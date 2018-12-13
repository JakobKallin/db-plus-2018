-- 1
SELECT
	Title,
	Country,
	Genre,
	(
		SELECT COUNT(*) - 1
		FROM Movie AS InnerMovie
		WHERE Genre = OuterMovie.Genre
		AND Country = OuterMovie.Country
	) AS NumberOfSimilar
FROM Movie AS OuterMovie

-- 2
SELECT
	Title,
	Rating,
	(
		SELECT OuterMovie.Rating - AVG(Rating)
		FROM Movie AS InnerMovie
		WHERE Genre = OuterMovie.Genre
	) AS RatingComparedToAverage
FROM Movie AS OuterMovie

-- 3
SELECT
	Title,
    Genre,
    Country,
	(
		SELECT TOP(1) Title
		FROM Movie AS InnerMovie
		WHERE Genre = OuterMovie.Genre
		AND Country = OuterMovie.Country
		AND Title != OuterMovie.Title
		ORDER BY Rating DESC
	) AS Recommended
FROM Movie AS OuterMovie

-- 4
SELECT
	Title,
    Director,
	(
		SELECT TOP(1) Title
		FROM Movie AS InnerMovie
		WHERE Director = OuterMovie.Director
		AND ReleaseDate > OuterMovie.ReleaseDate
		ORDER BY ReleaseDate
	) AS NextMovie
FROM Movie AS OuterMovie

-- 5
SELECT
	Match.Start,
	FirstTeam.Name,
	SecondTeam.Name,
	-- Find all the goals with the same team ID and match ID as the first team
	-- in the row from the outer query.
	(
		SELECT COUNT(*)
		FROM Goal
		JOIN Player ON Goal.PlayerID = Player.ID
		JOIN Team ON Player.TeamID = Team.ID
		WHERE Team.ID = FirstTeam.ID
		AND Goal.MatchID = Match.ID
	) AS FirstTeamGoals,
	-- Same as above but for the second team.
	(
		SELECT COUNT(*)
		FROM Goal
		JOIN Player ON Goal.PlayerID = Player.ID
		JOIN Team ON Player.TeamID = Team.ID
		WHERE Team.ID = SecondTeam.ID
		AND Goal.MatchID = Match.ID
	) AS SecondTeamGoals
FROM Match
JOIN Team AS FirstTeam ON Match.FirstTeamID = FirstTeam.ID
JOIN Team AS SecondTeam ON Match.SecondTeamID = SecondTeam.ID