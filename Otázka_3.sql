-- OTÁZKA 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
WITH prices AS (
    SELECT 
        year,
        category_code,
        category,
        AVG(avg_price) AS avg_price
    FROM t_Pavlina_Novakova_project_SQL_primary_final
    WHERE year IN (2006, 2018)
    GROUP BY year, category_code, category
),
price_changes AS (
    SELECT 
        p2006.category_code,
        p2006.category,
        p2006.avg_price AS avg_price_2006,
        p2018.avg_price AS avg_price_2018,
        -- Celkové procentuální zdražení 2006 → 2018
        ROUND(
            (p2018.avg_price / p2006.avg_price - 1) * 100, 
            2
        ) AS percent_total_growth,
        -- Meziroční procentuální růst
        ROUND(
            (p2018.avg_price / p2006.avg_price - 1) / (2018 - 2006) * 100, 
            2
        ) AS percent_yearly_growth
    FROM prices p2006
    JOIN prices p2018 
        ON p2006.category_code = p2018.category_code 
        AND p2006.year = 2006 
        AND p2018.year = 2018
)
SELECT 
    category_code, 
    category, 
    avg_price_2006, 
    avg_price_2018, 
    percent_total_growth AS percent_year_on_year,
    percent_yearly_growth
FROM price_changes
ORDER BY percent_yearly_growth ASC;