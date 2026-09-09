/* Topics Covered
CREATE DATABASE
CREATE TABLE
INSERT
SELECT
WHERE
ORDER BY
Logical Operators: AND, OR, NOT*/

create database SalesAnalyticsDb;
use SalesAnalyticsDb;

create table customerss(
id int primary key,
user_name varchar(50) not null,
age int,
country varchar(50),
amount_spend int );

insert into customerss(id,user_name,age,country,amount_spend) values 
(1,'Priyanshi',20,'India',25000),
(2,'Rahul',28,'India',55000),
(3,'John',35,'USA',75000),
(4,'Emma',32,'UK',45000),
(5,'Amit',27,'India',38000),
(6,'Sophia',24,'Canada',18000),
(7,'David',40,'USA',90000),
(8,'Neha',22,'India',15000),
(9,'Michael',31,'Australia',62000),
(10,'Riya',29,'India',47000),
(11,'James',45,'USA',85000),
(12,'Olivia',26,'Canada',22000),
(13,'Karan',38,'India',68000),
(14,'Lucas',33,'UK',52000),
(15,'Anjali',25,'India',30000),
(16,'William',37,'Australia',71000),
(17,'Pooja',42,'India',80000),
(18,'Ethan',23,'USA',19000),
(19,'Aarav',30,'India',42000),
(20,'Charlotte',34,'Canada',58000);

select * from customerss;

--Display only :Customer name,Age,Country
select 
user_name,
age,
country 
from customerss;

--Display only:Customer name,Country,Amount spent
select 
user_name,
country,
amount_Spend 
from customerss;

/*Filtering Data Using WHERE*/

--Find all customers whose amount_spend is greater than 50,000 --
select * 
from customerss 
where  amount_Spend >50000;

--Find all customers whose age is less than 30 --
select * 
from customerss 
where age<30; 

--Find all customers whose country is --
select * 
from customerss 
where country='India'; 

--Find all customers whose amount_spend is less than 20,000--
select * 
from customerss 
where amount_spend<20000;


/*Logical Operators */
--and 
select * 
from customerss 
where age<30 and amount_spend>30000;


select * 
from customerss 
where country='India' and amount_spend>40000;

--or 
select *
from customerss 
where country='India' or country='USA';

--and or 
select * 
from customerss 
where (country='India' or country='USA') 
and amount_spend >50000;

--NOT operator
select * 
from customerss 
where  country !='India';

/*Sorting Data*/

--(Lowest → Highest) 
select *
from customerss 
order by amount_spend asc;


--(Highest → Lowest)
select * 
from customerss 
order by amount_spend desc;

--Display:Customer name,Age,Country,Amount spent,Sort the customers from:
--(Youngest → Oldest)
select 
user_name,
age,country,
amount_spend 
from customerss 
order by age asc; 


/*Analyst-Level Filtering*/
select * 
from customerss 
where age between 25 and 40 and amount_spend >30000 
and (country ='India' or country='USA') 
order by amount_spend desc;

select * 
from customerss 
where age >=30 and amount_spend >40000 
and country !='India' 
order by amount_spend desc 

