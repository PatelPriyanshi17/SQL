CREATE DATABASE WindowFunctionsPractice;
GO

USE WindowFunctionsPractice;
GO
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);


INSERT INTO Employee
(emp_id, emp_name, department, city, salary, joining_date)
VALUES
(101, 'Aarav Sharma', 'IT', 'Ahmedabad', 72000, '2021-01-15'),
(102, 'Priya Patel', 'IT', 'Mumbai', 85000, '2020-06-10'),
(103, 'Rahul Mehta', 'IT', 'Ahmedabad', 78000, '2022-03-20'),
(104, 'Neha Shah', 'HR', 'Pune', 65000, '2021-08-12'),
(105, 'Vikram Singh', 'HR', 'Delhi', 72000, '2019-04-18'),
(106, 'Ananya Desai', 'HR', 'Mumbai', 68000, '2022-01-25'),
(107, 'Rohan Gupta', 'Sales', 'Delhi', 55000, '2023-02-14'),
(108, 'Sneha Joshi', 'Sales', 'Ahmedabad', 62000, '2021-11-05'),
(109, 'Karan Shah', 'Sales', 'Mumbai', 58000, '2022-07-19'),
(110, 'Meera Patel', 'Finance', 'Pune', 82000, '2020-09-21'),
(111, 'Arjun Mehta', 'Finance', 'Delhi', 90000, '2018-05-16'),
(112, 'Kavya Shah', 'Finance', 'Ahmedabad', 85000, '2021-12-01'),
(113, 'Dev Kumar', 'IT', 'Bangalore', 78000, '2023-06-11'),
(114, 'Isha Patel', 'IT', 'Mumbai', 92000, '2019-10-28'),
(115, 'Manav Joshi', 'Sales', 'Pune', 61000, '2020-02-17'),
(116, 'Pooja Mehta', 'HR', 'Ahmedabad', 75000, '2018-11-30'),
(117, 'Aditya Shah', 'Finance', 'Mumbai', 88000, '2022-04-09'),
(118, 'Nisha Gupta', 'Sales', 'Delhi', 59000, '2023-09-13'),
(119, 'Harsh Patel', 'IT', 'Pune', 88000, '2021-03-22'),
(120, 'Riya Singh', 'Finance', 'Ahmedabad', 76000, '2023-01-18');

select * from employee;


CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    sale_date DATE,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(12,2),

    FOREIGN KEY (employee_id)
    REFERENCES Employee(emp_id)
);

