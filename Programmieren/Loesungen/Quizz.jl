using REPL.TerminalMenus
using Random

struct Aufgabe
    frage
    antwort
    optionen
end

function stelle_frage(aufgabe::Aufgabe, mitoptionen = true)
    mitoptionen ? stelle_frage(aufgabe.frage, aufgabe.antwort, aufgabe.optionen) :
                  stelle_frage(aufgabe.frage, aufgabe.antwort)
end

function stelle_frage(frage, antwort, optionen)
    optionen = shuffle([antwort, optionen...])
    menu = RadioMenu(optionen)
    auswahl_nummer = request(frage, menu)
    auswahl = optionen[auswahl_nummer]
    return reagiere(auswahl, antwort)
end

function stelle_frage(frage, antwort)
    println(frage)
    auswahl = readline()
    return reagiere(auswahl, antwort)
end

function reagiere(auswahl, antwort)
    korrekt = (auswahl == antwort)
    if korrekt
        println("Richtig!")
        return true
    else
        println("Leider falsch. Die richtige Antwort ist $antwort.")
    end
    return false
end


function test(fragen, mitoptionen = true)
    fragen = shuffle(fragen)
    for frage in fragen
        stelle_frage(frage, mitoptionen)
        println()
    end
end


fragen = [Aufgabe("Welche Funktion erzeugt eine Schleife?", "for", ["switch", "if", "while"]),
             Aufgabe("Wie werden Kommazahlen genannt?", "Float", ["Int", "Number", "String"]),
             Aufgabe("Wie heisst der Typ fur wahr/falsch?", "Bool", ["Integer", "Float", "Pointer"]),]
