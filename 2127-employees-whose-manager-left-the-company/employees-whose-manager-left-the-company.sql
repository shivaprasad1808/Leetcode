/* Write your T-SQL query statement below */
select employee_id  from Employees 
where salary < 30000
and manager_id is  not null
and employee_id not in (
select a.employee_id from  
Employees a 
join Employees b
on a.manager_id = b.employee_id
)
order by employee_id