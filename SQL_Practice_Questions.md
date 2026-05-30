Daily SQL Practice — WHERE, GROUPBY, COUNT, OFFSET, LIKE | Aspiring Data Analyst

-- QUESTION PRACTICE ON DATA_SET_1 
-- TOTAL QUESTION WILL BE 50 

-- Q1 Get all employees from the IT department.
SELECT * FROM 
employees
where department = 'IT';

-- Q2 Get employees whose salary is greater than 50,000.
select name, salary from 
employees
where salary > 50000;

-- Q3 Find employees from both Mumbai and Delhi.
select name, city FROM
employees
where city in ('Mumbai','Delhi');

-- Q4 Get employees whose salary is between 30,000 and 70,000.
select name, salary FROM
employees
where salary BETWEEN 30000 and 70000;

-- Q5 Find all employees whose name starts with the letter "A".
select name from 
employees
where name like 'A%';

