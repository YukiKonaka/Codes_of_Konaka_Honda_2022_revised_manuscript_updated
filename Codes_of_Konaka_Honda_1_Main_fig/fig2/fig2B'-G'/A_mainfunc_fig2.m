clear all
close all
clc

rng(8)

para_FEP=get_para_FEP;%set parameters

sim_data=run_FEP(para_FEP);%run simuration

plot_fig_FEP(sim_data);%plot 