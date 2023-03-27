function plot_fig_iFEP

clear all
clc
close all

load("figdata.mat")


%C_noiseが1の相関係数とラグの抽出
index1=11;
index2=21;
index3=31;


%C_noiseが1のスムーザーの結果の抽出
x=[1:1:length(a)];


f = figure;
f.Position(3:4) = [1000 750];
subplot(2,2,1) 
plot(PS_Cb(:,index1),'LineWidth',5)
hold on;
plot(PS_Cb(:,index2),'LineWidth',5)
hold on
plot(PS_Cb(:,index3),'LineWidth',5)
hold on
plot(Cb,'-- b','LineWidth',5)
ylim([-20 20])
yticks([-20 -10 0 10 20])
yline(0)
xlabel('Trials','FontSize',20,'FontWeight','bold')
legend("1","2","3")
box("off")

epsilon1=PS_Cb(:,index1);
epsilon2=PS_Cb(:,index2);
epsilon3=PS_Cb(:,index3);

subplot(2,2,2)
boxchart(epsilon_option,SQ_MEAN_SQUARE_ERRO)
%xlim([0,5])
xticks([0.1 1 2 3 4 5])
ylim([0,10])
yticks([0 2.5 5 7.5 10])
title('SQ-error')
box("off")

subplot(2,2,3)
plot(Cb(500:10:end),PS_Cb(500:10:end,index1),'.','MarkerSize',15)
hold on
plot(Cb(500:10:end),PS_Cb(500:10:end,index2),'.','MarkerSize',15)
hold on
plot(Cb(500:10:end),PS_Cb(500:10:end,index3),'.','MarkerSize',15)
title('disutibution')
xlim([-4,8])
xticks([-4 0 4 8])
ylim([-10,15])
yticks([-10:6.25:15])
legend("ε=1","ε=2","ε=3")
box("off")

Cb_partial=Cb(500:10:end);
epsilon1_partial=PS_Cb(500:10:end,index1);
epsilon2_partial=PS_Cb(500:10:end,index2);
epsilon3_partial=PS_Cb(500:10:end,index3);

subplot(2,2,4)
boxchart(epsilon_option,corriration)
%xlim([-1,6])
xticks([0.1 1 2 3 4 5])
ylim([0,1])
yticks([0 0.25 0.5 0.75 1])
title('Corr')
box("off")

