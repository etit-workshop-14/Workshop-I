clear all;
%R_mess = 100kOhm
R_mess = 100000;
Widerstaende = [0, 100, 150, 220, 470, 570, 680, 780, 830, 1000, 1150, 1220, 1500, 2200, 3300, 4300, 5020, 8200, 10000, 15000, 20000, 40000];

Leuchtstoffroehre = zeros(22, 2);
%Gemessene Spannungen einfuegen als U_ges = 2 * U_mess
Leuchtstoffroehre(:, 1) = 2 * [1.53, 0.0155, 0.0255, 0.04, 0.09, 0.11, 0.125, 0.145, 0.155, 0.18, 0.22, 0.23, 0.275, 0.38, 0.58, 0.7, 0.77, 1.2, 1.3, 1.45, 1.5, 1.52];
%I_ges = ((2*U_mess)*(R_mess+R_L))/(R_mess*R_L)
for i = 1 : 22
    %Schon als 2*U_mess eingespeichert
    U_mess_2 = Leuchtstoffroehre(i, 1);
    R_L = Widerstaende(i);
    %in mA umrechnen: *1000
    Leuchtstoffroehre(i, 2) = (U_mess_2 * (R_mess + R_L)) / (R_mess * R_L) * 1000;
end
Leuchtstoffroehre = sortrows(Leuchtstoffroehre);

Taschenlampe = zeros(22, 2);
%Gemessene Spannungen einfuegen als U_ges = 2 * U_mess
Taschenlampe(:, 1) = 2 * [2.1, 0.034, 0.052, 0.075, 0.16, 0.19, 0.23, 0.255, 0.27, 0.32, 0.354, 0.38, 0.48, 0.64, 0.9, 1.08, 1.2, 1.45, 1.55, 1.75, 1.9, 2];
%I_ges = ((2*U_mess)*(R_mess+R_L))/(R_mess*R_L)
for i = 1 : 22
    %Schon als 2*U_mess eingespeichert
    U_mess_2 = Taschenlampe(i, 1);
    R_L = Widerstaende(i);
    %in mA umrechnen: *1000
    Taschenlampe(i, 2) = (U_mess_2 * (R_mess + R_L)) / (R_mess * R_L) * 1000;
end
Taschenlampe = sortrows(Taschenlampe);

Schreibtischlampe = zeros(22, 2);
%Gemessene Spannungen einfuegen als U_ges = 2 * U_mess
Schreibtischlampe(:, 1) = 2 * [1.75, 0.0165, 0.025, 0.0365, 0.075, 0.0885, 0.11, 0.125, 0.13, 0.155, 0.18, 0.19, 0.24, 0.35, 0.51, 0.65, 0.75, 1.15, 1.225, 1.425, 1.55, 1.6];
%I_ges = ((2*U_mess)*(R_mess+R_L))/(R_mess*R_L)
for i = 1 : 22
    %Schon als 2*U_mess eingespeichert
    U_mess_2 = Schreibtischlampe(i, 1);
    R_L = Widerstaende(i);
    %in mA umrechnen: *1000
    Schreibtischlampe(i, 2) = (U_mess_2 * (R_mess + R_L)) / (R_mess * R_L) * 1000;
end
Schreibtischlampe = sortrows(Schreibtischlampe);

figure1 = figure;
plot(Leuchtstoffroehre(:, 1), Leuchtstoffroehre(:, 2), '-x', 'LineWidth', 1.5);
title('I-U-Kennlinie fuer eine Leuchtstoffroehre');
grid on;
xlabel('Spannung [V]');
ylabel('Stromstaerke [mA]');
ylim([0, 0.7]);
saveas(figure1, '../pictures/I-U/Leuchtstoffroehre-UI.eps','epsc');

figure2 = figure;
plot(Taschenlampe(:, 1), Taschenlampe(:, 2), '-x', 'LineWidth', 1.5);
title('I-U-Kennlinie fuer eine Taschenlampe');
grid on;
xlabel('Spannung [V]');
ylabel('Stromstaerke [mA]');
ylim([0, 1]);
xlim([0, 4.1]);
saveas(figure2, '../pictures/I-U/Taschenlampe-UI.eps','epsc');

figure3 = figure;
plot(Schreibtischlampe(:, 1), Schreibtischlampe(:, 2), '-x', 'LineWidth', 1.5);
title('I-U-Kennlinie fuer eine Schreibtischlampe');
grid on;
xlabel('Spannung [V]');
ylabel('Stromstaerke [mA]');
ylim([0, 0.5]);
xlim([0, 3.5]);
saveas(figure3, '../pictures/I-U/Schreibtischlampe-UI.eps','epsc');