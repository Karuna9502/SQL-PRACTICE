# Write your MySQL query statement below
select firstName, LastName, city, state
from Person p
left join Address a 
on p.personID = a.personID;

#A LEFT JOIN (or LEFT OUTER JOIN) returns all records from the left
table and the matching records from the right table. If there is no match,
it returns NULL for the right table's columns
