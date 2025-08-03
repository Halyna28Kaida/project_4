CREATE TABLE t_Halyna_Kaida_project_SQL_secondary_final AS
SELECT 
	e.*,
	c.continent
FROM data_academy_content.economies AS e
LEFT JOIN data_academy_content.countries AS c
ON c.country = e.country
WHERE continent = 'Europe'
AND e.year BETWEEN (SELECT min(year) FROM t_halyna_kaida_project_sql_primary_final) 
AND (SELECT max(year) FROM t_halyna_kaida_project_sql_primary_final);