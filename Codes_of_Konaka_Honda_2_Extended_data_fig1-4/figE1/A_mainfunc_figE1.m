clear all
clc
close all

x=[0.5:0.01:1];
y=log(x./(1-x));

plot(x,y)
xticks([0.5:0.1:1])
yticks([0:1:5])
box off