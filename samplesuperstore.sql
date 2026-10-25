create database samplesuperstoredb;
use samplesuperstoredb;

--Level 1 — Basic SELECT & Filtering--
-- 1) Display all records from the samplesuperstore table--
select * from samplesuperstore;

-- 2) Display only:Order_ID,Order_Date,Customer_Name,Category,Sales,Profit--
select Order_ID,
Order_Date,
Customer_Name,
Category,Sales,
Profit 
from samplesuperstore;

-- 3) Find all orders where Sales is greater than 500.--
select Order_ID ,
Sales 
from samplesuperstore 
where Sales>500;

-- 4) Find all products where Profit is negative.
select Product_Name,
Profit 
from samplesuperstore 
where Profit<0;

-- 5) Find all orders belonging to the Consumer segment.--
select Order_ID,
Customer_Name,
segment 
from samplesuperstore 
where segment='Consumer';

-- 6) Display all orders from the Technology category.--
select Order_ID,
Product_Name,
category 
from samplesuperstore 
where category='Technology';

-- 7) Find all orders where Discount is greater than 0.20.--
select Order_ID,
Product_Name,
Discount 
from samplesuperstore 
where Discount >0.20

-- 8) Display orders shipped using First Class.--
select order_Id,
product_Name,
Ship_Mode 
from samplesuperstore 
where Ship_Mode='First Class';

-- 9) Find all records from the West region.--
select * 
from samplesuperstore 
where region='West';

-- 10) Display products whose name contains the word Chairs.--
select Product_Name,
Sub_Category 
from samplesuperstore 
where Sub_Category ='Chairs'; 

--Level 2 — Sorting &  --

-- 11) Display the 20 highest-sales orders.--
select Top 20 Order_ID,
Sales 
from samplesuperstore 
order by sales desc;

-- 12) Display the 20 orders with the lowest profit.--
select Top 20 Order_ID,
Profit 
from samplesuperstore 
order by Profit asc; 

-- 13) Display all unique:*   Categories,*   Sub-Categorie ,*   Segments,*   Regions
select DISTINCT category,
Sub_Category,
Segment,
Region  
from samplesuperstore;

-- 14) Display products sorted by Sales from highest to lowest.--
select Product_ID,
Product_Name,
Sales 
from samplesuperstore 
order by sales desc;

-- 15) Display products sorted by Profit from lowest to highest.
select Product_ID,
Product_Name,
Profit 
from samplesuperstore 
order by Profit asc;

-- 16) Display customers alphabetically by Customer_Name.--
select Customer_ID,
Customer_Name 
from samplesuperstore 
order by Customer_Name asc; 

--17) Display the orders with the highest discount.--
select Order_ID,
Discount 
from samplesuperstore 
order by Discount desc;

-- 18) Display the 10 most expensive individual sales transactions.--
select Top 10 Order_ID,
Sales 
from samplesuperstore 
order by Sales desc;

--Level 3 — Aggregate Functions--
-- 19) Find the total sales.
select 
SUM(Sales) AS totalsales 
from samplesuperstore;

-- 20) Find the total profit.--
select 
SUM(Profit) AS totalprofit 
from samplesuperstore;

-- 21) Find the average sales.--
select 
AVG(Sales) AS averagesales
from samplesuperstore;

-- 22) Find the average profit.--
select 
AVG(Profit) AS averageprofit
from samplesuperstore;

-- 23) Find the minimum and maximum sales.--
select 
MIN(Sales) AS minimumsales,
MAX(Sales) AS maximumsales
from samplesuperstore;

--24) Find the minimum and maximum profit.--
select 
MIN(Profit) AS minimumProfit,
MAX(Profit) AS maximumProfit
from samplesuperstore;

--25) Count the total number of records.--
select 
COUNT(*) AS totalnumber
from samplesuperstore;

-- 26) Count the number of unique customers.--
select 
COUNT(DISTINCT(Customer_Name)) AS totaluniquecustomernumber
from samplesuperstore;

--27) Count the number of unique products.--
select 
COUNT(DISTINCT(Product_ID)) AS totaluniqueproductnumber
from samplesuperstore;

-- 28) Find the total quantity sold.--
select 
SUM(quantity) AS totalquantitysold
from samplesuperstore;

--Level 4 — GROUP BY--
-- 29) Find total sales by category.--
select category,
SUM(Sales) AS totalsales 
from samplesuperstore 
group by Category;

-- 30) Find total profit by category--
select category,
SUM(Profit) AS totalProfit 
from samplesuperstore 
group by Category;

