create database companyDb;
use companyDb;

create table customers(
id int primary key,
user_name varchar(50) not null,
age int,
county varchar(50),
amount_Spend int
);

insert into customers (id,user_name,age,county,amount_Spend) values 
(1, 'Rahul', 25, 'India', 15000),
(2, 'Priya', 28, 'India', 22000),
(3, 'Amit', 32, 'India', 18000),
(4, 'Neha', 24, 'India', 12000),
(5, 'John', 35, 'USA', 30000),
(6, 'Sarah', 29, 'UK', 25000),
(7, 'David', 41, 'Canada', 35000),
(8, 'Emma', 27, 'Australia', 20000),
(9, 'Rohan', 30, 'India', 28000),
(10, 'Sophia', 33, 'USA', 32000); 

-- primary key => Not Null and Always unique
select*from customers;

-- Filtering , Sort, 
select user_name,age 
from customers;

select * 
from customers
where age>30;

select * 
from customers 
where age>30 and county ='India';  

select * 
from customers 
where county= 'India' and user_name like '%A';
-- %A = End A
-- A% = start A
-- %A% = Contains A 


select * 
from customers 
where amount_Spend between 20000 and 30000;

select * 
from customers 
order by age asc;


select * 
from customers 
order by age desc

select * 
from customers 
where age >30 
order by amount_Spend desc;

select top 2* 
from customers 
where age>30 
order by amount_Spend desc;
