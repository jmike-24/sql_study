SELECT code 
FROM economies2015
EXCEPT
SELECT code 
FROM economies2019;

SELECT code 
FROM economies2015
INTERSECT
SELECT code 
FROM economies2019;

SELECT * 
FROM economies2015
WHERE gross_savings > 25
UNION
SELECT * 
FROM economies2019
WHERE gross_savings > 25;


SELECT c.name AS country, ci.name AS city
FROM countries AS c
INNER JOIN cities AS ci
ON c.code = ci.country_code
ORDER BY country ASC;

SELECT DISTINCT name 
FROM languages

SELECT cn.name AS country,l.name AS language
FROM countries AS cn
JOIN languages AS l
USING (code)
WHERE l.name = 'Urdu';

SELECT cn.name 
FROM countries AS cn
JOIN languages AS l
USING (code)
GROUP BY cn.name
HAVING COUNT(*) >2;

SELECT cn.name, (SUM(c.urbanarea_pop)/p.size) AS share
FROM countries cn 
JOIN languages l
USING (code) 
JOIN populations p 
ON cn.code = p.country_code
JOIN cities c 
ON cn.code = c.country_code
WHERE p.year = 2015 AND l.name = 'English' AND l.official = 'True'
GROUP BY cn.name, p.size
ORDER BY share DESC; 
