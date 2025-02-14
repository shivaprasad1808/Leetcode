/* Write your T-SQL query statement below */
select	product_id, new_price as  price from
(select	product_id, new_price, row_number() over(partition by product_id order by change_date DESC) as rn from
 Products where change_date <='2019-08-16') as t
where rn=1
union
select product_id, 10 as price
from Products where product_id not in(select product_id from Products where change_date <='2019-08-16')