-- 31) Find average sales by category.--
select category,
AVG(Sales) AS averagesales 
from samplesuperstore 
group by Category;

-- 32) Find total sales by sub-category.--
select Sub_Category,
SUM(Sales) AS totalsales 
from samplesuperstore 
group by Sub_Category;

--33) Find total profit by sub-category.--
select Sub_Category,
SUM(Profit) AS totalProfit 
from samplesuperstore 
group by Sub_Category;

-- 34) Find total sales by region.--
select Region,
SUM(Sales) AS totalsales 
from samplesuperstore 
group by Region;

-- 35) Find total profit by region.--
select Region,
SUM(Profit) AS totalProfit 
from samplesuperstore 
group by Region;

--36) Find total sales by customer segment.--
select Segment,
SUM(Sales) AS totalsales 
from samplesuperstore 
group by Segment;

--37) Find total quantity sold by category.--
select Category,
SUM(quantity) AS totalquantitysold
from samplesuperstore
group by Category;

--38)Find the number of orders for each ship mode.--
select ship_Mode,
COUNT(Order_ID) AS numberoforders 
from samplesuperstore
group by ship_Mode;

-- 39) Find the number of customers in each segment.--
select segment, 
COUNT(Customer_ID) AS numberofcustomer 
from samplesuperstore
group by Segment;
 
-- 40)Find total sales by state--
select State_Province,
SUM(Sales) AS totalsales 
from samplesuperstore 
group by State_Province;

--Level 5 — HAVING\

-- 41)Find categories whose total sales are greater than 100,000.--
select Category,
SUM(Sales) AS totalsales
from samplesuperstore
group by Category 
having SUM(Sales)>100000;

-- 42)Find sub-categories whose total profit is greater than 10,000.--
select Sub_Category,
SUM(Profit) AS totalProfit
from samplesuperstore
group by  Sub_Category
having SUM(Profit)>10000;

-- 43) Find customers whose total sales exceed 5,000.--
select customer_id,
SUM(Sales) AS totalsales
from samplesuperstore 
group by customer_id
having SUM(Sales)>5000;

-- 44)Find states whose total sales exceed 50,000.--
select State_Province,
SUM(Sales) AS totalsales
from samplesuperstore 
group by State_Province
having SUM(Sales)>50000;

--45)Find products whose total sales exceed 10,000.--
select Product_ID,
SUM(Sales) AS totalsales
from samplesuperstore 
group by Product_ID
having SUM(Sales)>10000;

--46)Find categories having an average discount greater than 20%.--
select Category,
AVG(Discount) AS averagediscount
from samplesuperstore 
group by Category
having AVG(Discount)>20;

--47)Find customers who have placed more than 10 orders.--
select Customer_ID,
COUNT(Order_ID) AS totalorders
from samplesuperstore 
group by Customer_ID
having COUNT(Order_ID)>10;

--48)Find sub-categories with total profit below 0.--
select Sub_Category, 
SUM(Profit) AS totalprofit
from samplesuperstore
group by Sub_Category
having SUM(Profit)<0;

--Level 6 — CASE--
--  49) Create a column called Profit_Status:-Profit > 0  → Profitable,Profit < 0 → Loss,Profit = 0 → No Profit--   

SELECT *,
CASE
WHEN Profit > 0 THEN 'Profitable'
WHEN Profit < 0 THEN 'Loss'
ELSE 'No Profit'
END AS Profit_Status
FROM samplesuperstore;


-- 50) Create a Sales_Category:- Sales < 100 → Low ,100–500 → Medium ,501–1000 → High ,>1000 → Very High--
SELECT *,
Case
When Sales < 100 Then 'LOW'
When Sales Between 100 And 500 Then 'Medium'
When Sales Between 501 And 1000 Then 'High'
Else 'Very High'
End As Sales_Category
From samplesuperstore;


-- 51) Classify discounts into:- 0 → No Discount ,0–10% → Low,10–30% → Medium ,>30% → High--
SELECT 
    *,
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.10 THEN 'Low'
        WHEN Discount > 0.10 AND Discount <= 0.30 THEN 'Medium'
        WHEN Discount > 0.30 THEN 'High'
    END AS Discount_Category
FROM samplesuperstore;

-- 52) Calculate total sales and classify each category based on total sales.--
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    CASE
        WHEN SUM(Sales) < 100000 THEN 'Low'
        WHEN SUM(Sales) <= 300000 THEN 'Medium'
        ELSE 'High'
    END AS Sales_Category
