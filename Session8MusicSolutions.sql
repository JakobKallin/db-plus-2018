-- 1
SELECT Country, COUNT(*)
FROM Band
GROUP BY Country

-- 2
SELECT Country, COUNT(Song.ID)
FROM Song
JOIN Track ON Song.ID = Track.SongID
JOIN Album ON Track.AlbumID = Album.ID
RIGHT JOIN Band ON Album.BandID = Band.ID
GROUP BY Country

-- 3

-- Med flera kolumner i GROUP BY:
SELECT Band.Name, COUNT(*) AS MemberCount
FROM Band
JOIN Person ON Band.ID = Person.BandID
GROUP BY Band.ID, Band.Name

-- Med subquery:
SELECT Band.Name, MemberCount
FROM Band
JOIN (
	SELECT Band.ID, COUNT(*) AS MemberCount
	FROM Band
	JOIN Person ON Band.ID = Person.BandID
	GROUP BY Band.ID
) AS BandPerson ON Band.ID = BandPerson.ID

-- 4

-- Med flera kolumner i GROUP BY:
SELECT Album.Title, COUNT(*) AS SongCount, SUM(Length) / 60 AS TotalLength
FROM Album
JOIN Track ON Album.ID = Track.AlbumID
JOIN Song ON Track.SongID = Song.ID
GROUP BY Album.ID, Album.Title

-- Med subquery:
SELECT Album.Title, SongCount, TotalLength
FROM Album
JOIN (
	SELECT Album.ID, COUNT(*) AS SongCount, SUM(Length) / 60 AS TotalLength
	FROM Album
	JOIN Track ON Album.ID = Track.AlbumID
	JOIN Song ON Track.SongID = Song.ID
	GROUP BY Album.ID
) AS AlbumSong ON Album.ID = AlbumSong.ID

-- 5

-- Med flera kolumner i GROUP BY:
SELECT Band.Name, MAX(Length) AS MaxLength, AVG(Length) AS AvgLength, MIN(Length) AS MinLength
FROM Song
JOIN Track ON Song.ID = Track.SongID
JOIN Album ON Track.AlbumID = Album.ID
JOIN Band ON Album.BandID = Band.ID
GROUP BY Band.ID, Band.Name

-- Med subquery:
SELECT Band.Name, MaxLength, AvgLength, MinLength
FROM Band
JOIN (
	SELECT Band.ID, MAX(Length) AS MaxLength, AVG(Length) AS AvgLength, MIN(Length) AS MinLength
	FROM Song
	JOIN Track ON Song.ID = Track.SongID
	JOIN Album ON Track.AlbumID = Album.ID
	JOIN Band ON Album.BandID = Band.ID
	GROUP BY Band.ID
) AS BandSong ON Band.ID = BandSong.ID

-- 6

-- Med flera kolumner i GROUP BY:
SELECT Band.Name, MIN(ChartPosition.Position)
FROM Band
JOIN Album ON Band.ID = Album.BandID
JOIN Track ON Album.ID = Track.AlbumID
JOIN Song ON Track.SongID = Song.ID
JOIN ChartPosition ON Song.ID = ChartPosition.SongID
JOIN Chart ON ChartPosition.ChartID = Chart.ID
GROUP BY Band.ID, Band.Name

-- Med subquery:
SELECT Band.Name, PeakPosition
FROM Band
JOIN (
	SELECT Band.ID, MIN(Position) AS PeakPosition
	FROM Band
	JOIN Album ON Band.ID = Album.BandID
	JOIN Track ON Album.ID = Track.AlbumID
	JOIN Song ON Track.SongID = Song.ID
	JOIN ChartPosition ON Song.ID = ChartPosition.SongID
	JOIN Chart ON ChartPosition.ChartID = Chart.ID
	GROUP BY Band.ID
) AS BandPosition ON Band.ID = BandPosition.ID
