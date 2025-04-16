-- Запрос выводящий список курсов со средним баллом по экзамену и отсортированный по убыванию среднего балла
SELECT
    c.title AS course_title,
    AVG(e.scope) AS average_score
FROM
    Courses c
JOIN
    Exams e ON c.c_no = e.c_no
GROUP BY
    c.c_no, c.title
ORDER BY
    average_score DESC;