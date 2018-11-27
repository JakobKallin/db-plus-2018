-- Välj alla länder och deras städer.
SELECT *
FROM Country
JOIN City ON Country.ID = City.CountryID

-- Välj alla städer och deras länder.
-- Likvärdig föregående uttryck; endast ordningen på kolumnerna skiljer sig.
SELECT *
FROM City
JOIN Country ON City.CountryID = Country.ID 