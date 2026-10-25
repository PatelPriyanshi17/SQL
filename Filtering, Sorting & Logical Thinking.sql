/*Filtering, Sorting & Logical Thinking*/ 
	
	/*Filter data using WHERE
	
	Use logical & comparison operators
	Apply LIKE, IN, BETWEEN
	Sort and limit data*/ 

create database collagedb1;
use collagedb1;

create table employess(
id int primary key,
name varchar(50),
department varchar(50),
salary Decimal(10,2),
age int);

INSERT INTO employess (id, name, department, salary, age)
VALUES
(1, 'Amit', 'IT', 60000, 28),
(2, 'Sneha', 'HR', 45000, 25),
(3, 'Raj', 'Finance', 70000, 32),
(4, 'Simran', 'IT', 52000, 27),
(5, 'Karan', 'Marketing', 40000, 24);

select  * from  Employess;

--Salary > 40000--
select * from  
Employess 
where salary>40000;

--Department IT--
select * from 
employess 
where department='IT';

--Age between 25-30--
select * 
from employess 
where 
age between 25 and 30;

--Name starts with S--
select *
from employess
where 
name like 'S%';

--Top 3 salaries--
select Top 3 *
from employess 
order by salary desc;

--NOT HR--
select * 
from employess 
where 
department!='HR';