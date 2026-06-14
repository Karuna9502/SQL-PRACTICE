-- Q1. Show each order with the customer name who placed it.
select c.customer_id, c.name as customers, o.order_id, o.amount, o.status
FROM customers c INNER join orders o 
on c.customer_id = o.customer_id;

-- Q2 List every order along with the product name and category.
select o.order_id, p.name as products, p.category, o.amount
from orders o
inner join products p 
on o.product_id = p.product_id;
