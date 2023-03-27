%% fig3 c

clear all
clc
close all

rng default
rng(1)


a(1)=0; %右

T=100;
time=1:T;
beta=1;
a=zeros(1,T);
o=zeros(1,T);
ml=zeros(1,T);
mr=zeros(1,T);
pl=zeros(1,T);
pr=zeros(1,T);
Gl=zeros(1,T);
Gr=zeros(1,T);
fl=zeros(1,T);
fr=zeros(1,T);


I=1000;
C=-10*ones(1,T);
Po=0.75;


tt=1:T;
Pl=(tt<=T/2)*0+(tt>T/2)*0;
Pr=(tt<=T/2)*0.5+(tt>T/2)*0.5;  

  

vw=0.5;
am=0.3;
po=0.1;
mo=0;



ml(1)=mo; 
pl(1)=po;

mr(1)=mo;
pr(1)=po;

dt=1;

for i=1:I

for t=2:T
   
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
   
  %%%%%%%%%%%%%expected free energy%%%%%%%%%%%%%%
  
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

Precisionl(t)=pl(t-1)/(fl(t)^2)./((1-fl(t))^2);
Precisionr(t)=pr(t-1)/(fr(t)^2)./((1-fr(t))^2); 

end

Times_of_al_tmp=sum(a);
Times_of_ar_tmp=T-Times_of_al_tmp;

Rate_of_al_tmp(i)=Times_of_al_tmp/T;
Rate_of_ar_tmp(i)=Times_of_ar_tmp/T;

end

Rate=[Rate_of_al_tmp;Rate_of_ar_tmp]';
left_dominant=Rate(Rate(:,1)>0.5,:);
right_dominant=Rate(Rate(:,2)>0.5,:);

figure
boxchart(left_dominant)
yticks([0 0.25 0.5 0.75 1])
box("off")
pbaspect([1 1 1])

figure
boxchart(right_dominant)
yticks([0 0.25 0.5 0.75 1])
box("off")
pbaspect([1 1 1])

