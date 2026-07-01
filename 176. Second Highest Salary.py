select IFNULL( 
    (select distinct salary 
from Employee
order by salary DESC
limit 1, 1), NULL
 )as SecondHighestSalary

i learned about new function IFNULL and OFFSET
