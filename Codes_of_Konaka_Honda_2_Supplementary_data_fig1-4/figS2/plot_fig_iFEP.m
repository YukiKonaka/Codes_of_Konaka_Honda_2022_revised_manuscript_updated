function plot_fig_iFEP

clear all

load("iFEPdata.mat")


f = figure;
f.Position(3:4) = [1000 750];
subplot(3,3,1:3);
plot(ppl)
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
plot(ppl,'- b')
hold on
plot(1-ppl,'- r')
legend("left","right")
xticks([0 500 1000 1500])
yticks([0 0.25 0.5 0.75 1])
ylim([0 1])
 box('off')
x=[1:1:length(a)];
ppr=1-ppl;

subplot(3,3,5); 
 shadedErrorBar(2:T,ps_rpl(2:end),SD_rml(2:end)); 
 hold on;
 plot(2:T,ps_rpl(2:end),'- r')
 hold on;
 plot(2:T,lamdal(2:end),'-- b')
 xticks([0 500 1000 1500])
 yticks([0 0.25 0.5 0.75 1])
 ylim([0 1])
 xlabel('Trials','FontSize',10,'FontWeight','bold')
 title('Reward Probability(Left)','FontSize',10,'FontWeight','bold')

 subplot(3,3,6); 
 shadedErrorBar(2:T,ps_rpr(2:end),SD_rmr(2:end)); 
 hold on;
 plot(2:T,ps_rpr(2:end),'- r')
 hold on;
 plot(2:T,lamdar(2:end),'-- b')
 xticks([0 500 1000 1500])
 yticks([0 0.25 0.5 0.75 1])
 ylim([0 1])
 xlabel('Trials','FontSize',10,'FontWeight','bold')
 title('Reward Probability(Right)','FontSize',10,'FontWeight','bold')
 box('off')
 
subplot(3,3,7);
 shadedErrorBar(2:T,ps_precl(2:end),SD_rpl(2:end)); 
 hold on;
 plot(2:T,ps_precl(2:end),'- r')
 hold on;
 plot(2:T,Confidencel(2:end),'-- b')
 ylim([0 160])
 yticks([0 40 80 120 160])
 xlabel('Trials','FontSize',10,'FontWeight','bold')
 title('Confidence (Left)','FontSize',10,'FontWeight','bold')
 
 subplot(3,3,8);
 shadedErrorBar(2:T,ps_precr(2:end),SD_rpr(2:end)); 
 hold on;
 plot(2:T,ps_precr(2:end),'- r')
 hold on;
 plot(2:T,Confidencer(2:end),'-- b')
 ylim([0 160])
 yticks([0 40 80 120 160])
 xlabel('Trials','FontSize',10,'FontWeight','bold')
 title('Confidence (Right)','FontSize',10,'FontWeight','bold')

 
 
subplot(3,3,9);
shadedErrorBar(2:T,ps_C(2:end)/mean(pf_beta(1000:end)),SD_C(2:end)/mean(pf_beta(1000:end))); 
hold on
plot(2:T,ps_C(2:end)/mean(pf_beta(1000:end)),'- r')
hold on;
plot(2:T,C(2:end)/Beta,'-- b')
ylim([-20 20])
yticks([-20 -10 0 10 20])
yline(0)
xlabel('Trials','FontSize',10,'FontWeight','bold')
title('Intensity of curiosity','FontSize',10','FontWeight','bold')

ground_int_curi=C/Beta;
ps_int_curi=ps_C/mean(pf_beta(1000:end));
SD_int_curi=SD_C/mean(pf_beta(1000:end));


%% test end