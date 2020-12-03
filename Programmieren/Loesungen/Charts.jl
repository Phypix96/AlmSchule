using Dates, DelimitedFiles, Plots

function ladedaten(länge, Nsongs, überspringen = Day(0))
    if typeof(überspringen) <: Integer
        überspringen = Day(überspringen)
    end

    Charts = Dict{String, Array{Float64,1}}()
    for i = 1:länge
        datum = today() - überspringen - i*Day(1)
        dateipfad = "data/$datum.csv"
        if !isfile(dateipfad)
            @info("Downloading charts from $datum")
            download("https://spotifycharts.com/regional/global/daily/$datum/download", dateipfad)
        end
        daten = readdlm(dateipfad, ','; header = true, skipstart = 1)[1]
        for k = 1:Nsongs
            update!(Charts, daten[k, 2], daten[k, end-1], i, länge)
        end
    end
    return Charts
end

function ladedaten(von::Date, bis::Date, Nsongs)
    länge = (bis - von).value
    überspringen = today() - bis
    return ladedaten(länge, Nsongs, überspringen)
end

function update!(Songs, titel, wiedergaben, i, länge)
    if !haskey(Songs, titel)
        Songs[titel] = fill(NaN, länge)
    end
    Songs[titel][länge - i + 1] = wiedergaben
end

function main()
    #von = Date(2018, 12, 20)
    #bis = Date(2018, 12, 30)
    #charts  ladedaten(von, bis, 10)
    charts = ladedaten(365, 4, 1)
    p = plot(legend=false)
    for wert in values(charts)
        plot!(wert)
    end
    display(p)
end
