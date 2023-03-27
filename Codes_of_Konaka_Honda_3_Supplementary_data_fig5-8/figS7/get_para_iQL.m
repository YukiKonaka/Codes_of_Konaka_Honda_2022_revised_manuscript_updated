function para_iQL=get_para_iQL


numberofparticles=100000;
alpha_noise=0.001*5;%　noise intensity of β
beta_noise=0.01*10*2; %　noise intensity of β


alpha0_bottom=0; %Ct_0(initial value of intensity of curiosity) is uniformly distributed between C0_bottom and (C0_bottom+C0_width)
alpha0_width=1;

beta0_bottom=0;%β(inverce temprature) is uniformly distributed between beta_bottom and (beta_bottom+beta_width)
beta0_width=10;

para_iQL=[numberofparticles,alpha_noise,beta_noise,alpha0_bottom,alpha0_width,beta0_bottom,beta0_width]
