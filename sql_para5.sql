SELECT e.code, c.name 
FROM economies2019 e
LEFT JOIN countries c
ON e.code = c.code
WHERE name IS NULL;

SELECT e.code, c.name 
FROM countries c
RIGHT JOIN economies2019 e
ON c.code = e.code
WHERE c.name IS NULL;

SELECT c.name AS country, l.name AS language, cr.basic_unit AS currency
FROM countries c
LEFT JOIN languages l
USING (code)
LEFT JOIN currencies cr 
USING (code)
GROUP BY c.name, l.name, cr.basic_unit
HAVING l.name IS NULL and cr.basic_unit IS NULL; 

 
SELECT c.name
FROM countries c 
LEFT JOIN languages l 
USING(code)
WHERE l.percent > 70 and l.official IS false
GROUP BY c.name

SELECT c.name,  COUNT(l.name) AS number
FROM countries c 
LEFT JOIN languages l 
USING(code)
GROUP BY c.name, l.official
HAVING l.official IS true and COUNT(l.name) > 2; 

SELECT c.name,  COUNT(l.name) AS number
FROM countries c 
LEFT JOIN languages l 
USING(code)
GROUP BY c.name
HAVING COUNT(l.name) > 2;

SELECT c.name, MAX(p.size)/MIN(p.size) AS difference
FROM countries c 
LEFT JOIN populations p 
ON c.code = p.country_code
GROUP BY  c.name
HAVING MAX(p.size)/MIN(p.size) > 1.5


