/* Write your T-SQL query statement below */
select P.project_id, round(sum(experience_years)*1.0/count(E.employee_id),2) as average_years
from Project P join Employee E
on P.employee_id = E.employee_id
group by P.project_id
order by P.project_id