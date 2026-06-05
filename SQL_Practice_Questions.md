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

-- Q13 Get all orders sorted by order_date (newest first),then by amount (highest first) for same dates.
select order_date, order_id, amount FROM
orders
order by amount desc, order_date desc;

-- Q14 List all products sorted by category alphabetically,then by price from lowest to highest within each category.
select name, category, price FROM
products
order by category asc, price asc;

-- Q15 Get employees from the Sales department, sorted by salary descending.
select name, salary from 
employees
where department = 'sales'
order by salary DESC;

-- Q16 Get the top 5 highest-paid employees.
select name, salary FROM
employees
order by  salary desc
LIMIT 5;

-- Q17 Get any 3 products from the Electronics category.
select name, price, category FROM
products
where category = 'Electronics'
limit 3;

-- Q18 Get the 10 most recent orders.
select order_id, status, order_date FROM
orders
order by order_date Desc
limit 10;

-- Q19 Get customers ranked 11 to 20 by age (oldest first). This is page 2 of a 10-per-page result
select name, age FROM
customers
order by age DESC
LIMIT 10 OFFSET 10;

-- Q20 Get the 3rd and 4th most expensive products.
select name, price FROM
products
order by price DESC
LIMIT 2 offset 2;

-- Q21 Count the total number of employees in the company.
SELECT count(employee_id) as total_employee FROM
employees;
-------OR---------
SELECT COUNT(*) AS total_employees
FROM employees;

-- Q22 Count only the completed orders.
select count(*) as completed_status FROM
orders
where status = 'completed';

-- Q23 Count how many customers have provided an email address.
SELECT count(email) as provided_email
FROM customers;

-- Q24 Count distinct customers who have placed at least one order.
SELECT DISTINCT(customer_id) as customer_oderplaced
FROM orders;

-- Q25 Count how many products are priced above 500.
select count(*) FROM
products
where price > 500;

-- Q26 Count the number of employees in each department.
select count(*), department as employee_count
from employees
GROUP by department;


--Q27 Find the total revenue (SUM of amount) for each order status.
select status, sum(amount) as total_revenu
from orders
group by status;

-- Q28 Count how many customers are in each city.
select city, count(*) as count_customer
from customers
group by city;

--Q29 Find the average price of products in each category.
select category, ROUND(AVG(price), 2) as avg_price,
      count(*) as product_count
from products
group by category;

-- Q30 Find total sales amount per region, sorted highest first.
select region, sum(amount) as total_sale
FROM sales
group by region
order by amount DESC;










