clear all;
aufladen = importMessung('Aufladen_1');
entladen = importMessung('Entladen_1');
len_aufladen = height(aufladen);
len_entladen = height(entladen);
R_L = 500;
C = 200 / 1000;

%Doppelte Spannung ist U_ges
aufladen{:, 2} = aufladen{:, 2} * 2;
entladen{:, 2} = entladen{:, 2} * 2;

%Diff der Spannung
aufladen_diff = diff(aufladen{:, 2});
aufladen_diff(length(aufladen_diff) + 1) = aufladen_diff(length(aufladen_diff));
entladen_diff = diff(entladen{:, 2});
entladen_diff(length(entladen_diff) + 1) = entladen_diff(length(entladen_diff));

%Leistung: U^2/R
%aufladen{:, 3} = (aufladen{:, 2}.^2 / R_L) * 1000;
%entladen{:, 3} = (entladen{:, 2}.^2 / R_L) * 1000;
%Leistung: U*I
aufladen{:, 3} = aufladen{:, 2} .* aufladen_diff * 1000;
entladen{:, 3} = entladen{:, 2} .* entladen_diff * 1000;

%Aufladen ueber Zeit
figure1 = figure;
plot(aufladen{:, 1}, aufladen{:, 2}, '-');
%Entladen ueber Zeit (nach Aufladungskurve dranhaengen)
hold on;
plot(entladen{:, 1} + len_aufladen, entladen{:, 2}, '-');

title('U-t-Kennlinie eines ladenden/entladenden Kondensators');
legend('Aufladen', 'Entladen');
grid on;
xlabel('Zeit [s]');
ylabel('Spannung [V]');
xlim([0, 550]);
ylim([0, 0.35]);
saveas(figure1, '../pictures/Kondensator/Aufladen-Entladen.eps','epsc');

%Berechnung der Energie fuer das Aufladen durch die Leistung und die Zeit
energie_Aufladung = trapz(aufladen{:, 1}, aufladen{:, 3});
disp('Aufgenommene Energie:');
disp(energie_Aufladung);

%Berechnung der Energie fuer das Entladen durch die Leistung und die Zeit
energie_Entladung = trapz(entladen{:, 1}, entladen{:, 3});
disp('Abgegebene Energie:');
disp(energie_Entladung);