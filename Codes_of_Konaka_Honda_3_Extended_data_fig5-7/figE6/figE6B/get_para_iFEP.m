function para_iFEP=get_para_iFEP

numberofparticles=100000;
C_noise=1; %　ε：noise intensity of ct

m0_mean=0; %mean of initial value of μ
m0_SD=0.01;%SD   of initial value of μ

p0_shape=10; %shape para of initial value of p
p0_scale=0.001;%scale para of initial value of p

C0_bottom=-15; %Ct_0(initial value of intensity of curiosity) is uniformly distributed between C0_bottom and (C0_bottom+C0_width)
C0_width=30;

am_bottom=0.04;%α(learning rate) is uniformly distributed between am_bottom and (am_bottom+am_width)
am_width=0.02;

vw_bottom=0.2;%σ^2(variance of w) is uniformly distributed between am_bottom and (vw_bottom+vw_width)
vw_width=0.5;

beta_bottom=0;%β(inverce temprature) is uniformly distributed between beta_bottom and (beta_bottom+beta_width)
beta_width=50;


para_iFEP=[numberofparticles,C_noise,m0_mean,m0_SD,p0_shape,p0_scale,C0_bottom,C0_width,am_bottom,am_width,vw_bottom,vw_width,beta_bottom,beta_width]