INSERT INTO Sales
(sale_id, employee_id, sale_date, product, category, quantity, amount)
VALUES
(1,101,'2025-01-03','Laptop','Electronics',2,140000),
(2,102,'2025-01-04','Monitor','Electronics',3,75000),
(3,103,'2025-01-05','Keyboard','Accessories',5,25000),
(4,107,'2025-01-06','Laptop','Electronics',1,70000),
(5,108,'2025-01-07','Mouse','Accessories',10,15000),
(6,110,'2025-01-08','Printer','Electronics',2,50000),
(7,111,'2025-01-09','Laptop','Electronics',2,145000),
(8,102,'2025-01-10','Keyboard','Accessories',8,40000),
(9,109,'2025-01-11','Monitor','Electronics',2,52000),
(10,112,'2025-01-12','Printer','Electronics',3,72000),
(11,101,'2025-01-13','Mouse','Accessories',15,22500),
(12,103,'2025-01-14','Laptop','Electronics',1,72000),
(13,114,'2025-01-15','Monitor','Electronics',4,108000),
(14,115,'2025-01-16','Keyboard','Accessories',12,60000),
(15,108,'2025-01-17','Laptop','Electronics',2,150000),
(16,116,'2025-01-18','Printer','Electronics',1,26000),
(17,117,'2025-01-19','Monitor','Electronics',3,81000),
(18,118,'2025-01-20','Mouse','Accessories',20,30000),
(19,119,'2025-01-21','Laptop','Electronics',3,225000),
(20,120,'2025-01-22','Keyboard','Accessories',10,50000),
(21,101,'2025-01-23','Monitor','Electronics',2,54000),
(22,102,'2025-01-24','Laptop','Electronics',1,76000),
(23,103,'2025-01-25','Mouse','Accessories',12,18000),
(24,107,'2025-01-26','Printer','Electronics',2,52000),
(25,108,'2025-01-27','Monitor','Electronics',2,50000),
(26,110,'2025-01-28','Laptop','Electronics',1,73000),
(27,111,'2025-01-29','Keyboard','Accessories',15,75000),
(28,112,'2025-01-30','Mouse','Accessories',25,37500),
(29,114,'2025-02-01','Laptop','Electronics',2,155000),
(30,115,'2025-02-02','Monitor','Electronics',3,78000),
(31,116,'2025-02-03','Keyboard','Accessories',10,50000),
(32,117,'2025-02-04','Laptop','Electronics',1,74000),
(33,118,'2025-02-05','Printer','Electronics',2,51000),
(34,119,'2025-02-06','Monitor','Electronics',4,104000),
(35,120,'2025-02-07','Mouse','Accessories',18,27000),
(36,101,'2025-02-08','Laptop','Electronics',2,148000),
(37,102,'2025-02-09','Printer','Electronics',1,25000),
(38,103,'2025-02-10','Monitor','Electronics',3,79000),
(39,107,'2025-02-11','Mouse','Accessories',20,30000),
(40,108,'2025-02-12','Keyboard','Accessories',14,70000),
(41,109,'2025-02-13','Laptop','Electronics',2,152000),
(42,110,'2025-02-14','Monitor','Electronics',2,53000),
(43,111,'2025-02-15','Printer','Electronics',3,78000),
(44,112,'2025-02-16','Laptop','Electronics',2,146000),
(45,114,'2025-02-17','Keyboard','Accessories',10,50000),
(46,115,'2025-02-18','Mouse','Accessories',15,22500),
(47,116,'2025-02-19','Laptop','Electronics',1,71000),
(48,117,'2025-02-20','Monitor','Electronics',3,81000),
(49,118,'2025-02-21','Keyboard','Accessories',12,60000),
(50,119,'2025-02-22','Laptop','Electronics',2,149000),
(51,120,'2025-02-23','Printer','Electronics',2,50000),
(52,101,'2025-02-24','Mouse','Accessories',22,33000),
(53,102,'2025-02-25','Monitor','Electronics',2,51000),
(54,103,'2025-02-26','Laptop','Electronics',1,75000),
(55,107,'2025-02-27','Keyboard','Accessories',16,80000),
(56,108,'2025-02-28','Printer','Electronics',2,49000),
(57,109,'2025-03-01','Mouse','Accessories',25,37500),
(58,110,'2025-03-02','Laptop','Electronics',2,150000),
(59,111,'2025-03-03','Monitor','Electronics',4,106000),
(60,112,'2025-03-04','Keyboard','Accessories',18,90000);
select * from Sales;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product VARCHAR(50),
    category VARCHAR(50),
    amount DECIMAL(12,2),
    status VARCHAR(30)
);

