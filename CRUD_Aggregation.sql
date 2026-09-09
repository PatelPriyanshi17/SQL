/*CRUD, Aggregation & Business Performance Analysis
Topics Covered
SELECT
INSERT
UPDATE
DELETE
WHERE
AND, OR, NOT
IN
BETWEEN
LIKE
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
ORDER BY 

Use the same sales_transactions table and 30-record dataset from task 3 */

select * from sales_transactions;

--1)--
/*Generate a business summary of the sales_transactions table showing:
Total number of transactions
Total quantity sold
Total sales value based on quantity × unit_price
Average unit price
Highest unit price
Lowest unit price*/
select
    COUNT(*) AS TotalTransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice,
    MAX(unit_price) AS HighestUnitPrice,
    MIN(unit_price) AS LowestUnitPrice
from sales_transactions;

--2)--
/*Management wants to compare product categories.
For each category, display:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Arrange the categories from highest total sales value to lowest.*/
select category, 
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
 from sales_transactions
    GROUP BY category
    order by TotalSalesValue desc;

--3--
/*Calculate the performance of each salesperson.
Display:
Salesperson
Number of transactions handled
Total quantity sold
Total sales value
Average unit price
Arrange the result from highest total sales value to lowest.*/
select salesperson,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
from sales_transactions 
    GROUP BY salesperson 
    order by TotalSalesValue desc;

--4--
/*Analyze sales performance across cities.
For each city, display:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display the cities in descending order of total sales value.*/
select city,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
from sales_transactions 
    GROUP BY city 
    order by TotalSalesValue desc;

--5--
/*Analyze purchasing behavior based on customer type.
For each customer type, calculate:
Number of transactions
Total quantity purchased
Total sales value
Average unit price
Arrange the result by total sales value from highest to lowest.*/
select customer_type,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitypurchased,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
from sales_transactions 
    GROUP BY customer_type 
    order by TotalSalesValue desc;


--6--
/*Management wants to understand which payment methods generate the most business.
For each payment mode, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Arrange the result by total sales value in descending order.*/
select payment_mode,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
from sales_transactions 
    GROUP BY payment_mode
    order by TotalSalesValue desc;

--7--
/*Identify categories that generated more than 300000 in total sales value.
Display:
Category
Total quantity sold
Total sales value
Average unit price
Only categories meeting the required sales threshold should appear.*/
select category,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
from sales_transactions 
    GROUP BY category 
    having SUM(quantity * unit_price) >300000;

--8--
/*Identify salespersons whose total sales value is greater than 500000.
Display:
Salesperson
Number of transactions
Total quantity sold
Total sales value
Arrange the result from highest to lowest total sales value.*/
select Salesperson,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue
from sales_transactions 
    GROUP BY Salesperson 
    having SUM(quantity * unit_price) >500000
    order by TotalSalesValue desc;
 
 --9--
 /*Identify products where the total quantity sold is greater than 5.
Display:
Product name
Total quantity sold
Total sales value
Average unit price
Arrange the result by total quantity sold from highest to lowest.*/
select product_name,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
from sales_transactions 
    GROUP BY product_name
    having SUM(quantity) >5
    order by TotalQuantitySold desc;

--10--
/*Analyze only transactions made by Premium customers.
For each category, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only categories where the total sales value is greater than 200000.*/
select category,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitysold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice
from sales_transactions  
    where customer_type='Premium'
    GROUP BY category  
    having SUM(quantity * unit_price)>200000;

--11--
/*Analyze transactions made by VIP customers.
For each salesperson, calculate:
Number of transactions
Total quantity sold
Total sales value
Display only salespersons who generated more than 300000 in VIP sales.*/
select salesperson,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue
from sales_transactions
    where customer_type='VIP' 
    GROUP BY salesperson 
    having SUM(quantity * unit_price)>300000;

--12--
/*Consider transactions where the payment mode is either Online or Card.
For each city, calculate:
Number of transactions
Total quantity sold
Total sales value
Display only cities where total sales value is greater than 300000.*/
select city,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue
from sales_transactions
    where payment_mode in ('Online' ,'Card') 
    GROUP BY city 
    having SUM(quantity * unit_price)>300000;

 --13--
 /*Analyze the effect of discounts.
For each discount percentage, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only discount percentages that occur in at least 2 transactions.*/
select discount_percent,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitysold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice 
from sales_transactions 
    GROUP BY discount_percent
    haVing COUNT(*) >=2;
   
--14--
/*Consider only Electronics transactions.
For each salesperson, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Highest unit price
Display only salespersons whose Electronics sales value exceeds 250000.*/
select salesperson,
  COUNT(*) AS Numberoftransactions,
  SUM(quantity) AS TotalQuantitySold,
  SUM(quantity * unit_price) AS TotalSalesValue,
  AVG(unit_price) AS AverageUnitPrice,
  MAX(unit_price) AS HighestUnitPrice
