/* Write your T-SQL query statement below */
 WITH CTE AS (
    SELECT 
        id, 
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS rn2
    FROM Logs
),
CTE2 AS (
    SELECT 
        *,
        COUNT(*) OVER (PARTITION BY num, rn2) AS rn3
    FROM CTE
)
SELECT DISTINCT num AS ConsecutiveNums
FROM CTE2
WHERE rn3 >= 3;