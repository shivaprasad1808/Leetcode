/* Write your T-SQL query statement below */
 with CTE  as(
 SELECT person_name,  
 SUM(weight) OVER(ORDER BY turn ASC) AS rn FROM Queue)
select top 1  person_name from CTE where rn<=1000
order by rn DESC

