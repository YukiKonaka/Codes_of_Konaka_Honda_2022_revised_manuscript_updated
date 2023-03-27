function plot_fig_FEP(sim_data)

C=cell2mat(sim_data(1));
Dr=cell2mat(sim_data(2));
Dl=cell2mat(sim_data(3));
Infogainr=cell2mat(sim_data(4));
Infogainl=cell2mat(sim_data(5));
a=cell2mat(sim_data(6));

figure
plot(0,0)
hold on
x=meshgrid(-10:0.01:10);
y=flipud(x');
zz= -(1 * x +mean(C) *y);
z=(1+exp(-zz)).^(-1);
imagesc(x(1,:),y(:,1),z);
xlim([-1,1])
ylim([-1,1])
colormap('redblue')

deltaR=Dr(1:end-1)-Dl(1:end-1);
deltaI=Infogainr(1:end-1)-Infogainl(1:end-1);
AA=a(2:end);
dU=deltaR + mean(C).*deltaI;

hoge=(AA==1) .* (dU<0);
sum(hoge)
plot(deltaR(hoge==1),deltaI(hoge==1),'.b')
hold on
hoge=(AA==0) .* (dU>0);
sum(hoge)
plot(deltaR(hoge==1),deltaI(hoge==1),'.r')
hoge=(AA==1) .* (dU>0);
sum(hoge)
plot(deltaR(hoge==1),deltaI(hoge==1),'.b')
hoge=(AA==0) .* (dU<0);
sum(hoge)
plot(deltaR(hoge==1),deltaI(hoge==1),'.r')


xx=[-10:0.1:10];
yy=-1/mean(C)*xx;
plot(xx,yy,'k')
%colorbar
axis image
xlim([-1,1])
ylim([-1,1])
yticks([-1:0.5:1])
xline(0)
caxis([0.5-1,0.5+1])



end
