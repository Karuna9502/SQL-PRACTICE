# Write your MySQL query statement below
DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;




But MySQL also allows DELETE with JOIN.

Syntax:

DELETE alias
FROM table1 alias
JOIN table2 alias
ON condition;
