-- Skriv SQL-uttryck som hämtar följande data från er musikdatabas:

-- 1. Alla låtar sorterade på titel, A-Z.
SELECT * FROM Song ORDER BY Title;

-- 2. Alla låtar sorterade på längd, längst först.
SELECT * FROM Song ORDER BY Length DESC;

-- 3. Alla låtar längre än 4 minuter.
SELECT * FROM Song WHERE Length < (60 * 4);

-- 4. Alla låtar mellan 3 och 4 minuter långa.
SELECT * FROM Song WHERE Length >= (60 * 3) AND Length <= (60 * 4);

-- 5. Alla låtar som INTE är mellan 3 och 4 minuter långa.
SELECT * FROM Song WHERE Length < (60 * 3) OR Length > (60 * 4);

-- 6. Alla låtar vars text är längre än 1.000 tecken.
SELECT * FROM Song WHERE LEN(Lyrics) > 1000;

-- 7. Alla låtar vars titel börjar på 'T'.
SELECT * FROM Song WHERE SUBSTRING(Title, 1, 1) = 'T';

-- 8. Alla låtar vars text innehåller ordet 'love'.
SELECT * FROM Song WHERE CHARINDEX('love', Lyrics) > 0;

-- 9. Alla album släppta efter 2000.
SELECT * FROM Album WHERE YEAR(ReleaseDate) > 2000;

-- 10. Alla album släppta i juni.
SELECT * FROM Album WHERE MONTH(ReleaseDate) = 6;

-- 11. Alla band från Sverige.
SELECT * FROM Band WHERE Country = 'Sweden';

-- 12. Alla band som inte är från Sverige.
SELECT * FROM Band WHERE Country != 'Sweden';

-- 13. Alla band från USA eller Kanada.
SELECT * FROM Band WHERE Country = 'USA' OR Country = 'Canada';

-- 14. Alla band och hur många år de har varit verksamma. (Med andra ord: "Hur gammalt är bandet?")
SELECT *, YEAR(GETDATE()) - YearFormed AS Age FROM Band;

-- 15. Alla låtar, med längden angiven i hela minuter (avrundat till närmaste heltal).
SELECT *, CONVERT(INT, ROUND(Length / 60.0, 0)) AS Minutes FROM Song;

-- 16. Alla låtar, med texten förkortad till max 100 tecken och följt av '...' om den är längre.
SELECT *, IIF(LEN(Lyrics) > 100, SUBSTRING(Lyrics, 1, 100) + '...', Lyrics) AS LyricsPreview FROM Song;