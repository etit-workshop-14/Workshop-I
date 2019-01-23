clear all;
ohne_Kondensator = importMessung('OhneKondensator');
mit_Kondensator = importMessung('MitKondensator');
len_ohne = height(ohne_Kondensator);
len_mit = height(mit_Kondensator);

%U_ges = 2*U_mess
ohne_Kondensator{:, 2} = ohne_Kondensator{:, 2} * 2;
mit_Kondensator{:, 2} = mit_Kondensator{:, 2} * 2;

%Spannung ueber Zeit
figure1 = figure;
plot(ohne_Kondensator{:, 1}, ohne_Kondensator{:, 2}, '-');
title('U-t-Kennlinie einer Solarzelle ohne Kondensator');
grid on;
xlabel('Zeit [s]');
ylabel('Spannung [V]');
%ylim([0, 1.6]);
saveas(figure1, '../pictures/Vergleich/ohne-Kondensator.eps','epsc');

%Spannung ueber Zeit
figure2 = figure;
plot(mit_Kondensator{:, 1}, mit_Kondensator{:, 2}, '-');
title('U-t-Kennlinie einer Solarzelle mit Kondensator');
grid on;
xlabel('Zeit [s]');
ylabel('Spannung [V]');
%ylim([0, 1.6]);
saveas(figure2, '../pictures/Vergleich/mit-Kondensator.eps','epsc');