/* Write your T-SQL query statement below */
select product_name, sum(unit) as unit from Products P 
join Orders O 
on P.product_id = O.product_id
where month(order_date) = 2 and year(order_date) = '2020'
group by product_name 
having sum(unit) >=100;
