CREATE DATABASE SchoolDB;

USE SchoolDB;

CREATE TABLE Students1(
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
    Marks DECIMAL(5,2)
);
INSERT INTO Students1(StudentID, StudentName, Age, Course, Marks)
VALUES 
(1, 'Amit Sharma', 21, 'Data Analytics', 85.50),
(2, 'Neha Gupta', 22, 'Computer Science', 90.75),
(3, 'Ravi Singh', 20, 'Business Analytics', 78.25),
(4,'piyu patel',23,'BCA',66.90),
(5,'neel panchal',24,'CA',70.67);

SELECT * FROM Students1;

create table Employees(
E_id int primary key,
E_name varchar(50),
salary DECIMAL (10,2),
joiningDate Date ,
IsActive BIT
);

insert into Employees (E_id,E_name,salary,joiningDate,IsActive) values 
(101,'piyu patel',30000,'2025-07-10',1),
(102,'neel panchal',25000,'2025-06-15',0),
(103,'krisha patel', 20000,'2024-04-13',1);

select * from Employees;

