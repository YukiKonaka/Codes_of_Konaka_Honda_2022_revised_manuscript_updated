function smoother=run_smoother(filter,a,o,alpha_noise,beta_noise)

N=length(a);

Q_noise=0.01;

beta_noise=0.0005
alpha_noise=0.001*2

rr=[Q_noise;Q_noise;alpha_noise;beta_noise];
r=diag(rr);

pf_Q1=transpose(cell2mat(filter(1))); 
pf_Q2=transpose(cell2mat(filter(2)));
pf_alpha=transpose(cell2mat(filter(3)));
pf_beta=transpose(cell2mat(filter(4)));

m=[pf_Q1;pf_Q2;pf_alpha;pf_beta];
v=cell2mat(filter(5));

M=zeros(4,N);
M(:,N)=m(:,N);
V(:,:,N)=v(:,:,N);

for t=1:N-1

F(1,:)=pf_Q1(N-t)+pf_alpha(N-t+1)*(o(N-t)*(a(N-t)==1)-pf_Q1(N-t));
F(2,:)=pf_Q2(N-t)+pf_alpha(N-t+1)*(o(N-t)*(a(N-t)==2)-pf_Q2(N-t));
F(3,:)=0;
F(4,:)=0;

FF(1,:)=1-pf_alpha(N-t)*(a(N-t)==1);
FF(2,:)=1-pf_alpha(N-t)*(a(N-t)==0);


A=zeros(4,4);
A(1,1)=FF(1,:);
A(2,2)=FF(2,:);
A(3,3)=1;
A(4,4)=1;

mm=m(:,N-t);
mm(3)=0;
mm(4)=0;
d=F-A*mm;

P=r+A*v(:,:,N-t)*transpose(A); 

J=v(:,:,N-t)*transpose(A)*inv(P);  

M(:,N-t)=m(:,N-t)+J*(M(:,N-t+1)-d-A*m(:,N-t)); 
V(:,:,N-t)=v(:,:,N-t)+J*(V(:,:,N-t+1)-P)*transpose(J);

end
smoother=[{M} {V}];
