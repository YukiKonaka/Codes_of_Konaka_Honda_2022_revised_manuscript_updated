function particles = state_transition(particles,aa,rr,alpha_noise,beta_noise) 

[numberOfStates, numberOfParticles] = size(particles);
%particles(:,1:10)

s=length(aa);
alpha=particles(1,:);
beta=particles(2,:);
preQ1=particles(3,:);
preQ2=particles(end,:);

Q1=zeros(s,numberOfParticles);
Q2=zeros(s,numberOfParticles);

alpha=alpha+alpha_noise*randn(1,numberOfParticles);
beta =beta +beta_noise*randn(1,numberOfParticles);

for i=1:s
    if i==1
        Q1(i,:)=preQ1+alpha.*(rr(i)*(aa(i)==1)-preQ1);
        Q2(i,:)=preQ2+alpha.*(rr(i)*(aa(i)==2)-preQ2);
        else
    Q1(i,:)=Q1(i-1,:)+alpha.*(rr(i)*(aa(i)==1)-Q1(i-1,:));
    Q2(i,:)=Q2(i-1,:)+alpha.*(rr(i)*(aa(i)==2)-Q2(i-1,:));
    end    
end

particles=[alpha;beta;Q1;Q2];


end
