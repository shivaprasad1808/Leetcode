/* Write your T-SQL query statement below */
 WITH FirstLogin AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_login
    FROM 
        Activity
    GROUP BY 
        player_id
),
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
        a.event_date = DATEADD(day, 1, f.first_login)
)
SELECT 
    ROUND(COUNT(DISTINCT c.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM 
    ConsecutiveLogin c;