INSERT INTO Orders
(order_id, customer_id, order_date, product, category, amount, status)
VALUES
(1001,201,'2025-01-02','Laptop','Electronics',70000,'Delivered'),
(1002,202,'2025-01-03','Mouse','Accessories',1500,'Delivered'),
(1003,201,'2025-01-08','Monitor','Electronics',25000,'Delivered'),
(1004,203,'2025-01-10','Keyboard','Accessories',3000,'Delivered'),
(1005,202,'2025-01-12','Laptop','Electronics',72000,'Delivered'),
(1006,204,'2025-01-15','Printer','Electronics',26000,'Cancelled'),
(1007,201,'2025-01-18','Keyboard','Accessories',3500,'Delivered'),
(1008,205,'2025-01-20','Laptop','Electronics',75000,'Delivered'),
(1009,203,'2025-01-23','Mouse','Accessories',1800,'Delivered'),
(1010,202,'2025-01-25','Monitor','Electronics',27000,'Delivered'),
(1011,206,'2025-01-27','Laptop','Electronics',68000,'Delivered'),
(1012,204,'2025-01-29','Keyboard','Accessories',3200,'Delivered'),
(1013,205,'2025-02-01','Printer','Electronics',25500,'Delivered'),
(1014,201,'2025-02-03','Mouse','Accessories',2000,'Delivered'),
(1015,203,'2025-02-05','Laptop','Electronics',73000,'Delivered'),
(1016,202,'2025-02-07','Keyboard','Accessories',3500,'Delivered'),
(1017,206,'2025-02-10','Monitor','Electronics',28000,'Delivered'),
(1018,204,'2025-02-12','Laptop','Electronics',71000,'Delivered'),
(1019,205,'2025-02-15','Mouse','Accessories',2200,'Delivered'),
(1020,201,'2025-02-18','Printer','Electronics',25000,'Delivered'),
(1021,203,'2025-02-20','Monitor','Electronics',26000,'Delivered'),
(1022,202,'2025-02-22','Laptop','Electronics',76000,'Delivered'),
(1023,206,'2025-02-24','Keyboard','Accessories',3800,'Delivered'),
(1024,204,'2025-02-26','Mouse','Accessories',1900,'Delivered'),
(1025,205,'2025-02-28','Laptop','Electronics',78000,'Delivered'),
(1026,201,'2025-03-02','Monitor','Electronics',29000,'Delivered'),
(1027,203,'2025-03-04','Printer','Electronics',27000,'Delivered'),
(1028,202,'2025-03-06','Mouse','Accessories',2100,'Delivered'),
(1029,206,'2025-03-08','Laptop','Electronics',74000,'Delivered'),
(1030,204,'2025-03-10','Keyboard','Accessories',3600,'Delivered'),
(1031,205,'2025-03-12','Monitor','Electronics',30000,'Delivered'),
(1032,201,'2025-03-15','Laptop','Electronics',80000,'Delivered'),
(1033,203,'2025-03-17','Mouse','Accessories',2300,'Delivered'),
(1034,202,'2025-03-19','Printer','Electronics',28000,'Delivered'),
(1035,206,'2025-03-21','Monitor','Electronics',31000,'Delivered');

select *from Orders;

SELECT COUNT(*) AS Employee_Count
FROM Employee;

SELECT COUNT(*) AS Sales_Count
FROM Sales;

SELECT COUNT(*) AS Orders_Count
FROM Orders;

--Part A — Basic Ranking Functions--
/*Task 1 — Rank Employees by Salary
Display employee name, department, salary, and their rank based on salary from highest to lowest.

Hint: RANK() OVER (...)*/
select 
emp_name,
department,
salary,
rank() over(
       order by salary ) as salary_rank 
from Employee

/*Task 2 — Dense Rank Employees
Display all employees with their salary and dense rank within the company.

Hint: DENSE_RANK()*/
select 
emp_name,
department,
salary,
dense_rank() over(
       order by salary ) as salary_rank 
from Employee;

/*Task 3 — Row Number for Employees
Assign a unique row number to every employee based on salary from highest to lowest.

Hint: ROW_NUMBER()*/
select 
emp_name,
department,
salary,
row_number() over(
    order by salary desc)
    AS row_number_Salary 
from Employee;

/*Task 4 — Rank Employees Within Department
Rank employees based on salary separately within each department.

Hint: PARTITION BY department*/


select 
emp_name,
department,
salary,
rank() over(
    partition by department
    order by salary desc)
    AS row_number_Salary 
from Employee;

/*Task 5 — Top 3 Employees in Each Department
Find the top 3 highest-paid employees from every department.

Hint: Use ROW_NUMBER() or DENSE_RANK() with PARTITION BY.*/
with top_3_highest_paid as(
select
emp_name,
department,
salary,
row_number() over(
    partition by department
    order by salary desc)
    AS dense_rank_paid 
from Employee)

select 
emp_name,
department,
salary,
dense_rank_paid
from top_3_highest_paid 
where dense_rank_paid<=3
order by department,dense_rank_paid;

--Part B — Partitioning--
/*Task 6 — Department Average Salary
Display:

Employee name
Department
Salary
Average salary of their department
Hint: AVG() OVER(PARTITION BY ...) */

select 
emp_name,
department,
salary,
avg(salary) over(
    partition by department) AS 
    avg_salary_department
