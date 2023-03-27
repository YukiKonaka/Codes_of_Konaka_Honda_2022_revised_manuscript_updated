function likelihood = likelihood(predictedParticles,aa)
%predictedparticlesはZ measurementはX今回でいうところのa←action行動データ

size(predictedParticles);

s=length(aa);

for i=1:s

alpha=predictedParticles(1,:);
beta = predictedParticles(2,:);
Q1 = predictedParticles(3,:);
Q2 = predictedParticles(4,:);


beta2=exp(beta);
y=1./(1+exp(-beta2.*(Q1-Q2)));
m=(aa(i)==1);
L(i,:) = (y.^m).*((1-y).^(1-m));

end
likelihood =prod(L,1);
end

