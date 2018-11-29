1. Check-constraint "Length > 0" på tabellen Song
2. Check-constraint "LEN(Title) > 0" på tabellen Song.
3. Kolumn "Type" med typen varchar och check-constraint "Type IN ('original',
   'live', 'compilation')" på tabellen Album.
4. Check-constraint "Country LIKE '[A-Z][A-Z]'" på tabellen Band.
5. Check-constraint "Birthdate <= JoinDate" på tabellen Person.
6. Unique-index över kolumnerna AlbumID och Number på tabellen Track.
7. "ON DELETE CASCADE" på nyckeln från tabellen Person till tabellen Band.
8. Check-constraint "YearFormed <= YEAR(GETDATE())" på tabellen Band.
9. Check-constraint "Birthdate <= GETDATE()" på tabellen Person.
10. Se diagrammet i [Session5Solution.png](Session5Solution.png).
11. Primary key eller unique-index över kolumnerna SongID och ChartID på
    tabellen ChartPosition.