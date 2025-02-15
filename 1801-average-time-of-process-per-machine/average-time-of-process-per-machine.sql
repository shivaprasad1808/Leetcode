/* Write your T-SQL query statement below */
with CTE as (
select a.machine_id, 
 b.timestamp - a.timestamp as processing_time
 from Activity a join Activity b
 on a.machine_id = b.machine_id
 and a.process_id = b.process_id
 and b.timestamp >a. timestamp)
 select machine_id, round(avg(processing_time),3) as processing_time
 from CTE group by machine_id;
