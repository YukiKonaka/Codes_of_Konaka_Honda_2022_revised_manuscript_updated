clear all 
close all
clc


w=[-10:0.01:10];
sig=1./(1+exp(-w));
step1=1;
step2=5;
step3=10;
vw=0.560;


mu = 0;
sigma1 = sqrt(vw*step1);
gau1 = normpdf(w,mu,sigma1);

sigma2 = sqrt(vw*step2);
gau2 = normpdf(w,mu,sigma2);

sigma3 = sqrt(vw*step3);
gau3 = normpdf(w,mu,sigma3);

figure
plot(w,sig)
hold on
plot(w,gau1)
hold on
plot(w,gau2)
hold on
plot(w,gau3)
box("off")
xlim([-8 8])
xticks([-8:4:8])
yticks([0:0.25:1])

legend("sigmoidal","step=1","step=5","step=10")