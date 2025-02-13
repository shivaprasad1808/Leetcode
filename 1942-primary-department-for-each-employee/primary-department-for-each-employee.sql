/* Write your T-SQL query statement below */
with CTE as (
select employee_id, department_id from Employee
where employee_id not in   (
select employee_id from Employee
where primary_flag = 'Y')), 
CTE2 as (
select employee_id, department_id from Employee
where primary_flag = 'Y')
select employee_id, department_id from CTE  
UNION ALL 
select employee_id, department_id from CTE2 order by employee_id


