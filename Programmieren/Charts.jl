using Dates, DelimitedFiles, Plots

function getdata(length, Nsongs, skip = Day(0))
    if typeof(skip) <: Integer
        skip = Day(skip)
    end

    Charts = Dict{String, Array{Float64,1}}()
    for i = 1:length
        date = today() - skip - i*Day(1)
        path = "data/$date.csv"
        if !ispath(path)
            @info("Downloading charts from $date")
            download("https://spotifycharts.com/regional/global/daily/$date/download", path)
        end
        file = readdlm(path, ','; header = true, skipstart = 1)[1]
        for k = 1:Nsongs
            update!(Charts, file[k, 2:end-1], i, length)
        end
    end
    return Charts
end

function getdata(from::Date, to::Date, Nsongs)
    length = (to - from).value
    skip = today() - to
    return getdata(length, Nsongs, skip)
end

function update!(Songs, song, i, length)
    name = song[2]
    if !haskey(Songs, name)
        Songs[name] = fill(NaN, length)
    end
    Songs[name][length - i + 1] = song[end]
end

function main()
    #from = Date(2019, 12, 22)
    #to = Date(2020, 10, 26)
    #charts = getdata(from, to, 10)
    charts = getdata(365, 4, 1)
    p = plot(legend=false)
    for val in values(charts)
        plot!(val)
    end
    display(p)
end
