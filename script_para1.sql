SELECT name, subject 
FROM students 
LIMIT 5;

SELECT name, grade
FROM students
ORDER BY grade DESC;

SELECT grade
FROM students
ORDER BY grade ASC
LIMIT 3;

SELECT name, grade
FROM students 
ORDER BY grade DESC 
LIMIT 1;

SELECT name 
FROM students
WHERE grade >= 70 AND subject = 'SQL'

SELECT *
FROM students 
WHERE grade >= 70 AND subject = 'Python' AND "group" = 'МО-1';

SELECT *
FROM students 
WHERE subject = 'Python' AND grade >= 82 AND grade < 90;

SELECT COUNT(*)
FROM students 
WHERE subject = 'Python' AND grade >= 82 AND grade < 90;

SELECT COUNT(*)
FROM students 
WHERE subject = 'SQL' AND grade >= 90;