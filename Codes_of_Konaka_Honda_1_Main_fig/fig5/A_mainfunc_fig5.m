clear all
close all
clc

rng default
rng(3)

%get rat behavior data (Doya lab)
exp_data=get_doyalabdata;

%get parameters for iFEP
para_iFEP=get_para_iFEP;

%run iFEP
est_data_doya=run_iFEP(para_iFEP,exp_data);

%plot figure
plot_fig_iFEP(est_data_doya);