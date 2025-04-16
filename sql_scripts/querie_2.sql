-- Запрос возвращающий список студентов и количество сданных им экзаменов. Только для студентов, у которых есть сданные экзамены
SELECT
    s.name AS student_name,
    COUNT(e.c_no) AS exam_count
FROM
    Students s
JOIN
    Exams e ON s.s_id = e.s_id
GROUP BY
    s.s_id, s.name
HAVING
    COUNT(e.c_no) > 0;