/* Write your T-SQL query statement below */
 with Temp as (
select id, temperature, lag(temperature) over(order by recordDate) as  prev_temp,
recordDate, lag(recordDate) over(order by recordDate) as  prev_date
from Weather)
select id from Temp
where  temperature > prev_temp
and datediff(day, prev_date, recordDate)=1 