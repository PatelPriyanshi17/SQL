create database Windowdb;
use Windowdb;
CREATE TABLE Employees
(
  
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);
INSERT INTO Employees
(employee_id, employee_name, department, city, salary, joining_date)
VALUES 
(1, 'Amit', 'IT', 'Ahmedabad', 65000, '2021-01-15'),
(2, 'Rahul', 'IT', 'Mumbai', 85000, '2020-06-10'),
(3, 'Priya', 'HR', 'Delhi', 55000, '2022-03-20'),
(4, 'Neha', 'HR', 'Ahmedabad', 75000, '2021-08-12'),
(5, 'Vikas', 'Finance', 'Mumbai', 90000, '2019-04-18'),
(6, 'Pooja', 'Finance', 'Delhi', 70000, '2022-01-05'),
(7, 'Karan', 'IT', 'Pune', 85000, '2021-11-22'),
(8, 'Sneha', 'HR', 'Pune', 60000, '2023-02-15'),
(9, 'Rohit', 'Finance', 'Ahmedabad', 90000, '2020-09-10'),
(10, 'Anjali', 'IT', 'Delhi', 70000, '2023-05-25');

select * from Employees;

CREATE TABLE Products2(
    employee_id INT ,
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100), 
    category VARCHAR(50),
    unit_price DECIMAL(12,2)
);

INSERT INTO Products2 ( employee_id,product_id, product_name, category, unit_price)
VALUES
(1,11, 'Laptop', 'Electronics', 55000),
(2,12, 'Mobile', 'Electronics', 25000),
(3,13, 'Keyboard', 'Accessories', 2000),
(4,14, 'Mouse', 'Accessories', 1000),
(5,15, 'Monitor', 'Electronics', 15000),
(6,16, 'Printer', 'Electronics', 12000),
(7,17, 'Headphones', 'Accessories', 3000),
(8,18, 'Webcam', 'Accessories', 4000);

select * from Products2;
/*65. Practical Exercise 1 — Basic Ranking
Find the salary rank of every employee.

Expected concepts:

RANK()
ORDER BY*/
select 
employee_name,
salary,
Rank() over(
      order by Salary desc) AS Salary_rank 
      from Employees;

/*Practical Exercise 2 — Department Ranking
Rank employees based on salary within each department.

Expected concepts:

PARTITION BY
RANK()*/
select 
employee_name,
salary,
department,
Rank() over(
      partition by department
      order by Salary desc) AS Salary_rank 
      from Employees;

/*67. Practical Exercise 3 — Compare Ranking Functions
Display:

Employee
Salary
ROW_NUMBER() 
RANK()
DENSE_RANK()
Sort by salary descending.*/
select 
employee_name,
salary,
Row_number() over(
order by salary desc) AS Row_number_salary,
Rank() over(
order by salary desc) AS rank_salary,
DENSE_RANK() over(
order by salary desc) AS dense_rank_salary
from Employees;
 
/*68. Practical Exercise 4 — Department Average
Display every employee's:

Employee name
Department
Salary
Department average salary*/
select 
employee_name,
salary,
department,
AVG(salary) over(
partition by department) 
AS department_Avg_salary
from Employees;

/*69. Practical Exercise 5 — Salary Difference
Find the difference between:

Employee Salary
-
Department Average Salary*/
select 
    employee_name,
    salary,
    department,
    AVG(salary) over(
        partition by department
    )AS department_Avg,
    salary-
    AVG(salary) over(
        partition by department
    )AS difference_from_avg
from Employees;

/*70. Practical Exercise 6 — Department Total
Display every employee along with the total salary of their department.*/
select 
    employee_name,
    salary,
    department,
    SUM(salary) over( 
    partition by department)
    AS department_total_salary
from Employees;

/*71. Practical Exercise 7 — Salary Contribution
Calculate each employee's percentage contribution to the total department salary.*/
select 
    employee_name,
    department,
    salary,
    salary*100/
    SUM(salary) over( 
    partition by department)
    AS salary_percentage
from Employees; 
  
