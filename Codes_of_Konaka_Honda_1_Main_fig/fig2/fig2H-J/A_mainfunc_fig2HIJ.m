clear all
close all
clc

rng(2)

%set intensity of curiosity

%c=-1 %fig 2-H
%c=0  %fig 2-I
c=3  %fig 2-J


para_FEP=get_para_FEP(c);%set parameters
sim_data=run_FEP(para_FEP);%run simuration

plot_fig_FEP(sim_data);%plot
