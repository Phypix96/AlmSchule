using REPL.TerminalMenus
using Random

struct Exercise
    question
    answer
    options
end

function ask_question(exercise::Exercise, withoptions = true)
    if withoptions
        correct = ask_question(exercise.question, exercise.answer, exercise.options)
    else
        correct = ask_question(exercise.question, exercise.answer)
    end
end

function ask_question(question, answer, options)
    if typeof(answer) <: Array
        options = shuffle([answer..., options...])
        menu = MultiSelectMenu(options)
    elseif typeof(answer) <: String
        options = shuffle([answer, options...])
        menu = RadioMenu(options)
    end
    choice = request(question, menu)
    typeof(choice) <: Set ? choice = options[[choice...]] : choice = options[choice]
    return react(choice, answer)
end

function ask_question(question, answer)
    println(question)
    choice = readline()
    return react(choice, answer)
end

function react(choice, answer)
    correct = compare(choice, answer)
    if correct
        println("Richtig!")
        return true
    elseif typeof(answer) <: Array
        print("Leider falsch. Alle richtigen Antworten sind: ")
        for ans in answer
            print(ans, ", ")
        end
        println()
    else
        println("Leider falsch. Die richtige Antwort ist $answer.")
    end
    return false
end

function compare(choice, answer)
    if typeof(answer) <: Array
        correct = true
        for c in choice
            correct = correct && in(c, answer)
        end
    else
        correct = choice == answer
    end
    return correct
end


function test(questions, withoptions = true)
    for question in questions
        ask_question(question, withoptions)
        println()
    end
end

#function test(questions, n)
#    test(rand(questions, n))
#end


#function sample(rng::AbstractRNG, wv::AbstractWeights)
#    t = rand(rng) * sum(wv)
#    n = length(wv)
#    i = 1
#    cw = wv[1]
#    while cw < t && i < n
#        i += 1
#        @inbounds cw += wv[i]
#    end
#    return i
#end



questions = [Exercise("Welche Funktion erzeugt eine Schleife?", "for", ["switch", "if", "while"]),
             Exercise("Welche Zahlen-Typen gibt es?", ["Float", "Integer", "Complex"], ["Serviette", "Wasser"]),
             Exercise("Wie werden Kommazahlen genannt?", "Float", ["Int", "Number", "String"]),
             Exercise("Wie heisst der Typ fur wahr/falsch?", "Bool", ["Integer", "Float", "Pointer"]),]
