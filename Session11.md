Till de första fyra övningarna, skapa en databas med en enda tabell `Movie` som
har följande kolumner:

```
Title: nvarchar(50)
Country: char(2)
Genre: nvarchar(50)
Director: nvarchar(50)
Rating: decimal(3, 1)
ReleaseDate: date
```

(Ha inte med någon ID-kolumn.)

Skriv sedan - med hjälp av subqueries - SQL-uttryck som hämtar följande data
från den:

1. Varje films titel, land och genre samt hur många andra filmer från samma land
   och av samma genre som finns i databasen.

Exempelresultat:

Title | Country | Genre | NumberOfSimilar
-|-|-|-
The Terminator | US | action | 297

2. Varje films titel och betyg samt hur långt från genomsnittsbetyget i sin
   genre som filmen är (antingen positivt eller negativt).

Exempelresultat:

Title | Rating | RatingComparedToAverage
-|-|-
The Terminator | 7.9 | 2.3

3. Varje films titel, land och genre samt namnet på en rekommenderad film för
   personer som tyckte om filmen. Den rekommenderade filmen ska vara den film i
   databasen med högst betyg som kommer från samma land och är av samma genre.

Exempelresultat:

Title | Country | Genre | RecommendedMovie
-|-|-|-
The Terminator | US | action | The Dark Knight

4. Varje films titel och regissör samt titeln på nästa film av samma regissör
   (eller `NULL` om det är den senaste).

Exempelresultat:

Title | Director | NextMovie
-|-|-
Signs | M. Night Shyamalan | The Village

5. Till denna uppgift, använd fotbollsdatabasen från [lektion
   6](Session6Solution.png). Skriv ett SQL-uttryck som för varje match hämtar
   datum för matchen, vilka lag som spelar och vad resultatet blev. Kom ihåg att
   målen lagras i en separat tabell och att detta alltså inte är så enkelt som
   att enbart hämta en numerisk kolumn från `Match`-tabellen.

Exempelresultat:

Start | FirstTeam | SecondTeam | FirstTeamGoals | SecondTeamGoals
-|-|-|-|-
2018-01-01 18:00:00 | Manchester United | Real Madrid | 3 | 2