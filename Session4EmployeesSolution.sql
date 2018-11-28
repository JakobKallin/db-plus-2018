-- Se filen Session4EmployeesSolution.png för ett diagram över den färdiga
-- databasen.

-- 1. Ta fram en databas med följande innehåll:
--    - Anställda med förnamn, efternamn och roll.
--    - Varje anställd ska ha en chef, förutom företagets VD.
--    - Projekt med namn och startdatum.
--    - Varje projekt ska ha noll eller flera anställda som är tilldelade till
--      det projektet.
--    - Datorer med serienummer och modellnamn.
--    - Varje dator ska tillhöra en anställd, men varje anställd kan ha flera
--      datorer.

-- 2. Skriv ett SQL-uttryck som för varje person visar vilka datorer som tillhör
--    den personen.
SELECT
	Computer.Model,
	Computer.SerialNumber,
	Employee.FirstName,
	Employee.LastName
FROM Computer
JOIN Employee ON Computer.EmployeeID = Employee.ID

-- 3. Skriv ett SQL-uttryck som för varje projekt visar vilka personer som
--    jobbar på det och deras roller.
SELECT
	Project.Name AS ProjectName,
	Employee.FirstName,
	Employee.LastName,
	Role
FROM Project
JOIN ProjectEmployee ON Project.ID = ProjectEmployee.ProjectID
JOIN Employee ON ProjectEmployee.EmployeeID = Employee.ID

-- 4. Skriv ett SQL-uttryck som för varje person visar vem som är den personens
--    chef (förutom för VD:n, som inte har någon chef).
SELECT
	Employee.FirstName + ' ' + Employee.LastName AS Employee,
	OtherEmployee.FirstName + ' ' + OtherEmployee.LastName AS Manager
FROM Employee
JOIN Employee AS OtherEmployee ON Employee.Manager = OtherEmployee.ID

