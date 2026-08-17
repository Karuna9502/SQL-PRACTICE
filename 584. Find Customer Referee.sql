# Write your MySQL query statement below
SELECT name 
FROM customer 
WHERE referee_id != 2 OR referee_id IS NULL;


--  THIS IS WHAT I HAVE LEARNT WHiLE SLOVING THIS QUESTION
!= 2 OR IS NULL works because != is a standard comparison operator.
IS NOT 2 breaks your logic because IS NOT is only meant for keywords like NULL, TRUE, or FALSE, not for actual numbers

