# TechTFQ-30DaysSQLChallenge-DAY4
going through the challenge of SQL interview questions featured in the TechTFQ channel



In this repository we will be going through the SQL interview questions featured in the following YouTube video [SQL Interview Questions](https://www.youtube.com/watch?v=RjZFC6NVUMc&list=PLavw5C92dz9Hxz0YhttDniNgKejQlPoAn&index=4).

# **Day 4: The problem statement: Segregate the Data**

![image](https://github.com/Highashikata/TechTFQ-30DaysSQLChallenge-DAY4/assets/96960411/32a3120e-6e8b-4f32-9ad5-a91da4c576ca)

**DDL**
```
drop table if exists Q4_data;
create table Q4_data
(
	id			int,
	name		varchar(20),
	location	varchar(20)
);


select * from Q4_data;
```

**DML**

```
insert into Q4_data values(1,null,null);
insert into Q4_data values(2,'David',null);
insert into Q4_data values(3,null,'London');
insert into Q4_data values(4,null,null);
insert into Q4_data values(5,'David',null);
```

**DQL**

```
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
```