/*72. Practical Exercise 8 — Top 2 Employees
Find the top 2 highest-paid employees from every department.

Use:

ROW_NUMBER()*/
WITH RankedEmployees AS(
select 
 employee_name,
 department,
 salary,
 ROW_NUMBER() over(
        partition by department
        Order by salary desc) 
        AS ROW_NUMBER_department
from Employees)

select 
 employee_name,
 department,
 salary
 from RankedEmployees 
 where row_number_department <=2;


 /*73. Practical Exercise 9 — Top 2 With Ties
Find the top 2 salary ranks in every department where employees with the same salary receive the same rank.

Think about whether:
 
RANK()
or:

DENSE_RANK()
is more appropriate.*/
WITH RankedEmployees AS(
select 
 employee_name,
 department,
 salary,
 dense_rank() over(
        partition by department
        Order by salary desc) 
        AS ROW_NUMBER_department
from Employees)
select *
from RankedEmployees 
where row_number_department <=2;

/*74. Practical Exercise 10 — NTILE
Divide all employees into four salary groups.

Use:

NTILE(4)*/
select 
employee_name,
salary,
NTILE(4) over(
        order by salary desc) 
        as ntile_salary
from Employees;

/*75. Practical Exercise 11 — Running Total
Create an Orders table and calculate cumulative sales ordered by date.*/
select 
joining_date,
salary,
SUM(salary) over(
           order by joining_date )
           as  running_total
from Employees;

/*76. Practical Exercise 12 — Previous Order
For every customer, display:

Current order date
Previous order date
Use:

LAG()*/
select
employee_name,
joining_date AS Current_order_date,
salary,
lag(joining_date) over(
    order by joining_date ) 
    AS Previous_order_date
from Employees;
 
/*77. Practical Exercise 13 — Next Order
For every customer, display:

Current order date
Next order date
Use:

LEAD()*/
select
employee_name,
joining_date AS Current_order_date,
salary,
lead(joining_date) over(
    order by joining_date ) 
    AS next_order_date
from Employees;

/*78. Practical Exercise 14 — Sales Growth
Calculate:

Current Sales
-
Previous Sales
using LAG().*/
select
employee_name,
salary,
lag(salary) over(
    order by salary ) 
    AS current_salary,salary -
lag(salary) over(
    order by salary ) 
    AS Previous_salary
from Employees;

/*79. Practical Exercise 15 — Moving Average
Calculate a 3-row moving average.

Use:

ROWS BETWEEN 2 PRECEDING AND CURRENT ROW*/
select 
joining_date,
salary,
AVG(salary) over(
    order by joining_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW )
    AS moving_avg_3_row
from Employees;

/*80. Practical Exercise 16 — First Order
Find the first order placed by every customer.*/
select
employee_name,
FIRST_VALUE(salary) over(
        order by salary desc)
        as first_order 
from Employees; 

/*81. Practical Exercise 17 — Latest Order
Find the latest order for every customer.*/
select 
employee_name,
LAST_VALUE(salary) over(
        order by salary desc 
         ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING)
        as last_order  
from Employees; 

 
/*82. Practical Exercise 18 — Product Contribution
Calculate every product's percentage contribution to total sales.*/
 select 
product_name,
salary,
salary*100 /
SUM(salary) over(
        partition by product_name)
        AS Product_percentage
        from Products2 inner join Employees 
        on Products2.employee_id=Employees.employee_id;
    
/*83. Practical Exercise 19 — Category Ranking
Rank products by sales within each category.*/
select
product_name,
category,
Salary,
Rank() over( 
        partition by category
        order by salary desc)
        AS rank_products
from Products2 inner join Employees 
on Products2.employee_id=Employees.employee_id;
 
/*84. Practical Exercise 20 — Top 3 Products Per Category
Find the top 3 products in every category.

This is a must-practice interview problem.*/
with top3 AS (
select
product_name,
category,
Salary,
Rank() over( 
        partition by category
        order by salary desc)
        AS rank_products
from Products2 inner join Employees 
on Products2.employee_id=Employees.employee_id)

select 
product_name,
category ,
salary,
rank_products
from top3 where rank_products<=3;

