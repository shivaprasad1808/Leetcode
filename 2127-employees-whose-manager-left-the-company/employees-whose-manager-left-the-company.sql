/* Write your T-SQL query statement below */

/*Solution-1*/

select employee_id  from Employees 
where salary < 30000
and manager_id is  not null
and employee_id not in (
select a.employee_id from  
Employees a 
join Employees b
on a.manager_id = b.employee_id
)
order by employee_id;


/*Solution-2*/

SELECT employee_id from Employees
where manager_id not in (select employee_id from Employees) and salary<30000
order by employee_id asc;


