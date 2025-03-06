-- OTÁZKA 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
SELECT
    year,
    ROUND(AVG(avg_salary), 2) AS avg_salary,
    category_code,
    category,
    ROUND(AVG(avg_price), 2) AS avg_price,
    ROUND(AVG(avg_salary) / AVG(avg_price), 0) AS afforded_units
FROM t_Pavlina_Novakova_project_SQL_primary_final
WHERE year IN (2006, 2018)
    AND category_code IN (114201, 111301)
GROUP BY year, category_code, category
ORDER BY year, category_code;