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


C_under=ps_C/mean(PF_beta)>-1;


Infosum=infoL+infoR;

est_C=ps_C/mean(PF_beta);



bin=3;

f = figure;
f.Position(3:4) = [990 600];
subplot(2,3,1:2); 
xx1=Infosum';
yy1=est_C';

yyaxis left

plot(xx1) %lawdata
ylim([0.4 1.4])
hold on
yyaxis right
hold on
plot(yy1,"r")
yticks([-3:0.8:1])
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
legend("Info sum","C")

subplot(2,3,3);
[corr1,lags1] = xcorr(xx1(50:end)-mean(xx1(50:end)),yy1(50:end)-mean(yy1(50:end)),'coef');
plot(lags1,corr1,"k")
ylim([-0.6,0.9])
xlim([-60 60])
yticks([-0.6:0.3:0.9])
yline(0)
xline(0)

lags_e=lags1;
corr_e=corr1;



subplot(2,3,4:5); 
xx1=Infosum'; %Info raw
yy1=SGfilt_1D(est_C',bin,1,1); % C'

yyaxis left
hold on
plot(xx1)
ylim([0.4 1.4])
hold on
yyaxis right
hold on
plot(yy1,"r")
yticks([-0.15:0.07:0.2])
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
legend("Info sum","C'")

subplot(2,3,6);
[corr1,lags1] = xcorr(xx1(50:end)-mean(xx1(50:end)),yy1(50:end)-mean(yy1(50:end)),'coef');

plot(lags1,corr1,"k")
ylim([-0.6,0.9])
xlim([-60 60])
yticks([-0.6:0.3:0.9])
yline(0)
xline(0)




