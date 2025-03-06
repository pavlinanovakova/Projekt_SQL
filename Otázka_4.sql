-- OTÁZKA 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
SELECT 
    year,
    salary,
    salary_change_percentage,
    price,
    price_change_percentage,
    price_change_percentage - salary_change_percentage AS difference
FROM (
    SELECT 
        year,
        ROUND(AVG(avg_salary)) AS salary,
        ROUND(
            (AVG(avg_salary) / LAG(AVG(avg_salary)) OVER (ORDER BY year) - 1) * 100,
            1
        ) AS salary_change_percentage,
        ROUND(AVG(avg_price)) AS price,
        ROUND(
            (AVG(avg_price) / LAG(AVG(avg_price)) OVER (ORDER BY year) - 1) * 100,
            1
        ) AS price_change_percentage
    FROM t_Pavlina_Novakova_project_SQL_primary_final
    GROUP BY year
) AS yearly_changes
WHERE price_change_percentage > salary_change_percentage -- rostoucí ceny převyšují růst mezd
ORDER BY difference DESC;