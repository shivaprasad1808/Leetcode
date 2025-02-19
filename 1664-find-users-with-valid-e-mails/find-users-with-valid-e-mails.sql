/* Write your T-SQL query statement below */
SELECT user_id, name, mail 
FROM 
Users
WHERE
mail LIKE '[A-Za-z]%@leetcode.com'
AND LEFT(mail, LEN(mail)-13) NOT LIKE '%[^A-Za-z0-9._-]%'  