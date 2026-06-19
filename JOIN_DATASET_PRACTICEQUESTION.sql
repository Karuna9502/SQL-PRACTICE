-- Q1. Show each order with the customer name who placed it.
select c.customer_id, c.name as customers, o.order_id, o.amount, o.status
FROM customers c INNER join orders o 
on c.customer_id = o.customer_id;

-- Q2 List every order along with the product name and category.
select o.order_id, p.name as products, p.category, o.amount
from orders o
inner join products p 
on o.product_id = p.product_id;

-- Q3 Show each sale along with the employee name who made it.
SELECT e.name as employees, s.sale_id, s.region as region, s.amount
from sales s 
inner join employees e on s.emp_id = e.employee_id;

-- Q4 List all orders placed by customers from Delhi.
select o.order_id, c.name as customers, o.amount, o.status
from orders o
inner join customers c
on o.customer_id = c.customer_id
where c.city = 'Delhi';

-- Q5. Show product name, category, and total quantity ordered for each product.
SELECT p.name, p.category, COUNT(o.order_id) AS times_ordered
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.name, p.category
ORDER BY times_ordered DESC;

-- Q6. Find the total revenue generated per customer (name and total). Show only customers who have placed orders.
select c.name, sum(o.amount) as total_revenue
from customers c
INNER JOIN orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name
order by total_revenue;

-- Q7. Show customer name, product name, and amount for every completed order.
select c.name as customers, p.name As product_name, o.amount
from orders o
inner join customers c  on o.customer_id = c.customer_id
INNER JOIN products p on p.product_id = o.product_id
where o.status = 'completed';



