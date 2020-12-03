#ä ö ü 
using Dates, DelimitedFiles, Plots

function value(d::Day)
    return d.val
end


function ladedaten(länge, Nsongs, überspringen = Day(0))
    if typeof(überspringen) <: Integer
        überspringen = Day(überspringen)
    end

    Charts = Dict{String, Array{Float64,1}}()
    for i = 1:länge
        #Fuer alle Tage, die hoechstens laenge her sind, bestimme das Datum
        datum = today() - überspringen - i*Day(1)
        dateipfad = "data/$date.csv"

        """
        Ladet die Datei herunter, wenn sie noch nicht existiert

        Funktionen: isfile, download
        Website: https://spotifycharts.com/regional/global/daily/$datum/download
        """

        """
        Ladet daten in einen Array (mit Namen "daten"), wobei ihr die ersten beiden Zeilen auslaesst.
        'daten' ist dann ein Array, in dem jeder Eintrag wie folgt aufgebaut ist:
        Rang    Titel   Interpret   Wiedergaben    URL
        
        Funktion: readdlm
        """
        #Fuegt die ersten Nsongs Lieder zu Charts hinzu
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
    """
    Falls der Song noch nicht in 'Songs' ist, fügt einen neuen Array mit Länge 'laenge' hinzu.
    Der Array sollte überall den Wert NaN haben
    Als nästes soll an der Stelle i des Arrays die Anzahl der Wiedergaben eingefügt werden

    Funktionen: haskey, fill
    """
    return nothing
end


function main()
    #von = Date(2018, 12, 20)
    #bis = Date(2018, 12, 30)
    #charts = ladedaten(von, bis, 10)
    charts = ladedaten(365, 4, 1)
    p = plot(legend=false)
    for val in values(charts)
        plot!(val)
    end
    display(p)
end
