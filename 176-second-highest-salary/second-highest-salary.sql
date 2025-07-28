/* Write your T-SQL query statement below */
SELECT ISNULL(
    (SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee)),
    NULL
) AS SecondHighestSalary
