-- Lesson 3 — Functions (MariaDB)
-- Handout script: schema + sample data + example queries
-- Target: MariaDB (MySQL-compatible)
--
-- Suggested workflow in DBeaver:
--   1) Connect to your MariaDB container
--   2) Run this whole script
--   3) Set active schema/database to `school`

/* =========================================================
   0) Clean start
   ========================================================= */
DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

/* =========================================================
   1) Tables
   ========================================================= */
CREATE TABLE students (
  student_id  INT PRIMARY KEY AUTO_INCREMENT,
  first_name  VARCHAR(50) NULL,
  last_name   VARCHAR(50) NULL,
  email       VARCHAR(120) NULL,
  birthdate   DATE NULL,
  created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
  course_id   INT PRIMARY KEY AUTO_INCREMENT,
  course_code VARCHAR(16) NOT NULL,
  title       VARCHAR(120) NOT NULL,
  credits     TINYINT NOT NULL
);

CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id    INT NOT NULL,
  course_id     INT NOT NULL,
  enrolled_on   DATE NOT NULL,
  final_grade   DECIMAL(5,2) NULL,
  notes         VARCHAR(255) NULL,
  CONSTRAINT fk_enr_student FOREIGN KEY (student_id) REFERENCES students(student_id),
  CONSTRAINT fk_enr_course  FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);

/* =========================================================
   2) Sample data (intentionally messy text)
   ========================================================= */
INSERT INTO students (first_name, last_name, email, birthdate, created_at) VALUES
  ('  aLICE',   '  nielsen',  'alice.nielsen@example.com',  '2001-04-17', '2026-01-05 09:12:10'),
  ('BoB',       'JOHANSEN ',  NULL,                         '1999-11-02', '2026-01-06 14:03:55'),
  ('cArL',      'o''connor',  'carl.oconnor@example.com',   '2002-08-29', '2026-01-06 14:05:03'),
  ('dana',      'li',         'dana.li@example.com',        '2003-12-11', '2026-01-07 08:01:00'),
  ('EVA  ',     'HANSEN',     'eva.hansen@example.com',     NULL,         '2026-01-09 10:15:00'),
  ('f',         'ng',         'f.ng@example.com',           '2004-05-22', '2026-01-10 12:00:00'),
  ('  GREG',    'sørensen',   'greg.sorensen@example.com',  '1998-02-03', '2026-01-10 12:00:10'),
  (NULL,        'LARSEN',     'unknown.larsen@example.com', '2000-09-09', '2026-01-11 16:45:00'),
  ('Hanna',     NULL,         'hanna@example.com',          '2001-01-01', '2026-01-12 09:30:00'),
  (' iAn ',     'mCdoNaLd',   'ian.mcdonald@example.com',   '2002-06-30', '2026-01-13 07:10:00'),
  ('JULIE',     '  ',         'julie@example.com',          '2003-03-03', '2026-01-14 18:20:00'),
  ('Kai',       'Schmidt',    NULL,                         '1997-07-07', '2026-01-15 06:05:00');

INSERT INTO courses (course_code, title, credits) VALUES
  ('DB-101',   'Intro to Databases', 5),
  ('DB-201',   'Querying with SQL', 5),
  ('WEB-120',  'Web Fundamentals', 5),
  ('DEV-210',  'System Development', 5),
  ('SE-300',   'Software Engineering', 5),
  ('UX-110',   'UX Basics', 5),
  ('DATA-205', 'Data Cleaning', 5),
  ('OPS-150',  'DevOps Basics', 5);

-- A few grades are NULL on purpose.
INSERT INTO enrollments (student_id, course_id, enrolled_on, final_grade, notes) VALUES
  (1, 1, '2026-01-15',  7.00,  'Needs help with naming'),
  (1, 2, '2026-02-01', 10.00,  NULL),
  (2, 1, '2026-01-15',  4.50,  'Late start'),
  (2, 4, '2026-01-20', NULL,   'Awaiting project'),
  (3, 2, '2026-02-01', 12.00,  'Strong SQL'),
  (3, 5, '2026-02-10',  9.25,  NULL),
  (4, 1, '2026-01-15',  2.75,  'Missed labs'),
  (4, 6, '2026-01-22',  7.50,  NULL),
  (5, 7, '2026-02-05',  8.10,  'Watch NULL handling'),
  (6, 7, '2026-02-05',  3.00,  'Name too short?'),
  (7, 8, '2026-01-18',  6.66,  'Good progress'),
  (8, 2, '2026-02-01',  NULL,  NULL),
  (9, 1, '2026-01-15',  5.00,  'Missing last name'),
  (10,4, '2026-01-20', 11.49,  NULL),
  (11,3, '2026-01-16',  9.99,  'Whitespace issues'),
  (12,5, '2026-02-10',  7.01,  NULL);

/* =========================================================
   3) Example queries (functions)
   ========================================================= */

-- 3.1 System functions
SELECT
  DATABASE() AS current_db,
  VERSION()  AS db_version,
  USER()     AS session_user;

