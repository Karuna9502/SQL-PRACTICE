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


-- Q11 Get products that are either in the Electronics or Clothing category.
select product_id, category from 
products
where category in ('Electronics','Clothing');

-- Q12 List all employees sorted by salary from highest to lowest.
SELECT name, salary from
employees
order by salary desc;

-- Q13 List all customers alphabetically by name.
select name, city FROM
customers
order by name asc;

-- Q14 Get all orders sorted by order_date (newest first),then by amount (highest first) for same dates.
select order_date, order_id, amount FROM
orders
order by amount desc, order_date desc;

-- Q15 List all products sorted by category alphabetically,then by price from lowest to highest within each category.
select name, category, price FROM
products
order by category asc, price asc;

-- Q16 Get employees from the Sales department, sorted by salary descending.
select name, salary from 
employees
where department = 'sales'
order by salary DESC;

-- Q17 Get the top 5 highest-paid employees.
select name, salary FROM
employees
order by  salary desc
LIMIT 5;

-- Q18 Get any 3 products from the Electronics category.
select name, price, category FROM
products
where category = 'Electronics'
limit 3;

-- Q19 Get the 10 most recent orders.
select order_id, status, order_date FROM
orders
order by order_date Desc
limit 10;

-- Q20 Get customers ranked 11 to 20 by age (oldest first). This is page 2 of a 10-per-page result
select name, age FROM
customers
order by age DESC
LIMIT 10 OFFSET 10;

-- Q21 Get the 3rd and 4th most expensive products.
select name, price FROM
products
order by price DESC
LIMIT 2 offset 2;

-- Q22 Count the total number of employees in the company.
SELECT count(employee_id) as total_employee FROM
employees;
-------OR---------
SELECT COUNT(*) AS total_employees
FROM employees;

-- Q23 Count only the completed orders.
select count(*) as completed_status FROM
orders
where status = 'completed';

-- Q24 Count how many customers have provided an email address.
SELECT count(email) as provided_email
FROM customers;

-- Q25 Count distinct customers who have placed at least one order.
SELECT DISTINCT(customer_id) as customer_oderplaced
FROM orders;

-- Q26 Count how many products are priced above 500.
select count(*) FROM
products
where price > 500;

-- Q27 Count the number of employees in each department.
select count(*), department as employee_count
from employees
GROUP by department;


--Q28 Find the total revenue (SUM of amount) for each order status.
select status, sum(amount) as total_revenu
from orders
group by status;

-- Q29 Count how many customers are in each city.
select city, count(*) as count_customer
from customers
group by city;

--Q30 Find the average price of products in each category.
select category, ROUND(AVG(price), 2) as avg_price,
      count(*) as product_count
from products
group by category;

-- Q31 Find total sales amount per region, sorted highest first.
select region, sum(amount) as total_sale
FROM sales
group by region
order by amount DESC;


-- Q32 Count the number of completed orders per customer.
select customer_id, count(*) as completed_order
from orders
where status = 'completed'
GROUP by customer_id
order by completed_order DESC;

-- Q33 Find the highest salary in each department.
SELECT department, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employees
GROUP BY department;

-- Q34 Find the number of orders and average order value per month.
SELECT
  DATE_TRUNC('month', order_date) AS month,
  COUNT(*) AS order_count,
  ROUND(AVG(amount), 2) AS avg_order_value
FROM orders
GROUP BY 1
ORDER BY month;

-- Q35 Count the number of salespeople who made at least one sale in each region.
select region, count(DISTINCT emp_id) as  salespeople
from sales
group by region;

-- Q36 Find departments that have more than 10 employees.
select department, count(employee_id) 
from employees 
where employee_id 
group by department
having count(employee_id) > 10;

-- Q37 Find customers who have placed more than 5 orders in total.
select customer_id, count(*) as total_orders
from orders
GROUP by customer_id
HAVING count(*) > 5
order by total_orders DESC;

-- Q38 Find categories where the average product price is above 1,000.
select category, ROUND(avg(price),2) as avg_price
from products
group by category
having avg(price) > 1000

-- Q39 Find regions where total sales exceeded 500,000.
select region, sum(amount) as total_sales
from sales
group by region
having sum(amount) > 500000
order by total_sales desc;


-- Q40 Among completed orders only, find customers who spent more than 10,000 total.
select customer_id, sum(amount) as count_spent 
from orders
where status = 'completed'
group by customer_id
having sum(amount) > 10000;

-- Q41 Find departments where the average salary is between 40,000 and 80,000.
select department, ROUND(AVG(salary),2) as avg_salary   
from employees
GROUP by department
having AVG(salary)  BETWEEN 40000 and 80000;

-- Q42 Get the top 3 departments by total salary spend.
select department, sum(salary) as total_spend
from employees
group by department
order by sum(salary) DESC
limit 3;

-- Q43 Get the 5 customers with the highest total spend, but only include customers who have placed at least 3 orders.
select customer_id,  COUNT(*) as orders, sum(amount) as total_spends
from orders
group by customer_id
having COUNT(*) >= 3
order by sum(amount) DESC
limit 5;

-- Q44 Get the 2nd pageof products (10 per page), sorted cheapest first. Page 2 = rows 11–20.
select name, price
from products
order by price Asc
limit 10 OFFSET 10;
          
-- Q45 Count employees per department, but only show departments with 5 or more employees, sorted by count descending.
select department, count(*) as total_employee
from employees
group by department
having count(*) >= 5
order by total_employee DESC;

-- Q46 Find the top 5 salespeople by total sales amount.
select emp_id, sum(amount) as total_sale
from sales
group by emp_id
order by total_sale DESC
limit 5;

-- Q47 Find the total and average order value per month, only for months where total revenue exceeded 50,000.
SELECT
  DATE_TRUNC('month', order_date) AS month,
  SUM(amount)                   AS total_rev,
  ROUND(AVG(amount), 2)          AS avg_order
FROM orders
GROUP BY 1
HAVING SUM(amount) > 50000
ORDER BY month;













