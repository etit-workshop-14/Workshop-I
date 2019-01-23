clear all;
%Zeichne theoretische Kurve der Entladung eines Kondensators
x = 0 : 0.1 : 5;
y = 5 * exp(-x);
figure1 = figure;
plot(x, y, 'r');
title('Theoretische entladung eines 5V Kondensators');
ylabel('Spannung [V]');
xlabel('Zeit [sec]');
xlim([0, 5]);
saveas(figure1, '../pictures/Kondensator/5-V-Theorie.eps','epsc');