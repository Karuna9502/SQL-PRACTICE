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

-- Q6 Get customers who have not provided an email address.
select name, email FROM
customers
where email is NULL;

-- Q7 Find all completed orders with amount greater than 1,000.
select * FROM
orders
where status = 'completed' and amount > 1000;

-- Q9 Find customers aged between 25 and 35 who live in Bangalore.
select age, name FROM
customers
where age BETWEEN 25 and 35
and city = 'Bangalore';

-- Q10 Find all products that are NOT in the Electronics category.
SELECT category, product_id FROM
products
where category not in ('Electronics');


-- Q8 Get products that are either in the Electronics or Clothing category.
select product_id, category from 
products
where category in ('Electronics','Clothing');

-- Q11 List all employees sorted by salary from highest to lowest.
SELECT name, salary from
employees
order by salary desc;

-- Q12 List all customers alphabetically by name.
select name, city FROM
customers
order by name asc;



