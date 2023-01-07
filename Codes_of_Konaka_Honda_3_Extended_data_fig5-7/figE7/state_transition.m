function particles = state_15_self_org(particles,a,o,C_noise) 

[numberOfStates, numberOfParticles] = size(particles);

dt=1;

%%particle 
ml=particles(1,:);
mr=particles(2,:);
pl=particles(3,:);
pr=particles(4,:);
C =particles(5,:);
am=particles(6,:);
vw=particles(7,:);

vw=particles(7,:);
beta=particles(8,:);

pw=1./vw;
fl=(1+exp(-1*ml)).^(-1); 
fr=(1+exp(-1*mr)).^(-1); 


dmldt=((1./pl)+vw).*(o-fl);
dmrdt=((1./pr)+vw).*(o-fr);


ml  =ml+am.*dmldt*dt*(a==1);
mr  =mr+am.*dmrdt*dt*(a==0);
Sl=(1+exp(-1*ml)).^(-1); 
Sr=(1+exp(-1*mr)).^(-1); 

pl=(((1./vw.*pl)./(pl+1./vw))+(Sl.*(1-Sl))).*(a==1)+((1./vw.*pl)./(pl+1./vw)).*(a==0);
pr=(((1./vw.*pr)./(pr+1./vw))+(Sr.*(1-Sr))).*(a==0)+((1./vw.*pr)./(pr+1./vw)).*(a==1);

fl(fl<0.00000000001) = 0.00000000001;
fl(fl>0.99999999999) = 0.99999999999;
fr(fr<0.00000000001) = 0.00000000001;
fr(fr>0.99999999999) = 0.99999999999;
   
   POAl=fl+0.5*fl.*(1-fl).*(1-2*fl).*((1./pl)+vw);  
   POAl(POAl<0.00000000001) = 0.00000000001;
   POAl(POAl>0.99999999999) = 0.99999999999; 
   Al= -fl.*log(fl)-(1-fl).*log(1-fl);
   Bl=-0.5*(fl.*(1-fl).*(1+(1-2.*fl).*(log(fl)-log(1-fl)))).*((1./pl)+vw);
   Cl=(1-POAl).*log(1-POAl)+POAl.*log(POAl);

   POAr=fr+0.5*fr.*(1-fr).*(1-2*fr).*((1./pr)+vw); 
   POAr(POAr<0.00000000001) = 0.00000000001;
   POAr(POAr>0.99999999999) = 0.99999999999;
   
   Ar= -fr.*log(fr)-(1-fr).*log(1-fr);
   Br=-0.5*(fr.*(1-fr).*(1+(1-2.*fr).*(log(fr)-log(1-fr)))).*((1./pr)+vw);
   Cr=(1-POAr).*log(1-POAr)+POAr.*log(POAr);
   


%成功
%C = C +0.01*(leftL*a+(1-leftL)*(1-a))-0.01*(leftL*(1-a)+(1-leftL)*a)+C_noise*randn(1,numberOfParticles);
C = C +C_noise*randn(1,numberOfParticles);


am = am;
vw = vw;

particles=[ml;mr;pl;pr;C;am;vw;beta];

end
