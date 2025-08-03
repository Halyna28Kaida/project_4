/*
	3. 	Která kategorie potravin zdražuje nejpomaleji 
		(je u ní nejnižší percentuální meziroční nárůst)? 
*/

SELECT
	product,
	ROUND(AVG(percent_increase), 1) AS per_year_by_year_increase
FROM(
	SELECT
		year,
		product,
		LAG(price) OVER(PARTITION BY product ORDER BY year) AS prev_year_price,	
		price,
		ROUND((price - LAG(price) OVER(PARTITION BY product ORDER BY year))/price*100, 1) as percent_increase
	FROM t_halyna_kaida_project_sql_primary_final
	GROUP BY year, product, price
	ORDER BY product, year
)
GROUP BY product
ORDER BY per_year_by_year_increase;
