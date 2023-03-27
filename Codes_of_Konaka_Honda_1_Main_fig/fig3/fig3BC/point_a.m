clear all
clc
close all

load ("point_a.mat")

Rate=[Rate_of_al_tmp;Rate_of_ar_tmp];


figure
boxchart(Rate')
yticks([0 0.25 0.5 0.75 1])
box("off")
pbaspect([1 1 1])