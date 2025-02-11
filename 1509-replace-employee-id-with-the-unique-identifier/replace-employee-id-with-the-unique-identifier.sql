/* Write your T-SQL query statement below */
select unique_id, name 
from  Employees E left join EmployeeUNI  EU
on E.id = EU.id;