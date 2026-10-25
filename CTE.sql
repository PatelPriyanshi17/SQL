create database cte;
use cte;
CREATE TABLE Employees1
(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    manager_id INT NULL
);

INSERT INTO Employees1
(employee_id, employee_name, department, city, salary, joining_date, manager_id)
VALUES
(1, 'Amit', 'IT', 'Ahmedabad', 65000, '2021-01-15', NULL),
(2, 'Rahul', 'IT', 'Mumbai', 85000, '2020-06-10', 1),
(3, 'Karan', 'IT', 'Pune', 85000, '2021-11-22', 2),
(4, 'Anjali', 'IT', 'Delhi', 70000, '2023-05-25', 2),
(5, 'Priya', 'HR', 'Delhi', 55000, '2022-03-20', NULL),
(6, 'Neha', 'HR', 'Ahmedabad', 75000, '2021-08-12', 5),
(7, 'Sneha', 'HR', 'Pune', 60000, '2023-02-15', 5),
(8, 'Vikas', 'Finance', 'Mumbai', 90000, '2019-04-18', NULL),
(9, 'Pooja', 'Finance', 'Delhi', 70000, '2022-01-05', 8),
(10, 'Rohit', 'Finance', 'Ahmedabad', 90000, '2020-09-10', 8),
(11, 'Mehul', 'Sales', 'Ahmedabad', 62000, '2022-07-11', NULL),
(12, 'Nisha', 'Sales', 'Mumbai', 78000, '2021-12-01', 11),
(13, 'Ravi', 'Sales', 'Delhi', 68000, '2023-03-19', 11),
(14, 'Komal', 'Marketing', 'Pune', 72000, '2020-10-21', NULL),
(15, 'Tina', 'Marketing', 'Ahmedabad', 82000, '2022-06-13', 14);

select * from Employees1;
CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    category VARCHAR(50),
    sales_amount DECIMAL(12,2),
    quantity INT,
    order_status VARCHAR(30)
);

INSERT INTO Orders
(order_id, customer_id, order_date, product_id, category, sales_amount, quantity, order_status)
VALUES
(1001, 101, '2026-01-05', 1, 'Laptop', 75000, 1, 'Completed'),
(1002, 102, '2026-01-08', 2, 'Mobile', 30000, 1, 'Completed'),
(1003, 101, '2026-01-15', 3, 'Monitor', 18000, 2, 'Completed'),
(1004, 103, '2026-01-20', 1, 'Laptop', 80000, 1, 'Completed'),
(1005, 104, '2026-02-02', 4, 'Keyboard', 5000, 2, 'Completed'),
(1006, 102, '2026-02-10', 5, 'Tablet', 25000, 1, 'Completed'),
(1007, 105, '2026-02-14', 1, 'Laptop', 90000, 1, 'Completed'),
(1008, 101, '2026-02-20', 6, 'Mouse', 2500, 2, 'Completed'),
(1009, 103, '2026-03-03', 2, 'Mobile', 35000, 1, 'Completed'),
(1010, 106, '2026-03-10', 3, 'Monitor', 22000, 1, 'Completed'),
(1011, 104, '2026-03-17', 1, 'Laptop', 70000, 1, 'Completed'),
(1012, 105, '2026-03-21', 5, 'Tablet', 28000, 1, 'Completed'),
(1013, 102, '2026-04-04', 2, 'Mobile', 32000, 1, 'Completed'),
(1014, 106, '2026-04-12', 1, 'Laptop', 85000, 1, 'Completed'),
(1015, 107, '2026-04-18', 4, 'Keyboard', 7000, 2, 'Completed'),
(1016, 101, '2026-05-01', 3, 'Monitor', 20000, 1, 'Completed'),
(1017, 103, '2026-05-08', 1, 'Laptop', 95000, 1, 'Completed'),
(1018, 108, '2026-05-15', 5, 'Tablet', 30000, 1, 'Completed'),
(1019, 105, '2026-06-02', 2, 'Mobile', 36000, 1, 'Completed'),
(1020, 107, '2026-06-11', 6, 'Mouse', 3500, 3, 'Completed');
select * from Orders;