from Employee
order by department,salary desc;

/* Task 7 — Difference from Department Average
Display each employee's salary and the difference between their salary and their department's average salary.

Hint: Salary − AVG() OVER(...)*/


select 
emp_name,
department,
salary,
avg(salary) over(
    partition by department) AS 
    avg_salary_department,
    salary -
    avg(salary) over(
    partition by department) AS 
    salary_difference
from Employee
order by department,salary desc;

/*Task 8 — Department Total Salary
Display every employee along with the total salary paid to their department.

Hint: SUM() OVER(PARTITION BY department) */
select 
emp_name,
department,
salary,
sum(salary) over(
    partition by department) AS 
    sum_salary_department
from Employee
order by department,salary desc;

/*Task 9 — Employee Salary Percentage
Calculate each employee's percentage contribution to their department's total salary.


Hint: salary / SUM(salary) OVER(...)*/


/* Task 10 — Department Employee Count
Display every employee along with the total number of employees working in their department.

Hint: COUNT(*) OVER(PARTITION BY department)*/
select 
emp_name,
department,
salary,
count(*) over(
    partition by department) AS 
    count_department_employee
from Employee
order by department,salary desc;

--Part C — Aggregate Window Functions--
/*Task 11 — Running Sales Total
Display each sale along with the cumulative sales amount over time.

Hint: SUM(amount) OVER(ORDER BY sale_date) */
select 
sale_id,
sale_date,
sum(amount) over(
    order by sale_date) 
    AS running_sales_total
