create database SalesDatadb;
use SalesDatadb;
CREATE TABLE SalesData(
    order_id INT,
    customer_name VARCHAR(50 ),

    phone VARCHAR(15),
    mobile VARCHAR(15),
    office_phone VARCHAR(15),
    home_phone VARCHAR(15),

    product_name VARCHAR(50),
    price DECIMAL(10,4),
    quantity INT,

    profit DECIMAL(10,2),
    discount DECIMAL(5,2),

    order_date DATE,
    delivery_date DATE,

    returns DECIMAL(10,2),
    sales DECIMAL(10,2),

    radius DECIMAL(10,2)
);

INSERT INTO SalesData
VALUES
(1, 'Rahul',
 '9876543210', '9876543210', NULL, NULL,
 'Laptop', 55000.4567, 2,
 5000.00, 10.00,
 '2025-01-15', '2025-01-20',
 1000.00, 110000.00, 5),

(2, 'Priya',
 NULL, NULL, '9123456780', NULL,
 'Mouse', 799.9999, 5,
 -500.00, 5.00,
 '2025-02-10', '2025-02-15',
 500.00, 4000.00, 10),

(3, 'Amit',
 '9988776655', NULL, NULL, '9090909090',
 'Keyboard', 1299.5678, 3,
 800.00, NULL,
 '2025-03-22', '2025-03-28',
 0.00, 3900.00, 7.5),

(4, 'Sneha',
 NULL, NULL, NULL, NULL,
 'Monitor', 15499.9955, 1,
 0.00, 15.00,
 '2025-04-05', NULL,
 1000.00, 15500.00, 12),

(5, 'Karan',
 '9012345678', '9012345678', '8123456789', NULL,
 'Headphones', 2499.4999, 4,
 1200.00, NULL,
 '2025-05-18', '2025-05-23',
 300.00, 10000.00, 3.5),

(6, 'Neha',
 NULL, NULL, NULL, '7894561230',
 'Printer', 8999.8755, 2,
 -1500.00, 20.00,
 '2025-06-12', NULL,
 2000.00, 18000.00, 6),

(7, 'Mohit',
 '9876501234', NULL, '8765432109', NULL,
 'Webcam', 1899.1234, 6,
 2500.00, 8.00,
 '2025-07-25', '2025-07-30',
 500.00, 11400.00, 8),

(8, 'Riya',
 NULL, NULL, NULL, NULL,
 'Speaker', 3499.9999, 3,
 0.00, NULL,
 '2025-08-14', NULL,
 0.00, 10500.00, 4),

(9, 'Rahul',
 '9876543210', '9876543210', NULL, NULL,
 'Mouse', 799.9999, 10,
 1800.00, 12.00,
 '2026-01-10', '2026-01-14',
 200.00, 8000.00, 9),

(10, 'Priya',
 NULL, NULL, '9123456780', NULL,
 'Keyboard', 1299.5678, 7,
 2100.00, NULL,
 '2026-02-20', '2026-02-25',
 300.00, 9100.00, 11),

(11, 'Amit',
 '9988776655', NULL, NULL, '9090909090',
 'Monitor', 15499.9955, 2,
 3500.00, 10.00,
 '2026-03-11', NULL,
 1000.00, 31000.00, 15),

(12, 'Sneha',
 NULL, NULL, NULL, NULL,
 'Headphones', 2499.4999, 5,
 -1000.00, NULL,
 '2026-04-08', '2026-04-15',
 500.00, 12500.00, 2.5),

(13, 'Karan',
 '9012345678', '9012345678', '8123456789', NULL,
 'Printer', 8999.8755, 1,
 0.00, 5.00,
 '2026-05-19', NULL,
 0.00, 9000.00, 13),

(14, 'Neha',
 NULL, NULL, NULL, '7894561230',
 'Webcam', 1899.1234, 8,
 3200.00, NULL,
 '2026-06-21', '2026-06-26',
 400.00, 15200.00, 7),

(15, 'Mohit',
 '9876501234', NULL, '8765432109', NULL,
 'Speaker', 3499.9999, 4,
 -2000.00, 18.00,
 '2026-07-16', NULL,
 1500.00, 14000.00, 10);

 select * from SalesData;

 --Numeric Function Exercises--

 --1)Display the absolute value of the profit column.--
 select abs(Profit) AS absoluteProfit
 from SalesData; 

 --2)Display product prices rounded to 2 decimal places.--
 select round(price,2) AS roundedPrices 
 from SalesData;

 --3)Display the ceiling value of every product price.--
 select CEILING(price) AS ceilingprice
 from SalesData;

 --4)Display the floor value of every product price.--
 select Floor(price) AS floorPrice
 from SalesData;

 --5)Calculate the square of every quantity.--
 select square(quantity) AS squaresquare
 FROM SalesData;

 --6)Calculate the square root of a numeric column.--
  select sqrt(sales) AS squarerootSales
  from SalesData;

--7)Calculate a total order value using: (quantity × price ) and round the result to 2 decimal places.--
select quantity,
       price,
Round(quantity * price,2) AS TotalOrder 
from salesData;

--8)Display whether each transaction has a positive, negative, or zero profit using SIGN().--
select SIGN(Profit) AS signProfit
from SalesData;

--9)Generate a random number between 1 and 100.--
SELECT FLOOR(RAND() * 100) + 1 AS RandomNumber
from SalesData;

--10)Calculate the area of a circle with radius stored in a column.--
SELECT
    radius,
    PI() * POWER(radius, 2) AS CircleArea
FROM SalesData;


--Date & Time Exercises--

--11)Display the current date and time.--
select GetDate();

--12)Display today's date without the time portion--
select Cast(GETDATE() AS Date);

