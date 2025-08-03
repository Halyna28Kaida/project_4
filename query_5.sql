/*
	5. 	Má výška HDP vliv na změny ve mzdách a cenách potravin? 
		Neboli, pokud HDP vzroste výrazněji v jednom roce, 
		projeví se to na cenách potravin či mzdách ve stejném nebo 
		následujícím roce výraznějším růstem?
*/

WITH base AS (
	SELECT 
		pf.year,
		ROUND(AVG(pf.price), 2) AS avg_price,
		ROUND(AVG(pf.wage), 2) AS avg_wage,
		ROUND(AVG(sf.gdp::numeric), 2) AS avg_gdp
	FROM t_halyna_kaida_project_sql_primary_final AS pf
	JOIN t_halyna_kaida_project_sql_secondary_final AS sf
	ON pf.year = sf.year
	WHERE country = 'Czech Republic'
	GROUP BY pf.year
)


SELECT
	curr.year,
	ROUND((curr.avg_price - LAG(curr.avg_price) OVER(ORDER BY curr.year)) / LAG(curr.avg_price) OVER(ORDER BY curr.year) * 100, 1) AS price_perc_increase_curr,
	ROUND((curr.avg_wage - LAG(curr.avg_wage) OVER(ORDER BY curr.year)) / LAG(curr.avg_wage) OVER(ORDER BY curr.year) * 100, 1) AS wage_perc_increase_curr,
	curr.avg_gdp,
	ROUND((curr.avg_gdp - LAG(curr.avg_gdp) OVER(ORDER BY curr.year)) / LAG(curr.avg_gdp) OVER(ORDER BY curr.year) * 100, 1) AS gdp_percent_increase_curr,
	next.year AS next_year,
	ROUND((next.avg_price - LAG(next.avg_price) OVER(ORDER BY next.year)) / LAG(next.avg_price) OVER(ORDER BY next.year) * 100, 1) AS price_perc_increase_next,
	ROUND((next.avg_wage - LAG(next.avg_wage) OVER(ORDER BY next.year)) / LAG(next.avg_wage) OVER(ORDER BY next.year) * 100, 1) AS wage_perc_increase_next
FROM base AS curr
JOIN base AS next
ON curr.year + 1 = next.year;


