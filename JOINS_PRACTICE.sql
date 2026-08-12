-- =============================================
-- SCHOOL MANAGEMENT SYSTEM — PRACTICE DATASET
-- Use this on: sqliteonline.com
-- Author: SQL Practice Set
-- =============================================

-- Step 1: Create all tables
CREATE DATABASE IF NOT exists sms;
USE  sms;

CREATE TABLE teachers (
    teacher_id  INTEGER PRIMARY KEY,
    name        TEXT,
    subject     TEXT,
    salary      DECIMAL(10,2),
    city        TEXT
);

CREATE TABLE classes (
    class_id    INTEGER PRIMARY KEY,
    class_name  TEXT,
    teacher_id  INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE students (
    student_id  INTEGER PRIMARY KEY,
    name        TEXT,
    age         INTEGER,
    city        TEXT,
    class_id    INTEGER,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

CREATE TABLE exams (
    exam_id     INTEGER PRIMARY KEY,
    student_id  INTEGER,
    subject     TEXT,
    marks       INTEGER,
    exam_date   TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE fees (
    fee_id      INTEGER PRIMARY KEY,
    student_id  INTEGER,
    amount      DECIMAL(10,2),
    paid_date   TEXT,
    status      TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- =============================================
-- Step 2: Insert data
-- =============================================

-- Teachers (4 teachers — Ms. Rao has no class assigned)
INSERT INTO teachers VALUES (1, 'Mr. Sharma', 'Maths',   55000, 'Delhi');
INSERT INTO teachers VALUES (2, 'Ms. Verma',  'Science', 62000, 'Mumbai');
INSERT INTO teachers VALUES (3, 'Mr. Singh',  'English', 48000, 'Pune');
INSERT INTO teachers VALUES (4, 'Ms. Rao',    'History', 51000, 'Delhi');

-- Classes (3 classes — Ms. Rao not assigned to any)
INSERT INTO classes VALUES (1, 'Class 10A', 1);
INSERT INTO classes VALUES (2, 'Class 11B', 2);
INSERT INTO classes VALUES (3, 'Class 12C', 3);

-- Students (10 students)
INSERT INTO students VALUES (1,  'Rahul',   16, 'Delhi',  1);
INSERT INTO students VALUES (2,  'Priya',   17, 'Mumbai', 2);
INSERT INTO students VALUES (3,  'Amit',    16, 'Delhi',  1);
INSERT INTO students VALUES (4,  'Neha',    18, 'Pune',   3);
INSERT INTO students VALUES (5,  'Ravi',    17, 'Mumbai', 2);
INSERT INTO students VALUES (6,  'Sneha',   15, 'Delhi',  1);
INSERT INTO students VALUES (7,  'Karan',   18, 'Pune',   3);
INSERT INTO students VALUES (8,  'Pooja',   16, 'Mumbai', 2);
INSERT INTO students VALUES (9,  'Arjun',   17, 'Delhi',  1);
INSERT INTO students VALUES (10, 'Divya',   15, 'Pune',   3);

-- Exams (student 6 has no exam — for anti-join practice)
INSERT INTO exams VALUES (1,  1,  'Maths',   85, '2024-01-10');
INSERT INTO exams VALUES (2,  1,  'Science', 90, '2024-01-12');
INSERT INTO exams VALUES (3,  1,  'English', 78, '2024-01-14');
INSERT INTO exams VALUES (4,  2,  'Maths',   78, '2024-01-10');
INSERT INTO exams VALUES (5,  2,  'Science', 82, '2024-01-12');
INSERT INTO exams VALUES (6,  3,  'Maths',   92, '2024-01-10');
INSERT INTO exams VALUES (7,  3,  'English', 88, '2024-01-14');
INSERT INTO exams VALUES (8,  4,  'Maths',   65, '2024-01-10');
INSERT INTO exams VALUES (9,  4,  'Science', 70, '2024-01-12');
INSERT INTO exams VALUES (10, 5,  'English', 95, '2024-01-14');
INSERT INTO exams VALUES (11, 5,  'Maths',   80, '2024-01-10');
INSERT INTO exams VALUES (12, 7,  'Science', 74, '2024-01-12');
INSERT INTO exams VALUES (13, 7,  'English', 69, '2024-01-14');
INSERT INTO exams VALUES (14, 8,  'Maths',   88, '2024-01-10');
INSERT INTO exams VALUES (15, 9,  'Science', 91, '2024-01-12');
INSERT INTO exams VALUES (16, 9,  'Maths',   76, '2024-01-10');
INSERT INTO exams VALUES (17, 10, 'English', 83, '2024-01-14');
INSERT INTO exams VALUES (18, 10, 'Maths',   77, '2024-01-10');

-- Fees (student 4 has no fee record — for anti-join practice)
INSERT INTO fees VALUES (1,  1,  5000, '2024-01-05', 'paid');
INSERT INTO fees VALUES (2,  2,  5000, '2024-01-06', 'paid');
INSERT INTO fees VALUES (3,  3,  5000, NULL,          'pending');
INSERT INTO fees VALUES (4,  5,  5000, '2024-01-07', 'paid');
INSERT INTO fees VALUES (5,  6,  5000, '2024-01-08', 'paid');
INSERT INTO fees VALUES (6,  7,  5000, NULL,          'pending');
INSERT INTO fees VALUES (7,  8,  5000, '2024-01-09', 'paid');
INSERT INTO fees VALUES (8,  9,  5000, '2024-01-10', 'paid');
INSERT INTO fees VALUES (9,  10, 5000, NULL,          'pending');
INSERT INTO fees VALUES (10, 1,  2000, '2024-03-05', 'paid');
INSERT INTO fees VALUES (11, 2,  2000, '2024-03-06', 'paid');
INSERT INTO fees VALUES (12, 5,  2000, NULL,          'pending');

-- Q1 Show each student with their class name.
SELECT s.name, c.class_name
FROM classes as c
JOIN students as s
ON c.class_id = s.class_id;

-- Q2 Show each student with their class name and teacher name.
SELECT t.name, c.class_name 
FROM classes as c 
JOIN teachers as t 
ON c.teacher_id = t.teacher_id;

-- Q3 Show each student with their exam subject and marks
SELECT s.name, e.subject , e.marks
FROM students as s 
JOIN exams as e 
ON s.student_id = e.student_id;

-- Q4 Show students from Delhi along with their class name.
SELECT s.name, c.class_name, s.city
FROM students as s
JOIN classes as c
ON s.class_id = c.class_id;

-- Q5 Show student name, class name, teacher name and their total marks across all exams.
SELECT s.name as Student_name, t.name as Teacher_name, c.class_name, e.marks
FROM students as s
INNER JOIN classes as c 
ON s.class_id = c.class_id
INNER JOIN teachers as t
ON c.teacher_id = t.teacher_id
INNER JOIN exams as e
ON s.student_id = e.student_id;

