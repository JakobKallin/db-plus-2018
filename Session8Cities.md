Skapa en databas med en enda tabell `City` som har följande kolumner:

```
Name: nvarchar(255)
Population: int
Hectares: int
Municipality: nvarchar(255)
County: nvarchar(255)
```

(Ha inte med någon ID-kolumn.)

Kopiera och kör sedan kommandona i [Session8Cities.sql](Session8Cities.sql) (med
`New Query`) för att lägga in data om Sveriges tätorter i tabellen.

Skriv sedan SQL-uttryck som hämtar följande data från den:

1. Den totala befolkningen per län (county).

Exempelresultat:

```
Stockholms län | 2226484
Västra Götalands län | 1476160
```

2. Den totala befolkningen per kommun (municipality).

Exempelresultat:

```
Stockholm | 1562136
Göteborg | 673611
```

3. Antalet tätorter i varje län, flest först.

Exempelresultat:

```
Västra Götalands län | 311
Skåne län | 247
```

4. Den genomsnittliga befolkningsmängden per län.

Exempelresultat:

```
Stockholms län | 16017
Västmanlands län | 5589
```

5. Den totala befolkningen per förstabokstav i tätortens namn, samt hur många
   tätorter som börjar med den bokstaven. (Exempelvis räknas Stockholm och
   Skövde alltså till samma grupp.)

Exempelresultat:

```
A | 137229 | 56
B | 391892 | 161
```

6. Samtliga län med tätorter vars namn slutar på "red" samt antalet sådana orter
   i varje län, sorterat på högst antal.

Exempelresultat:

```
Västra Götalands län | 15
Hallands län | 4
```

7. Antalet tätorter i varje län vars namn börjar på samma bokstav, sorterat
   först på länets namn och sedan på bokstaven.

Exempelresultat:

```
Blekinge län | B | 3
Blekinge län | D | 2
Blekinge län | E | 1
...
Västra Götalands län | Å | 3
Västra Götalands län | Ä | 3
Västra Götalands län | Ö | 11
```
