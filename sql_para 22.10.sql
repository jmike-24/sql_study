SELECT cn.region, COUNT (DISTINCT cn.name) AS number_cn, AVG(pop.life_expectancy) AS avg_lifeexp, SUM(pop.size) AS size_rn
FROM countries cn
JOIN populations pop
ON cn.code = pop.country_code
WHERE pop.year = 2015
GROUP BY cn.region
ORDER BY number_cn DESC;

SELECT cn.region, AVG(ec.gdp_percapita) AS region_gdp, COUNT (DISTINCT cn.name) AS number_cn, (SUM(ec.exports) - SUM(ec.imports)) AS saldo
FROM countries cn
JOIN economies ec
USING(code)
WHERE ec.year = 2015
GROUP BY cn.region 
HAVING AVG(ec.gdp_percapita)> 20000 AND COUNT (DISTINCT cn.name) >=5 AND (SUM(ec.exports)- SUM(ec.imports)) > 0
ORDER BY region_gdp DESC;

SELECT cr1.curr_code, cr1.code, cr2.code
FROM currencies cr1
JOIN currencies cr2
ON cr1.curr_code = cr2.curr_code AND cr1.code > cr2.code; 

SELECT cr1.curr_code, c1_ct.name, c2_ct.name
FROM currencies cr1
JOIN currencies cr2
ON cr1.curr_code = cr2.curr_code AND cr1.code > cr2.code
JOIN countries AS c1_ct
ON cr1.code = c1_ct.code
JOIN countries AS c2_ct
ON cr2.code = c2_ct.code; 

SELECT cr1.curr_code, c1_ct.name, c2_ct.name
FROM currencies cr1
JOIN currencies cr2
ON cr1.curr_code = cr2.curr_code AND cr1.code > cr2.code
JOIN countries AS c1_ct
ON cr1.code = c1_ct.code
JOIN countries AS c2_ct
ON cr2.code = c2_ct.code
WHERE cr1.curr_code <> 'EUR'; 





