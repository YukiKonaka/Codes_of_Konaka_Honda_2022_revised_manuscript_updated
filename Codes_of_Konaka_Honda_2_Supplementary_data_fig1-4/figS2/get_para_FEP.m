function para_FEP=get_para_FEP
%set game rule
T=1500; %number of trials
time=1:T;
Pl=0.5*-cos(2*pi*time/(T/2))+0.5; %reward probability(left)
Pr=0.5*cos(2*pi*time/(T/2))+0.5;%reward probability(right)

%set parameters
C=9*-sin(2*pi*time/(T/2))+3;%curiosity
R=1;       %desired probability of the presence of a reward
vw=0.4;       %variance of the transition probability of w
am=0.05;      %learning rate
Beta=1.5;       %inverse temprature

%set initial values
po=0.1;   % initial value of precision of Q(w)
mo=0;     % initial value of mean of Q(w)

ml(1)=mo; 
pl(1)=po;
mr(1)=mo;
pr(1)=po;

a(1)=rand<0.5; 
dt=1;


para_FEP=[a,am,Beta,{C},dt,ml,mo,mr,pl,{Pl},po,R,pr,{Pr},T,{time},vw]
