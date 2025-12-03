-- коррелированные подзапросы
SELECT
	name,
	region,
	surface_area
FROM
	countries AS c
WHERE
	surface_area = (
		SELECT
			MIN(surface_area)
		FROM
			countries
		WHERE
			region = c.region
	);


--
SELECT
	c.code
FROM
	countries AS c
	JOIN populations AS v ON c.code = v.country_code
WHERE
	v.year = 2015
	AND v.life_expectancy < (
		SELECT
			AVG(v2.life_expectancy)
		FROM
			countries c2
			JOIN populations AS v2 ON c2.code = v2.country_code
		WHERE
			c2.region = c.region
			AND v2.year = 2015
	);

-- страны для которых в таблице городов нет города 126

SELECT
	c.name
FROM
	countries c
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			cities AS c1
			where c1.country_code=c.code
	)



--- страны где хотя бы один город с населением больше 10 млн (12) 
SELECT
	c.name
FROM
	countries c
WHERE
	EXISTS (
		SELECT
			1
		FROM
			cities AS ci
		WHERE
			c.code = ci.country_code
			AND ci.city_proper_pop > 10000000
	);

-- регионы в которых менее 15 стран

SELECT
	region,
	ccount
FROM
	(
		SELECT
			region,
			COUNT(*) AS ccount
		FROM
			countries
		GROUP BY
			region
	) AS regions
WHERE
	ccount < 15;


-- подзапрос в селекте

SELECT
	c.name,
	(
		SELECT
			COUNT(ci.name) AS cic
		FROM
			cities AS ci
		WHERE
			c.code = ci.country_code
	) AS city_count
FROM
	countries c;
	
--
SELECT
	c1.name,
	c1.region,
	(SELECT COUNT(*)
		FROM
			countries2 AS c2
		WHERE
			c1.region = c2.region
	) AS num_in_region
FROM
	countries c1
	order by c1.name asc;