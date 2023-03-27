clear all
close all
clc

rng default
rng(3)

%get rat behavior data (Doya lab)
exp_data=get_doyalabdata; %ok

%%
% fig E7 B-F
%get parameters for inverseQL
para_iQL=get_para_iQL; 

%run iFEP
run_iQL(para_iQL,exp_data);

%plot figure
plot_fig_iQL;

%%
% fig E7 G-J
%get parameters for iFEP
para_iFEP=get_para_iFEP;

%run iFEP
est_data_doya=run_iFEP(para_iFEP,exp_data);

%plot figure
plot_fig_iFEP(est_data_doya);




