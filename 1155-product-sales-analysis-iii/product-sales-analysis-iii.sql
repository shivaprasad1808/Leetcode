/*Solution 1*/

select a.product_id, a.first_year, s.quantity, s.price
from (
select product_id, min(year) as first_year
from Sales 
group by product_id
) a
join Sales s
on a.product_id= s.product_id
and a.first_year= s.year

/*Solution 2*/

 with CTE as (
select product_id, year , quantity, price, row_number() over(partition by product_id order by year asc) as rn  
from Sales )
select product_id, year as first_year, quantity, price
from CTE where rn=1
