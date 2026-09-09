create database collageDb;
use collageDb;

create table students(
studentId int primary key,
studentName varchar(50),
age int,
course varchar(50),
marks DECIMAL(5,2) 
)

insert into students (studentId,studentName,age,course,marks) values 
(1,'piyu patel',21,'Data Analytics',85.77),
(2, 'Neha Gupta', 22, 'Computer Science', 90.75),
(3, 'Ravi Singh', 20, 'Business Analytics', 78.25);

select * from students

select studentName,age,marks from students where marks>80;