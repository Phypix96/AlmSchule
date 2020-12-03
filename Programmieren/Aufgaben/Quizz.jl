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
    """
    Durchmische die Optionen mit der Antwort und erzeuge mit diesen durchmischten Optionen ein Auswahl-Menu.
    Frage als nachstes die Auswahl ab und speichere sie in einer Variable auswahl
    Funktionen: shuffle, RadioMenu, request
    """
    reaktion(optionen[auswahl], antwort)
end

function stelle_frage(frage, antwort)
    """
    Schreibe die Frage in die Konsole und lies die Antwort
    in einer Variable "antwort" ein
    Funktionen: println, readline
    """
    reaktion(auswahl, antwort)
end

function reaktion(auswahl, antwort)
    """
    Ueberpruefe, ob die Auswahl richtig ist.
    Wenn ja, schreibe "Richtig" in die Konsole,
    sonst, dass es falsch war, und was die richtige Antwort ist.
    Funktionen: ==, println
    """
end

function test(fragen, withoptions = true)
    fragen = shuffle(fragen)
    for frage in fragen
        ask_frage(frage, withoptions)
        println()
    end
end

function main()
    fragen = [Exercise("Welche Funktion erzeugt eine Schleife?", "for", ["switch", "if", "while"]),
              Exercise("Welche Zahlen-Typen gibt es?", ["Float", "Integer", "Complex"], ["Serviette", "Wasser"]),
              Exercise("Wie werden Kommazahlen genannt?", "Float", ["Int", "Number", "String"]),
              Exercise("Wie heisst der Typ fur wahr/falsch?", "Bool", ["Integer", "Float", "Pointer"]),]
    test(fragen)
end
