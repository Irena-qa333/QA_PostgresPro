-- Добавление записей в таблицу Students
INSERT INTO students (s_id, name, start_year, age, email)
VALUES
    (1, 'Савчук Дмитрий', '2020-09-01', 23, 'savchuk.dmitry@example.com'),
    (2, 'Рыжова Юлия', '2022-08-15', 20, 'ryzhova.yuliya@example.com'),
    (3, 'Орлов Кирилл', '2024-03-20', 18, 'orlov.kirill@example.com');


-- Добавление записей в таблицу Courses
INSERT INTO courses (c_no, title, hours)
VALUES
    (1, 'Программирование', 120),
    (2, 'Основы тестирования', 200),
    (3, 'Базы данных', 100);


-- Добавление записей в таблицу Exams
INSERT INTO exams (s_id, c_no, scope)
VALUES
    (1, 1, 5),
    (1, 2, 5),
    (2, 1, 3),
    (1, 3, 4),
    (2, 2, 4);