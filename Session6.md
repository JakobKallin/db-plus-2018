# Design

Ta fram en fullständig databas, inklusive tabeller, constraints och lämplig
exempeldata, som matchar följande krav på en databas om fotboll så bra som
möjligt:

> Varje lag har ett namn och tillhör ett land. Ett lag har också en
> förbundskapten ("manager") och en ägare. Varje spelare tillhör både ett lag
> och ett land och har dessutom en position ("goalkeeper", "defender",
> "midfielder" eller "forward") och en storlek på sitt ego (1-10).
> 
> Varje match äger rum under en turnering och på en arena. En turnering har ett
> namn och äger rum i ett land mellan två datum. En arena har ett namn och en
> kapacitet (antal besökare) befinner sig i ett land. Matchen i sig har två lag
> och en starttid.
> 
> Målen som görs i varje match spåras inte som en enkel summa utan för varje mål
> behöver också anges vilken spelare som gjorde det och i vilken minut av
> matchen det gjordes.
> 
> Utöver mål innehåller varje match också kort (gula eller röda) som kan delas
> ut till spelare. Även här behöver det anges vilken minut av matchen varje
> sådan händelse ägde rum.
> 
> Slutligen har varje match också en eller flera domare. Varje match ska ha en
> huvuddomare och assisterande domare. En domare kan ha en av tre roller under
> en match: huvuddomare ("main"), assisterande domare ("assistant") och
> videodomare ("VAR").

Det finns inte nödvändigtvis en enda perfekt lösning (eller någon alls) på vissa
av kraven, och alla egenskaper som vore önskvärda i lösningen har inte
nödvändigtvis nämnts uttryckligen i beskrivningen. Denna uppgift handlar om att
hitta en så bra balans som möjligt mellan korrekthet, flexibilitet och enkelhet.

# SQL-uttryck

För att testa och öva på databasens struktur, skriv sedan SQL-uttryck som hämtar följande data:

1. Namn på samtliga spelare, samt vilket lag spelaren tillhör.

Exempelresultat:

Zlatan Ibrahimovic | Manchester United

2. Starttid för samtliga matcher, samt vilken turnering och vilken arena som
   matchen ägde rum på.

Exempelresultat:

2014-01-02 | 2014 FIFA World Cup | Friends Arena

3. Färg och datum för samtliga utdelade kort i samtliga matcher, samt vilken
   spelare som fick kortet.

Exempelresultat:

Zlatan Ibrahimovic | yellow | 2014-01-02

4. Datum för samtliga mål i samtliga matcher, samt vilken spelare som gjorde
   målet och vilket lag spelaren tillhör.

Exempelresultat:

Zlatan Ibrahimovic | 2014-01-02 | Manchester United

5. Färg och datum för samtliga utdelade kort i samtliga matcher, samt vilken
   spelare som fick kortet och vilken domare som delade ut kortet. Utgå från att
   det är huvuddomaren ("main") som delar ut kort.

Exempelresultat:

Zlatan Ibrahimovic | Pierluigi Collina | yellow | 2014-01-02