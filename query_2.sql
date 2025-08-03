/*
	2. 	Kolik je možné si koupit litrů mléka a 
		kilogramů chleba za první a poslední srovnatelné 
		období v dostupných datech cen a mezd?
*/

SELECT
	*,
	ROUND(avg_wage / avg_price) as units_per_year
FROM(
	SELECT 	
		year,
		product,
		ROUND(AVG(price), 2) AS avg_price,
		ROUND(AVG(wage), 2) AS avg_wage 
	FROM t_halyna_kaida_project_sql_primary_final
	WHERE (category_code IN (111301, 114201) 
	AND year = (SELECT min(year) FROM t_halyna_kaida_project_sql_primary_final)) 
	OR (category_code IN (111301, 114201) 
	AND year = (SELECT max(year) FROM t_halyna_kaida_project_sql_primary_final))
	GROUP BY year, product
	ORDER BY year, product
);
