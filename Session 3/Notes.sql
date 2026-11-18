USE school;

-- Quick checks
SELECT COUNT(*) AS students FROM school.students;
SELECT COUNT(*) AS enrollments FROM school.enrollments;

SELECT CONCAT('Email: ', email) AS msg
FROM students;

SELECT CONCAT('Email: ', COALESCE(email, '(none)')) AS msg
FROM students;

SELECT CONCAT('Email: ', IFNULL(email, '(none)')) AS msg
FROM students;

SELECT notes,
  COALESCE(notes, '(no notes)') AS safe_notes
FROM enrollments;

SELECT LENGTH('abcde123') AS string_len;

SELECT UPPER(TRIM(last_name)) AS last_name_upper,
  CONCAT(UPPER(LEFT(TRIM(first_name), 1)), LOWER(SUBSTRING(TRIM(first_name), 2))) AS first_name_proper,
  CONCAT_WS(' ',
    CONCAT(UPPER(LEFT(TRIM(first_name), 1)), LOWER(SUBSTRING(TRIM(first_name), 2))), 
    CONCAT(UPPER(LEFT(TRIM(last_name), 1)), LOWER(SUBSTRING(TRIM(last_name), 2)))
  ) AS safe_full_name,
  COALESCE(email, '(no email)') AS safe_email
FROM students;

SELECT student_id, first_name,
  LENGTH(TRIM(COALESCE(first_name, ''))) AS fn_len,
  CASE
    WHEN first_name IS NULL THEN 'MISSING'
    WHEN LENGTH(TRIM(first_name)) < 2 THEN 'TOO_SHORT'
    WHEN LENGTH(TRIM(first_name)) > 25 THEN 'TOO_LONG'
    ELSE 'OK'
  END AS first_name_flag
FROM students;

SELECT enrollment_id, final_grade,
  CASE
    WHEN final_grade IS NULL THEN NULL
    WHEN final_grade >= 7.0 THEN 0
    ELSE ROUND(7.0 - final_grade, 2)
  END AS distance_to_pass
FROM enrollments
ORDER BY distance_to_pass DESC;

SELECT
  NOW() AS 'now()',
  CURRENT_TIMESTAMP AS 'current_timestamp',
  CURDATE() AS 'curdate()',
  CURTIME() AS 'curtime()';

