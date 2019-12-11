CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE CASCADE
);

--find grades with bunches
SELECT first_name,
title,
grade
    FROM students
    LEFT JOIN papers
        ON students.id = papers.student_id;

SELECT first_name,
title,
grade
    FROM students
    JOIN papers
        ON students.id = papers.student_id
    GROUP BY first_name, title
    ORDER BY grade DESC;
    
SELECT first_name,
title,
grade
    FROM students
    JOIN papers
        ON students.id = papers.student_id
    GROUP BY first_name, title
    ORDER BY grade DESC;

--prints student averages and 0's
SELECT first_name,
IFNULL(AVG(grade), '0') AS average
    FROM students
    LEFT JOIN papers
        ON students.id = papers.student_id
    GROUP BY first_name
    ORDER BY grade DESC;
    