--Practice Exercises--
--Basic CTE--
--1) Create a CTE that returns all employees.--
with Employees as (
select * from 
Employees1)
select * from 
Employees1;

--2)Return employees earning more than 70000--
WITH Employeescts as
(
    SELECT *
    FROM Employees1
    WHERE Salary > 70000
)
SELECT *
FROM Employeescts;

--3) Return only employee_id, name, department and salary.--
with employeects as (
select employee_id,
       employee_name,
       department,
       salary 
from Employees1)
select *  from
employeects;

--4)Calculate annual salary using a CTE.--
with Employeescts as (
select 
 employee_id,
 employee_name,
 salary,
 salary*12 AS annual_salary 
 from Employees1)
select * from
Employeescts;

--5)Return employees from Ahmedabad.--
with Employeescts as (
select
employee_id,
employee_name,
city
from Employees1
where city='Ahmedabad' )
select * from 
Employeescts;

--6)  Categorize employees based on salary.--
with Employeescts as(
select 
employee_id,
employee_name,
salary,
department,
case 
    when salary < 40000 then 'Low'
    when salary <=70000 then 'medium'
    else 'high' 
end as salary_category
from Employees1 ) 
select * from 
Employeescts;

--Aggregation--
--7) Average salary by department.--
with Employeescts as(
select 
department,
AVG(salary) AS Average_salary 
from Employees1
group by department
)
select * from 
Employeescts;

--8) Employee count by department.--
with  Employeescts as(
select 
department,
COUNT(employee_id) AS Count_Employee 
from Employees1
group by department
)
select * from 
Employeescts;

--9)Maximum salary by department.--
with  Employeescts as(
select 
department,
max(salary) AS maximum_salary
from Employees1
group by department
)
select * from 
Employeescts;

--10)Minimum and maximum salary by department.--
with  Employeescts as(
select 
department,
min(salary) AS minimum_salary,
max(salary) AS maximum_salary
from Employees1
group by department
)
select * from 
Employeescts;

--11)Departments with average salary greater than 70000.--
with  Employeescts as(
select 
department,
avg(salary) AS average_salary
from Employees1
group by department
having avg(salary)>70000
)
select * from 
Employeescts;

--12) Departments with more than two employees.--
WITH DeptCount AS (
    SELECT department, COUNT(*) AS total_employees
    FROM Employees
    GROUP BY department
)
SELECT *
FROM DeptCount
WHERE total_employees > 2;

---CTE + Window Functions--

--13) Rank employees by salary within department.--
with  Employeescts as(
select 
employee_id,
employee_name,
salary,
department,
rank() over(
        partition by department
        order by salary desc) 
        AS salary_rank
from Employees1
)
select * from 
Employeescts;

--14)Top 2 employees from every department.--
with  Employeescts as(
select
employee_id,
employee_name,
department,
salary,
row_number() over(
        partition by department
        order by salary desc) 
        AS salary_rank
from Employees1
)
select *
from 
Employeescts where salary_rank <=2;
 
 --15)Highest-paid employee from each department.--

with  Employeescts as(
select
employee_id,
employee_name,
department,
salary,
row_number() over(
        partition by department
        order by salary desc) 
        AS salary_rank
from Employees1
)
select *
from 
Employeescts where salary_rank =1;

--16)Top 3 salary levels per department.--
with  Employeescts as(
select
employee_id,
employee_name,
department,
salary,
row_number() over(
        partition by department
        order by salary desc) 
        AS salary_rank
from Employees1
)
select * 
from 
Employeescts where salary_rank <=3;

--17)Use DENSE_RANK for distinct salary levels.--
with  Employeescts as(
select
employee_id,
employee_name,
department,
salary,
dense_rank() over(
       
        order by salary desc) 
        AS salary_rank
from Employees1
)
select *
from 
Employeescts;

--18)Latest employee joining each department.--
with  Employeescts as(
select
employee_id,
employee_name,
department,
joining_date,
salary,
row_number() over(
        partition by department
        order by joining_date desc,employee_id desc) 
        AS joining_rank
from Employees1
)
select * 
from 
Employeescts where joining_rank =1;

