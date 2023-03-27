function para_FEP=get_para_FEP(c)
%set game rule
T=1000; %number of trials
time=1:T;

wr_tmp=rand;
wl_tmp=rand;
wr(1)=wr_tmp;
wl(1)=wl_tmp;

for i=2:T
    wr_tmp=wr_tmp-0.01*wr_tmp+0.15*randn;
    wl_tmp=wl_tmp-0.01*wl_tmp+0.15*randn;
    wr(i)=wr_tmp;
    wl(i)=wl_tmp;
end
Pr=1./(1+exp(-wr));
Pl=1./(1+exp(-wl));

%set parameters
C=c*ones(1,T);%curiosity


Po=0.8;       %desired probability of the presence of a reward
vw=0.4;       %variance of the transition probability of w
am=0.05;      %learning rate
beta=2;       %inverse temprature


%set initial values
po=0.1;   % initial value of precision of Q(w)
mo=0;     % initial value of mean of Q(w)

ml(1)=mo; 
pl(1)=po;
mr(1)=mo;
pr(1)=po;

a(1)=rand<0.5; 
dt=1;

para_FEP=[a,am,beta,{C},dt,ml,mo,mr,pl,{Pl},po,Po,pr,{Pr},T,{time},vw]