from Sales;
/* Task 12 — Running Sales by Employee
Calculate the cumulative sales amount for each employee.

Hint: PARTITION BY employee_id ORDER BY sale_date*/
select 
employee_id,
sale_id,
sale_date,
sum(amount) over(
    partition by employee_id
    order by sale_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
    AS running_sales_total
from Sales;

/* Task 13 — Running Quantity Sold
Calculate the running total of quantity sold based on sale date.

Hint: SUM(quantity) OVER(...)*/ 
SELECT
    sale_id,
    sale_date,
    quantity,
    SUM(quantity) OVER (
        ORDER BY sale_date, sale_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_quantity_sold
FROM Sales
ORDER BY sale_date, sale_id;

/* Task 14 — Average Sales Per Employee
Display each sale along with the average sale amount generated by that employee.

Hint: AVG(amount) OVER(PARTITION BY employee_id)*/
select 
employee_id,
sale_id,
amount,
avg(amount) OVER(
    partition by employee_id) 
    AS sale_amount
from Sales
order by employee_id,sale_date;

/*Task 15 — Maximum Sale by Employee
Display each sale along with the highest sale amount made by that employee.

Hint: MAX(amount) OVER(...)*/
select
employee_id,
sale_id,
amount,
max(amount) over(
    partition by employee_id 
    order by amount desc) AS 
    highest_sales
from Sales;

--Part D — LAG and LEAD--
/* Task 16 — Previous Sale Amount
For every sale, display the previous sale amount made by the same employee.

Hint: LAG(amount)*/
select 
employee_id,
sale_id,
sale_date,
amount,
lag(amount) over(
        partition by employee_id
        order by sale_id,sale_date)
        as previous_sale_amount
from Sales
order by employee_id,sale_date,sale_id;

/*Task 17 — Next Sale Amount
For every sale, display the next sale amount made by the same employee.

Hint: LEAD(amount)

*/
select 
employee_id,
sale_id,
sale_date,
amount,
lead(amount) over(
        partition by employee_id
        order by sale_id,sale_date)
        as next_sale_amount
from Sales
order by employee_id,sale_date,sale_id;
        
/* Task 18 — Compare Current Sale with Previous Sale
Display:

Sale date
Employee
Current amount
Previous amount
Difference
Hint: Use LAG() and subtraction.*/

select
sale_date,
employee_id,
amount as cureenet_amount,
lag(amount) over(
    partition by employee_id
    order by sale_id,sale_date)
    as previous_amount,
amount- lag(amount) over(
    partition by employee_id
    order by sale_id,sale_date )
     as difference_sales
from Sales 

/*Task 19 — Sales Growth Percentage
Calculate the percentage change between the current sale and previous sale.

Hint: (Current - Previous) / Previous * 100

 */
SELECT
    sale_date,
    employee_id,
    amount AS Current_Amount,
    LAG(amount) OVER (
        PARTITION BY employee_id
        ORDER BY sale_date, sale_id
    ) AS Previous_Amount,
    ROUND(
        (amount - LAG(amount) OVER (
            PARTITION BY employee_id
            ORDER BY sale_date, sale_id
        )) * 100.0
        / NULLIF(
            LAG(amount) OVER (
                PARTITION BY employee_id
                ORDER BY sale_date, sale_id
            ), 0
        ),
        2
    ) AS Sales_Growth_Percentage
FROM Sales
ORDER BY employee_id, sale_date, sale_id;

/* ask 20 — Previous Order Date
For each customer, display their current order date and their previous order date.

Hint: LAG(order_date) OVER(PARTITION BY customer_id ...)*/

select 
customer_id,
order_id,
order_date as cureent_date,
lag(order_date) over(
    partition by customer_id
    order by order_id,order_date)
    as previous_order_date 
from Orders
order by customer_id,Order_date,Order_id;

--Part E — Advanced Window Frames--

/* Task 21 — Running Average of Sales
Calculate the running average of sales based on sale date.

Hint: AVG() OVER(ORDER BY sale_date)*/
select 
sale_id,
sale_date,
amount,
avg(amount) over(
    order by sale_date,sale_id 
    rows between unbounded preceding and current row
    ) as running_avg_sales
from Sales
order by sale_id,sale_date;

/*Task 22 — Previous 3 Sales Average
For every sale, calculate the average amount of the current sale and the previous 2 sales.

Hint: Use ROWS BETWEEN 2 PRECEDING AND CURRENT ROW */
select 
sale_id,
sale_date,
amount,
avg(amount) over(
    order by sale_id,sale_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW )
    as Previous_3_Sales_Average
from Sales 
order by sale_id,sale_date;

/*Task 23 — Moving Total of 3 Sales
Calculate a moving total using the current sale and previous 2 sales.

Hint: SUM() OVER(... ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)*/
SELECT
    sale_id,
    sale_date,
    amount,
    SUM(amount) OVER (
        ORDER BY sale_date, sale_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Moving_Total_3_Sales
FROM Sales
ORDER BY sale_date, sale_id;

/*Task 24 — Department Salary Running Total
Within every department, calculate the cumulative salary based on employee joining date.

Hint: PARTITION BY department ORDER BY joining_date */
select 
emp_id,
emp_name,
department,
salary ,
joining_date,
sum(salary) over(
    partition by department
    order by joining_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
    as Department_Running_Total
from Employee
order by department,joining_date,emp_id;

/* Task 25 — Highest Salary So Far
For each employee, display the highest salary encountered so far based on joining date.

Hint: MAX(salary) OVER(...)*/
select 
emp_id,
emp_name,
department,
joining_date,
salary,
max(salary) over(
    order by joining_date,emp_id desc 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Highest_Salary_So_Far
FROM Employee
ORDER BY joining_date, emp_id;

--Part F — Business Problems--
/* Task 26 — Customer Order Ranking
Rank each customer's orders from highest order amount to lowest.

Hint: RANK() OVER(PARTITION BY customer_id ORDER BY amount DESC)*/
select 
customer_id,
order_id,
order_date,
amount,
rank() over(
    partition by customer_id
    order by amount desc)
    AS Order_rank
from Orders
order by customer_id,Order_rank;

/*Task 27 — Highest Order for Each Customer
Find the highest-value order made by every customer.

Hint: Use ROW_NUMBER() or RANK() with PARTITION BY customer_id.

 */
WITH RankedOrders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY amount DESC
        ) AS rn
    FROM Orders
)
SELECT
    customer_id,
    order_id,
    order_date,
    amount
FROM RankedOrders
WHERE rn = 1
ORDER BY customer_id;

/* Task 28 — First and Last Order
For every customer, identify their first order and last order.

Hint: Think about ROW_NUMBER(), FIRST_VALUE() or LAST_VALUE().*/
WITH OrderRanking AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        amount,

        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date ASC, order_id ASC
        ) AS First_Order,

        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC, order_id DESC
        ) AS Last_Order

    FROM Orders
)
SELECT
    customer_id,
    order_id,
    order_date,
    amount,
    CASE
        WHEN First_Order = 1 THEN 'First Order'
        WHEN Last_Order = 1 THEN 'Last Order'
    END AS Order_Type
