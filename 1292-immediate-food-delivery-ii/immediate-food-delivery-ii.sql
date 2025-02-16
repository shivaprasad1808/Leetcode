with source as (
select
delivery_id,
customer_id,
order_date,
customer_pref_delivery_date,
case
when order_date = customer_pref_delivery_date then 'immediate'
else 'scheduled'
end as status
from Delivery
),
first as (
select
customer_id,
order_date,
status,
row_number() over(partition by customer_id order by order_date) as rn
from source
)

select
Round((SUM(CASE WHEN status = 'immediate' THEN 1 ELSE 0 END)*100.0/ COUNT(*))   ,2) as immediate_percentage
from first
where rn = 1