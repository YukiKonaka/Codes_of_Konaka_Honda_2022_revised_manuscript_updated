function para_FEP=get_para_FEP
%set game rule

sl1=0.9*ones(1,20);sl2=0.5*ones(1,41);sl3=0.5*ones(1,62);
sl4=0.1*ones(1,94);sl5=0.5*ones(1,20);sl6=0.9*ones(1,40);
sl7=0.1*ones(1,74);sl8=0.5*ones(1,40);
sl=[sl1,sl2,sl3,sl4,sl5,sl6,sl7,sl8];

sr1=0.5*ones(1,20);sr2=0.9*ones(1,41);sr3=0.1*ones(1,62);
sr4=0.5*ones(1,94);sr5=0.9*ones(1,20);sr6=0.5*ones(1,40);
sr7=0.5*ones(1,74);sr8=0.1*ones(1,40);
sr=[sr1,sr2,sr3,sr4,sr5,sr6,sr7,sr8];

Pl=sl;
Pr=sr;

T=length(sl);
time=1:T;

%set parameters
C=0*-sin(2*pi*time/(T/2));%curiosity
R=1;       %desired probability of the presence of a reward
vw=0.4;       %variance of the transition probability of w
am=0.05;      %learning rate
Beta=2.4956;       %inverse temprature

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