--19) Earliest employee joining each department.--
 with  Employeescts as(
select
employee_id,
employee_name,
department,
joining_date,
salary,
row_number() over(
        partition by department
        order by joining_date asc) 
        AS joining_rank
from Employees1
)
select *
from 
Employeescts where joining_rank =1;

--20)Assign row numbers ordered by salary.--
with  Employeescts as(
select
employee_id,
employee_name,
department,
salary,
row_number() over(
        order by salary asc,employee_id) 
        AS salary_rank 
from Employees1
)
select * 
from 
Employeescts;

--Orders--
--21)Total sales per customer.--
WITH CustomerSales AS (
    SELECT customer_id,
           SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY customer_id
)
SELECT *
FROM CustomerSales
ORDER BY total_sales DESC;

--22)Rank customers by sales.--
WITH CustomerSales AS (
    SELECT customer_id,
           SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY customer_id
),
CustomerRank AS (
    SELECT *,
           RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM CustomerSales
)
SELECT *
FROM CustomerRank;

--23)Top 5 customers.--
WITH CustomerSales AS (
    SELECT customer_id,
           SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY customer_id
),
CustomerRank AS (
    SELECT *,
           ROW_NUMBER() OVER (
               ORDER BY total_sales DESC, customer_id
           ) AS rn
    FROM CustomerSales
)
SELECT *
FROM CustomerRank
WHERE rn <= 5;

--24)Monthly sales.--
WITH MonthlySales AS (
    SELECT YEAR(order_date) AS sales_year,
           MONTH(order_date) AS sales_month,
           SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT *
FROM MonthlySales
ORDER BY sales_year, sales_month;


--25)Month-over-month sales difference--
 WITH MonthlySales AS
(
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)
SELECT
    sales_year,
    sales_month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY sales_year, sales_month
    ) AS previous_month_sales,
    total_sales -
    LAG(total_sales) OVER (
        ORDER BY sales_year, sales_month
    ) AS sales_difference
FROM MonthlySales
ORDER BY sales_year, sales_month;

--26)Month-over-month growth percentage.--
WITH MonthlySales AS
(
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)
SELECT
    sales_year,
    sales_month,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY sales_year, sales_month
    ) AS previous_month_sales,

    ROUND(
        (
            (total_sales -
             LAG(total_sales) OVER (
                 ORDER BY sales_year, sales_month
             ))
            * 100.0
        )
        / NULLIF(
            LAG(total_sales) OVER (
                ORDER BY sales_year, sales_month
            ), 0
        ),
        2
    ) AS mom_growth_percentage

FROM MonthlySales
ORDER BY sales_year, sales_month;

--27)Latest order for every customer.--
WITH CustomerOrders AS
(
    SELECT
        order_id,
        customer_id,
        order_date,
        sales_amount,
        ROW_NUMBER() OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date DESC
        ) AS order_rank
    FROM Orders
)
SELECT
    order_id,
   customer_id,
    order_date,
    sales_amount
FROM CustomerOrders
WHERE order_rank = 1;

--28)First order for every customer.--
WITH CustomerOrders AS
(
    SELECT
        order_id,
        customer_id,
        order_date,
        sales_amount,
        ROW_NUMBER() OVER
        (
            PARTITION BY customer_id
            ORDER BY order_date ASC
        ) AS rn
    FROM Orders
)
SELECT
    order_id,
    customer_id,
    order_date,
    sales_amount
FROM CustomerOrders
WHERE rn = 1;

--29)Top 2 products by sales within category.--
WITH RankedProducts AS
(
    SELECT
        category,
        product_id,
        SUM(sales_amount) AS total_sales,

        ROW_NUMBER() OVER
        (
            PARTITION BY category
            ORDER BY SUM(sales_amount) DESC
        ) AS rn

    FROM Orders
    GROUP BY
        category,
        product_id
)
SELECT
    category,
    product_id,
    total_sales
FROM RankedProducts
WHERE rn <= 2
ORDER BY
    category,
    total_sales DESC;

