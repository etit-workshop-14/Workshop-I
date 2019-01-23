clear all;
%Von wissenschaftlicher Zahlenschreibweise in Dezimalschreibweise
format longg;
langzeitmessung = importMessung('Langzeitmessung');
len_L = height(langzeitmessung);
R_L = 1000;

for i = 1 : len_L
    %Doppelte Spannung ist U_ges
    double_U = langzeitmessung{i, 2} * 2;
    langzeitmessung{i, 2} = double_U;
    %Leistung berechnen: U^2/R in mW
    langzeitmessung{i, 3} = (double_U^2 / R_L) * 1000;
end

%Spannung ueber Zeit
figure1 = figure;
plot(langzeitmessung{:, 1}, langzeitmessung{:, 2}, '-');
title('U-t-Kennlinie einer Solarzelle');
grid on;
xlabel('Zeit [s]');
ylabel('Spannung [V]');
ylim([0, 1.6]);
saveas(figure1, '../pictures/U-t/U-t-Kennlinie.eps','epsc');

%Leistung ueber Zeit
figure2 = figure;
plot(langzeitmessung{:, 1}, langzeitmessung{:, 3}, '-');
title('P-t-Kennlinie einer Solarzelle');
grid on;
xlabel('Zeit [s]');
ylabel('Leistung [mW]');
ylim([0, 2.0]);
saveas(figure2, '../pictures/U-t/P-t-Kennlinie.eps','epsc');

%Berechnung der Energie durch die Leistung und die Zeit
E = trapz(langzeitmessung{:, 1}, langzeitmessung{:, 3});
disp('Erzeugte Energie:');
disp(E);