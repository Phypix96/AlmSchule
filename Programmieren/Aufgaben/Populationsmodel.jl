using Plots

logistic(x, r) = r*x*(1-x)

function ueberspringen(wert, r, schritte)
    for i = 1:schritte
        wert = logistic(wert, r)
    end
    return wert
end

function logistic(schritte, r, start, ignorieren = 0)
    """
    Ueberspringt die ersten Schritte (in Variable "ignorieren" gegeben).
    Der resultierende Wert ist der neue Start-Wert
    """

    population = zeros(schritte)
    population[1] = start

    """
    Wertet die Logistische Funktion schritte-mal aus und speichert das Ergebnis in
    population an der zugehoerigen Stelle
    """
    return population
end

function chaos(r_bereich, schritte, stellen, ignorieren = 10000)
    r_werte = []
    werte = []
    """
    Fuer alle r-Werte in r_range, berechnet "schritte" Werte der logistischen Funktion.
    Fuegt diese Werte zu "werte" hinzu, und den zugehoerigen r-Wert in "r_werte"
    Funktionen: append! oder push!

    OPTIONAL:
    Rundet die Werte auf "stellen" Nachstellen und schliesst alle mehrfach vorhandenen Werte aus
    Funktionen: round, unique

    """
    return (r_werte, werte)
end

function main()
    r_bereich = LinRange(0, 4, 1000)
    schritte = 1000
    stellen = 4
    r_werte, werte = chaos(r_bereich, schritte, stellen)
    scatter(r_werte, werte, markersize = 1, markerstrokewidth = 0.01)
end
