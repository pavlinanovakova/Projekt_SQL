-- OTÁZKA 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
WITH PN_1 AS (
    SELECT 
        industry_code,
        year,
        industry_name,
        avg_salary,
        LAG(avg_salary) OVER (PARTITION BY industry_code ORDER BY year) AS last_year
    FROM t_Pavlina_Novakova_project_SQL_primary_final
)
SELECT 
    industry_code,
    industry_name,
    SUM(CASE WHEN last_year < avg_salary THEN 1 ELSE 0 END) AS grow_years,
    SUM(CASE WHEN last_year > avg_salary THEN 1 ELSE 0 END) AS decline_years
FROM PN_1
GROUP BY industry_code, industry_name
ORDER BY grow_years DESC, industry_code;