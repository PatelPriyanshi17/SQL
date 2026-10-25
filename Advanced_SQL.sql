CREATE DATABASE Advance_SQL_PracticeDB;


USE Advance_SQL_PracticeDB;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    gender VARCHAR(10),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    joining_date DATE
);

INSERT INTO Employees
(employee_id, employee_name, department, gender, salary, city, joining_date)
VALUES
(1, 'Rahul', 'IT', 'Male', 120000, 'Ahmedabad', '2023-01-15'),
(2, 'Priya', 'HR', 'Female', 75000, 'Mumbai', '2022-05-20'),
(3, 'Amit', 'IT', 'Male', 55000, 'Ahmedabad', '2024-02-10'),
(4, 'Sneha', 'Finance', 'Female', 95000, 'Pune', '2021-07-12'),
(5, 'Karan', 'Sales', 'Male', 45000, 'Mumbai', '2023-09-01'),
(6, 'Neha', 'HR', 'Female', 110000, 'Ahmedabad', '2020-03-18'),
(7, 'Mohit', 'IT', 'Male', 65000, 'Pune', '2022-11-25'),
(8, 'Riya', 'Finance', 'Female', 58000, 'Mumbai', '2024-06-05'),
(9, 'Ajay', 'Sales', 'Male', 85000, 'Ahmedabad', '2021-12-14'),
(10, 'Pooja', 'IT', 'Female', 100000, 'Pune', '2023-04-22');

SELECT * FROM Employees;


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers
(customer_id, customer_name, city)
VALUES
(101, 'Arjun', 'Ahmedabad'),
(102, 'Meera', 'Delhi'),
(103, 'Dev', 'Mumbai'),
(104, 'Isha', 'Surat'),
(105, 'Krish', 'Pune'),
(106, 'Anaya', 'Vadodara');

SELECT * FROM Customers;




--Task 1 — CASE: Create Salary Category--

SELECT
    employee_id,
    employee_name,
    salary,
    CASE
        WHEN salary >= 100000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM Employees;


--Task 2 — Conditional Aggregation--
SELECT
    SUM(CASE WHEN salary >= 100000 THEN 1 ELSE 0 END)
        AS high_salary_employees,

    SUM(CASE WHEN salary >= 60000
                  AND salary < 100000 THEN 1 ELSE 0 END)
        AS medium_salary_employees,

    SUM(CASE WHEN salary < 60000 THEN 1 ELSE 0 END)
        AS low_salary_employees
FROM Employees;


--Task 3 — Set Operators--

--1. UNION — Returns unique cities from both tables.--
SELECT city FROM Employees
UNION
SELECT city FROM Customers;

--2. UNION ALL — Returns all rows, including duplicates.--
SELECT city FROM Employees
UNION ALL
SELECT city FROM Customers;

--3. INTERSECT — Returns cities present in both tables.--
SELECT city FROM Employees
INTERSECT
SELECT city FROM Customers;

--4. EXCEPT — Returns cities in Employees that are not in Customers.--
SELECT city FROM Employees
EXCEPT
SELECT city FROM Customers;

--Task 4 — PIVOT: Department-wise Gender Count--

SELECT
    department,
    [Male],
    [Female]
FROM
(
    SELECT
        department,
        gender
    FROM Employees
) AS SourceTable
PIVOT
(
    COUNT(gender)
    FOR gender IN ([Male], [Female])
) AS PivotTable;


--Task 5 — Create a View--
CREATE VIEW HighSalaryView AS
SELECT
    employee_id,
    employee_name,
    department,
    salary
FROM Employees
WHERE salary > 70000;

SELECT * FROM HighSalaryView;

--Task 6 — Temporary Table--
SELECT *
INTO #HighSalaryEmployees
FROM Employees
WHERE salary > 100000;

SELECT * FROM #HighSalaryEmployees;

--Task 7 — Stored Procedure--
CREATE PROCEDURE GetEmployeesByCity
    @City VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE city = @City;
END;

EXEC GetEmployeesByCity @City = 'Ahmedabad';

--Task 8 — Create an Index on Department--
CREATE INDEX IX_Employees_Department
ON Employees(department);

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT *
FROM Employees
WHERE department = 'IT';

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

--Task 9 — Execution Plan--
SELECT *
FROM Employees
WHERE department = 'IT';

--Task 10 — Transaction: COMMIT and ROLLBACK--

--A. Test COMMIT
BEGIN TRANSACTION;

UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 1;

SELECT *
FROM Employees
WHERE employee_id = 1;

COMMIT TRANSACTION;

--B. Test ROLLBACK--
BEGIN TRANSACTION;

UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 1;

SELECT *
FROM Employees
WHERE employee_id = 1;

ROLLBACK TRANSACTION;