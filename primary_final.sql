CREATE TABLE t_Halyna_Kaida_project_SQL_primary_final AS 

WITH prices AS (
	SELECT 
		cp.year,
		cp.category_code, 
		CONCAT(cpc.name, ' ', cpc.price_value, cpc.price_unit) AS product,
		cp.price,
		cr.name as region
	FROM(
		SELECT 
			EXTRACT(YEAR FROM date_to) AS year, 
			ROUND(AVG(value::numeric) , 2) AS price,
			category_code,
			region_code
		FROM data_academy_content.czechia_price
		GROUP BY year, category_code, region_code
	) AS cp
	JOIN data_academy_content.czechia_price_category AS cpc
	ON cpc.code = cp.category_code
	JOIN data_academy_content.czechia_region AS cr
	ON cp.region_code = cr.code
)
, wages AS (
    SELECT 
        cpay.payroll_year,
        cpib.name AS industry,
        ROUND(AVG(cpay.value), 2) AS wage    
    FROM data_academy_content.czechia_payroll AS cpay
    LEFT JOIN data_academy_content.czechia_payroll_industry_branch AS cpib
        ON cpay.industry_branch_code = cpib.code
    WHERE cpay.value_type_code = 5958 
        AND cpay.calculation_code = 200
	GROUP BY cpay.payroll_year, cpib.name
)

SELECT 
	p.*,
	w.wage,
	w.industry
FROM prices AS p
JOIN wages AS w
ON p.year = w.payroll_year;

	