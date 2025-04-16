-- Таблица Students
CREATE TABLE Students (
    s_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    start_year DATE DEFAULT CURRENT_DATE,
    age SMALLINT CHECK (
        age >= 16
        AND age <= 99
    ),
    email VARCHAR(255) UNIQUE
);

-- Таблица Courses
CREATE TABLE Courses (
    c_no INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    hours SMALLINT CHECK (hours > 0)
);

-- Таблица Exams
CREATE TABLE Exams (
    s_id INT,
    c_no INT,
    scope SMALLINT CHECK (
        scope BETWEEN 1 AND 100
    ),
    PRIMARY KEY (s_id, c_no),
    FOREIGN KEY (s_id) REFERENCES Students(s_id),
    FOREIGN KEY (c_no) REFERENCES Courses(c_no)
);