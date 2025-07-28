/* Write your T-SQL query statement below */

        with cte as (
          SELECT DISTINCT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
          FROM Employee)
    SELECT ISNULL(
    (SELECT salary FROM CTE WHERE rnk = 2), NULL
) AS SecondHighestSalary