--30) Product percentage contribution to total sales.--
SELECT
    product_id,
    SUM(sales_amount) AS product_sales,

    ROUND(
        SUM(sales_amount) * 100.0
        / SUM(SUM(sales_amount)) OVER(),
        2
    ) AS sales_percentage

FROM Orders
GROUP BY product_id
ORDER BY sales_percentage DESC;


--Multiple CTEs--
--31)Build a three-CTE customer ranking pipeline.--
WITH SalesData AS
(
select
    customer_id,
    order_date,
    sales_amount
from Orders ),
 Customersales as 
(
 select 
    customer_id,
    sum(sales_amount) AS Total_sales_amount
    from Orders
    group by customer_id ),
RankedCustomers AS 
(
 select 
 customer_id,
 Total_sales_amount,
 rank() over(
    order by Total_sales_amount desc
    ) AS rank_sales
from Customersales 
)
select * from 
RankedCustomers where 
rank_sales <=5;

--32)Classify departments using multiple CTEs.--
WITH DepartmentSalary AS
(
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department
),

DepartmentClass AS
(
    SELECT
        department,
        avg_salary,
        CASE
            WHEN avg_salary >= 70000 THEN 'High Salary'
            WHEN avg_salary >= 50000 THEN 'Medium Salary'
            ELSE 'Low Salary'
        END AS salary_class
    FROM DepartmentSalary
)

SELECT
    department,
    avg_salary,
    salary_class
FROM DepartmentClass
ORDER BY avg_salary DESC;

--33)Build monthly sales + previous month analysis.--
WITH MonthlySales AS
(
    SELECT
        YEAR(order_date) AS Sales_Year,
        MONTH(order_date) AS Sales_Month,
        SUM(sales_amount) AS Monthly_Sales
    FROM Orders
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)
SELECT
    Sales_Year,
    Sales_Month,
    Monthly_Sales,

    LAG(Monthly_Sales) OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Previous_Month_Sales,

    Monthly_Sales
      - LAG(Monthly_Sales) OVER
        (
            ORDER BY Sales_Year, Sales_Month
        ) AS Sales_Difference

FROM MonthlySales
ORDER BY
    Sales_Year,
    Sales_Month;

--34)Classify customers as Platinum, Gold, Silver or Bronze.--
WITH CustomerSales AS
(
    SELECT
        customer_id,
        SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_sales,
    CASE
        WHEN total_sales >= 100000 THEN 'Platinum'
        WHEN total_sales >= 50000 THEN 'Gold'
        WHEN total_sales >= 25000 THEN 'Silver'
        ELSE 'Bronze'
    END AS customer_category
FROM CustomerSales;

--35)Build a multi-stage query for the top 10 customers.--
WITH CustomerSales AS
(
    -- Stage 1: Customer-wise total sales
    SELECT
        customer_id,
        SUM(sales_amount) AS Total_Sales
    FROM Orders
    GROUP BY customer_id
),

RankedCustomers AS
(
    -- Stage 2: Rank customers by sales
    SELECT
        customer_id,
        Total_Sales,
        ROW_NUMBER() OVER (
            ORDER BY Total_Sales DESC
        ) AS Customer_Rank
    FROM CustomerSales
)

-- Stage 3: Get Top 10
SELECT
    Customer_Rank,
    customer_id,
    Total_Sales
FROM RankedCustomers
WHERE Customer_Rank <= 10
ORDER BY Customer_Rank;

--Data Cleaning--
--36)Find duplicate employees.--

with duplicateemployess as (
select 
employee_id,
employee_name,
department,
city,
ROW_NUMBER() over(
    partition by employee_name,
                 department,
                 city
    order by employee_id desc) AS rn 
from Employees1 )
select * from 
duplicateemployess where rn > 1;

-- 37)Assign row numbers to duplicates.--

WITH DuplicateCheck AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY employee_name, department
               ORDER BY employee_id
           ) AS rn
    FROM Employees
)
SELECT *
FROM DuplicateCheck
WHERE rn > 1;

--38)Find invalid salary records.--
WITH InvalidSalary AS (
    SELECT *
    FROM Employees
    WHERE salary IS NULL
       OR salary <= 0
)
SELECT *
FROM InvalidSalary;

