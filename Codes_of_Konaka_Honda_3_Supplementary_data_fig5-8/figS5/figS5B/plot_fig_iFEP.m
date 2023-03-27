function plot_fig_iFEP

clear all

load("histdata.mat")


for i=1:length(ps_C(:,1))
m_C(i)=mean(ps_C(i,1:end));
end

figure
hist(m_C,30)
xlim([-6,6])
xticks([-6 -3 0 3 6])
%ylim([0,240])
%yticks([0 60 120 180 240])
box off

hold on 
%scatter(mean(ps_C/mean(PF_R)),0,"r")
plot(-0.7330,0,". r",'MarkerSize',50)

sum(m_C<-0.7330)/1000

