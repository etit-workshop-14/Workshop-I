clear all;
%R_mess = 100kOhm
R_mess = 100000;
Widerstaende = [0, 100, 150, 220, 470, 570, 680, 780, 830, 1000, 1150, 1220, 1500, 2200, 3300, 4300, 5020, 8200, 10000, 15000, 20000, 40000];

%Gemessene Spannungen einspeisen
Leuchtstoffroehre = 2 * [1.53, 0.0155, 0.0255, 0.04, 0.09, 0.11, 0.125, 0.145, 0.155, 0.18, 0.21, 0.23, 0.275, 0.38, 0.58, 0.7, 0.77, 1.2, 1.3, 1.45, 1.5, 1.52];

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

Schreibtischlampe = 2 * [1.75, 0.0165, 0.025, 0.0365, 0.075, 0.0885, 0.11, 0.125, 0.13, 0.155, 0.18, 0.19, 0.24, 0.35, 0.51, 0.65, 0.75, 1.15, 1.225, 1.425, 1.55, 1.6];

drawMPP(Widerstaende, Leuchtstoffroehre, 1);
drawMPP(Widerstaende, Taschenlampe(:, 1), 2);
drawMPP(Widerstaende, Schreibtischlampe, 3);

%Zeichne U-I-Kennlinie links und Leistung rechts
figure1 = figure;
plot(Taschenlampe(:, 1), Taschenlampe(:, 2), '-x');

A = zeros(22, 1);
for i = 1 : 22
    %In mW umrechnen
    A(i) = Taschenlampe(i, 1)^2 / Widerstaende(i) * 1000;
end


title("P-U-Kennlinie einer Taschenlampe");
xlabel("Spannung [V]");
ylabel("Stromstaerke [mA]");
ylim([0, 1]);
line([0, 2.4], [0.5021, 0.5021], 'Color', 'Black');
line([2.4, 2.4], [0, 0.5021], 'Color', 'Black');
line([2.4, 2.4], [0.82, 0.5021], 'Color', 'Black', 'LineStyle', ':');

yyaxis right;
ylabel("Leistung [mW]");
hold on;
plot(Taschenlampe(:, 1), A, '-x');
grid on;
saveas(figure1, '../pictures/MPP/P-U-Kennlinie-Taschenlampe-MPP.eps','epsc');

