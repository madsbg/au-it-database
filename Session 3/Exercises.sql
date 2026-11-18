USE school;

-- Exercise A / Slide 9
SELECT CONCAT(
    UPPER(LEFT(TRIM(first_name), 1)),
    LOWER(SUBSTRING(TRIM(first_name), 2))) AS first_name_proper,
  UPPER(TRIM(last_name)) AS last_name_upper,
  COALESCE(email, '(no email)') AS safe_email,
  CONCAT_WS(" ", TRIM(first_name), TRIM(last_name)) AS safe_full_name 
FROM students;

-- Exercise B / Slide 12
SELECT course_code,
  SUBSTRING(course_code, 1, LOCATE('-', course_code) - 1) AS prefix,
  SUBSTRING(course_code, LOCATE('-', course_code) + 1) AS suffix,
  CASE
    WHEN LENGTH(course_code) < 7 THEN 'TOO SHORT'
    WHEN LOCATE('E', course_code) THEN 'CONTAINS E'
    ELSE 'OK'
  END AS code_flag
FROM courses;

-- Exercise C / Slide 15
SELECT enrollment_id, final_grade,
  ROUND(final_grade, 1) AS final_grade_round,
  ABS(final_grade - 7) AS abs_diff_from_7,
  CASE
    WHEN final_grade IS NULL THEN NULL
    WHEN final_grade < 4 THEN 'TOO BAD'
    WHEN final_grade < 7 THEN 'ALMOST THERE'
    WHEN final_grade < 10 THEN 'YOU MADE IT'
    ELSE 'EXCELLENT'
  END AS distance_to_pass
FROM enrollments
ORDER BY enrollment_id;

-- Exercise D / Slide 19
-- See examples on slide 17 and 18 

