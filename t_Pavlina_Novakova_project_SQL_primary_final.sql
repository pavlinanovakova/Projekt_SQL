-- Společné roky - výsledek (2006 - 2018)
WITH payroll_yrs AS (
    SELECT 
        MIN(payroll_year) AS min_year, 
        MAX(payroll_year) AS max_year
    FROM czechia_payroll
),
price_yrs AS (
    SELECT 
        MIN(YEAR(date_from)) AS min_year, 
        MAX(YEAR(date_from)) AS max_year
    FROM czechia_price
)
SELECT 
    GREATEST(pay.min_year, price.min_year) AS common_min_year,
    LEAST(pay.max_year, price.max_year) AS common_max_year
FROM payroll_yrs pay
JOIN price_yrs price;


-- první tabulka
CREATE OR REPLACE TABLE t_Pavlina_Novakova_project_SQL_primary_final AS
WITH payroll AS (
	SELECT 
		pay.payroll_year AS year, 
		pay.industry_branch_code AS industry_code, 
		pib.name AS industry_name,
		ROUND(AVG(pay.value)) AS avg_salary 
	FROM czechia_payroll pay
	JOIN czechia_payroll_industry_branch pib ON pay.industry_branch_code = pib.code 
	WHERE 
		pay.value_type_code ='5958'
		AND pay.industry_branch_code IS NOT NULL
		AND pay.payroll_year BETWEEN 2006 AND 2018
	GROUP BY pay.payroll_year, pay.industry_branch_code
), 
price AS (
	SELECT 
		YEAR(cp.date_from) year,
		cpc.code category_code,
		cpc.name category,
		ROUND(AVG(cp.value), 2) avg_price
	FROM czechia_price cp
	JOIN czechia_price_category cpc ON cp.category_code = cpc.code 
	WHERE YEAR(cp.date_from) BETWEEN 2006 AND 2018
	GROUP BY YEAR(cp.date_from), cp.category_code
), 
gdp AS (
	SELECT 
		year,
		ROUND(GDP) AS gdp
	FROM economies
	WHERE country = 'Czech Republic'
)
SELECT
	pay.year,
	pay.industry_code,
	pay.industry_name,
	pay.avg_salary,
	pr.category_code,	
	pr.category,
	pr.avg_price,
	g.gdp
FROM payroll pay
JOIN price pr ON pay.year = pr.year
JOIN gdp g ON pay.year = g.year
ORDER BY pay.year, pay.industry_code, pr.category_code;
