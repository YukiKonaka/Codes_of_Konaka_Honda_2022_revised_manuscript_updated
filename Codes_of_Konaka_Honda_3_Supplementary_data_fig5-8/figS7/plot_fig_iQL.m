function plot_fig_iQL

load("est_data_doya.mat")
a=-a+2;


f = figure;
f.Position(3:4) = [1000 500];
subplot(3,2,1:2);
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
     xticks([0:100:400])

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

    


subplot(3,2,3)
shadedErrorBar(2:T,eQ1(2:end),SD_Q1(2:end));
hold on
plot(2:T,eQ1(2:end),"b")
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
ylim([0 1])
yticks([0:0.25:1])
xticks([0:100:400])
title('Q left')



subplot(3,2,4)
shadedErrorBar(2:T,eQ2(2:end),SD_Q1(2:end));
hold on
plot(2:T,eQ2(2:end),"r")
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
ylim([0 1])
yticks([0:0.25:1])
xticks([0:100:400])
title('Q right')

subplot(3,2,5)
%shadedErrorBar(2:T,exp(ps_alpha(2:end)),SD_alpha(2:end));
hold on
plot(2:T,exp(ps_alpha(2:end)),"k")
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
hold on;
ylim([0 3])
yticks([0:0.75:3])
xticks([0:100:400])
box("off")
title('alpha')

e_alpha=exp(ps_alpha);


subplot(3,2,6)
%shadedErrorBar(2:T,exp(ps_beta(2:end)),SD_beta(2:end));
hold on
plot(2:T,exp(ps_beta(2:end)),"k")
xline(1,'-');xline(21,'-');xline(62,'-');
xline(124,'-');xline(218,'-');xline(238,'-');
xline(278,'-');xline(352,'-');
hold on;
ylim([0 10])
yticks([0:2.5:10])
xticks([0:100:400])
box("off")
title('beta')

e_beta=exp(ps_beta);

y=1./(1+exp(-ps_beta.*(eQ1-eQ2)));
m=(a==1);
likelihood = (y.^m).*((1-y).^(1-m));
for i=1:length(a)
    Likelihood(i)=log(likelihood(i));
end
"Likelihood"
sum(Likelihood)

