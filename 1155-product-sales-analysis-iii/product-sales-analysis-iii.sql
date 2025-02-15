select a.product_id, a.first_year, s.quantity, s.price
from (
select product_id, min(year) as first_year
from Sales 
group by product_id
) a
join Sales s
on a.product_id= s.product_id
and a.first_year= s.year