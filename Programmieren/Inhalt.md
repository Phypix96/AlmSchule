# Programmieren
## Computer Grundlagen
Was macht ein Computer eigentlich?
    Ein Computer fuehrt eine Reihe Befehle aus und erzeug ein Ergebnis.
    Das kann eine Zahl sein, ein Bild, eine Bildschirm-Ausgabe, ...
Wie teilt man einem Computer mit, was er tun soll?
    Die Befehle, die ein Computer versteht sind eine Reihe von Strom-Aus, Strom-An Signalen.
    Diese per Hand zu schreiben ist extrem muehsam und nur fuer kleine Programme ueberhabt machbar.
    Darum haben wir Programme entwickelt, die diese Befehle aus Menschen-lesbarer Form in Computer Form bringen.
    Diese Programme nennen wir Compiler, die Menschen-lesbare Form Programmiersprache.
    Es gibt eine grosse Vielfalt an Programmiersprachen, die fuer verschiedene Anwendungen gemacht sind, z.B. C, C++, Java, JavaScript, Python, Rust, Go, ...
    Manche dieser Sprachen sind sehr leicht zu programmieren und dafuer eher langsam, wobei andere komplizierter sind, dafuer aber auch hoehere Geschwindigkeiten bieten.
    Wir werden uns mit Julia beschaeftigen.
    Anders als C oder C++ kuemmer Julia sich automatisch um viele Aspekte, die fuer den Computer wichtig sind, fuer uns aber nur muehsam.
    Das macht das Programmieren mit Julia wesentlich schneller.
    Julia Code kann dabei fast genauso schnell (und manchmal sogar schneller) sein wie C oder C++ Code, die in der Regel die schnellsten Code erzeugen.

## Bausteine des Programmierens
Was sind die Bausteine eines Programms?
    Ganz allgemein besteht ein Programm aus Variablen, in denen Daten gespeichert sein koennen, sowie Funktionen.
    Diese Funktionen koennen die Variablen nehmen und veraendern, sowie neue Variablen erzeugen. 
Was sind diese Variablen?
    Ein Computer speichert verschiedene Daten unterschiedlich ab.
    Man spricht hier von Daten-Typen.
    Ganze Zahlen werden z.B. anders gespeichert als Kommazahlen.
    Diese Typen werden mit dem englischen Namen benannt, also Integer und Float-Point (kurz Int und Float)
    Fuer Text verwendet man Char (Character) fuer einzelne Buchstaben, und String fuer Text, der aus mehreren Buchstaben besteht.
    Es gibt auch einen eigenen Typen fuer wahr/falsch. Dieser wird Bool genannt.
    TODO: zusammenfassende Tabelle

    Man kann diese elementaren Typen auch kombinieren, wenn man viele Daten zum Verarbeiten hat.
    Das einfachste Beispiel hierfuer ist ein Tuple.
    In einem Tuple kann jedes Element einen anderen Typen haben, aber man muss im vorhinein wissen, welche Elemente man hat.
    TODO: Julia Beispiel
    Wenn jedes Element den selben Typen hat, kann man einen Array verwenden. An einen Array kann man neue Elemente anhaengen, loeschen und veraendern.
    Man kann z.B. einen Satz als Array von Buchstaben darstellen:
    TODO: Julia Beispiel
    Sowohl in einem Tuple als auch einem Array kann man auf die einzelnen Elemente zugreifen, indem man ihre Position angibt.  
    TODO: Julia Beispiel
    Das letzte wichtige Beispiel ist eine Dictionary, also ein Woerterbuch.
    Aehnlich wie im Array haben alle Elemente den selben Typen, aber man greift auf diese nicht ueber ihre Position zu, sondern den Key, den Schluessel.
    TODO: Julia Beispiel

    Es ist auch moeglich, eigene Daten-Typen zu definieren. Das wird vor allem fuer fortgeschrittenere Anwendungeungen ausgesprochen nuetzlich!

Was kann man mit diesen Variablen machen?
    Um irgendetwas nuetzliches mit diesen Variablen machen zu koennen verwenden Programmiersprachen Funktionen.
    Eine Funktion nimmt eine, mehrere, oder auch keine Variable und fuehrt damit eine Reihe von Befehlen aus.
    Die Befehle werden in der Reihenfolge ausgefuehrt, in der sie im Code stehen.
    Dannach kann die Funktion auch wieder eine Variable zurueckgeben.
    TODO: Julia Beispiel

    Es gibt ein paar spezielle Funktionen, die den Ablauf von Befehlen beeinflussen koennen.
    - Wenn-dann-sonst:
        Ein Programm kann unterschiedlichen Code ausfuehren, je nach dem ob eine Bedingung erfuellt ist oder nicht
        Das wird mit if - else gemacht:
        TODO: Julia Code
        Das Argument fuer die if-Abfrage muss eine wahr/falsch Variable sein, also ein Boolean.
    - Fuer
        Oft will man denselben Code fuer viele Wiederholungen ausfuheren, fuer alle Elemente in einer Liste, ect.
        Das kann man mit for machen
        TODO: Julia Code
    - Waehrend
        Das ist wie eine Mischung aus for und if. Solange eine Bedingunge erfuellt ist, wird der Code ausgefuehrt.
        Wenn die Bedingung nicht mehr erfuellt ist, wird zum naechsten Code-Abschnitt uebergegangen
        TODO: Julia Code

    

## Tools
- REPL
- Editor (Jupiter?)
- Git



## Output
- print
- write

## Input
- readline()
