
function sim_data=run_FEP(para_FEP)

a=cell2mat(para_FEP(1));
am=cell2mat(para_FEP(2));
beta=cell2mat(para_FEP(3));
C=cell2mat(para_FEP(4));
dt=cell2mat(para_FEP(5));
ml=cell2mat(para_FEP(6));
mo=cell2mat(para_FEP(7));
mr=cell2mat(para_FEP(8));
pl=cell2mat(para_FEP(9));
Pl=cell2mat(para_FEP(10));
po=cell2mat(para_FEP(11));
Po=cell2mat(para_FEP(12));
pr=cell2mat(para_FEP(13));
Pr=cell2mat(para_FEP(14));
T=cell2mat(para_FEP(15));
time=cell2mat(para_FEP(16));
vw=cell2mat(para_FEP(17));


%%%%%%%%%%%%%Simmulation%%%%%%%%%%%%%%
for t=2:T
  %%%%%%%%%%%%% Estimation of the reward probability%%%%%%%%%%%%%%  
    if t==2
        a(t)=rand<0.5;
    else
       al_prob=1/(1+(exp(-beta*(Gr(t-1)-Gl(t-1)))));
       a(t)=rand<al_prob;
    end
    
    fl(t)=(1/(1+exp(-ml(t-1))));   
    fr(t)=(1/(1+exp(-mr(t-1)))); 
    
    if a(t)==1 
        o(t) = rand < Pl(t);
        
        
        dmldt=((1/pl(t-1))+vw)*(o(t)-fl(t));        
        ml(t)=ml(t-1)+am*dmldt*dt;
        Sl(t)=(1/(1+exp(-ml(t))));
        pl(t)=((1/vw*pl(t-1))/(pl(t-1)+1/vw))+(Sl(t)*(1-Sl(t)));
        
        
        mr(t)=mr(t-1);
        pr(t)=((1/vw*pr(t-1))/(pr(t-1)+1/vw));
    
    else
        o(t) = rand < Pr(t);
        
        
        dmrdt=((1/pr(t-1))+vw)*(o(t)-fr(t));
        mr(t)=mr(t-1)+am*dmrdt*dt;
        Sr(t)=(1/(1+exp(-mr(t))));
        pr(t)=((1/vw*pr(t-1))/(pr(t-1)+1/vw))+(Sr(t)*(1-Sr(t)));
        
        
        ml(t)=ml(t-1);
        pl(t)=((1/vw*pl(t-1))/(pl(t-1)+1/vw));
         
    end 
    lamdal(t)=1/(1+exp(-ml(t)));
    lamdar(t)=1/(1+exp(-mr(t)));
   
  %%%%%%%%%%%%% Calculate expected utility%%%%%%%%%%%%%%
  
POAl(t)=lamdal(t)+0.5*lamdal(t)*(1-lamdal(t))*(1-2*lamdal(t))*((1/pl(t))+vw);  
Al(t)= -lamdal(t)*log(lamdal(t))-(1-lamdal(t))*log(1-lamdal(t));
Bl(t)=-0.5*(lamdal(t)*(1-lamdal(t))*(1+(1-2*lamdal(t))*(log(lamdal(t))-log(1-lamdal(t)))))*((1/pl(t))+vw);
Cl(t)=(1-POAl(t))*log(1-POAl(t))+POAl(t)*log(POAl(t));
Dl(t)=-POAl(t)*log(Po/(1-Po));


POAr(t)=lamdar(t)+0.5*lamdar(t)*(1-lamdar(t))*(1-2*lamdar(t))*((1/pr(t))+2*vw);
Ar(t)= -lamdar(t)*log(lamdar(t))-(1-lamdar(t))*log(1-lamdar(t));
Br(t)=-0.5*(lamdar(t)*(1-lamdar(t))*(1+(1-2*lamdar(t))*(log(lamdar(t))-log(1-lamdar(t)))))*((1/pr(t))+vw);
Cr(t)=(1-POAr(t))*log(1-POAr(t))+POAr(t)*log(POAr(t));
Dr(t)=-POAr(t)*log(Po/(1-Po));

Gl(t)=C(t)*(Al(t)+Bl(t)+Cl(t))+Dl(t);
Gr(t)=C(t)*(Ar(t)+Br(t)+Cr(t))+Dr(t);

Confidencel(t)=pl(t-1)/(fl(t)^2)./((1-fl(t))^2);
Confidencer(t)=pr(t-1)/(fr(t)^2)./((1-fr(t))^2); 

Infogainl(t)=(Al(t)+Bl(t)+Cl(t));
Infogainr(t)=(Ar(t)+Br(t)+Cr(t));


end

width=100;
for i=1:T-width
    ppl(i+0.5*width)=mean(a(i:i+width));
    
end
ppl(1:0.5*width)=NaN;

sim_data=[{C},{Dr},{Dl},{Infogainr},{Infogainl},{a}]
