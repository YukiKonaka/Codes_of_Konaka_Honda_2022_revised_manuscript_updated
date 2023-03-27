clear all
close all
clc

rng default
rng(6)

% run ReCU model
para_FEP=get_para_FEP;%set parameters of ReCU model simulation

run_FEP(para_FEP);%run ReCU model simulation

% run iFep
rng default
rng(2)

para_iFEP=get_para_iFEP;%set parameters of iFEP

run_iFEP(para_iFEP);% run iFEP

plot_fig_iFEP; % plot figure

