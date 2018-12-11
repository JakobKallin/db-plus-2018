-- 1
-- https://github.com/Apress/beg-t-sql/blob/master/Code/Chapter%2014%20solution.sql#L100

-- 2
-- https://github.com/Apress/beg-t-sql/blob/master/Code/Chapter%2014%20solution.sql#L115

-- 3
-- https://github.com/Apress/beg-t-sql/blob/master/Code/Chapter%2014%20solution.sql#L129

-- 4
-- https://github.com/Apress/beg-t-sql/blob/master/Code/Chapter%2014%20solution.sql#L146

-- 5
IF EXISTS(
    SELECT *
    FROM inserted
    JOIN Band ON inserted.BandID = Band.ID
    WHERE YEAR(inserted.ReleaseDate) < Band.YearFormed
)
BEGIN
    THROW 50000, 'Album age cannot be higher than band age', 1
END

-- 6
IF EXISTS(
    SELECT *
    FROM inserted
    JOIN Band ON inserted.BandID = Band.ID
    WHERE Band.YearFormed < YEAR(inserted.Birthdate)
)
BEGIN
    THROW 50000, 'Band member age cannot be lower than band age', 1
END

-- 7
IF EXISTS(
    SELECT *
    FROM inserted
    -- Subquery to find number of tracks on album that inserted track belongs to.
    WHERE Number > (
        SELECT COUNT(*)
        FROM Track
        JOIN Album ON Track.AlbumID = Album.ID
        -- Correlated subquery; might need to be optimized if performance suffers.
        WHERE Album.ID = inserted.AlbumID
        GROUP BY Album.ID
    )
)
BEGIN
    THROW 50000, 'Track number cannot be greater than number of tracks on album', 1;
END