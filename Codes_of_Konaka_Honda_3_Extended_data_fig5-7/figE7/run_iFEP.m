function est_data_doya=run_iFEP(para_iFEP,exp_data)

a=cell2mat(exp_data(1));
o=cell2mat(exp_data(2));

numberofparticles=para_iFEP(1);
C_noise=para_iFEP(2);
m0_mean=para_iFEP(3);
m0_SD=para_iFEP(4);
p0_shape=para_iFEP(5);
p0_scale=para_iFEP(6);
C0_bottom=para_iFEP(7);
C0_width=para_iFEP(8);
am_bottom=para_iFEP(9);
am_width=para_iFEP(10);
vw_bottom=para_iFEP(11);
vw_width=para_iFEP(12);
beta_bottom=para_iFEP(13);
beta_width=para_iFEP(14);


T=length(a);

% run particle filter
myPF = particleFilter(@state_transition,@likelihood);

% set initial values of paricles
F=m0_mean*ones(1,8);
S= diag(((m0_SD)^2)*ones(1,8));
initialize(myPF,numberofparticles,F,S);
myPF.Particles(3:4,:)=gamrnd(p0_shape,p0_scale,[2,numberofparticles]);
myPF.Particles(5,:)=C0_bottom+C0_width*rand(1,numberofparticles);
myPF.Particles(6,:)=am_bottom+am_width*rand(1,numberofparticles);
myPF.Particles(7,:)=vw_bottom+vw_width*rand(1,numberofparticles);
myPF.Particles(8,:)=beta_bottom+beta_width*rand(1,numberofparticles);


myPF.StateEstimationMethod = 'mean';
myPF.ResamplingMethod = 'systematic';

zEst=zeros(length(a),length(F));


for k=1:length(a)

    zEst(k,:) = correct(myPF,a(k),o(k));
 
    predict(myPF,a(k),o(k),C_noise);
    
    vv(:,:,k)=cov(transpose(myPF.Particles(1:5,:)));
        
end

v(:,:,:)=vv;


%%result of particle filter
pf_ml=zEst(:,1);
pf_mr=zEst(:,2);
pf_pl=zEst(:,3);
pf_pr=zEst(:,4);
pf_C =zEst(:,5);
pf_am =zEst(:,6);
pf_vw =zEst(:,7);
pf_beta =zEst(:,8);

pf_v =v;
pf_rpl=1./(1+exp(-pf_ml));
pf_rpr=1./(1+exp(-pf_mr));
pf_precl=pf_pl./(pf_rpl.^2)./((1-pf_rpl).^2);
pf_precr=pf_pr./(pf_rpr.^2)./((1-pf_rpr).^2);

filter=[{pf_ml},{pf_mr},{pf_pl},{pf_pr},{pf_C},{pf_v},{pf_vw(end)},{pf_am(end)},{pf_beta(end)}];

% run smoother
smoother=run_smoother(filter,a,o,C_noise);

% result of smoother
ps=cell2mat(smoother(1));
ps_v=cell2mat(smoother(2));
ps_ml=transpose(ps(1,:));
ps_mr=transpose(ps(2,:));
ps_pl=transpose(ps(3,:));
ps_pr=transpose(ps(4,:));
ps_C =transpose(ps(5,:));

ps_rpl=1./(1+exp(-ps_ml));
ps_rpr=1./(1+exp(-ps_mr));
ps_precl=ps_pl./(ps_rpl.^2)./((1-ps_rpl).^2);
ps_precr=ps_pr./(ps_rpr.^2)./((1-ps_rpr).^2);

v_ml=ps_v(1,1,:);
V_ml=transpose(reshape(v_ml,1,length(a)));
v_mr=ps_v(2,2,:);
V_mr=transpose(reshape(v_mr,1,length(a)));
v_pl=ps_v(3,3,:);
V_pl=transpose(reshape(v_pl,1,length(a)));
v_pr=ps_v(4,4,:);
V_pr=transpose(reshape(v_pr,1,length(a)));
v_C=ps_v(5,5,:);
V_C=transpose(reshape(v_C,1,length(a)));

SD_rml=sqrt(V_ml.*(ps_rpl.^2).*(1-ps_rpl).^2);
SD_rmr=sqrt(V_mr.*(ps_rpr.^2).*(1-ps_rpr).^2);
SD_rpl=sqrt(V_pl./((ps_rpl.^4)./((1-ps_rpl).^4)));
SD_rpr=sqrt(V_pr./((ps_rpr.^4)./((1-ps_rpr).^4)));
SD_C=sqrt(V_C);

N_step=length(a);

width=25;
for i=1:N_step-width
    ppl(i+width)=mean(a(i:i+width));
    
end

ppl(1:25)=NaN;
mean(pf_am)
mean(pf_beta)
mean(pf_vw)

est_data_doya=[{ppl},{a},{o},{ps_rpl},{SD_rml},{ps_rpr},{SD_rmr},{ps_precl},{SD_rpl},{ps_precr},{SD_rpr},{ps_C},{pf_beta},{SD_C},{T},{ps_ml},{ps_mr}]


