clear all
close all
clc

rng shuffle

for i=1:1000
% run ReCU model
para_FEP=get_para_FEP;%set parameters of ReCU model simulation

run_FEP(para_FEP);%run ReCU model simulation

% run iFep
para_iFEP=get_para_iFEP;%set parameters of iFEP

run_iFEP(para_iFEP);% run iFEP

load("iFEPdata.mat")
ps_C(i,:)=PS_C;
ave_ps_C(i)=mean(PS_C);

save("histdata.mat",'ps_C','ave_ps_C')
end

plot_fig_iFEP; % plot figure

