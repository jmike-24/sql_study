-- задание 1
SELECT id, name
FROM students;

-- задание 2
SELECT st.name, gr.grade 
FROM students st 
JOIN grades gr 
ON st.id = gr.student_id
WHERE gr.grade <60 AND gr.subject = 'ТМО'
ORDER BY gr.grade ASC;

-- задание 3
SELECT st.name, gr.grade, fd.complaint
FROM students st 
JOIN grades gr 
ON st.id = gr.student_id
JOIN feedback fd
ON st.id = fd.student_id
WHERE gr.grade <60 AND gr.subject = 'ТМО' AND fd.complaint = True AND fd.subject = 'ТМО'
ORDER BY gr.grade ASC;

-- задание 4
SELECT st.name, COUNT(vs.student_id) AS attend_num, srez.attended
FROM students st
LEFT JOIN visits vs 
ON st.id = vs.student_id 
LEFT JOIN sql_exam_attendance srez
ON st.id = srez.student_id 
WHERE vs.room = '2127' AND srez.attended = false
GROUP BY st.name, srez.attended 
HAVING COUNT(vs.student_id)>=3;

-- задание 5
SELECT st.name
FROM students st 
JOIN grades gr 
ON st.id = gr.student_id
JOIN feedback fd
ON st.id = fd.student_id
WHERE gr.grade <60 AND gr.subject = 'ТМО' AND fd.complaint = True AND fd.subject = 'ТМО'
INTERSECT
SELECT st.name
FROM students st
LEFT JOIN visits vs 
ON st.id = vs.student_id 
LEFT JOIN sql_exam_attendance srez
ON st.id = srez.student_id 
WHERE vs.room = '2127' AND srez.attended = false
GROUP BY st.name 
HAVING COUNT(vs.student_id)>=3;

-- задание 6
SELECT AVG(grade)
FROM grades
WHERE subject = 'ТМО';

-- задание 7
SELECT COUNT(DISTINCT student_id)
FROM visits
WHERE room = 'деканат';

-- задание 8 
SELECT student_id, MAX(grade)- MIN(grade) AS difference
FROM grades
GROUP BY student_id
ORDER BY difference ASC
LIMIT 3;

-- задание 9 
SELECT st.name, gr.student_id
FROM students st 
LEFT JOIN grades gr
ON st.id = gr.student_id
GROUP BY st.name, gr.student_id
HAVING gr.student_id IS NULL; 

-- задание 10 
SELECT subject, COUNT(complaint) AS complaint_num
FROM feedback
WHERE complaint = true
GROUP BY subject 
ORDER BY complaint_num DESC;

-- задание 11
SELECT st.name
FROM students st 
JOIN visits vs 
ON st.id = vs.student_id
WHERE vs.room = '2127' 
INTERSECT
SELECT st.name
FROM students st 
JOIN visits vs 
ON st.id = vs.student_id
WHERE vs.room = 'деканат'; 