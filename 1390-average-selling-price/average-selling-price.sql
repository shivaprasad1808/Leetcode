/* Write your T-SQL query statement below */
SELECT p.product_id, ISNULL(round(SUM(p.price*u.units*1.0)/sum(u.units),2),0) as average_price
FROM Prices p 
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND 
u.purchase_date BETWEEN p.Start_date and p.end_date
GROUP BY p.product_id