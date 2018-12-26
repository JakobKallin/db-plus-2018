# JSON

1. Skriv en JSON-representation av följande SQL-databas om musik:

ID | Name | YearFormed | Country
---|---|---|---
1 | Soul Asylum | 1981 | US
2 | The Rolling Stones | 1962 | EN

ID | Title | ReleaseDate | BandID
---|---|---|---
1 | Grave Dancers Union | 1992-10-06 | 1
2 | Let Your Dim Light Shine | 1995-06-06 | 1
3 | Tattoo You | 1981-08-24 | 2

ID |Title | Length | AlbumID
---|---|---|---
1 | Runaway Train | 185 | 1
2 | The Sun Maid | 210 | 1
3 | Misery | 195 | 2
4 | Promises Broken | 221 | 2
5 | Start Me Up | 219 | 3

2. Gör om följande JSON-representation av platser till en SQL-databas:

```json
[
    {
        "name": "Sweden",
        "code": "SE",
        "languages": ["Swedish"],
        "cities": [
            {
                "name": "Stockholm",
                "population": 1515017,
                "streets": [
                    { "name": "Kungsgatan", "length": 1500 },
                    { "name": "Hornsgatan", "length": 2300 }
                ]
            },
            {
                "name": "Gothenburg",
                "population": 590580,
                "streets": [
                    { "name": "Arkivgatan", "length": 215 },
                    { "name": "Stampgatan", "length": 1300 }
                ]
            },
            {
                "name": "Malmö",
                "population": 312012,
                "streets": [
                    { "name": "Regementsgatan", "length": 1800 }
                ]
            }
        ]
    },
    {
        "name": "Belgium",
        "code": "BE",
        "languages": ["Dutch", "French", "German"],
        "cities": [
            {
                "name": "Brussels",
                "population": 176545,
                "streets": [
                    { "name": "Rue Guimard", "length": 185 }
                ]
            }
        ]
    }
]
```

# XML

3. Skriv en XML-representation av SQL-databasen från uppgift #1.

4. Skriv en XML-representation av JSON-representationen från uppgift #2.

# Riktiga format

5. Skriv ett förslag på hur följande XML-data skulle kunna representeras som JSON: [The Guardians RSS-flöde om Sverige](https://www.theguardian.com/world/sweden/rss).

6. Skriv ett förslag på hur följande JSON-data skulle kunna representeras som XML: [Google Books information om Harry Potter](https://www.googleapis.com/books/v1/volumes?q=isbn:0747532699).
