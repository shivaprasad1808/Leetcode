/* Write your T-SQL query statement below */
select customer_id, count(visit_id) as count_no_trans
from  Visits
where visit_id
NOT IN
(select visit_id from Transactions)
group by customer_id 