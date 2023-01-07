function plot_fig_iFEP(est_data_doya)

ppl=cell2mat(est_data_doya(1));
a=cell2mat(est_data_doya(2));
o=cell2mat(est_data_doya(3));
ps_rpl=cell2mat(est_data_doya(4));
SD_rml=cell2mat(est_data_doya(5));
ps_rpr=cell2mat(est_data_doya(6));
SD_rmr=cell2mat(est_data_doya(7));
ps_precl=cell2mat(est_data_doya(8));
SD_rpl=cell2mat(est_data_doya(9));
ps_precr=cell2mat(est_data_doya(10));
SD_rpr=cell2mat(est_data_doya(11));
ps_C=cell2mat(est_data_doya(12));
PF_beta=cell2mat(est_data_doya(13));
SD_C=cell2mat(est_data_doya(14));
T=cell2mat(est_data_doya(15));
ps_ml=cell2mat(est_data_doya(16));
ps_mr=cell2mat(est_data_doya(17));
ps_pl=cell2mat(est_data_doya(18));
ps_pr=cell2mat(est_data_doya(19));
pf_vw=cell2mat(est_data_doya(20));


%%

fl=(1+exp(-1*ps_ml)).^(-1); 
fr=(1+exp(-1*ps_mr)).^(-1);
fl(fl<0.00000000001) = 0.00000000001;
fl(fl>0.99999999999) = 0.99999999999;
fr(fr<0.00000000001) = 0.00000000001;
fr(fr>0.99999999999) = 0.99999999999;
   
POAl=fl+0.5*fl.*(1-fl).*(1-2*fl).*((1./ps_pl)+pf_vw);  
POAl(POAl<0.00000000001) = 0.00000000001;
POAl(POAl>0.99999999999) = 0.99999999999; 
Al= -fl.*log(fl)-(1-fl).*log(1-fl);
Bl=-0.5*(fl.*(1-fl).*(1+(1-2.*fl).*(log(fl)-log(1-fl)))).*((1./ps_pl)+pf_vw);
Cl=(1-POAl).*log(1-POAl)+POAl.*log(POAl);
Dl=-POAl;   


POAr=fr+0.5*fr.*(1-fr).*(1-2*fr).*((1./ps_pr)+pf_vw); 
POAr(POAr<0.00000000001) = 0.00000000001;
POAr(POAr>0.99999999999) = 0.99999999999;
   
Ar= -fr.*log(fr)-(1-fr).*log(1-fr);
Br=-0.5*(fr.*(1-fr).*(1+(1-2.*fr).*(log(fr)-log(1-fr)))).*((1./ps_pr)+pf_vw);
Cr=(1-POAr).*log(1-POAr)+POAr.*log(POAr);
Dr=-POAr;    
   
infoL=-(Al+Bl+Cl);
rewardL=-Dl;

infoR=-(Ar+Br+Cr);
rewardR=-Dr;



%% draw heatmap


CC=ps_C(1:end-1)/mean(PF_beta);

C_under=CC>-1.1;
C_under2=CC>-0.7;

dR=rewardL(1:end-1)-rewardR(1:end-1);
dInfo=infoL(1:end-1)-infoR(1:end-1);

c_ave=mean(CC(C_under==0));
c_ave1=mean(CC(C_under2==1));
c_ave2=mean(CC);

aa=a(2:end);


%%
%left panel
XX=[dR(C_under==0) dInfo(C_under==0)];
YY=categorical(aa(C_under==0));
YY2=aa(C_under==0);

length(YY)

selection_train=rand(1,length(YY))>0.3;
XX_train=XX(selection_train==1,:);
YY_train=YY(selection_train==1);
XX_test=XX(selection_train==0,:);
YY_test=YY2(selection_train==0);
[B,Fitinfo]=lassoglm(XX_train,YY_train,'binomial','Link','logit','Alpha',0.0000001);

for i=1:length(Fitinfo.Lambda)
sig=1./exp(-(B(:,i)'*XX_test'));
L_test(i)=sum((YY_test==1).*log(sig)')+sum((YY_test==0).*(1-log(sig))');
end
[M,I] = max(L_test);
B(:,I)

x=meshgrid(-1:0.01:1);
xx=[-1:0.01:1];
y=x';
zz= -(B(1,I) * x + B(2,I) *y);
z=(1+exp(-zz)).^(-1);
yy=-B(1,I)/B(2,I)*xx;
yyy=-1/c_ave*xx;%particle smoother



f = figure;
f.Position(3:4) = [990 330];
subplot(1,3,1) 

