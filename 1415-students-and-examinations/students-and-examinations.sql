/* Write your T-SQL query statement below */
with Students_Subjects as (
select student_id, student_name, subject_name
from Students   Cross join Subjects)
select   S.student_id, S.student_name, S.subject_name, count(E.subject_name) as attended_exams 
from Students_Subjects S  Left join Examinations E
on S.student_id = E.student_id
and S.subject_name =E.subject_name
group by  S.student_id, S.student_name, S.subject_name