from sales_transactions 
  where category='Electronics' 
  GROUP BY salesperson 
  having SUM(quantity * unit_price)>250000;

 --15--
 /*Consider only Furniture transactions where the quantity is greater than 2.
For each city, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only cities where the resulting total sales value is greater than 50000.*/
 select city,
     COUNT(*) AS Numberoftransactions,
     SUM(quantity) AS TotalQuantitySold,
     SUM(quantity * unit_price) AS TotalSalesValue,
     AVG(unit_price) AS AverageUnitPrice
 from sales_transactions
     where category='Furniture' and quantity>2 
     GROUP BY city
     having SUM(quantity * unit_price)>50000;

 --16--
 /*Consider only Appliances transactions where:
Payment mode is not Cash
Discount percentage is less than 20
Group the transactions by salesperson and display:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Display only salespersons with total sales value above 100000.*/
select salesperson,
     COUNT(*) AS Numberoftransactions,
     SUM(quantity) AS TotalQuantitySold,
     SUM(quantity * unit_price) AS TotalSalesValue,
     AVG(unit_price) AS AverageUnitPrice
 from sales_transactions
     where category='Appliances' 
     and payment_mode!='Cash' 
     and discount_percent<20
     GROUP BY salesperson
     having SUM(quantity * unit_price)>100000;

 --17--
 /*Analyze only Premium and VIP customers.
For each customer type, calculate:
Number of transactions
Total quantity sold
Total sales value
Average unit price
Maximum unit price
Arrange the result by total sales value from highest to lowest.*/
 select customer_type,
      COUNT(*) AS Numberoftransactions,
      SUM(quantity) AS TotalQuantitySold,
      SUM(quantity * unit_price) AS TotalSalesValue,
      AVG(unit_price) AS AverageUnitPrice,
      MAX(unit_price) maximumUnitPrice
  from sales_transactions 
      where customer_type in('Premium','VIP')
      group by customer_type 
      order by TotalSalesValue desc;

--18--
/*Management wants to identify salespersons handling high-discount transactions.
Consider only transactions where the discount percentage is greater than 15.
For each salesperson, calculate:
Number of transactions
Total quantity sold
Total sales value
Average discount percentage
Display only salespersons who have at least 2 such transactions.*/
select salesperson,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(discount_percent) AS Averagediscountpercentage
from sales_transactions
    where discount_percent > 15
    group by salesperson
    having count(*) >=2;

--19--
/*Insert this transaction into the table.
After inserting the record, generate a query to verify that the transaction has been successfully added.*/
INSERT INTO sales_transactions
(
    transaction_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    discount_percent,
    city,
    payment_mode,
    salesperson,
    customer_type
)
VALUES
(
    1031,
    'Raj Mehta',
    'MacBook Pro',
    'Electronics',
    2,
    125000,
    10,
    'Mumbai',
    'Online',
    'Rahul',
    'Premium'
);

select * from sales_transactions;

--20--
/*Management wants a consolidated performance report.
Consider transactions where:
Customer type is either Premium or VIP
Payment mode is not Cash
Quantity is greater than 1
Discount percentage is less than 20
Group the qualifying transactions by salesperson and category.
The report must contain:
Salesperson
Category
Number of transactions
Total quantity sold
Total sales value
Average unit price
Minimum unit price
Maximum unit price
Average discount percentage
Display only salesperson-category combinations where the total sales value is greater than 200000.
Arrange the final report from highest total sales value to lowest.*/
select 
salesperson,category,
    COUNT(*) AS Numberoftransactions,
    SUM(quantity) AS TotalQuantitySold,
    SUM(quantity * unit_price) AS TotalSalesValue,
    AVG(unit_price) AS AverageUnitPrice,
    MIN(unit_price) AS MinimumUnitPrice,
    MAX(unit_price) AS MaximumUnitPrice,
    AVG(discount_percent) AS Averagediscountpercentage
from sales_transactions
    where customer_type in('Premium','VIP')
    and payment_mode!='Cash'
    and quantity>1
    and discount_percent<20 
    group by category,salesperson 
    having SUM(quantity * unit_price)>200000
    order by Totalsalesvalue desc;

/*Additional CRUD Challenge*/
--CRUD Operations--

/* 1)create 
Insert the new transaction provided in Task 19.*/

/*2)Retrieve and analyze the transaction using filtering and aggregation.*/
select * from sales_transactions 
where transaction_id=1031;

/*3)Choose the transaction with transaction_id = 1031 and update its discount percentage from 10 to 12.*/
update sales_transactions 
set discount_percent=12 
where transaction_id=1031;

/*4Delete

Delete the transaction with transaction_id = 1031.

Then verify that the transaction has been removed.*/
delete from sales_transactions where transaction_id=1031;




