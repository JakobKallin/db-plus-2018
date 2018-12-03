## Databasstruktur

Se diagrammet [Session6Solution.png](Session6Solution.png) för den övergripande databasstrukturen.

## Constraints

### Samtliga tabeller med "Country"
- Country LIKE '[A-Z][A-Z]'
- Eventuellt också kontroll för icke-negativa tal på heltalskolumnerna

### Player
- Check: Position IN ('goalkeeper', 'defender', 'midfielder', 'forward')
- Check: EgoSize >= 1 AND EgoSize <= 10

### Match
- Check: FirstTeamID != SecondTeamID

### Card
- Check: Type IN ('yellow', 'red')

### Tournament
- Check: Start <= [End]

### MatchReferee
- Primary: MatchID, RefereeID
- Role IN ('main', 'assistant', 'VAR')

## SQL-uttryck

Skriv SQL-uttryck som hämtar följande data:

1. Namn på samtliga spelare, samt vilket lag spelaren tillhör.

SELECT
	Player.FirstName + ' ' + Player.LastName,
	Player.EgoSize,
	Team.Name
FROM Player
JOIN Team ON Player.TeamID = Team.ID

Exempelresultat:

Zlatan Ibrahimovic | Manchester United

2. Starttid för samtliga matcher, samt vilken turnering och vilken arena som
   matchen ägde rum på.

SELECT
	Match.Start,
	Tournament.Name,
	Stadium.Name
FROM Match
JOIN Tournament ON Match.TournamentID = Tournament.ID
JOIN Stadium ON Match.StadiumID = Stadium.ID

Exempelresultat:

2014-01-02 | 2014 FIFA World Cup | Friends Arena

3. Färg och datum för samtliga utdelade kort i samtliga matcher, samt vilken
   spelare som fick kortet.

SELECT
    Player.FirstName + ' ' + Player.LastName,
    Card.Type,
    CONVERT(DATE, Match.Start)
FROM Player
JOIN Card ON Player.ID = Card.PlayerID
JOIN Match ON Card.MatchID = Match.ID

Exempelresultat:

Zlatan Ibrahimovic | yellow | 2014-01-02

4. Datum för samtliga mål i samtliga matcher, samt vilken spelare som gjorde
   målet och vilket lag spelaren tillhör.

SELECT
	Player.FirstName + ' ' + Player.LastName,
    CONVERT(DATE, Match.Start),
	Team.Name
FROM Player
JOIN Goal ON Player.ID = Goal.PlayerID
JOIN Match ON Goal.MatchID = Match.ID
JOIN Team ON Player.TeamID = Team.ID

Exempelresultat:

Zlatan Ibrahimovic | 2014-01-02 | Manchester United

5. Färg och datum för samtliga utdelade kort i samtliga matcher, samt vilken
   spelare som fick kortet och vilken domare som delade ut kortet. Utgå från att
   det är huvuddomaren ("main") som delar ut kort.

SELECT
	Player.FirstName + ' ' + Player.LastName,
	Referee.FirstName + ' ' + Referee.LastName,
	Card.Type,
    CONVERT(DATE, Match.Start)
FROM Player
JOIN Card ON Player.ID = Card.PlayerID
JOIN Match ON Card.MatchID = Match.ID
JOIN MatchReferee ON Match.ID = MatchReferee.MatchID
JOIN Referee ON MatchReferee.RefereeID = Referee.ID
WHERE MatchReferee.Role = 'main'

Exempelresultat:

Zlatan Ibrahimovic | Pierluigi Collina | yellow | 2014-01-02