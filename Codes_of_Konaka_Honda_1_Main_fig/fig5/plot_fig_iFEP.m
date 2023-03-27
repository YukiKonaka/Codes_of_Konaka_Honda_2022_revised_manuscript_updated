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
pf_vw=cell2mat(est_data_doya(18));
ps_pl=cell2mat(est_data_doya(19));
ps_pr=cell2mat(est_data_doya(20));



f = figure;
f.Position(3:4) = [1000 750];

N_step=length(a);

width=25;
for i=1:N_step-width
    ppl(i+width)=mean(a(i:i+width));
    
end

ppl(1:25)=NaN;

subplot(3,3,1:3);
plot(ppl)
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
hold on;
 plot([0,length(a)],ones(1,2),'k')
     hold on
     plot([0,length(a)],0*ones(1,2),'k')
     ylabel('Right    Left','FontSize',15,'FontWeight','bold')
     yticks([0  0.5  1])
     ylim([-0.5 1.5])

 tmpr = find(a == 1 & o == 1);
 if ~isempty(tmpr), rtemp=plot(tmpr,1.25, 'b|','MarkerSize',30); 
     hold on; end
 
 tmp = find(a == 1 & o == 0);
 if ~isempty(tmp), ptemp=plot(tmp,1.25, 'b|','MarkerSize',15); 
     hold on; end
 tmpr = find(a == 0 & o == 1);
 if ~isempty(tmpr), rtemp=plot(tmpr,-0.25, 'r|','MarkerSize',30);
     hold on; end
 tmp = find(a == 0 & o == 0);
 if ~isempty(tmp), ptemp=plot(tmp,-0.25, 'r|','MarkerSize',15);
     hold on;end
     hold on;


subplot(3,3,4); 
plot(ppl,'- b','LineWidth',1)
hold on
plot(1-ppl,'- r','LineWidth',1)
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
legend("left","right")
yticks([0 0.25 0.5 0.75 1])
ylim([0 1])

ppr=1-ppl;


subplot(3,3,5); 
x=[1:1:length(a)];
sl1=0.9*ones(1,20);sl2=0.5*ones(1,41);sl3=0.5*ones(1,62);
sl4=0.1*ones(1,94);sl5=0.5*ones(1,20);sl6=0.9*ones(1,40);
sl7=0.1*ones(1,74);sl8=0.5*ones(1,40);
sl=[sl1,sl2,sl3,sl4,sl5,sl6,sl7,sl8];

sr1=0.5*ones(1,20);sr2=0.9*ones(1,41);sr3=0.1*ones(1,62);
sr4=0.5*ones(1,94);sr5=0.9*ones(1,20);sr6=0.5*ones(1,40);
sr7=0.5*ones(1,74);sr8=0.1*ones(1,40);
sr=[sr1,sr2,sr3,sr4,sr5,sr6,sr7,sr8];


shadedErrorBar(2:T,ps_rpl(2:end),SD_rml(2:end)); 
hold on;
plot(2:T,ps_rpl(2:end),'- b','LineWidth',1)
hold on;
plot(2:T,sl(2:end),'-- b','LineWidth',3)
hold on;

xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
xlabel('Trials','FontSize',10,'FontWeight','bold')
yticks([0,0.25,0.5,0.75,1])
title('Reward Probability(Left)','FontSize',10,'FontWeight','bold')

subplot(3,3,6); 
x=[1:1:length(a)];
sl1=0.9*ones(1,20);sl2=0.5*ones(1,41);sl3=0.5*ones(1,62);
sl4=0.1*ones(1,94);sl5=0.5*ones(1,20);sl6=0.9*ones(1,40);
sl7=0.1*ones(1,74);sl8=0.5*ones(1,40);
sl=[sl1,sl2,sl3,sl4,sl5,sl6,sl7,sl8];

sr1=0.5*ones(1,20);sr2=0.9*ones(1,41);sr3=0.1*ones(1,62);
sr4=0.5*ones(1,94);sr5=0.9*ones(1,20);sr6=0.5*ones(1,40);
sr7=0.5*ones(1,74);sr8=0.1*ones(1,40);
sr=[sr1,sr2,sr3,sr4,sr5,sr6,sr7,sr8];


shadedErrorBar(2:T,ps_rpr(2:end),SD_rmr(2:end)); 
hold on;
plot(2:T,ps_rpr(2:end),'- r','LineWidth',1)
hold on;
plot(2:T,sr(2:end),'-- r','LineWidth',3)
hold on;

xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');

yticks([0,0.25,0.5,0.75,1])
xlabel('Trials','FontSize',10,'FontWeight','bold')
title('Reward Probability(Right)','FontSize',10,'FontWeight','bold')



subplot(3,3,7); 
shadedErrorBar(2:T,ps_precl(2:end),SD_rpl(2:end)); 
hold on;
plot(2:T,ps_precl(2:end),'- b','LineWidth',1)
hold on;

xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
ylim([0 24])
yticks([0 6 12 18 24])
xlabel('Trials','FontSize',10,'FontWeight','bold')
title('Confidence','FontSize',10,'FontWeight','bold')

subplot(3,3,8); 

shadedErrorBar(2:T,ps_precr(2:end),SD_rpr(2:end)); 
hold on;
plot(2:T,ps_precr(2:end),'- r','LineWidth',1)
hold on;

xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
ylim([0 24])
yticks([0 6 12 18 24])
xlabel('Trials','FontSize',10,'FontWeight','bold')
title('Confidence','FontSize',10,'FontWeight','bold')


subplot(3,3,9); 
hold on;
shadedErrorBar(2:T,ps_C(2:end)/mean(PF_beta),SD_C(2:end)/mean(PF_beta)); 
plot(ps_C(2:end)/mean(PF_beta),'- b','LineWidth',1)
hold on;
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
xlabel('Trials','FontSize',10,'FontWeight','bold')
title('Intensity of Curiosity','FontSize',10','FontWeight','bold')
yline(0)
ylim([-3,1])
yticks([-3 -2 -1 0 1])

int_of_curiosity=ps_C/mean(PF_beta);
SD_int_of_curiosity=SD_C/mean(PF_beta);

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
   Dl=-POAl.*PF_beta;   

   POAr=fr+0.5*fr.*(1-fr).*(1-2*fr).*((1./ps_pr)+pf_vw); 
   POAr(POAr<0.00000000001) = 0.00000000001;
   POAr(POAr>0.99999999999) = 0.99999999999;
   
   Ar= -fr.*log(fr)-(1-fr).*log(1-fr);
   Br=-0.5*(fr.*(1-fr).*(1+(1-2.*fr).*(log(fr)-log(1-fr)))).*((1./ps_pr)+pf_vw);
   Cr=(1-POAr).*log(1-POAr)+POAr.*log(POAr);
   Dr=-POAr.*PF_beta;    
   
Gl=ps_C.*(Al+Bl+Cl)+Dl;
Gr=ps_C.*(Ar+Br+Cr)+Dr;
 
y=1./(1+exp(-(Gr-Gl)));
m=(a==1);

likelihood  = ((y.^m).*((1-y).^(1-m)));

for i=1:length(a)
    logLikelihood(i)=log(likelihood(i));
end
"logLikilihood"
sum(logLikelihood)