FROM OrderRanking
WHERE First_Order = 1
   OR Last_Order = 1
ORDER BY customer_id, order_date;

/* Task 29 — Compare Current and Previous Order
For every customer, display:

Customer ID
Order date
Current order amount
Previous order amount
Difference between orders
Hint: LAG() + PARTITION BY customer_id*/

SELECT
    customer_id,
    order_date,
    amount AS Current_Order_Amount,

    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS Previous_Order_Amount,

    amount - LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS Difference_Between_Orders

FROM Orders
ORDER BY customer_id, order_date, order_id;

/* Task 30 — Employee Sales Leaderboard
Create a sales leaderboard showing:

Employee ID
Total sales
Rank
Dense Rank
Percentage contribution to total company sales
Sort the result from highest total sales to lowest.

Hint: First calculate employee-level totals, then apply window functions to those totals.*/
WITH EmployeeSales AS (
    SELECT
        employee_id,
        SUM(amount) AS Total_Sales
    FROM Sales
    GROUP BY employee_id
)
SELECT
    employee_id,
    Total_Sales,

    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank,

    DENSE_RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Dense_Rank,

    ROUND(
        Total_Sales * 100.0 /
        NULLIF(SUM(Total_Sales) OVER (), 0),
        2
    ) AS Sales_Contribution_Percentage

FROM EmployeeSales
ORDER BY Total_Sales DESC;


--Bonus Challenge Tasks--
/*Challenge 1
Find the 2nd highest salary in each department.

Hint: Ranking functions.*/
WITH SalaryRanking AS (
    SELECT
        emp_id,
        emp_name,
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS Salary_Rank
    FROM Employee
)
SELECT
     emp_id,
     emp_name,
    department,
    salary
FROM SalaryRanking
WHERE Salary_Rank = 2 
ORDER BY department;

/*Find employees whose salary is above their department average.

Hint: Department-level AVG().*/
SELECT
    emp_id,
    emp_name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS Department_Avg_Salary
FROM Employee
WHERE salary > (
    SELECT AVG(E2.salary)
    FROM Employee E2
    WHERE E2.department = Employee.department
)
ORDER BY department, salary DESC;

/* Challenge 3
Find the top-selling product in each category.

Hint: Aggregate sales first, then rank products within category.*/

WITH ProductSales AS (
    SELECT
        category,
        product_name,
        SUM(sales_amount) AS Total_Sales
    FROM Sales
    GROUP BY category, product_name
),
RankedProducts AS (
    SELECT
        category,
        product_name,
        Total_Sales,
        RANK() OVER (
            PARTITION BY category
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ProductSales
)
SELECT
    category,
    product_name,
    Total_Sales
FROM RankedProducts
WHERE Sales_Rank = 1
ORDER BY category;

/* Challenge 4
Find customers whose latest order amount is greater than their previous order.

Hint: LAG() and customer partitioning.*/
WITH CustomerOrders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        amount,

        LAG(amount) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS Previous_Order_Amount,

        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC, order_id DESC
        ) AS Latest_Order_Rank

    FROM Orders
)
SELECT
    customer_id,
    order_id,
    order_date,
    amount AS Latest_Order_Amount,
    Previous_Order_Amount
FROM CustomerOrders
WHERE Latest_Order_Rank = 1
  AND amount > Previous_Order_Amount
ORDER BY customer_id;