-- 3.2 Text cleanup: normalize whitespace + casing
-- PROPER-CASE ("Title Case") without a dedicated function:
--   first letter UPPER, rest LOWER, after TRIM
SELECT
  student_id,
  first_name,
  last_name,
  CONCAT(
    UPPER(LEFT(TRIM(first_name), 1)),
    LOWER(SUBSTRING(TRIM(first_name), 2))
  ) AS first_name_proper,
  UPPER(TRIM(last_name)) AS last_name_upper
FROM students;

-- 3.3 NULL-safe display: CONCAT() returns NULL if any argument is NULL
-- Use COALESCE() or CONCAT_WS() to avoid NULL collapsing the whole result.
SELECT
  student_id,
  -- Safe full name (handles NULL and blank-ish values)
  TRIM(
    CONCAT_WS(' ',
      NULLIF(TRIM(
        CONCAT(
          UPPER(LEFT(TRIM(first_name), 1)),
          LOWER(SUBSTRING(TRIM(first_name), 2))
        )
      ), ''),
      NULLIF(UPPER(TRIM(last_name)), '')
    )
  ) AS safe_full_name,
  COALESCE(email, '(no email)') AS safe_email
FROM students;

-- 3.4 Extract parts of course code
SELECT
  course_code,
  LEFT(course_code, 2) AS code_prefix_left2,
  SUBSTRING_INDEX(course_code, '-', 1) AS code_prefix_before_dash,
  SUBSTRING_INDEX(course_code, '-', -1) AS code_suffix_after_dash
FROM courses;

-- 3.5 Flag suspect strings with LENGTH()
SELECT
  student_id,
  first_name,
  last_name,
  LENGTH(TRIM(COALESCE(first_name, ''))) AS first_len,
  LENGTH(TRIM(COALESCE(last_name,  ''))) AS last_len,
  CASE
    WHEN first_name IS NULL OR LENGTH(TRIM(first_name)) < 2 THEN 'SUSPECT_FIRST'
    WHEN LENGTH(TRIM(first_name)) > 25 THEN 'TOO_LONG_FIRST'
    ELSE 'OK'
  END AS first_name_flag,
  CASE
    WHEN last_name IS NULL OR LENGTH(TRIM(last_name)) < 2 THEN 'SUSPECT_LAST'
    ELSE 'OK'
  END AS last_name_flag
FROM students;

-- 3.6 Numeric cleanup: rounding + absolute differences
SELECT
  enrollment_id,
  final_grade,
  ROUND(final_grade, 1) AS grade_round_1,
  ROUND(final_grade, 0) AS grade_round_0,
  ABS(final_grade - 7.00) AS abs_diff_from_7
FROM enrollments;

-- 3.7 Date/time: days since created, age in years
SELECT
  student_id,
  created_at,
  DATEDIFF(CURDATE(), DATE(created_at)) AS days_since_created,
  birthdate,
  CASE
    WHEN birthdate IS NULL THEN NULL
    ELSE TIMESTAMPDIFF(YEAR, birthdate, CURDATE())
  END AS age_years
FROM students;

-- 3.8 Date arithmetic: add/sub intervals (e.g., "follow-up date")
SELECT
  enrollment_id,
  enrolled_on,
  DATE_ADD(enrolled_on, INTERVAL 14 DAY) AS followup_plus_14_days,
  DATE_SUB(enrolled_on, INTERVAL 7 DAY)  AS one_week_before
FROM enrollments;

-- 3.9 Bucketing by month/year (grouping later)
SELECT
  enrollment_id,
  enrolled_on,
  CONCAT(YEAR(enrolled_on), '-', LPAD(MONTH(enrolled_on), 2, '0')) AS enrolled_yyyymm
FROM enrollments;

/* =========================================================
   4) Exercise starters (delete the TODO comments and write the query)
   ========================================================= */

-- EX A (Text): Normalize student names.
-- Goal columns:
--   student_id, first_name_proper, last_name_upper, safe_email
-- TODO: write the SELECT using TRIM, UPPER/LOWER, LEFT/SUBSTRING, COALESCE.

-- EX B (Text validation): Flag suspect course codes.
-- Rule:
--   course_code should look like AAA-999 (prefix 2-4 letters, dash, 2-4 digits)
-- TODO (basic): at least flag length != 6 and missing dash using LOCATE('-', course_code).

-- EX C (Numeric): "distance from pass" where pass=7.0
-- Output columns:
--   enrollment_id, final_grade, distance_to_pass
-- distance_to_pass should be:
--   NULL if final_grade is NULL
--   0 if final_grade >= 7
--   otherwise 7 - final_grade (rounded to 2 decimals)

-- EX D (Date/time): Add computed fields for reports.
-- Output columns:
--   enrollment_id, enrolled_on, enrolled_yyyymm, followup_plus_14_days

-- EX E (Nesting): Create a display field for enrollments:
--   "<SAFE_FULL_NAME> — <COURSE_CODE> — grade <FINAL_GRADE or 'N/A'>"
-- Hint: CONCAT_WS and COALESCE.
