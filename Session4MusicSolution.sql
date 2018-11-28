-- Se filen Session4MusicSolution.png för ett diagram över den färdiga
-- databasen.

-- 1. Utöka databasen så att varje låt tillhör ett album och varje album tillhör
--    ett band. Processen är följande:
--    - Se till att varje kolumn med namnet "ID" är en primary key (högerklicka
--      och välj "Set Primary Key").
--    - Skapa en kolumn i ena tabellen med samma datatyp som ID-kolumnen i den
--      andra tabellen (troligtvis "int").
--    - I databasdiagrammet, välj först kolumnen som ska vara en foreign key.
--      Klicka sedan på kolumnen, håll in musknappen och släpp ovanpå den andra
--      tabellen.
--    - Bekräfta att rätt kolumner visas i rutan som dyker upp (den ena ska vara
--      "ID") och tryck sedan OK på båda rutorna.

-- 2. Skriv ett SQL-uttryck som hämtar samtliga låtar och för varje låt också
--    vilket album den tillhör.
SELECT *
FROM Song
JOIN Album ON Song.AlbumID = Album.ID

-- 3. Utöka föregående uttryck så att det också visar vilket band som har gjort
--    låten.
SELECT *
FROM Song
JOIN Album ON Song.AlbumID = Album.ID
JOIN Band ON Album.BandID = Band.ID

-- 4. Utöka föregående uttryck så att det bara visar album och låtar av Imagine
--    Dragons (eller ett annat band som ni väljer själva).
SELECT *
FROM Song
JOIN Album ON Song.AlbumID = Album.ID
JOIN Band ON Album.BandID = Band.ID
WHERE Band.Name = 'Imagine Dragons'

-- 5. Utöka databasen så att varje låt också har ett spårnummer på sitt album
--    ("track number"). Spårnumret ska alltså vara ett godtyckligt heltal som
--    förknippas med varje låt. (Vi kommer först senare i kursen att se hur man
--    kan garantera att spårnumren dels är unika per album och dels följer
--    sekvensen 1, 2, 3, ...).

-- 6. Utöka uttrycket från uppgift 3 så att låtarna nu är sorterade först på
--    bandets namn, sedan på albumets releasedatum, sedan på låtens spårnummer.
SELECT Band.Name, Album.ReleaseDate, Album.Title, Song.TrackNumber, Song.Title
FROM Song
JOIN Album ON Song.AlbumID = Album.ID
JOIN Band ON Album.BandID = Band.ID
ORDER BY Band.Name, Album.ReleaseDate, Song.TrackNumber

    -- Vid det här laget kan ni vilja göra en kopia av er databas innan ni gör
    -- fler ändringar på den, så att ni enkelt kan jämföra lösningen före och
    -- efter de kommande ändringarna. För att göra detta, följ dessa steg:
    
    -- 1. Högerklicka på databasen i vänsterkolumnen och välj Tasks > Back Up...
    -- 2. Klicka på OK i rutan som dyker upp och sedan OK igen.
    -- 3. Högerklicka på Databases i vänsterkolumnen och välj Restore
    --    Database...
    -- 4. Välj databasen under Source > Database.
    -- 5. Döp om databasen under Destination > Database så att den får ett nytt
    --    namn och alltså inte ersätter den tidigare. Tryck sedan OK.
    -- 6. Om det inte lyckas, gå in under Files i vänsterkolumnen i rutan och
    --    byt namn på databasfilerna manuellt i kolumnen Restore As. De två
    --    filernas namn ska alltså sluta med ".mdf" och ".ldf".

-- 7. Utöka databasen så att varje låt kan förekomma på flera album, exempelvis
--    samlingsalbum.

-- 8. Justera uttrycket från uppgift 6 så att det nu visar upp låtarna på alla
--    album som de förekommer på.
SELECT Band.Name, Album.ReleaseDate, Album.Title, Track.Number, Song.Title
FROM Song
JOIN Track ON Song.ID = Track.SongID
JOIN Album ON Track.AlbumID = Album.ID
JOIN Band ON Album.BandID = Band.ID
ORDER BY Band.Name, Album.ReleaseDate, Track.Number

-- 9. Utöka databasen så att varje band också har en eller flera bandmedlemmar
--    med förnamn, efternamn och födelsedatum.

-- 10. Skriv ett SQL-uttryck som hämtar samtliga låtar som Dan Reynolds (eller
--     en annan bandmedlem i ett annat band som ni väljer själva) uppträder på.
--     Att en bandmedlem uppträder på en låt definieras alltså som att den
--     personen är med i det band som har producerat det album som låten finns
--     på.
SELECT Song.Title, Person.FirstName, Person.LastName
FROM Song
JOIN Track ON Song.ID = Track.SongID
JOIN Album ON Track.AlbumID = Album.ID
JOIN Band ON Album.BandID = Band.ID
JOIN Person ON Band.ID = Person.BandID
WHERE Person.FirstName = 'Dan' AND Person.LastName = 'Reynolds'