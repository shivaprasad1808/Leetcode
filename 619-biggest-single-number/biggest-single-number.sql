/* Write your T-SQL query statement below */
with CTE as (
select num from MyNumbers
group by num
having count(num)=1)
SELECT ISNULL(
(SELECT TOP 1 num FROM CTE ORDER BY num DESC), 
NULL) AS num;
 