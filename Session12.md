1. Använd dina kunskaper om SQL injection för att hacka ett riktigt program:

- Skapa en ny databas med namnet `HackThis`.
- Kopiera samtliga kommandon i [`Session12.sql`](Session12.sql) och kör dem på
  din nya databas.
- Skapa en ny kommandoradsapplikation i Visual Studio och ersätt innehållet i
  Program.cs med koden i [`Session12.cs`](Session12.cs).
- Ändra connection string på rad 31 så att den innehåller namnet på din dator
  istället för `MYCOMPUTER`. Hämta detta namn från `Connect to Server`-fönstret
  som visas när du startar SQL Server Management Studio. Starta programmet utan
  att läsa varken källkoden eller datan i databasen och försök att hacka
  programmet för att komma åt känslig data om andra patienter. Du själv har
  personnummer `8502101234` och lösenord `secret123`, och du har Brad Pitt och
  Cate Blanchett som läkare. Kom ihåg att om programmet på något sätt ger dig
  tillgång till andra patienters data så innehåller det ett säkerhetshål. Du kan
  köra programmet hur många gånger som helst. Om du fastnar, titta på källkoden
  och databasstrukturen för att få ledtrådar.

2. Ändra källkoden till föregående program så att det inte längre går att hacka
   med *SQL injection*.

3. Skriv ett kommandoradsprogram som kommunicerar med en databas och innehåller
   ett eller flera medvetna säkerhetshål som möjliggör *SQL injection*. Be sedan
   en klasskamrat att hacka ditt program utan att läsa källkoden eller titta på
   databasstrukturen. Om din klasskamrat behöver ledtrådar, låt dem läsa
   källkoden och titta på databasstrukturen.

4. Be din klasskamrat att ändra källkoden till ditt program från föregående
   övning så att det inte längre går att hacka med *SQL injection*.