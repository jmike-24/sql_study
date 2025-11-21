-- все страны, в которых в 2015 г.
уровень безработицы был выше среднего
уровня по всем странам.
SELECT cn.name, ec.unemployment_rate
FROM countries cn
JOIN economies ec
USING(code)
WHERE ec.year = 2015 
AND ec.unemployment_rate > 
(SELECT AVG(unemployment_rate)
FROM economies
WHERE year = 2015);

-- страна с наибольшим уровнем инфляции 
SELECT cn.name, ec.inflation_rate
FROM countries cn
JOIN economies ec
USING(code)
WHERE ec.year = 2015
AND ec.inflation_rate = (
SELECT MAX(inflation_rate)
FROM economies
WHERE year = 2015 AND ec.gdp_percapita < 
(SELECT AVG(gdp_percapita)
FROM economies
WHERE year = 2015));

-- страны, столицы которых отсутствуют в списке таблице cities
SELECT name 
FROM countries
WHERE capital NOT IN 
(SELECT name
FROM cities);

-- страны с такой же формой правления, как у страны с наименьшей площадью
SELECT name 
FROM countries 
WHERE gov_form = (
SELECT gov_form 
FROM countries 
WHERE surface_area = (
SELECT MIN(surface_area)
FROM countries));

-- страны, площадь которых больше, чем площадь всех стран Африки
SELECT name 
FROM countries 
WHERE surface_area > ALL(
SELECT surface_area 
FROM countries 
WHERE continent = 'Africa');

-- города, у которых численность населения в черте города меньше, чем у любого города Испании 
SELECT name 
FROM cities
WHERE city_proper_pop < ANY(
SELECT city_proper_pop
FROM cities 
WHERE country_code = 'ESP'
);

-- страны, у которых уровень безработицы ниже, чем у всех стран Южной Америки
SELECT code
FROM economies 
WHERE unemployment_rate < ALL (
SELECT unemployment_rate
FROM economies ec
JOIN countries cn
USING(code)
WHERE cn.region = 'South America'
AND ec.unemployment_rate IS NOT NULL);


