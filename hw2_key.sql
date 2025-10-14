-- Это ВАРИАНТЫ ответов, а не единственно верные способы решения
-- Настоятельно рекомендую сначала попробовать самостоятельно



-- 1.	Найдите всех студентов программы «Международные отношения» из европейских стран.
SELECT s.name AS student_name, c.name AS country_name
FROM students s
JOIN countries c
	ON s.country_id = c.country_id
WHERE s.program = 'Международные отношения' AND c.region = 'Европа';

-- 2.	Посчитайте число студентов, обучающихся на каждой программе.
SELECT program, COUNT(*) AS num_students
FROM students
GROUP BY program
ORDER BY num_students DESC;

-- 3.	По каким курсам осенью 2024 года средняя оценка студентов была больше 4?
SELECT co.title AS course_title, AVG(g.grade)
FROM grades g
JOIN students s
	ON g.student_id = s.id
JOIN courses co
	ON g.course_id = co.course_id
WHERE term = 'Осень' AND year = 2024
GROUP BY co.title
HAVING AVG(g.grade) > 4
ORDER BY avg ASC

-- 4.	По каким курсам, читаемым в 2023 году, поставили больше всего пятерок?
SELECT c.course_id, c.title, COUNT(*) AS num_5
FROM grades g
JOIN courses c 
	ON c.course_id = g.course_id
WHERE g.year = 2023 AND g.grade = '5'
GROUP BY c.course_id, c.title
ORDER BY num_5 DESC, title;


-- 5.	Какой курс не читался в 2024 году? (= по какому курсу нет ни одной оценки за 2024)
SELECT c.course_id, c.title
FROM courses c
LEFT JOIN grades g
	ON c.course_id = g.course_id AND g.year = 2024
WHERE g.course_id IS NULL
ORDER BY c.title;

-- 6.	Выведите список студентов, активно участвующих в академической деятельности: 
-- те, кто участвовал либо в проектах, либо в конференциях. 
SELECT s.id, s.name
FROM students s
JOIN students_projects sp ON s.id = sp.student_id

UNION

SELECT s.id, s.name
FROM students s
JOIN students_conferences sc ON s.id = sc.student_id
ORDER BY id;

-- 7. Студенты, участвовавшие и в конференциях, и в проектах по теме "Безопасность"
SELECT s.id, s.name
FROM students s
JOIN students_conferences sc ON s.id = sc.student_id
JOIN conferences c ON sc.conf_id = c.conf_id
WHERE c.topic = 'Безопасность'

INTERSECT

SELECT s.id, s.name
FROM students s
JOIN students_projects sp ON s.id = sp.student_id
JOIN projects p ON sp.project_id = p.project_id
WHERE p.theme = 'Безопасность'
ORDER BY name;

-- 8.	А кто вообще ни в чем не участвовал? (год не важен)
SELECT s.id, s.name AS just_chillin
FROM students s
LEFT JOIN students_projects sp ON s.id = sp.student_id
LEFT JOIN students_conferences sc ON s.id = sc.student_id
WHERE sp.student_id IS NULL AND sc.student_id IS NULL
ORDER BY s.name;

-- 9.	Создайте таблицу всех возможных уникальных сочетаний тематик конференций и программ обучения.
SELECT DISTINCT cf.topic AS conference_topic, s.program AS program
FROM conferences cf
CROSS JOIN students s
ORDER BY conference_topic, program;


-- 10.	По каждому региону выведите три метрики: 
-- students_count – число студентов из региона, 
-- confs_2024_count – число конференций, проведенных в регионе в 2024. 
-- Оставьте только те регионы, в которых провели хотя бы три конференции.

SELECT c.region, COUNT(DISTINCT s.id) AS num_students, COUNT(DISTINCT conf.conf_id) AS num_confs_2024
FROM countries c
LEFT JOIN students s ON s.country_id = c.country_id
LEFT JOIN conferences conf ON conf.country = c.country_id
WHERE conf.year = 2024
GROUP BY c.region
HAVING COUNT(DISTINCT conf.conf_id) >= 3
ORDER BY c.region;






