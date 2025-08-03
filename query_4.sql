/*
	4. 	Existuje rok, ve kterém byl meziroční nárůst cen 
		potravin výrazně vyšší než růst mezd (větší než 10 %)?
*/

SELECT
	*,
	price_percent_increase - wage_percent_increase as increase_percent_diff
FROM (
	SELECT
		year,
		avg_price,
		ROUND((avg_price - LAG(avg_price) OVER(ORDER BY year)) / LAG(avg_price) OVER(ORDER BY year) * 100, 1) AS price_percent_increase,
		avg_wage,
		ROUND((avg_wage - LAG(avg_wage) OVER(ORDER BY year)) / LAG(avg_wage) OVER(ORDER BY year) * 100, 1) AS wage_percent_increase
	FROM(
		SELECT 
			year,
			ROUND(AVG(price), 2) AS avg_price,
			ROUND(AVG(wage), 2) AS avg_wage
		FROM t_halyna_kaida_project_sql_primary_final
		GROUP BY year
	)
	ORDER BY year
)	
--WHERE price_percent_increase - wage_percent_increase > 10;
