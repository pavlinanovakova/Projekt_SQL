-- OTÁZKA 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 	
-- projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
SELECT 
    year,
    gdp,
    ROUND((gdp / LAG(gdp) OVER (ORDER BY year) - 1) * 100, 2) AS gdp_change_percent,
    ROUND(AVG(avg_salary)) AS salary,
    ROUND(
        (AVG(avg_salary) / LAG(AVG(avg_salary)) OVER (ORDER BY year) - 1) * 100,
        2
    ) AS salary_change_percent,
    ROUND(
        (AVG(avg_salary) / LEAD(AVG(avg_salary)) OVER (ORDER BY year) - 1) * 100,
        2
    ) AS salary_change_next_year_percent,
    ROUND(AVG(avg_price)) AS price,
    ROUND(
        (AVG(avg_price) / LAG(AVG(avg_price)) OVER (ORDER BY year) - 1) * 100,
        2
    ) AS price_change_percent,
    ROUND(
        (AVG(avg_price) / LEAD(AVG(avg_price)) OVER (ORDER BY year) - 1) * 100,
        2
    ) AS price_change_next_year_percent
FROM t_Pavlina_Novakova_project_SQL_primary_final
GROUP BY year
ORDER BY ABS(gdp_change_percent) DESC;