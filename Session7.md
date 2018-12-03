# Design

Ta fram en fullständig databas, inklusive tabeller, constraints och lämplig
exempeldata, som matchar följande krav på en databas för en skola så bra som
möjligt:

> Skolan erbjuder flera utbildningar som i sin tur består av flera kurser. Varje
> kurs har ett namn, ett start- och slutdatum samt ett antal högskolepoäng.
> Varje utbildning har ett namn. Alla kurser är knutna till en enda utbildning.
> Varje kurs kan äga rum flera gånger men bara en gång per termin. En student är
> uppskriven på en (och bara en) utbildning och är då automatiskt uppskriven på
> alla kurser i den utbildningen; det går inte att läsa kurser från andra
> utbildningar.
> 
> Varje kurs består av flera lektioner som kan äga rum i olika lärosalar och vid
> olika tider på dagen. Skolan använder dock ett förenklat schema som innebär
> att samtliga lektioner börjar vid jämna klockslag och är en timme långa. (I de
> fall där ett tillfälle måste vara längre än en timme så schemaläggs det helt
> enkelt som flera lektioner i följd.)
> 
> Varje kurs har en eller flera examinationer. Varje examination är antingen ett
> skriftligt prov eller ett inlämningsarbete. Efter en examination får varje
> student i kursen dels ett antal poäng och dels ett betyg (IG, G eller VG).
> Studenter som inte deltar på en examination eller inte slutför den får dock
> varken poäng eller betyg.
> 
> Utöver studenter finns det personal av tre typer: administratörer, lärare och
> handledare. (Varje anställd ingår bara i en av kategorierna.) Varje kurs har
> en lärare och en kursansvarig administratör men kan ha flera handledare.
> Samtliga anställda har grundläggande personuppgifter och en månadslön.

Det finns inte nödvändigtvis en enda perfekt lösning (eller någon alls) på vissa
av kraven, och alla egenskaper som vore önskvärda i lösningen har inte
nödvändigtvis nämnts uttryckligen i beskrivningen. Denna uppgift handlar om att
hitta en så bra balans som möjligt mellan korrekthet, flexibilitet och enkelhet.

## Ordlista

Nedan följer förslag på översättningar från de svenska orden i beskrivningen
till engelska ord i databasdesignen.

Svenska | Engelska
-|-
administratör | administrator
betyg | grade
examination | examination
handledare | instructor
inlämningsarbete | assignment
kurs | course
lektion | session
lärare | teacher
personal | staff
skriftligt prov | test
student | student
termin | semester
utbildning | curriculum

# SQL-uttryck

För att testa och öva på databasens struktur, skriv sedan SQL-uttryck som hämtar följande data:

1. Namn på samtliga kurser och vilka lärare som undervisar i dem.

Exempelresultat:

Severus Snape | Defence Against the Dark Arts

2. Namn på samtliga kurser och vilka handledare som handleder i dem.

Exempelresultat:

Minerva McGonagall | Defence Against the Dark Arts

3. Namn på samtliga studenter samt kursnamn, betyg, poäng och typ på samtliga
   examinationer som de har gjort.

Exempelresultat:

Harry Potter | Defence Against the Dark Arts | test | 50 | VG

4. Namn på samtliga studenter samt vilka lärosalar de har lektioner i och vilka
   kurser som de läser i dessa lärosalar.

Exempelresultat:

Harry Potter | Defence Against the Dark Arts | 3C
