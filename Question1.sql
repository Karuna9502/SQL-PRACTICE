-- Q1. Show each order with the customer name who placed it.
select c.customer_id, c.name as customers, o.order_id, o.amount, o.status
FROM customers c INNER join orders o 
on c.customer_id = o.customer_id;
