/* Write your T-SQL query statement below */
with CTE as (
select d.name as  Department, e.name as Employee, salary ,
dense_rank() over(partition by departmentId order by salary DESC) as rn
from Employee e
 join Department d
on e.departmentId=d.id)
select Department, Employee, salary   from CTE where rn<=3