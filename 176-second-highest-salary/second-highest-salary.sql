/* Write your T-SQL query statement below */
WITH RankedSalaries AS (
    SELECT DISTINCT salary, 
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee
)
SELECT (SELECT salary as SecondHighestSalary  FROM RankedSalaries WHERE rnk = 2) AS SecondHighestSalary;
