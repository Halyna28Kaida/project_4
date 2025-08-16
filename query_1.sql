/*
	1.  Rostou v průběhu let mzdy ve všech odvětvích, 
		nebo v některých klesají?
*/

SELECT
	*
FROM(
	SELECT
		year,
		industry,
		LAG(wage) OVER (PARTITION BY industry ORDER BY year) AS previous_year_wage,
		wage,
		wage - LAG(wage) OVER (PARTITION BY industry ORDER BY year) AS difference,
		CASE
			WHEN wage - LAG(wage) OVER (PARTITION BY industry ORDER BY year) > 0 THEN 'increase'
			WHEN wage - LAG(wage) OVER (PARTITION BY industry ORDER BY year) < 0 THEN 'decrease'
			ELSE ''
		END increase_decrease
	FROM t_halyna_kaida_project_sql_primary_final
	GROUP BY industry, year, wage
	ORDER BY industry, year)
WHERE 1 = 1
	AND increase_decrease = 'decrease';
