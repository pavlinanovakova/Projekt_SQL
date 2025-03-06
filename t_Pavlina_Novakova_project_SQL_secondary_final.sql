-- druhá tabulka
CREATE OR REPLACE TABLE t_Pavlina_Novakova_project_SQL_secondary_final AS 
SELECT	
	e.`year`,
	c.country,
	e.population,
	e.gdp,
	e.gini 
FROM countries c
JOIN economies e 
	ON c.country = e.country
WHERE e.`year` BETWEEN 2006 AND 2018
ORDER BY e.`year`, c.country;