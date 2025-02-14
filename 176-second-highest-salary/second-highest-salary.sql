/* Write your T-SQL query statement below */
 select max(a.salary) as SecondHighestSalary 
from employee a
 right join employee b
on a.salary < b.salary;