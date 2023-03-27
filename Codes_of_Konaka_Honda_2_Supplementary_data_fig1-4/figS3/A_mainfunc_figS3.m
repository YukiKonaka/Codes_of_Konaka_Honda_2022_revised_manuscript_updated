clear all
close all
clc

rng default
rng(6)

% run ReCU model
para_FEP=get_para_FEP; %set parameters of ReCU model simulation
run_FEP(para_FEP); %run ReCU model simulation

% run iFep
para_iFEP=get_para_iFEP;%set parameters of iFEP

%set epsilon
epsilon_option=get_epsilon_option;
rng default
rng(2)

for i=1:length(epsilon_option)
para_iFEP(2)=epsilon_option(i);

iFEPdata=run_iFEP(para_iFEP);% run iFEP

PS_Cb(:,i)=cell2mat(iFEPdata(1));
Cb=cell2mat(iFEPdata(2));
SQ_MEAN_SQUARE_ERRO(i)=sqrt(cell2mat(iFEPdata(3)));
corriration(i)=cell2mat(iFEPdata(4));
a=cell2mat(iFEPdata(5));

end
save("figdata.mat")

% plot figure
plot_fig_iFEP; 