imagesc(x(1,:),y(:,1),z);
colormap('redblue')
hold on
plot(dR((aa==0 & C_under==0)),dInfo((aa==0 & C_under==0)),'. r','Markersize',10)
hold on
plot(dR((aa==1 & C_under==0)),dInfo((aa==1 & C_under==0)),'. b','Markersize',10)
axis xy
grid off
hold on
plot(xx,yy,"b")
hold on
plot(xx,yyy,"r")
hold on

xline(0)
yline(0)
axis image
xlim([-0.4 0.6])
ylim([-0.6 0.4])
xticks([-0.4:0.2:0.6])
caxis([0.5-0.002,0.5+0.002])
colorbar

legend("logistic regression","particle smoother")
title("c<-1.1")

%%
%middle panel
XX=[dR(C_under==1 & C_under2==0) dInfo(C_under==1 & C_under2==0)];
YY=categorical(aa(C_under==1 & C_under2==0));
YY2=aa(C_under==1 & C_under2==0);

length(YY)

selection_train=rand(1,length(YY))>0.3;
XX_train=XX(selection_train==1,:);
YY_train=YY(selection_train==1);
XX_test=XX(selection_train==0,:);
YY_test=YY2(selection_train==0);
[B,Fitinfo]=lassoglm(XX_train,YY_train,'binomial','Link','logit','Alpha',0.0000001);

for i=1:length(Fitinfo.Lambda)
sig=1./exp(-(B(:,i)'*XX_test'));
L_test(i)=sum((YY_test==1).*log(sig)')+sum((YY_test==0).*(1-log(sig))');
end
[M,I] = max(L_test);
B(:,I)

x=meshgrid(-1:0.01:1);
xx=[-1:0.01:1];
y=x';
zz= -(B(1,I) * x + B(2,I) *y);
z=(1+exp(-zz)).^(-1);
yy=-B(1,I)/B(2,I)*xx;
yyy=-1/c_ave2*xx;%particle smoother



subplot(1,3,2) 
imagesc(x(1,:),y(:,1),z);
colormap('redblue')
hold on
plot(dR(aa==1),dInfo(aa==1),'. b','Markersize',10)
hold on
plot(dR(aa==0),dInfo(aa==0),'. r','Markersize',10)

axis xy
grid off
hold on
plot(xx,yy,"b")
hold on
plot(xx,yyy,"r")
hold on

xline(0)
yline(0)
axis image
xlim([-0.4 0.6])
ylim([-0.6 0.4])
xticks([-0.4:0.2:0.6])
caxis([0.5-0.002,0.5+0.002])
colorbar

legend("logistic regression","particle smoother")
title("-1.1<c<-0.7")





%%
%right panel

 XX=[dR(C_under2==1) dInfo(C_under2==1)];
 YY=categorical(aa(C_under2==1));
 YY2=aa(C_under2==1);
 
 length(YY)


selection_train=rand(1,length(YY))>0.3;
XX_train=XX(selection_train==1,:);
YY_train=YY(selection_train==1);
XX_test=XX(selection_train==0,:);
YY_test=YY2(selection_train==0);
[B,Fitinfo]=lassoglm(XX_train,YY_train,'binomial','Link','logit','Alpha',0.0000001);

for i=1:length(Fitinfo.Lambda)
sig=1./exp(-(B(:,i)'*XX_test'));
L_test(i)=sum((YY_test==1).*log(sig)')+sum((YY_test==0).*(1-log(sig))');
end
[M,I] = max(L_test);
B(:,I)

x=meshgrid(-1:0.01:1);
xx=[-1:0.01:1];
y=x';
zz= -(B(1,I) * x + B(2,I) *y);
z=(1+exp(-zz)).^(-1);
yy=-B(1,I)/B(2,I)*xx;
yyy=-1/c_ave1*xx;%particle smoother



subplot(1,3,3) 

imagesc(x(1,:),y(:,1),z);
colormap('redblue')
hold on
plot(dR((aa==1 & C_under2==1)),dInfo((aa==1 & C_under2==1)),'. b','Markersize',10)
hold on
plot(dR((aa==0 & C_under2==1)),dInfo((aa==0 & C_under2==1)),'. r','Markersize',10)

axis xy
grid off
hold on
plot(xx,yy,"b")
hold on
plot(xx,yyy,"r")
hold on
caxis([0.5-0.002,0.5+0.002])
colorbar

xline(0)
yline(0)
axis image
xlim([-0.4 0.6])
ylim([-0.6 0.4])
xticks([-0.4:0.2:0.6])
legend("logistic regression","particle smoother")
title("c>-0.7")

figure
colorbar
caxis([0.5-0.002,0.5+0.002])
colormap('redblue')





