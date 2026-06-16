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
