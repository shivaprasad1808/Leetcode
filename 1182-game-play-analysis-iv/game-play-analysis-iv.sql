/* Write your T-SQL query statement below */
/*Solution-1*/
WITH FirstLogin AS (
SELECT 
player_id, 
MIN(event_date) AS first_login
FROM 
Activity
GROUP BY 
player_id),
ConsecutiveLogin AS (
SELECT 
DISTINCT a.player_id
FROM 
Activity a
JOIN 
FirstLogin f
ON 
a.player_id = f.player_id
AND 
a.event_date = DATEADD(day, 1, f.first_login))
SELECT 
ROUND(COUNT(DISTINCT c.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM 
ConsecutiveLogin c;



/*Solution-2*/
WITH CTE AS (
SELECT player_id, 
event_date, 
min(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS prev_date
FROM Activity
group by player_id, event_date
)
SELECT 
ROUND(
COUNT(DISTINCT player_id) * 1.0 / 
(SELECT COUNT(DISTINCT player_id) FROM Activity), 
2
) AS fraction
FROM CTE
WHERE DATEDIFF(day, prev_date, event_date) = 1;

/*SOLUTION-3: To count the number of players that logged in for at least two consecutive days */

WITH CTE AS (
    SELECT player_id, 
           event_date, 
           LAG(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS prev_date
    FROM Activity
)
SELECT 
    ROUND(
        COUNT(DISTINCT player_id) * 1.0 / 
        (SELECT COUNT(DISTINCT player_id) FROM Activity), 
        2
    ) AS fraction
FROM CTE
WHERE DATEDIFF(day, prev_date, event_date) = 1;

