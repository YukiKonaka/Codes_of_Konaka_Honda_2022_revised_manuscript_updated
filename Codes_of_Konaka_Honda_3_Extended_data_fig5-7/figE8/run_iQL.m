function run_iQL(para_iFEP,exp_data)

a=cell2mat(exp_data(1));
o=cell2mat(exp_data(2));
r=o;
a=-a+2;

numberofparticles=para_iFEP(1);
alpha_noise=para_iFEP(2);
beta_noise=para_iFEP(3);
alpha0_bottom=para_iFEP(4);
alpha0_width=para_iFEP(5);
beta0_bottom=para_iFEP(6);
beta0_width=para_iFEP(7);


T=length(a);

% run particle filter
myPF = particleFilter(@state_transition,@likelihood);

% set initial values of paricles
S=zeros(2+2,2+2);S(1,1)=0.004;S(2,2)=0.23;
initialize(myPF,numberofparticles,[0.2;2.5;zeros(2,1)],S); 
myPF.Particles(1,:)=alpha0_bottom+alpha0_width*rand(1,numberofparticles);
myPF.Particles(2,:)=beta0_bottom+beta0_width*rand(1,numberofparticles);


myPF.StateEstimationMethod = 'mean';
myPF.ResamplingMethod = 'systematic';

zEst=zeros(length(a),4);


for k=1:length(a)
    zEst(k,:) = correct(myPF,a((k-1)+1:k));
    predict(myPF,a(k),r(k),alpha_noise,beta_noise);
    vv(:,:,k)=cov(transpose(myPF.Particles(1:4,:)));      
end

v(:,:,:)=vv;

e_alpha=zEst(:,1);
e_beta=zEst(:,2);
eQ1=zEst(:,3);
eQ2=zEst(:,end);


filter=[{eQ1},{eQ2},{e_alpha},{e_beta},{v}];
o=r;

smoother=run_smoother(filter,a,o,alpha_noise,beta_noise);

ps=cell2mat(smoother(1));
ps_v=cell2mat(smoother(2));

ps_Q1=transpose(ps(1,:));
ps_Q2=transpose(ps(2,:));
ps_alpha=transpose(ps(3,:));
ps_beta=transpose(ps(4,:));


%smootherの分散
v_Q1=ps_v(1,1,:);
V_Q1=transpose(reshape(v_Q1,1,length(a)));
v_Q2=ps_v(2,2,:);
V_Q2=transpose(reshape(v_Q2,1,length(a)));
v_alpha=ps_v(3,3,:);
V_alpha=transpose(reshape(v_alpha,1,length(a)));
v_beta=ps_v(4,4,:);
V_beta=transpose(reshape(v_beta,1,length(a)));

%filterの分散
vv_Q1=v(1,1,:);
VV_Q1=transpose(reshape(v_Q1,1,length(a)));
vv_Q2=v(2,2,:);
VV_Q2=transpose(reshape(v_Q2,1,length(a)));

%標準偏差への変換
SD_alpha=sqrt(V_alpha);
SD_beta=sqrt(V_beta);
SD_Q1=sqrt(VV_Q1);
SD_Q2=sqrt(VV_Q2);

width=25;
aa=-a+2;
for i=1:T-width
    ppl(i+width)=mean(aa(i:i+width));
end

ppl(1:width)=NaN;

save("est_data_doya.mat")
save("QL_beta.mat")


