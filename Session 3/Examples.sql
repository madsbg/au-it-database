USE school;

-- Slide 5
SELECT student_id,
  UPPER(TRIM(last_name)) AS last_upper
FROM students;
-- TRIM runs first, then UPPER

-- Slide 6
SELECT CONCAT('Email: ', email) AS msg FROM students;

SELECT CONCAT('Email: ', COALESCE(email, '(none)')) AS msg
FROM students;

-- Slide 7
SELECT first_name,
  UPPER(TRIM(last_name)) AS last_upper,
  LENGTH(TRIM(first_name)) AS fn_len
FROM students;

-- Slide 8
SELECT student_id,
  CONCAT(
    UPPER(LEFT(TRIM(first_name), 1)),
    LOWER(SUBSTRING(TRIM(first_name), 2))
  ) AS first_proper,
  UPPER(TRIM(last_name)) AS last_upper,
  COALESCE(email, '(no email)') AS safe_email
FROM students ORDER BY student_id;

-- Slide 10
SELECT course_code,
  LEFT(course_code, 3) AS first_3,
  LOCATE('-', course_code) AS dash_pos,
  SUBSTRING(course_code, 1, LOCATE('-', course_code) - 1) AS prefix,
  SUBSTRING(course_code, LOCATE('-', course_code) + 1) AS suffix
FROM courses;
-- LOCATE returns 0 if not found handle with CASE when validating

-- Slide 11
SELECT student_id, first_name,
  LENGTH(TRIM(COALESCE(first_name, ''))) AS fn_len,
  CASE
    WHEN first_name IS NULL THEN 'MISSING'
    WHEN LENGTH(TRIM(first_name)) < 2 THEN 'TOO_SHORT'
    WHEN LENGTH(TRIM(first_name)) > 25 THEN 'TOO_LONG'
    ELSE 'OK'
  END AS first_name_flag
FROM students;

-- Slide 13
SELECT enrollment_id, final_grade,
  ROUND(final_grade, 1) AS grade_round_1,
  ABS(final_grade - 7.00) AS abs_diff_from_pass
FROM enrollments;

-- Slide 14
SELECT enrollment_id, final_grade,
  CASE
    WHEN final_grade IS NULL THEN NULL
    WHEN final_grade >= 7.0 THEN 0
    ELSE ROUND(7.0 - final_grade, 2)
  END AS distance_to_pass
FROM enrollments ORDER BY enrollment_id;

-- Slide 16
SELECT CURDATE() AS today,
  NOW() AS now,
  YEAR(CURDATE()) AS yyyy,
  MONTH(CURDATE()) AS mm;

-- Slide 17
SELECT student_id, created_at,
  DATEDIFF(CURDATE(), DATE(created_at)) AS days_since_created,
  birthdate,
  CASE
   WHEN birthdate IS NULL THEN NULL
   ELSE TIMESTAMPDIFF(YEAR, birthdate, CURDATE())
  END AS age_years
FROM students;

-- Slide 18
SELECT enrollment_id, enrolled_on,
  DATE_ADD(enrolled_on, INTERVAL 14 DAY) AS followup_plus_14,
  CONCAT(YEAR(enrolled_on), '-',
    LPAD(MONTH(enrolled_on), 2, '0')) AS enrolled_yyyymm
FROM enrollments ORDER BY enrolled_on;

-- Slide 20
SELECT DATABASE() AS db,
  VERSION() AS version,
  USER() AS 'session_user',
  CURRENT_USER() AS 'current_user';

-- Slide 21
SELECT e.enrollment_id,
  CONCAT_WS(' — ',
    CONCAT_WS(' ',
      CONCAT(UPPER(LEFT(TRIM(s.first_name), 1)),
        LOWER(SUBSTRING(TRIM(s.first_name), 2))),
      UPPER(TRIM(s.last_name))),
  c.course_code,
  CONCAT('grade ', COALESCE(ROUND(e.final_grade, 1), 'N/A'))
  ) AS display_line
FROM enrollments e JOIN students s JOIN courses c;

