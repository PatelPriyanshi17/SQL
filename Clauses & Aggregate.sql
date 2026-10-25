/* SQL Clauses & Aggregate Functions*/

/* this SQL Clauses GROUP BY Clause,HAVING Clause,LIMIT Clause,IN Clause,BETWEEN Clause,LIKE Clause */
/* Aggregate Functions COUNT(),SUM().AVG(),MIN(),MAX() */
create database Clauses_Aggregate;
use Clauses_aggregate;

CREATE TABLE students3 (
  id INT PRIMARY KEY,
  studentname VARCHAR(50),
  course VARCHAR(20),
  marks INT
);

INSERT INTO students3 VALUES
(1, 'Aman', 'BCA', 75),
(2, 'Neha', 'MCA', 90),
(3, 'Karan', 'BCA', 65),
(4, 'Riya', 'BBA', 80),
(5, 'Meena', 'MCA', 88);

select * from students3;

--1) Count the total number of students in the table--
select COUNT(*) from students3;

--2)Display the highest and lowest marks--
select 
MAX(marks) AS highest_marks,
MIN(marks) AS lowest_marks 
from students3;

	
--3)Show total marks obtained by students in each course--
select Course,  
SUM(marks) AS total_marks 
from students3 Group by course;

--4)Display the average marks per course using GROUP BY--
select Course,
avg(marks) AS average_marks
from students3 group by course;

--5)Show only those courses whose average marks exceed 80 using HAVING.--
select Course,
avg(marks) AS average_marks 
from students3 
group by course 
having avg(marks)>80

--6)Display the top 2 scoring students using ORDER BY and LIMIT.--
select Top 2 
studentname,marks 
from students3 
order by marks desc; 

--7)Show all students whose marks are between 60 and 90.--
select* 
from students3 
where marks between 60 and 90;

--8)Display all students enrolled in BCA or MCA using IN.--
select * 
from students3 
where course in ('BCA','MCA');
 
 --9)Find the total number of unique courses (COUNT(DISTINCT course)).--
 select 
 COUNT(DISTINCT course) 
 AS uniquecourses 
 from students3;

