select * from Q4_data;

-- Method1: Using the Cross join
-- The 1st Output
SELECT * 
from
	(select DISTINCT first_value(id) over(order by id) from Q4_data) as ID 
cross join
	(select name from Q4_data where name is not null order by id limit 1) as NAME
CROSS JOIN 
	(select location from Q4_data where location is not null order by id limit 1) as LOCATION

-- The 2nd Output
SELECT * 
from
	(select id from Q4_data order by id DESC limit 1) as ID 
cross join
	(select name from Q4_data where name is not null order by id limit 1) as NAME
CROSS JOIN 
	(select location from Q4_data where location is not null order by id limit 1) as LOCATION



-- Method2: Without using the cross join
-- 1st output
SELECT(SELECT id
       FROM   q4_data
       ORDER  BY id
       LIMIT  1) AS ID,
      (SELECT name
       FROM   q4_data
       WHERE  name IS NOT NULL
       LIMIT  1) AS NAME,
      (SELECT location
       FROM   q4_data
       WHERE  location IS NOT NULL
       ORDER  BY id
       LIMIT  1) AS LOCATION 


-- 2nd output

SELECT(SELECT id
       FROM   q4_data
       ORDER  BY id DESC
       LIMIT  1) AS ID,
      (SELECT name
       FROM   q4_data
       WHERE  name IS NOT NULL
       LIMIT  1) AS NAME,
      (SELECT location
       FROM   q4_data
       WHERE  location IS NOT NULL
       ORDER  BY id
       LIMIT  1) AS LOCATION 