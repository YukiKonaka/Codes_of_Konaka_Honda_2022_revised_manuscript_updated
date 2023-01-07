function plot_fig_FEP(sim_data)

ppl=cell2mat(sim_data(1));
T=cell2mat(sim_data(2));
lamdal=cell2mat(sim_data(3));
lamdar=cell2mat(sim_data(4));
Pl=cell2mat(sim_data(5));
Pr=cell2mat(sim_data(6));
Confidencel=cell2mat(sim_data(7));
Confidencer=cell2mat(sim_data(8));
Infogainl=cell2mat(sim_data(9));
Infogainr=cell2mat(sim_data(10));
Dl=cell2mat(sim_data(11));
Dr=cell2mat(sim_data(12));
Gl=cell2mat(sim_data(13));
Gr=cell2mat(sim_data(14));

f = figure;
subplot(2,3,1);
f.Position(3:4) = [1000 375];
plot(ppl,'r-')
hold on
plot(1-ppl,'g-')
legend("left","right")
ylim([0 1])
yticks([0 0.25 0.5 0.75 1])
box('off')
xticks([0 500 1000])


subplot(2,3,2)
plot(2:T,lamdal(2:end),'r-','LineWidth',1)
hold on
plot(2:T,lamdar(2:end),'g-','LineWidth',1)
hold on 
plot(2:T,Pl(2:end),'--','LineWidth',1)
hold on
plot(2:T,Pr(2:end),'--','LineWidth',1)
xlabel('Trials','FontSize',15,'FontWeight','bold')
ylabel({'Estimated';'Reward';'Probability'},'FontSize',15,'FontWeight','bold')
xlim([0,1000])
ylim([0,1])
xticks([0 500 1000])
yticks([0 0.25 0.5 0.75 1])
box('off')

subplot(2,3,3)
plot(2:T,Confidencel(2:end),'r-','LineWidth',1)
hold on
plot(2:T,Confidencer(2:end),'g-','LineWidth',1)
hold on
xlabel('Trials','FontSize',15,'FontWeight','bold')
ylabel('Confidence','FontSize',15,'FontWeight','bold')
xlim([0,1000])
ylim([0,44])
xticks([0 500 1000])
yticks([0:11:44])
box('off')


subplot(2,3,4)
plot(2:T,-Infogainl(2:end),'r-','LineWidth',1)
hold on
plot(2:T,-Infogainr(2:end),'g-','LineWidth',1)
xlabel('Trials','FontSize',15,'FontWeight','bold')
ylabel({'Info';'gain'},'FontSize',15,'FontWeight','bold')
xlim([0,1000])
ylim([0,0.6])
xticks([0 500 1000])
yticks([0:0.15:0.6])
box('off')

subplot(2,3,5)
plot(2:T,-Dl(2:end),'r-','LineWidth',1)
hold on
plot(2:T,-Dr(2:end),'g-','LineWidth',1)
xlabel('Trials','FontSize',15,'FontWeight','bold')
ylabel({'Expected';'Reward'},'FontSize',15,'FontWeight','bold')
xlim([0,1000])
ylim([0,1.2])
xticks([0 500 1000])
yticks([0:0.3:1.2])
box('off')

subplot(2,3,6)
plot(2:T,-Gl(2:end),'r-','LineWidth',1)
hold on
plot(2:T,-Gr(2:end),'g-','LineWidth',1)
xlabel('Trials','FontSize',15,'FontWeight','bold')
ylabel({'Expected';'net';'Utility'},'FontSize',15,'FontWeight','bold')
xlim([0,1000])
ylim([0,1.4])
xticks([0 500 1000])
yticks([0:0.35:1.4])
box('off')



end
