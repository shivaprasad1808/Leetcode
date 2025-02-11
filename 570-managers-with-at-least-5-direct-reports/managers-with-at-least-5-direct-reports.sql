/* Write your T-SQL query statement below */
 SELECT e1.name
FROM Employee e1
JOIN (
    SELECT managerId, COUNT(id) AS direct_reports
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(id) >= 5
) e2 ON e1.id = e2.managerId;