--13)Display the year from every order date.--
select Order_Date,
YEAR(Order_Date) AS OrderYear
from SalesData;

--14)Display the month number from every order date.--
select Order_Date,
Month(Order_Date) AS OrderMonth
from SalesData;

--15)Display the name of the month from every order date.
select Order_Date,
DATENAME(Month,Order_Date) AS OrderMonthNAme
from SalesData;

--16)Display the weekday name for every order.--
select Order_Date,
DATENAME(WEEKDAY,Order_Date) AS Weekdayname
from SalesData;

--17)Calculate the number of days between order date and delivery date.--
select order_Date,delivery_date,
DATEDIFF(Day,Order_Date,delivery_date) AS differnatdays
from SalesData

--18)Calculate an expected delivery date by adding 7 days to the order date.--
select Order_Date,
DATEADD(Day,7,Order_Date) AS addingdays
from SalesData;

--19)Display the last day of the month for every order date.--
select Order_date,
EOMONTH(Order_date) AS lastdayofmonth
from SalesData;

--20)Display orders placed in each year and month.--
select 
Year(Order_Date) AS OrderYear,
Month(Order_Date) AS OrderMonth,
Count(*) AS totalOrders
from SalesData 
group by Year(Order_Date) ,
        Month(Order_Date)

Order by 
        OrderYear,OrderMonth;

--NULL Handling Exercises--
--21)Find all customers whose phone number is NULL.--
select customer_name,phone
from SalesData 
where phone is null;

--22)Find all customers whose phone number is NOT NULL.--
select customer_name,phone
from SalesData 
where phone is not null;

--23)Display Not Available instead of NULL phone numbers.--
select phone,
       isnull(phone,'Not Available') AS replacenull
from SalesData;

--24)Display 0 instead of NULL discount values.--
select discount,
        isnull(discount,0) AS Dicount
from SalesData;

/*25)For every customer, return the first available value among:

mobile
office_phone
home_phone
If all are NULL, display:

No Contact*/
select Customer_Name,
COALESCE(mobile,office_phone,home_phone,'No Contact') AS firstavailable
from SalesData;

--26)Find the number of rows in a table using COUNT(*).--
select count(*) AS totalrows from SalesData;

--27)Find the number of non-NULL values in a specific column.--
select Count(phone) AS notnull
from SalesData; 

--28)Calculate an average while handling NULL values.--
select AVG(discount) AS  averageNULL from SalesData;

--29)calculate a percentage without causing a divide-by-zero error.Use NULLIF().--
select 
(profit/Nullif(Sales,0))*100 AS Salespercentage
from SalesData;

--30)Find orders where the delivery date is NULL and calculate how many days have passed since the order date--
select Order_Date,
       delivery_Date,
       DateDiff(Day,Order_Date ,getdate()) AS Days_Passed
from SalesData
where delivery_Date is null;

--Industry Scenarios--
/*Scenario 1 — E-Commerce Delivery Analysis
An e-commerce company wants to identify how long each order took to deliver.

Display:

Order ID
Order Date
Delivery Date
Delivery Days
If the delivery date is NULL, calculate the number of days from the order date until today.

Required concepts:

DATEDIFF()
ISNULL()
GETDATE()*/
select 
Order_ID,
Order_Date,
Delivery_Date,
DATEDIFF(Day,Order_Date,ISNUll(Delivery_Date,GETDATE())) AS Delivery_Days
from SalesData;

/*Scenario 2 — Monthly Sales Report
Management wants a monthly sales report.

Display:

Order Year
Order Month
Month Name
Total Sales
Required concepts:

YEAR()
MONTH()
DATENAME()
SUM()*/
select 
YEAR(order_date) AS Order_Year,
Month(order_date) AS Order_Month,
DateName(Month,order_date) AS Month_Name,
SUM(Sales) AS total_Sales 
from SalesData
group by YEAR(order_date),
         Month(order_date),
        DateName(Month,order_date)
Order by Order_Year,
         Order_Month;

/*Scenario 3 — Customer Contact Report
The company wants one contact number for each customer.

Priority:

Mobile
↓
Office Phone
↓
Home Phone
↓
No Contact
Required function:

COALESCE()*/
select Customer_Name,
COALESCE(Mobile,Office_phone,Home_phone,'No Contact') AS Avaliable
from SalesData;

/*Scenario 4 — Financial Profit Report
Create a report showing:

Product
Sales
Cost
Profit
Profit Percentage
Round the percentage to 2 decimal places.

Avoid division-by-zero errors.

Required concepts:

ROUND()
NULLIF()*/

SELECT
    product_name,
    Sales,
    Price AS Cost,
    Sales - Price AS Profit,
    ROUND(
        (Sales - Price) * 100.0 / NULLIF(Sales, 0),
        2
    ) AS Profit_Percentage
FROM SalesData;

/*Scenario 5 — Order Value Report
Create a report containing:

Order ID
Quantity
Price
Discount
Total Value
If discount is NULL, treat it as zero.

Round monetary values to 2 decimal places.

Required concepts:

ISNULL()
ROUND()*/
SELECT
    Order_ID,
    Quantity,
    Price,
    ISNULL(Discount, 0) AS Discount,
    ROUND(
        Quantity * Price * (1 - ISNULL(Discount, 0) / 100.0),
        2
    ) AS Total_Value
FROM SalesData;

/*Scenario 6 — Month-End Business Report
Management wants to know the month-end date for every Orders.

Display:

Transaction ID
Transaction Date
Month Name
Month End Date
Required concepts:

DATENAME()
EOMONTH()*/
select 
order_ID,
order_date,
DateName(Month,order_date) AS Month_name,
Eomonth(order_date) AS Month_end_Date
from SalesData;