FROM samplesuperstore
GROUP BY Category
ORDER BY Total_Sales DESC;

--Level 7 — Multiple Conditions--

-- 53) Find Consumer customers from the West region.--
select * 
from samplesuperstore 
where Segment='Consumer' and Region='West';

--54) Find Technology products with sales above 1,000.--
select * 
from samplesuperstore
where Category='Technology' and sales>1000

/* 55) Find orders where:

*   Sales > 500
    
*   Profit > 100
    
*   Discount < 20% */
select *
from samplesuperstore 
where sales > 500 
and Profit >100
and Discount < 0.20;

--56)Find Furniture orders where profit is negative.--
select * 
from samplesuperstore
where Category='Furniture' and Profit<0;

--57)Find Corporate customers who purchased Technology products.--
select * 
from samplesuperstore 
where Segment='Corporate' and Category='Technology';

--58)Find orders from the East region with discounts greater than 30%.--
select * 
from samplesuperstore
where Region='East' and Discount>0.30;

--Level 8 — Date Analysis---

--59)Find the earliest order date.--
select 
MIN(Order_Date) AS earliestorderdate 
from samplesuperstore;

--60)Find the latest order date.--
select 
MAX(Order_Date) AS latestorderdate 
from samplesuperstore;

--61)Find total sales by year.--
select 
Year(Order_Date) AS YearOrder,
SUM(Sales) AS totalsales
from samplesuperstore
group by Year(Order_Date)
order by YearOrder;

--62)Find total profit by year.--
select 
Year(Order_Date) AS yearOrder,
Sum(Profit) AS TotalProfit
from samplesuperstore
group by Year(Order_Date)
order by YearOrder;

--63)Find total sales by month.--
select 
Month(Order_Date) AS monthOrder,
SUM(Sales) AS totalsales
from samplesuperstore
group by Month(Order_Date)
order by monthOrder;

--64)Find the number of orders placed in each year.--
select
    YEAR (Order_Date) AS Order_year,
    COUNT(*) AS numberoforders
    from samplesuperstore
    group by YEAR (Order_Date)
    order by Order_year;

--65)Find sales for each year and category.--
select category,
       Year(Order_date) AS Order_year,
       SUM(sales) AS totalsales
       from samplesuperstore 
       group by category,Year(Order_date)
       order by Order_year,category;

--66)Find the year with the highest total sales--
select top 1
     Year(Order_date) AS Order_year,
     sum(sales) AS totalsales
     from samplesuperstore
     group by Year(Order_date)
     order by totalsales desc;

--67)Find the month with the highest sales.--
select top 1
     Month(Order_date) AS Order_month,
     sum(sales) AS totalsales
     from samplesuperstore
     group by Month(Order_date)
     order by totalsales desc;

        
--68)Find orders where the shipping date is later than the order date by more than 5 days.--
 select * 
 From samplesuperstore
 Where DATEDIFF(Day,Order_Date,Ship_Date)>5;

--Level 9 — Subqueries--
--  69)Find products whose sales are greater than the average sales of all products.--
select Product_ID,Product_Name,Sales
from samplesuperstore 
where sales >(select AVG(Sales)
from samplesuperstore);

--70)Find customers whose total sales are greater than the average customer sales.--
WITH CustomerSales AS (
    SELECT
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Customer_Name
)
SELECT
    Customer_Name,
    Total_Sales
FROM CustomerSales
WHERE Total_Sales > (
    SELECT AVG(Total_Sales * 1.0)
    FROM CustomerSales
)
ORDER BY Total_Sales DESC;

--71)Find the product with the highest sales.--
SELECT
    product_name,
    SUM(sales) AS Total_Sales
FROM samplesuperstore
GROUP BY product_name
HAVING SUM(sales) = (
    SELECT MAX(Product_Total)
    FROM (
        SELECT SUM(sales) AS Product_Total
        FROM samplesuperstore
        GROUP BY product_name
    ) AS ProductSales
);

--72)Find the customer with the highest total sales.--
SELECT
    customer_id,
    SUM(sales) AS Total_Sales
FROM samplesuperstore
GROUP BY customer_id
HAVING SUM(sales) = (
    SELECT MAX(Customer_Total)
    FROM (
        SELECT SUM(sales) AS Customer_Total
        FROM samplesuperstore
        GROUP BY customer_id
    ) AS CustomerSales
);

--73)Find the category with the highest total profit.--
SELECT
    customer_id,
    SUM(sales) AS Total_Profit
