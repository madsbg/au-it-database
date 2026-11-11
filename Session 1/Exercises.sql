-- Exercises from session 1
-- Database: course

SELECT * FROM courses;

SELECT first_name,last_name,city FROM students;

SELECT first_name,last_name,city FROM students
WHERE city='Vejle';

SELECT first_name,last_name,birth_year FROM students
ORDER BY birth_year DESC;

SELECT COUNT(*) FROM enrollments;

SELECT * FROM enrollments
WHERE status IN ('enrolled','completed');

SELECT * FROM enrollments
WHERE grade BETWEEN 4 AND 7;

SELECT first_name,last_name,city FROM students
WHERE last_name LIKE '%ten%';

SELECT first_name,last_name,birth_year FROM students
WHERE birth_year IS NULL;
