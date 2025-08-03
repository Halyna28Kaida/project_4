/*
	1. 	Rostou v průběhu let mzdy ve všech odvětvích, 
		nebo v některých klesají?
*/

SELECT
	*
FROM(
	SELECT
		year,
		industry,
		LAG(wage) OVER (PARTITION BY industry ORDER BY year) as previous_year_wage,
		wage,
		wage - LAG(wage) OVER (PARTITION BY industry ORDER BY year) AS difference,
		case
			when wage - LAG(wage) OVER (PARTITION BY industry ORDER BY year) > 0 then 'increase'
			when wage - LAG(wage) OVER (PARTITION BY industry ORDER BY year) < 0 then 'decrease'
			else ''
		end increase_decrease
	FROM t_halyna_kaida_project_sql_primary_final
	GROUP BY industry, year, wage
	ORDER BY industry, year)
WHERE 	1 = 1
	and increase_decrease = 'decrease';
