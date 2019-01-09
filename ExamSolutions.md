# 1.

## a)
```sql
SELECT Title, Year
FROM Movie
WHERE Year >= 2000
AND Genre = 'action'
ORDER BY Year DESC, Title
```

## b)
```sql
SELECT Title, Year, FirstName, LastName
FROM Movie
JOIN Director ON Movie.DirectorID = Director.ID
```

## c)
```sql
SELECT Title
FROM Actor
JOIN MovieActor ON Actor.ID = MovieActor.ActorID
JOIN Movie ON MovieActor.MovieID = Movie.ID
WHERE FirstName = 'Brad'
AND LastName = 'Pitt'
AND Genre = 'comedy'
```

## d)
```sql
SELECT Genre, COUNT(*)
FROM Movie
GROUP BY Genre
```

## e)
```sql
SELECT FirstName, LastName, COUNT(*)
FROM Movie
JOIN Director ON Movie.DirectorID = Director.ID
GROUP BY Director.ID, FirstName, LastName
```

# 2

## a)

Name | City
---  |---
Blue Furniture | New York
Red Clothing | Los Angeles

## b)

Description | SkillCount
---         |---
cooking | 3
drawing | 2
singing | 2

## c)

FirstName | LastName | Level
---       |---       |---
Annie | Williams | 5
John | Smith | 3
Mary | Brown | 2

## d)

Name | Description | SkillCount
---  |---          |---
Blue Furniture | cooking | 2
Blue Furniture | drawing | 2
Blue Furniture | singing | 1
Green Foods | cooking | 1
Red Clothing | singing | 1

# 3

- **a)** `varchar` eller `nvarchar`
- **b)** `int`
- **c)** `decimal`
- **d)** `decimal`
- **e)** `bit`
- **f)** `date`

# 4

- **a)** datatypen `char(2)` och/eller `check`-constraint som kontrollerar
  längden/tecknen
- **b)** förbjud `null` på kolumnen
- **c)** `unique`-constraint på kolumnen
- **d)** `check`-constraint som jämför de två kolumnerna

# 5

## a)
Anfallaren kan komma åt samtliga mejl i databasen, även de som tillhör andra
användare.

## b)
För att anfallaren på grund av strängkonkateneringen kan "bryta sig ur"
`Subject`-strängen och infoga egna SQL-kommandon efter det, som i detta fall
utökar villkoret så att samtliga rader från tabellen alltid returneras.

## c)
Genom att först och främst ersätta apostrofer i användarens sträng med
dubbelapostrofer, vilket görs automatiskt av exempelvis `SqlParameter` i C#, som
också tar hand om andra gränsfall som annars kan möjliggöra attacker.
