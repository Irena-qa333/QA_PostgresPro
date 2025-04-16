-- Запрос, возвращающий всех студентов, которые еще не сдали ни одного экзамена
SELECT s.*
FROM Students s
LEFT JOIN Exams e ON s.s_id = e.s_id
WHERE e.s_id IS NULL;