using Plots

logistic(x, r) = r*x*(1-x)

function skip(value, r, steps)
    for i = 1:steps
        value = logistic(value, r)
    end
    return value
end

function logistic(steps, r, start, ignore = 0)
    population = zeros(steps)
    start = skip(start, r, ignore)
    population[1] = start
    for i = 2:steps
        population[i] = logistic(population[i-1], r)
    end
    return population
end

function chaos(r_range, steps, digits, ignore = 10000)
    r_values = []
    values = []
    for r = r_range
        population = logistic(steps, r, 0.5, ignore)
        population = unique(round.(population; digits=digits))
        for val in population
            append!(r_values, r)
            append!(values, val)
        end
    end
    return (r_values, values)
end
