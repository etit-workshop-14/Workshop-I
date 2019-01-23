function [] = drawMPP(Widerstande, Spannung, Typ)
    names = ["Leuchtstoffroehre", "Taschenlampe", "Schreibtischlampe"];
    files = ["../pictures/MPP/Leuchtstoffroehre-MPP.eps", "../pictures/MPP/Taschenlampe-MPP.eps", "../pictures/MPP/Schreibtischlampe-MPP.eps"];

    A = zeros(22, 1);
    figure1 = figure;
    for i = 1 : 22
        %In mW umrechnen
        A(i) = Spannung(i)^2 / Widerstande(i) * 1000;
    end
    plot(Widerstande, A, '-x');
    title(["Maximum-Power-Point einer ", names(Typ)]);
    xlabel("Widerstand [Ohm]");
    ylabel("Leistung in [mW]");
    grid on;
    saveas(figure1, files(Typ), 'epsc');
end

