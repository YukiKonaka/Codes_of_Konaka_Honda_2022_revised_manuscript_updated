function likelihood = likelihood_iFEP(predictedParticles,a,o)

% calculate likelihood

size(predictedParticles);


ml=predictedParticles(1,:);
mr=predictedParticles(2,:);
pl=predictedParticles(3,:);
pr=predictedParticles(4,:);
C =predictedParticles(5,:);
am=predictedParticles(6,:);
vw=predictedParticles(7,:);
vw=predictedParticles(7,:);
beta=predictedParticles(8,:);


fl=(1+exp(-1*ml)).^(-1); 
fr=(1+exp(-1*mr)).^(-1);
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
   Dl=-POAl.*beta;   

   POAr=fr+0.5*fr.*(1-fr).*(1-2*fr).*((1./pr)+vw); 
   POAr(POAr<0.00000000001) = 0.00000000001;
   POAr(POAr>0.99999999999) = 0.99999999999;
   
   Ar= -fr.*log(fr)-(1-fr).*log(1-fr);
   Br=-0.5*(fr.*(1-fr).*(1+(1-2.*fr).*(log(fr)-log(1-fr)))).*((1./pr)+vw);
   Cr=(1-POAr).*log(1-POAr)+POAr.*log(POAr);
   Dr=-POAr.*beta;    
   
Gl=C.*(Al+Bl+Cl)+Dl;
Gr=C.*(Ar+Br+Cr)+Dr;
 
y=1./(1+exp(-(Gr-Gl)));
m=(a==1);

likelihood  = ((y.^m).*((1-y).^(1-m))).*((fl.^o.^m).*(fr.^o.^(1-m)));

end