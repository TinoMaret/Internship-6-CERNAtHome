SELECT r.Name, r.DateOfPublishment,
	(SELECT STRING_AGG(CONCAT(sc.LastName, ',', LEFT(sc.FirstName, 1)), ';') FROM Scientists sc
	WHERE sc.Id IN
	(SELECT s.ScientistId FROM Signature s
	WHERE s.ResearchId = r.Id)) AS Scientists 
FROM Researches r;


SELECT sc.FirstName, sc.LastName, 
	CASE WHEN sc.Gender = 'M' THEN 'MUŠKI'
	WHEN sc.Gender = 'Ž' THEN 'ŽENSKI'
	WHEN sc.Gender = 'N' THEN 'NEPOZNATO'
	WHEN sc.Gender = 'O' THEN 'OSTALO' END AS Spol,
	c.Country, c.GDP
FROM Scientists sc
JOIN Countries c ON c.Id = sc.CountryId;

SELECT p.Project,
COALESCE(CAST(
	(SELECT STRING_AGG(a.Name, '; ') FROM Accelerators a
	 	JOIN AcceleratorProject ap ON a.Id = ap.AcceleratorId
		WHERE ap.ProjectId = p.Id) AS VARCHAR), 'NEMA GA') AS Accelerator
FROM Projects p;

SELECT DISTINCT(p.Id), p.Project FROM Projects p
JOIN Researches r ON p.Id = r.ProjectId
WHERE DATE_PART('year',r.DateOfPublishment) BETWEEN 2014 AND 2017;

SELECT DISTINCT(c.Country), COUNT(DISTINCT r.Id ) AS BROJRADOVA FROM Countries c
JOIN Scientists s ON s.CountryId = c.Id
JOIN Signature sg ON sg.ScientistId = s.Id
JOIN Researches r ON r.Id = sg.ResearchId
GROUP BY c.Country
ORDER BY c.Country;

SELECT DISTINCT (c.Country), MIN(r.DateOfPublishment) AS First_Publishment
FROM Countries c
JOIN Scientists s ON s.CountryId = c.Id
JOIN Signature sg ON sg.ScientistId = s.Id
JOIN Researches r ON r.Id = sg.ResearchId
GROUP BY c.Country;


SELECT DISTINCT h.City, COUNT(*) AS Scientists_Living FROM Hotels h
JOIN Scientists s ON s.HotelId = h.Id
GROUP BY h.City
ORDER BY Scientists_Living DESC;

SELECT DISTINCT (a.Name), ROUND(AVG(r.AmountOfCitations), 2) AS AverageAmountOfCitations FROM Accelerators a
JOIN AcceleratorProject ap ON ap.AcceleratorId = a.Id
JOIN Projects p ON p.Id = ap.ProjectId
JOIN Researches r ON r.ProjectId = p.Id
GROUP BY a.Name;