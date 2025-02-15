/* Write your T-SQL query statement below */
with CTE as(
select id, student,
lag(student, 1) over(order by id) as prev_value,
lead(student, 1) over(order by id) as next_value,
row_number() over(order by id) as rn,
count(*) over() as total_rows 
from seat)
select id, 
case when id%2=1 and id< total_rows then next_value
when id %2 =0 then prev_value
when id = total_rows and id%2=1 then student
 end as student from CTE