FROM samplesuperstore
GROUP BY customer_id
HAVING SUM(sales) = (
    SELECT MAX(Customer_Total)
    FROM (
        SELECT SUM(sales) AS Customer_Total
        FROM samplesuperstore
        GROUP BY customer_id
    ) AS CustomerSales
);

--74)Find all orders having sales greater than the average order sales.--
select 
Order_ID,
Sales
from samplesuperstore 
where sales>(
    select avg(sales)
    from samplesuperstore)
order by Sales desc;

--75)Find all customers who have purchased products from the Technology category.--
select 
customer_id,
customer_Name
from samplesuperstore
where customer_id in(
SELECT customer_id
    FROM samplesuperstore
    WHERE category = 'Technology'
)
ORDER BY customer_id;

--76)Find products whose profit is greater than the average profit.--
SELECT
    product_name,
    SUM(profit) AS Total_Profit
FROM samplesuperstore
GROUP BY product_name
HAVING SUM(profit) > (
    SELECT AVG(Product_Total_Profit)
    FROM (
        SELECT SUM(profit) AS Product_Total_Profit
        FROM samplesuperstore
        GROUP BY product_name
    ) AS ProductProfit
)
ORDER BY Total_Profit DESC;


--Level 10 — Advanced SQL--
--77)Find the second-highest sales transaction.--
WITH ProductSales AS (
    SELECT
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Product_Name
),
RankedProducts AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ProductSales
)
SELECT
    Product_Name,
    Total_Sales
FROM RankedProducts
WHERE Sales_Rank = 3
ORDER BY Total_Sales DESC;

--78)Find the second-highest selling customer.--
WITH CustomerSales AS (
    SELECT
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Customer_Name
),
RankedCustomers AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM CustomerSales
)
SELECT
    Customer_Name,
    Total_Sales
FROM RankedCustomers
WHERE Sales_Rank = 2
ORDER BY Total_Sales DESC;

--79)Find the third-highest selling product.--
WITH ProductSales AS (
    SELECT
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Product_Name
),
RankedProducts AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ProductSales
)
SELECT
    Product_Name,
    Total_Sales
FROM RankedProducts
WHERE Sales_Rank = 3
ORDER BY Total_Sales DESC;

--80)Find the highest-selling product in each category.--
WITH ProductSales AS (
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Category, Product_Name
),
RankedProducts AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ProductSales
)
SELECT
    Category,
    Product_Name,
    Total_Sales
FROM RankedProducts
WHERE Sales_Rank = 1
ORDER BY Category;

--81)Find the highest-profit customer in each region.--
WITH CustomerProfit AS (
    SELECT
        Region,
        Customer_Name,
        SUM(Profit) AS Total_Profit
    FROM samplesuperstore
    GROUP BY Region, Customer_Name
),
RankedCustomers AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY Region
            ORDER BY Total_Profit DESC
        ) AS Profit_Rank
    FROM CustomerProfit
)
SELECT
    Region,
    Customer_Name,
    Total_Profit
FROM RankedCustomers
WHERE Profit_Rank = 1
ORDER BY Region;

--82)Find the highest-sales sub-category in each category.--
WITH SubCategorySales AS (
    SELECT
        Category,
        Sub_Category,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Category, Sub_Category
),
RankedSubCategories AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM SubCategorySales
)
SELECT
    Category,
    Sub_Category,
    Total_Sales
FROM RankedSubCategories
WHERE Sales_Rank = 1
ORDER BY Category;

--83)Find customers whose sales are above their region's average sales.--
WITH CustomerSales AS (
    SELECT
        Region,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Region, Customer_Name
),
RegionAverage AS (
    SELECT *,
        AVG(Total_Sales * 1.0) OVER (
            PARTITION BY Region
        ) AS Region_Avg_Sales
    FROM CustomerSales
)
SELECT
    Region,
    Customer_Name,
    Total_Sales,
    ROUND(Region_Avg_Sales, 2) AS Region_Avg_Sales
FROM RegionAverage
WHERE Total_Sales > Region_Avg_Sales
ORDER BY Region, Total_Sales DESC;

--84)Find products whose profit is above their category's average profit.--
WITH ProductProfit AS (
    SELECT
        Category,
        Product_Name,
        SUM(Profit) AS Total_Profit
    FROM samplesuperstore
    GROUP BY Category, Product_Name
),
CategoryAverage AS (
    SELECT *,
        AVG(Total_Profit * 1.0) OVER (
            PARTITION BY Category
        ) AS Category_Avg_Profit
    FROM ProductProfit
)
SELECT
    Category,
    Product_Name,
    Total_Profit,
    ROUND(Category_Avg_Profit, 2) AS Category_Avg_Profit
