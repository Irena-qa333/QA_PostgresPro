-- Создание временных последовательностей для генерации ID
DO

$$
BEGIN
    DROP SEQUENCE IF EXISTS temp_student_seq CASCADE;
    DROP SEQUENCE IF EXISTS temp_course_seq CASCADE;
END

$$;

CREATE TEMPORARY SEQUENCE temp_student_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
CREATE TEMPORARY SEQUENCE temp_course_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


-- Наполнение произвольными данными таблицы Students
WITH students_data AS (
    SELECT nextval('temp_student_seq') AS s_id,
           md5(random()::text || clock_timestamp()) AS random_text,
           substring(md5(random()::text || clock_timestamp()), 1, 10)::varchar(10) AS name_part,
           substring(md5(random()::text || clock_timestamp()), 1, 10)::varchar(10) AS surname_part,
           TO_CHAR((NOW() - INTERVAL '10 years' * floor(random()*15)), 'YYYY-MM-DD') AS start_year,
           round(random()*(99-16)+16) AS age,
           LOWER(substring(md5(random()::text || clock_timestamp()), 1, 8)) || '@example.com'::varchar(255) AS email
    FROM generate_series(1, 100) -- количество студентов
)
INSERT INTO Students (s_id, name, start_year, age, email)
SELECT s_id, name_part || ' ' || surname_part, start_year, age, email
FROM students_data;


-- Наполнение произвольными данными таблицы Courses
WITH courses_data AS (
    SELECT nextval('temp_course_seq') AS c_no,
           CASE floor(random()*8)
               WHEN 0 THEN 'Программирование'
               WHEN 1 THEN 'Основы тестирования'
               WHEN 2 THEN 'Базы данных'
               WHEN 3 THEN 'Методология Agile'
               WHEN 4 THEN 'Разработка мобильных приложений'
               WHEN 5 THEN 'Работа с API'
               WHEN 6 THEN 'Информационная безопасность'
               ELSE 'Оптимизация кода'
           END AS title,
           ROUND(RANDOM() * 190 + 10) AS hours
    FROM generate_series(1, 20) -- количество курсов
)
INSERT INTO Courses (c_no, title, hours)
SELECT c_no, title, hours
FROM courses_data;


-- Наполнение произвольными данными таблицы Exams
WITH exams_data AS (
    SELECT s_id, c_no, round(random() * 99 + 1) AS scope
    FROM (
        SELECT s_id, c_no
        FROM Students
        CROSS JOIN Courses
        LIMIT 300 -- максимальное количество экзаменов
    ) AS combinations
)
INSERT INTO Exams (s_id, c_no, scope)
SELECT s_id, c_no, scope
FROM exams_data;


-- Удаление временных последовательностей
DROP SEQUENCE temp_student_seq CASCADE;
DROP SEQUENCE temp_course_seq CASCADE;
