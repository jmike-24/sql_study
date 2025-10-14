-- алиби проверка
SELECT s.name, a.location, a.verified
FROM suspects AS s
INNER JOIN alibi AS a
ON s.id = a.suspect_id
WHERE verified = false OR verified IS NULL
ORDER BY verified DESC NULLS FIRST, name ASC;

-- кто был в музее
SELECT s.name, m.exit_time 
FROM suspects AS s
INNER JOIN museum_logs AS m
ON s.id = m.suspect_id
WHERE exit_time >= '2024-02-22 21:30:00';

--
SELECT s.name, c.location
FROM suspects AS s
INNER JOIN clues AS c
ON s.id = c.suspect_id
WHERE c.location = 'Сцена преступления';

-- 
SELECT s.name
FROM suspects AS s
JOIN  alibi AS a
ON s.id = a.suspect_id
JOIN clues AS c
ON s.id = c.suspect_id
JOIN museum_logs AS m
ON s.id = m.suspect_id
WHERE (a.verified = 'false' OR a.verified IS NULL) AND m.exit_time >= '2024-02-22 21:30:00' AND c.location = 'Сцена преступления'