FROM CategoryAverage
WHERE Total_Profit > Category_Avg_Profit
ORDER BY Category, Total_Profit DESC;


--85. Rank customers based on total sales--

WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Customer_ID, Customer_Name
)
SELECT *,
    DENSE_RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank
FROM CustomerSales
ORDER BY Sales_Rank;


--86. Rank products based on total sales--


WITH ProductSales AS
(
    SELECT
        Product_ID,
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Product_ID, Product_Name
)
SELECT *,
    DENSE_RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank
FROM ProductSales
ORDER BY Sales_Rank;


--87. Rank categories based on total profit--


SELECT
    Category,
    SUM(Profit) AS Total_Profit,
    DENSE_RANK() OVER (
        ORDER BY SUM(Profit) DESC
    ) AS Profit_Rank
FROM samplesuperstore
GROUP BY Category
ORDER BY Profit_Rank;


-- 88. Create RANK() and DENSE_RANK() for customers based on total sales--


WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Customer_ID, Customer_Name
)
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank,
    DENSE_RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Dense_Sales_Rank
FROM CustomerSales
ORDER BY Total_Sales DESC;



-- 89. Find the top 3 customers in each region--
WITH CustomerSales AS
(
    SELECT
        Region,
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Region, Customer_ID, Customer_Name
),
RankedCustomers AS
(
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY Region
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM CustomerSales
)
SELECT *
FROM RankedCustomers
WHERE Sales_Rank <= 3
ORDER BY Region, Sales_Rank;


-- 90. Find the top 3 products in each category--
WITH ProductSales AS
(
    SELECT
        Category,
        Product_ID,
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Category, Product_ID, Product_Name
),
RankedProducts AS
(
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ProductSales
)
SELECT *
FROM RankedProducts
WHERE Sales_Rank <= 3
ORDER BY Category, Sales_Rank;


--91. Calculate the percentage contribution of each category to total company sales--
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    CAST(
        SUM(Sales) * 100.0 /
        SUM(SUM(Sales)) OVER ()
        AS DECIMAL(10,2)
    ) AS Sales_Percentage
FROM samplesuperstore
GROUP BY Category
ORDER BY Sales_Percentage DESC;



-- 92. Calculate running total of sales by order date--


WITH DailySales AS
(
    SELECT
        Order_Date,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Order_Date
)
SELECT
    Order_Date,
    Total_Sales,
    SUM(Total_Sales) OVER (
        ORDER BY Order_Date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS Running_Total
FROM DailySales
ORDER BY Order_Date;


-- 93. Calculate running total of sales for each customer--
SELECT
    Customer_ID,
    Customer_Name,
    Order_Date,
    Order_ID,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY Customer_ID
        ORDER BY Order_Date, Order_ID
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS Running_Total
FROM samplesuperstore
ORDER BY Customer_ID, Order_Date, Order_ID;

-- 94. Calculate previous order sales using LAG()--
SELECT
    Customer_ID,
    Customer_Name,
    Order_Date,
    Order_ID,
    Sales,
    LAG(Sales) OVER (
        PARTITION BY Customer_ID
        ORDER BY Order_Date, Order_ID
    ) AS Previous_Order_Sales
FROM samplesuperstore
ORDER BY Customer_ID, Order_Date, Order_ID;

-- 95. Calculate next order sales using LEAD()--
SELECT
    Customer_ID,
    Customer_Name,
    Order_Date,
    Order_ID,
    Sales,
    LEAD(Sales) OVER (
        PARTITION BY Customer_ID
        ORDER BY Order_Date, Order_ID
    ) AS Next_Order_Sales
FROM samplesuperstore
ORDER BY Customer_ID, Order_Date, Order_ID;



--96. Calculate the difference between current and previous sales--
WITH OrderSales AS
(
    SELECT
        Customer_ID,
        Customer_Name,
        Order_Date,
        Order_ID,
        Sales,
        LAG(Sales) OVER (
            PARTITION BY Customer_ID
            ORDER BY Order_Date, Order_ID
        ) AS Previous_Sales
    FROM samplesuperstore
)
SELECT
    Customer_ID,
    Customer_Name,
    Order_Date,
    Order_ID,
    Sales,
    Previous_Sales,
    Sales - Previous_Sales AS Sales_Difference
FROM OrderSales
ORDER BY Customer_ID, Order_Date, Order_ID;

-- 97. Calculate each customer's sales compared with the average customer sales--
WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Customer_ID, Customer_Name
)
SELECT
    Customer_ID,
    Customer_Name,
    Total_Sales,
    CAST(
        AVG(Total_Sales * 1.0) OVER ()
        AS DECIMAL(12,2)
    ) AS Average_Customer_Sales,
    CAST(
        Total_Sales - AVG(Total_Sales * 1.0) OVER ()
        AS DECIMAL(12,2)
    ) AS Difference_From_Average
