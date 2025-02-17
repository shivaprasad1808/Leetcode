/* Write your T-SQL query statement below */
with CTE as (
select requester_id from RequestAccepted
union all
 select accepter_id from RequestAccepted
), CTE2 as(
select requester_id,
count(requester_id) as num  from CTE
 group by requester_id )
 select  requester_id as id, num from CTE2
 where num = (select max(num) from CTE2)
   