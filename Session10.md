# Instruktioner

## User-defined functions
1. Inuti valfri databas, expandera mappen `Programmability`.
2. Högerklicka på mappen `Functions` och välj `New > Scalar-valued Function...`.
3. I fönstret som dyker upp, ersätt all kod med följande:

```
CREATE FUNCTION dbo.Shout(@Text VARCHAR(100))
RETURNS VARCHAR(100) AS BEGIN
	RETURN @Text + '!';
END;
```

5. Kör koden (med `Execute` eller `F5`).
6. Expandera `Functions` och `Scalar-valued Functions` och ni bör hitta er nya
   funktion där. För att ändra på den i efterhand, högerklicka på den och välj
   `Modify`. Ändra sedan koden och kör den varje gång som ni utför någon
   ändring. (SQL Server Management Studio kan ha lagt till extra kod runt er
   egen; detta är inget problem.)
7. För att testa funktionen, kör kommandot `SELECT dbo.Shout('Hello')` i ett
   nytt kommandofönster.

## Triggers

För att testa ett exempel på triggers, följ dessa steg:

1. Återskapa databasen i [Session10Concerts.png](Session10Concerts.png).
2. Expandera tabellen `Ticket`.
3. Högerklicka på mappen `Triggers` och välj `New Trigger...`.
4. I fönstret som dyker upp, ersätt all kod med följande:

```
ALTER TRIGGER ValidateSeatNumber
   ON Ticket
   AFTER INSERT, UPDATE
AS 
BEGIN
    -- Prevents unnecessary "(x rows affected)" output from queries in trigger.
    SET NOCOUNT ON;

    -- The actual integrity check, using the special "inserted" table.
    IF EXISTS (
        SELECT *
        FROM inserted
        JOIN Concert ON inserted.ConcertID = Concert.ID
        WHERE SeatNumber > Capacity
    )
    BEGIN
        -- Throwing an exception with an error number, message, and state.
        -- For error number and state, we just use 50000 and 1 by default.
        THROW 50000, 'Seat number cannot be greater than capacity', 1;
    END
END
```

5. Kör koden (med `Execute` eller `F5`).
6. Expandera `Triggers` och ni bör hitta er nya trigger där. För att ändra på
   den i efterhand, högerklicka på den och välj `Modify`. Ändra sedan koden och
   kör den varje gång som ni utför någon ändring. (SQL Server Management Studio
   kan ha lagt till extra kod runt er egen; detta är inget problem.)

För att felsöka en trigger, följ dessa steg:

1. Infoga eller ändra den aktuella tabellens data med `INSERT` eller `UPDATE`,
   *inte* med `Edit Top 200 Rows` (för det ger inte lika mycket felinformation).
2. För att se den data som triggern använder sig av, skriv ett `SELECT`-kommando
   inuti triggern (dock inte inuti en subquery eller ett `IF`-villkor).
   Kommandots resultat kommer att visas i `Results`-fönstret precis som med
   vanliga `SELECT`-kommandon.

# Övningar

## User-defined functions

1. Gör övning 14-3-1 i kursboken.
2. Gör övning 14-3-2 i kursboken.
3. Gör övning 14-3-3 i kursboken.
4. Gör övning 14-3-4 i kursboken.

## Triggers

5. Skriv en trigger som garanterar att alla album har ett releasedatum som inte
   är tidigare än det år/datum då bandet bildades. Det ska alltså inte vara
   möjligt för ett band som bildades år 2008 att ha släppt ett album år 2005.
6. Skriv en trigger som garanterat att året då ett band bildades inte är
   tidigare än födelsedatumet för någon av bandets medlemmar. Det ska alltså
   inte vara möjligt för att band att ha bildats år 1980 om en av dess medlemmar
   föddes år 1985. (I detta scenario utgår vi från att varje band har samma
   uppsättning medlemmar från starten.)
7. Skriv en trigger som garanterar att alla låtar på ett album har ett
   spårnummer som är lika med eller lägre än det totala antalet låtar på
   albumet. Det ska alltså inte vara möjligt att ha tre låtar på ett album med
   spårnummer 1, 5 och 7. Varje spårnummer på varje album ska också vara unikt,
   men använd något annat än triggers för att åstadkomma detta.
