/* Write your T-SQL query statement below */
SELECT
    ISNULL(
      (SELECT Salary FROM (
          SELECT DISTINCT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
          FROM Employee
      ) t
      WHERE rnk = 2
    ), NULL
    ) AS SecondHighestSalary
