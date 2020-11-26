#https://spotifycharts.com/regional/global/daily/2020-11-22
#
using Dates

function getdata(length, skip = Day(0))
    if typeof(skip) <: Integer
        skip = Day(skip)
    end

    for i = 1:length
        date = today() - skip - i*Day(1)
        path = "data/$date.csv"
        if !ispath(path)
            @info("Downloading charts from $date")
            download("https://spotifycharts.com/regional/global/daily/$date/download", path)
        end
    end
end

# Charts["Song title"] = Array(Chart position)
# if !haskey(Charts, song)
#     Charts[song] = fill(-Inf, length)
# end
# Charts[song][i] = streams


