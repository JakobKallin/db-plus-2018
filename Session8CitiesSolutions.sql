-- 1
SELECT County, SUM(Population)
FROM City
GROUP BY County
ORDER BY SUM(Population) DESC

-- 2
SELECT Municipality, SUM(Population)
FROM City
GROUP BY Municipality
ORDER BY SUM(Population) DESC

-- 3
SELECT County, COUNT(*) AS CityCount
FROM City
GROUP BY County
ORDER BY CityCount DESC

-- 4
SELECT County, AVG(Population)
FROM City
GROUP BY County
ORDER BY AVG(Population) DESC

-- 5
SELECT LEFT(Name, 1), SUM(Population), COUNT(*)
FROM City
GROUP BY LEFT(Name, 1)
ORDER BY LEFT(Name, 1)

-- 6
SELECT County, COUNT(*)
FROM City
WHERE Name LIKE '%red'
GROUP BY County
ORDER BY COUNT(*) DESC

-- 7
SELECT County, LEFT(Name, 1), SUM(Population), COUNT(*)
FROM City
GROUP BY County, LEFT(Name, 1)
ORDER BY County, LEFT(Name, 1)
