with CTE as ( 
select machine_id, timestamp-lag(timestamp) over(partition by machine_id, process_id order by  timestamp) as processing_time
from Activity )
select machine_id, round(avg(processing_time),3) as processing_time
from CTE
group by machine_id