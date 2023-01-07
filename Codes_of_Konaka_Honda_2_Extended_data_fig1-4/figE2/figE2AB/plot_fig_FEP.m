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
Al_prob=cell2mat(sim_data(15));
a=cell2mat(sim_data(16));


e_reward=Al_prob.*(-Dl)+(1-Al_prob).*(-Dr);
e_info=Al_prob.*(-Infogainl)+(1-Al_prob).*(-Infogainr);


f = figure;
f.Position(3:4) = [1000 400];
subplot(1,2,1)
plot(e_info,'LineWidth',5)
%plot(-Infogainl,'LineWidth',5)
hold on
plot(e_reward,'r-','LineWidth',5)
%plot(-Dl,'r-','LineWidth',5)
legend('information gain','expected reward')
xlim([0,10])
ylim([0,1])
xticks([0:5:15])
yticks([0:0.2:1])
box('off')


subplot(1,2,2)
plot(e_info(round(0.25*length(a)):end),e_reward(round(0.25*length(a)):end),".")
xlabel("e-Information gain")
ylabel("e-Expected reward")
xlim([0.1 0.3])
xticks([0.1:0.1:0.3])
ylim([.7 .95])
yticks([.7:0.05:.95])
box('off')


end