FROM CustomerSales
ORDER BY Total_Sales DESC;




-- 98. Find the highest-selling product in every sub-category using a window function--
WITH ProductSales AS
(
    SELECT
        Category,
        Sub_Category,
        Product_ID,
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY
        Category,
        Sub_Category,
        Product_ID,
        Product_Name
),
RankedProducts AS
(
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY Sub_Category
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ProductSales
)
SELECT
    Category,
    Sub_Category,
    Product_ID,
    Product_Name,
    Total_Sales
FROM RankedProducts
WHERE Sales_Rank = 1
ORDER BY Category, Sub_Category;



-- 99. Create a sales leaderboard--
WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Customer_ID, Customer_Name
)
SELECT
    Customer_Name,
    Total_Sales,
    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank,
    DENSE_RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Dense_Sales_Rank,
    CAST(
        Total_Sales * 100.0 /
        SUM(Total_Sales) OVER ()
        AS DECIMAL(10,2)
    ) AS Percentage_Contribution
FROM CustomerSales
ORDER BY Sales_Rank;


-- 100. Create a regional sales leaderboard--
WITH RegionalSales AS
(
    SELECT
        Region,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Region
)
SELECT
    Region,
    Total_Sales,
    RANK() OVER (
        ORDER BY Total_Sales DESC
    ) AS Sales_Rank,
    CAST(
        Total_Sales * 100.0 /
        SUM(Total_Sales) OVER ()
        AS DECIMAL(10,2)
    ) AS Percentage_Of_Company_Sales
FROM RegionalSales
ORDER BY Sales_Rank;


--Task 101 — Superstore Business Analysis--

-- 1. Which category generates the highest sales?--
SELECT TOP 1
    Category,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 2. Which category generates the highest profit?--
SELECT TOP 1
    Category,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Category
ORDER BY Total_Profit DESC;


-- 3. Which sub-category generates the highest sales?--

SELECT TOP 1
    Sub_Category,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;


--4. Which sub-category generates the lowest profit?--


SELECT TOP 1
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Sub_Category
ORDER BY Total_Profit ASC;


-- 5. Which customer generates the highest sales?--


SELECT TOP 1
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC;


-- 6. Which region generates the highest sales?--

SELECT TOP 1
    Region,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Region
ORDER BY Total_Sales DESC;


--7. Which region generates the highest profit?--

SELECT TOP 1
    Region,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Region
ORDER BY Total_Profit DESC;

--8. Which segment generates the highest sales?--
SELECT TOP 1
    Segment,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 9. Which products generate losses?--


SELECT
    Product_ID,
    Product_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Product_ID, Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;

-- 10. Which customers generate losses?--

SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Customer_ID, Customer_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- 11. What percentage of total sales comes from each category?--


SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    CAST(
        SUM(Sales) * 100.0 /
        SUM(SUM(Sales)) OVER ()
        AS DECIMAL(10,2)
    ) AS Sales_Percentage
FROM samplesuperstore
GROUP BY Category
ORDER BY Sales_Percentage DESC;

-- 12. What are the top 5 customers by sales?--
SELECT TOP 5
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC;

-- 13. What are the top 3 products in each category?--


WITH ProductSales AS
(
    SELECT
        Category,
        Product_ID,
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM samplesuperstore
    GROUP BY Category, Product_ID, Product_Name
),
RankedProducts AS
(
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Sales_Rank
    FROM ProductSales
)
SELECT
    Category,
    Product_ID,
    Product_Name,
    Total_Sales,
    Sales_Rank
FROM RankedProducts
WHERE Sales_Rank <= 3
ORDER BY Category, Sales_Rank;



-- 14. What is the yearly sales trend?--
SELECT
    YEAR(Order_Date) AS Order_Year,
    SUM(Sales) AS Total_Sales
FROM samplesuperstore
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;


-- 15. What is the yearly profit trend?--

SELECT
    YEAR(Order_Date) AS Order_Year,
    SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;
