SELECT city, population
FROM cities 
ORDER BY population DESC, city ASC;

SELECT city, country, area_km2
FROM cities 
ORDER BY area_km2 ASC NULLS FIRST; 

SELECT *
FROM students; 

SELECT DISTINCT ON (name) name,grade
FROM students
ORDER BY name, grade DESC;

SELECT name,
MAX(grade) AS best_grade
FROM students
GROUP BY name
ORDER BY name DESC;

SELECT DISTINCT region, country 
FROM cities;

SELECT region, COUNT(DISTINCT city)
FROM cities
GROUP BY region

SELECT country, AVG(population) AS avg_pop, AVG(area_km2) AS avg_area
FROM cities 
GROUP BY country
HAVING COUNT (id) >= 2

SELECT country 
FROM cities 
GROUP BY country
HAVING COUNT(id) >= 2

SELECT region, SUM(population) AS sum_pop, COUNT(DISTINCT country) AS count_country
FROM cities
WHERE year_founded > 1000
GROUP BY region
HAVING SUM(population) > 20000000 AND COUNT(DISTINCT country) >= 4
ORDER BY count_country DESC, sum_pop DESC