/* Challenge 5
Find the employee with the highest cumulative sales.

Hint: Running SUM(). */
WITH EmployeeSales AS (
    SELECT
        employee_id,
        SUM(amount) AS Total_Sales
    FROM Sales
    GROUP BY employee_id
),
RankedSales AS (
    SELECT
        employee_id,
        Total_Sales,
        RANK() OVER (
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM EmployeeSales
)
SELECT
    employee_id,
    Total_Sales,
    Sales_Rank
FROM RankedSales
WHERE Sales_Rank = 1;

/* Challenge 6
Calculate a 7-day moving average of sales.

Hint: Window frame + date ordering.*/
WITH DailySales AS (
    SELECT
        CAST(sale_date AS DATE) AS Sale_Date,
        SUM(amount) AS Total_Daily_Sales
    FROM Sales
    GROUP BY CAST(sale_date AS DATE)
),
MovingAverage AS (
    SELECT
        Sale_Date,
        Total_Daily_Sales,
        AVG(Total_Daily_Sales * 1.0) OVER (
            ORDER BY Sale_Date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS Moving_Avg_7_Day
    FROM DailySales
)
SELECT
    Sale_Date,
    Total_Daily_Sales,
    ROUND(Moving_Avg_7_Day, 2) AS Moving_Avg_7_Day
FROM MovingAverage
ORDER BY Sale_Date;

/* Challenge 7
Identify consecutive orders where a customer's order amount increased.

Hint: LAG().*/

WITH CustomerOrders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        amount AS Current_Amount,
        LAG(amount) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS Previous_Amount
    FROM Orders
)
SELECT
    customer_id,
    order_id,
    order_date,
    Previous_Amount,
    Current_Amount,
    Current_Amount - Previous_Amount AS Amount_Increase
FROM CustomerOrders
WHERE Current_Amount > Previous_Amount
ORDER BY customer_id, order_date, order_id;

/*Challenge 8
Find the first sale and latest sale of every employee.

Hint: FIRST_VALUE() / LAST_VALUE() or ranking functions.*/
WITH EmployeeSales AS (
    SELECT
        employee_id,
        sale_id,
        sale_date,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY sale_date, sale_id
        ) AS First_Sale_Rank,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY sale_date DESC, sale_id DESC
        ) AS Latest_Sale_Rank
    FROM Sales
)
SELECT
    employee_id,
    sale_id,
    sale_date,
    amount,
    CASE
        WHEN First_Sale_Rank = 1
         AND Latest_Sale_Rank = 1 THEN 'First and Latest Sale'
        WHEN First_Sale_Rank = 1 THEN 'First Sale'
        WHEN Latest_Sale_Rank = 1 THEN 'Latest Sale'
    END AS Sale_Type
FROM EmployeeSales
WHERE First_Sale_Rank = 1
   OR Latest_Sale_Rank = 1
ORDER BY employee_id, sale_date;

/*Challenge 9
Calculate each product's percentage contribution to category sales.

Hint: SUM() OVER(PARTITION BY category).*/
WITH ProductSales AS (
    SELECT
        category,
        product_name,
        SUM(amount) AS Product_Total_Sales
    FROM Sales
    GROUP BY category, product_name
)
SELECT
    category,
    product_name,
    Product_Total_Sales,
    ROUND(
        Product_Total_Sales * 100.0 /
        NULLIF(
            SUM(Product_Total_Sales) OVER (
                PARTITION BY category
            ),
            0
        ),
        2
    ) AS Category_Contribution_Percentage
FROM ProductSales
ORDER BY category, Product_Total_Sales DESC;

/*Challenge 10
Calculate month-over-month sales growth.

Hint: Aggregate by month first, then use LAG().*/
WITH MonthlySales AS (
    SELECT
        DATEFROMPARTS(
            YEAR(sale_date),
            MONTH(sale_date),
            1
        ) AS Sales_Month,
        SUM(amount) AS Total_Sales
    FROM Sales
    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
),
SalesComparison AS (
    SELECT
        Sales_Month,
        Total_Sales,
        LAG(Total_Sales) OVER (
            ORDER BY Sales_Month
        ) AS Previous_Month_Sales
    FROM MonthlySales
)
SELECT
    Sales_Month,
    Total_Sales,
    Previous_Month_Sales,
    ROUND(
        (Total_Sales - Previous_Month_Sales) * 100.0 /
        NULLIF(Previous_Month_Sales, 0),
        2
    ) AS Growth_Percentage
FROM SalesComparison
ORDER BY Sales_Month;