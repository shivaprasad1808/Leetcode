/* Write your T-SQL query statement below */
delete   a from Person a , person b
 where a.email = b.email and 
a.id>b.id
 