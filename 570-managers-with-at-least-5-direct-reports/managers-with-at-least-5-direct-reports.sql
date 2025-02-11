/* Write your T-SQL query statement below */
with CTE as (
select managerId from Employee
group by managerId
having count(id) >=5)
select name from Employee e1
join CTE c
on e1.id= c.managerId
