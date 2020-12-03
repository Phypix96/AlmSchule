using Plots

logistic(x, r) = r*x*(1-x)

function ueberspringen(wert, r, schritte)
    for i = 1:schritte
        wert = logistic(wert, r)
    end
    return wert
end

function logistic(schritte, r, start, ignorieren = 0)
    start = ueberspringen(start, r, ignorieren)

    population = zeros(schritte)
    population[1] = start
    for i = 2:schritte
        population[i] = logistic(population[i-1], r)
    end
    return population
end

function chaos(r_bereich, schritte, stellen, ignorieren = 10000)
    r_werte = []
    werte = []
    for r = r_bereich
        population = logistic(schritte, r, 0.5, ignorieren)
        population = unique(round.(population; digits=stellen))
        append!(werte, population)
        append!(r_werte, fill(r, length(population)))
    end
    return (r_werte, werte)
end

function main()
    r_bereich = LinRange(3.5, 4, 1000)
    schritte = 1000
    stellen = 4
    r_werte, werte = chaos(r_bereich, schritte, stellen)
    scatter(r_werte, werte, legend = false, markersize = 1, markerstrokewidth=0.01)
end
