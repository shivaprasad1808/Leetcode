/* Write your T-SQL query statement below */
with CTE as (select distinct sell_date, product from Activities)
select   sell_date, count(   product) as num_sold,
string_agg(product, ',') 
WITHIN GROUP (ORDER BY product)
 as products 
from CTE
group by sell_date 