--39)Find customers with multiple orders on the same date.--
with Dailyorders as (
    select
    customer_id,
    order_date,
    count(*) AS total_orders
    from orders
group by  customer_id,
    order_date
)
select * 
from Dailyorders
where total_orders>1;     

--40)Identify products with unusually low sales.--
WITH ProductSales AS (
    SELECT product_id, category,
           SUM(sales_amount) AS total_sales
    FROM Orders
    GROUP BY product_id, category
),
AverageSales AS (
    SELECT AVG(total_sales) AS avg_product_sales
    FROM ProductSales
)
SELECT p.*
FROM ProductSales p
CROSS JOIN AverageSales a
WHERE p.total_sales < a.avg_product_sales;

--Recursive CTE--
--41)Generate numbers 1–20.--
with numbers as(
select 1 as numbers 
union all 
select numbers +1
from numbers 
where numbers <10 
)
SELECT *
FROM Numbers
OPTION (MAXRECURSION 0);

--42)Generate numbers 1–100.--

with numbers as(
select 1 as numbers 
union all 
select numbers +1
from numbers 
where numbers <100
)
SELECT *
FROM Numbers
OPTION (MAXRECURSION 0);

--43)Generate dates for January 2026.--
WITH Dates AS
(
    SELECT CAST('2026-01-01' AS DATE) AS order_date

    UNION ALL

    SELECT DATEADD(DAY, 1, order_date)
    FROM Dates
    WHERE order_date < '2026-01-10'
)
SELECT *
FROM Dates
OPTION (MAXRECURSION 0);

--44)Generate the first 90 days of 2026.--
WITH Calendar AS (
    SELECT CAST('2026-01-01' AS DATE) AS calendar_date

    UNION ALL

    SELECT DATEADD(DAY, 1, calendar_date)
    FROM Calendar
    WHERE calendar_date < '2026-03-31'
)
SELECT calendar_date
FROM Calendar
OPTION (MAXRECURSION 90);

--45)Display employee-manager hierarchy.--
WITH EmployeeHierarchy AS (
    SELECT employee_id, employee_name, manager_id,
           department, 0 AS hierarchy_level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id,
           e.department, h.hierarchy_level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy h
        ON e.manager_id = h.employee_id
)
SELECT *
FROM EmployeeHierarchy
ORDER BY hierarchy_level, manager_id, employee_id
OPTION (MAXRECURSION 100);

--46)Display hierarchy levels.--
WITH EmployeeHierarchy AS (
    SELECT employee_id, employee_name, manager_id,
           0 AS hierarchy_level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id,
           h.hierarchy_level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy h
        ON e.manager_id = h.employee_id
)
SELECT employee_id, employee_name, manager_id, hierarchy_level
FROM EmployeeHierarchy
ORDER BY hierarchy_level, employee_id
OPTION (MAXRECURSION 100);

--47)Generate hierarchy paths.--
WITH EmployeeHierarchy AS (
    SELECT employee_id, employee_name, manager_id,
           CAST(employee_name AS VARCHAR(MAX)) AS hierarchy_path,
           0 AS hierarchy_level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id,
           CAST(
               h.hierarchy_path + ' -> ' + e.employee_name
               AS VARCHAR(MAX)
           ),
           h.hierarchy_level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy h
        ON e.manager_id = h.employee_id
)
SELECT employee_id, employee_name, hierarchy_level, hierarchy_path
FROM EmployeeHierarchy
ORDER BY hierarchy_level, employee_id
OPTION (MAXRECURSION 100);

--48)Find all employees under a selected manager.--
DECLARE @ManagerID INT = 8;

WITH Subordinates AS (
    SELECT employee_id, employee_name, manager_id,
           department, 1 AS hierarchy_level
    FROM Employees
    WHERE manager_id = @ManagerID

    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id,
           e.department, s.hierarchy_level + 1
    FROM Employees e
    INNER JOIN Subordinates s
        ON e.manager_id = s.employee_id
)
SELECT *
FROM Subordinates
ORDER BY hierarchy_level, manager_id, employee_id
OPTION (MAXRECURSION 100);