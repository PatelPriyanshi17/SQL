CREATE TABLE cust1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO cust1 (customer_id, customer_name, city)
VALUES
(101, 'Aarav Shah', 'Ahmedabad'),
(102, 'Riya Patel', 'Mumbai'),
(103, 'Rahul Mehta', 'Delhi'),
(104, 'Priya Sharma', 'Ahmedabad'),
(105, 'Karan Desai', 'Pune'),
(106, 'Neha Joshi', 'Mumbai'),
(107, 'Arjun Patel', 'Bangalore'),
(108, 'Sneha Shah', 'Delhi'),
(109, 'Vivek Mehta', 'Ahmedabad'),
(110, 'Anjali Desai', 'Surat'),
(111, 'Rohan Shah', 'Pune'),
(112, 'Meera Patel', 'Mumbai'),
(113, 'Dhruv Shah', 'Ahmedabad'),
(114, 'Kavya Mehta', 'Delhi'),
(115, 'Yash Desai', 'Bangalore'),
(116, 'Ishita Patel', 'Surat'),
(117, 'Manav Shah', 'Pune'),
(118, 'Pooja Joshi', 'Mumbai'),
(119, 'Nikhil Mehta', 'Ahmedabad'),
(120, 'Tanya Shah', 'Delhi');

select * from cust1;

CREATE TABLE  orders3(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    amount DECIMAL(10,2)
);

INSERT INTO orders3
(order_id, customer_id, product_name, quantity, amount)
VALUES
(1001, 101, 'Laptop', 2, 55000),
(1002, 101, 'Mouse', 5, 800),
(1003, 101, 'Keyboard', 3, 1500),
(1004, 102, 'Laptop', 1, 62000),
(1005, 102, 'Monitor', 2, 18000),
(1006, 103, 'Mobile Phone', 2, 35000),
(1007, 103, 'Headphones', 4, 4500),
(1008, 104, 'Laptop', 1, 58000),
(1009, 104, 'Printer', 2, 12500),
(1010, 104, 'Keyboard', 5, 1400),
(1011, 105, 'Office Chair', 4, 8500),
(1012, 105, 'Monitor', 3, 17000),
(1013, 106, 'Mobile Phone', 3, 32000),
(1014, 106, 'Headphones', 5, 4200),
(1015, 107, 'Laptop', 2, 60000),
(1016, 107, 'Mouse', 10, 750),
(1017, 108, 'Monitor', 4, 16000),
(1018, 108, 'Keyboard', 6, 1300),
(1019, 109, 'Laptop', 2, 57000),
(1020, 109, 'Printer', 3, 13500),
(1021, 109, 'Mouse', 8, 700),
(1022, 110, 'Mobile Phone', 2, 36000),
(1023, 110, 'Headphones', 3, 4800),
(1024, 111, 'Laptop', 1, 65000),
(1025, 111, 'Monitor', 2, 19000),
(1026, 112, 'Printer', 4, 12000),
(1027, 112, 'Keyboard', 7, 1200),
(1028, 113, 'Laptop', 3, 54000),
(1029, 113, 'Mouse', 6, 850),
(1030, 113, 'Headphones', 4, 5000),
(1031, 114, 'Mobile Phone', 2, 34000),
(1032, 114, 'Monitor', 3, 17500),
(1033, 115, 'Laptop', 2, 59000),
(1034, 115, 'Printer', 2, 14000),
(1035, 116, 'Office Chair', 5, 9000),
(1036, 117, 'Laptop', 1, 61000),
(1037, 117, 'Keyboard', 8, 1250),
(1038, 118, 'Mobile Phone', 3, 33000),
(1039, 118, 'Headphones', 6, 4300),
(1040, 119, 'Laptop', 2, 56000),
(1041, 119, 'Monitor', 2, 18500),
(1042, 119, 'Printer', 1, 15000),
(1043, 121, 'Laptop', 1, 60000),
(1044, 122, 'Monitor', 2, 17000);

select * from orders3;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Products
(product_id, product_name, category, price)
VALUES
(201, 'Laptop', 'Electronics', 60000),
(202, 'Mobile Phone', 'Electronics', 35000),
(203, 'Monitor', 'Electronics', 18000),
(204, 'Printer', 'Electronics', 14000),
(205, 'Keyboard', 'Accessories', 1500),
(206, 'Mouse', 'Accessories', 800),
(207, 'Headphones', 'Accessories', 4500),
(208, 'Office Chair', 'Furniture', 9000),
(209, 'Webcam', 'Accessories', 3500),
(210, 'Tablet', 'Electronics', 28000),
(211, 'Desk', 'Furniture', 15000),
(212, 'USB Hub', 'Accessories', 1200);

select * from Products;
--1--
/*The Finance team wants to identify customers contributing significantly to company revenue.
Prepare a customer revenue report containing:
Customer ID
Customer Name
City
Total Number of Orders
Total Quantity Purchased
Total Purchase Value
Average Order Value
Only customers with at least 3 orders and total purchase value above ₹75,000 should be included.
Sort the report by total purchase value from highest to lowest*/

select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS TotalNumberofOrders,
SUM(orders3. quantity) AS TotalQuantityPurchased,
SUM(orders3.amount)  AS  TotalPurchaseValue,
AVG(orders3.amount) AS AverageOrderValue
from cust1 
inner join orders3 
on cust1.customer_id = orders3.customer_id 
group by cust1.customer_id,
         cust1.customer_name,
         cust1.city 
having 
COUNT(orders3.order_id)>=3 
and SUM(orders3.amount) > 75000
order by TotalPurchaseValue desc;

--2-- 
/*The Business Intelligence team wants to compare sales performance across customer locations.
Generate a city-level sales report containing:
City
Number of Customers
Number of Orders
Total Quantity Sold
Total Sales Value
Average Order Value
Only cities generating more than ₹1,00,000 in sales should appear.
Sort the report by sales value descending.*/
select 
cust1.city,
COUNT(cust1.customer_id) AS NumberofCustomers,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.quantity) AS TotalQuantitySold,
SUM(orders3.amount) AS TotalSalesValue,
AVG(orders3.amount) AS sAverageOrderValue
from cust1 
inner join orders3
on cust1.customer_id = orders3.customer_id 
group by cust1.city
having SUM(orders3.amount)>100000
order by TotalSalesValue desc;

--3--
/* The Customer Success team wants to identify customers responsible for high-value transactions.
Find customers who have:
At least one order with a transaction value above ₹25,000
Total purchase value above ₹50,000
Display:
Customer ID
Customer Name
City
Number of Orders
Total Purchase Value
Highest Transaction Value*/

select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.amount)  AS  TotalPurchaseValue,
MAX(orders3.amount) AS HighestTransactionValue
from cust1 
inner join orders3 
on cust1.customer_id = orders3.customer_id 
group by cust1.customer_id,
        cust1.customer_name,
        cust1.city 
having MAX(orders3.amount)>25000
and SUM(orders3.amount) >50000;

--4--
/*Management wants to identify customers with frequent purchasing activity.
Generate a report showing customers who have placed more than 4 orders.
Display:
Customer ID
Customer Name
City
Number of Orders
Total Quantity Purchased
Total Purchase Value
Average Order Value
Sort by order count and then total purchase value.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.quantity) AS TotalQuantityPurchased,
SUM(orders3.amount)  AS  TotalPurchaseValue,
AVG(orders3.amount) AS AverageOrderValue
from cust1 
inner join orders3 
on cust1.customer_id = orders3.customer_id 
group by cust1.customer_id,
        cust1.customer_name,
        cust1.city 
having COUNT(orders3.order_id)>4 
order by 
    NumberofOrders desc,
    TotalPurchaseValue desc;

--5--
/*The Product Analytics team wants to understand which products are generating the largest commercial contribution.
Generate a product performance report containing:
Product Name
Number of Orders
Total Quantity Sold
Total Revenue
Average Order Amount
Highest Order Amount
Only products with at least 3 orders should be included.
Sort by total revenue descending.*/
select 
orders3.product_name,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.quantity) AS TotalQuantitySold,
SUM(orders3.amount) AS TotalRevenue,
AVG(orders3.amount) AS AverageOrderAmount,
MAX(orders3.amount) AS HighestOrderAmount
from orders3 
group by orders3.product_name
having COUNT(orders3.order_id)>=3 
order by TotalRevenue desc;

--6--
/*The Operations team wants to identify products with consistently high sales volume.
Identify products where:
Total quantity sold is greater than 100
Number of orders is greater than 5
Display:
Product Name
Total Quantity Sold
Number of Orders
Total Revenue*/
select 
orders3.product_name,
SUM(orders3.quantity) AS TotalQuantitySold,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.amount) AS TotalRevenue
from orders3
group by orders3.product_name
having 
    SUM(orders3.quantity)>100
    AND COUNT(orders3.order_id)>5;

--7--
/*Senior management wants to identify the strongest revenue-generating markets.

For every city, calculate:
Total Customers
Total Orders
Total Quantity Sold
Total Revenue
Display only cities with:
At least 3 customers
At least 5 orders
Revenue above ₹2,00,000*/
select 
cust1.city,
COUNT(cust1.customer_id) AS TotalCustomers,
COUNT(orders3.order_id) AS TotalOrders,
SUM(orders3.quantity) AS TotalQuantitySold,
SUM(orders3.amount) AS TotalRevenue
from cust1 
INNER JOIN orders3
    ON cust1.customer_id = orders3.customer_id
group by cust1.city
having 
    COUNT(cust1.customer_id)>=3
    and COUNT(orders3.order_id) >= 5
    AND SUM(orders3.amount) > 200000;

--8--
/*The Finance team wants to analyze the order-value behavior of customers.
Generate a report containing:
Customer ID
Customer Name
City
Number of Orders
Minimum Order Value
Maximum Order Value
Average Order Value
Total Purchase Value
Only customers with at least 3 orders should be included.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS NumberofOrders,
MIN(orders3.amount) AS MinimumOrderAmount,
MAX(orders3.amount) AS MaximumOrderAmount,
AVG(orders3.amount) AS AverageOrderValue,
SUM(orders3.amount) AS TotalPurchaseValue
from cust1
inner join orders3 
on cust1.customer_id = orders3.customer_id
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
having COUNT(orders3.order_id) >=3;

--9--
/*The CRM team wants to identify customers who are actively purchasing from the company.
Generate a report for customers who have placed at least 5 orders.
Display:
Customer ID
Customer Name
City
Number of Orders
Total Quantity Purchased
Total Purchase Value
Sort customers by number of orders descending.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.quantity) AS TotalQuantityPurchased,
SUM(orders3.amount) AS TotalPurchaseValue
from cust1
inner join orders3 
on cust1.customer_id = orders3.customer_id
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
having COUNT(cust1.customer_id) >=5
order by NumberofOrders desc;

--10--
/*The business team wants to identify customers with limited purchasing activity.
Find customers who have placed 1 or 2 orders only.
Display:
Customer ID
Customer Name
City
Number of Orders
Total Purchase Value
Sort by total purchase value descending.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.amount) AS TotalPurchaseValue
from cust1
inner join orders3 
on cust1.customer_id = orders3.customer_id
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
having COUNT(orders3.order_id) in (1,2)
order by TotalPurchaseValue DESC;

--left join--
--11--
/*The CRM department wants a complete customer coverage report.
Include every customer, regardless of whether they have placed an order.
Display:
Customer ID
Customer Name
City
Number of Orders
Total Quantity Purchased
Total Purchase Value
Customers with no purchases must still be represented in the report.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.quantity) AS TotalQuantityPurchased,
SUM(orders3.amount) AS TotalPurchaseValue
from cust1
left join orders3 
on cust1.customer_id = orders3.customer_id
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
order by cust1.customer_id ;

--12--
/*The Marketing team wants a list of registered customers who have never generated an order.
Prepare a report containing:
Customer ID
Customer Name
City
The result should represent only customers with zero purchasing activity.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city
from cust1
left join orders3 
on cust1.customer_id = orders3.customer_id
where orders3.order_id IS NULL;

--13--
/*The Finance team wants to compare the complete customer base with purchasing activity.
Generate a report containing every customer and their:
Customer ID
Customer Name
City
Number of Orders
Total Purchase Value
The report must preserve customers who have no order history.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
COUNT(orders3.order_id) AS NumberofOrders,
SUM(orders3.amount) AS TotalPurchaseValue
from cust1
left join orders3 
on cust1.customer_id = orders3.customer_id
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
order by cust1.customer_id ;

--14--
/*The Product team wants to identify products that are present in the company's product catalog but have no sales activity.
Generate a report containing:
Product ID
Product Name
Category
Price
Only products with zero order activity should be returned.*/
select 
Products.product_id,
Products.product_name,
Products.category,
Products.price
from Products 
left join orders3 
on Products.product_name = orders3.product_name
where orders3.product_name IS NULL;

--RIGHT JOIN / FULL JOIN--
--15--
/*The Data Quality team wants to identify inconsistencies between customer master data and order transaction data.
Prepare a reconciliation report containing:
Customer ID
Customer Name
City
Order ID
Product Name
Quantity
Amount
The report must preserve records from both datasets, including unmatched records.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
orders3.order_id,
orders3.product_name,
orders3.quantity,
orders3.amount
from cust1 
full outer join orders3
    on cust1.customer_id=orders3.customer_id;

--16--
/*The company is performing a data-quality audit between customer and order records.
Identify all records where customer information and order information do not have a matching relationship.
Display:
Customer ID
Customer Name
Order ID
Product Name
Amount*/
select 
cust1.customer_id,
cust1.customer_name,
orders3.order_id,
orders3.product_name,
orders3.amount 
from cust1
full outer join orders3
        on cust1.customer_id=orders3.customer_id
where cust1.customer_id IS NULL
   or orders3.customer_id IS NULL;

--17--
/*Generate a complete reconciliation dataset containing:
Customer ID
Customer Name
City
Order ID
Product Name
Quantity
Amount
Transaction Value
All records from both customer and order datasets must be retained.*/
select 
cust1.customer_id,
cust1.customer_name,
cust1.city,
orders3.order_id,
orders3.quantity,
orders3.amount,
(orders3.amount)*(orders3.quantity) AS TransactionValue
from cust1
full outer join orders3
    on cust1.customer_id = orders3.customer_id;

--ANTI JOIN — Business Problems--
--18--
/*The Marketing department wants to identify customers who have registered with the company but have generated no transactions.
Display:
Customer ID
Customer Name
City*/
select 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
from cust1
left join orders3
    on cust1.customer_id = orders3.customer_id
where orders3.order_id IS NULL;

--19--
/*The Product Management team wants to identify products that are currently available in the catalog but have never been purchased.
Display:
Product ID
Product Name
Category
Price*/
select
    Products.product_id,
    Products.product_name,
    Products.category,
    Products.price
from Products
left join orders3
   on Products.product_name = orders3.product_name
where orders3.product_name IS NULL;

--20--
/*The Growth team wants to identify customers who have not converted into paying customers.
Return all customers with no corresponding order records.
Display:
Customer ID
Customer Name
City*/
select 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
from cust1
left join orders3
    on cust1.customer_id = orders3.customer_id
where orders3.order_id IS NULL;

--21--
/*The Inventory team wants to identify products that have never appeared in a transaction.
Display:
Product ID
Product Name
Category
Price
Sort by price from highest to lowest.*/
select 
    Products.product_id,
    Products.product_name,
    Products.category,
    Products.price
    from Products
    left join orders3
    on Products.product_name = orders3.product_name
    where orders3.product_name IS NULL 
    order by Products.price desc;

--Cross Join — Enterprise Scenario--
--22-
/*The Marketing Analytics team is preparing a personalized campaign.
Create a dataset representing every possible customer-product combination.
Display:
Customer ID
Customer Name
City
Product ID
Product Name
Category*/
select
    cust1.customer_id,
    cust1.customer_name,
    cust1.city,
    Products.product_id,
    Products.product_name,
    Products.category
from cust1
cross join Products;

--23--
/*The Marketing department wants to know the theoretical size of a campaign where every customer could receive an offer for every product.
Calculate the total number of possible:
Customer × Product combinations
Return the result as a single value*/
select COUNT(*) AS TotalCombinations
from cust1 
cross join Products;

--24--
/*Create every possible combination of:
Customer City
Product Name
Display the complete opportunity matrix.
The result should contain every possible city-product combination, regardless of whether a customer from that city has purchased the product.*/
select 
cust1.city,
Products.product_name 
from cust1 
cross join Products
order by cust1.city,Products.product_name;


--High-Level Business Analysis--
--25--
/*Management wants a customer performance dataset for the monthly business review.
Generate:
Customer ID
Customer Name
City
Number of Orders
Total Quantity Purchased
Total Revenue
Average Order Value
Maximum Order Value
Only customers with at least 3 orders should be included.
Sort the output by:
Total Revenue
Number of Orders
Average Order Value
All in descending order*/
select
    cust1.customer_id,
    cust1.customer_name,
    cust1.city,
    COUNT(orders3.order_id) AS NumberOfOrders,
    SUM(orders3.quantity) AS TotalQuantityPurchased,
    SUM(orders3.amount) AS TotalRevenue,
    AVG(orders3.amount) AS AverageOrderValue,
    MAX(orders3.amount) AS MaximumOrderValue
from cust1
inner join orders3
    on cust1.customer_id = orders3.customer_id
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
having COUNT(orders3.order_id) >= 3
order by
    TotalRevenue desc,
    NumberOfOrders desc,
    AverageOrderValue desc;

--26--
/*The Product Management team is conducting a quarterly product review.
Generate:
Product Name
Number of Orders
Total Quantity Sold
Total Revenue
Average Order Value
Maximum Order Value
Only products with at least 5 orders and total revenue above ₹2,00,000 should be included.*/
select
    orders3.product_name,
    COUNT(orders3.order_id) AS NumberOfOrders,
    SUM(orders3.quantity) AS TotalQuantitySold,
    SUM(orders3.amount) AS TotalRevenue,
    AVG(orders3.amount) AS AverageOrderValue,
    MAX(orders3.amount) AS MaximumOrderValue
from orders3
group by 
    orders3.product_name
having 
    COUNT(orders3.order_id) >= 5
    AND SUM(orders3.amount) > 200000;

--27--
/*The Sales Strategy team wants to identify markets with strong customer engagement and revenue generation.
Generate a city-level report containing:
City
Number of Customers
Number of Orders
Total Quantity Sold
Total Revenue
Average Order Value
Only cities satisfying all of the following should appear:
At least 5 customers
More than 10 orders
Revenue greater than ₹5,00,000*/
select
    cust1.city,
    COUNT(DISTINCT cust1.customer_id) AS NumberOfCustomers,
    COUNT(orders3.order_id) AS NumberOfOrders,
    SUM(orders3.quantity) AS TotalQuantitySold,
    SUM(orders3.amount) AS TotalRevenue,
    AVG(orders3.amount) AS AverageOrderValue
from cust1
inner join orders3
    on cust1.customer_id = orders3.customer_id
group by 
    cust1.city
having
    COUNT(cust1.customer_id) >= 5
    AND COUNT(orders3.order_id) > 10
    AND SUM(orders3.amount) > 500000;

--28--
/*The Finance team wants to investigate customers responsible for high-value business.
Identify customers whose transaction history contains at least 2 orders with transaction value greater than ₹25,000.
Display:
Customer ID
Customer Name
City
Number of qualifying orders
Total value of qualifying orders*/
select
    cust1.customer_id,
    cust1.customer_name,
    cust1.city,
    COUNT(orders3.order_id) AS NumberOfQualifyingOrders,
    SUM(orders3.amount * orders3.quantity) AS TotalQualifyingValue
from cust1
inner join orders3
    on cust1.customer_id = orders3.customer_id
where orders3.amount * orders3.quantity > 25000
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
having COUNT(orders3.order_id) >= 2
order by  TotalQualifyingValue desc;

--29--
/*The Supply Chain team wants to identify products with strong customer demand.
Find products where:
Total quantity sold is greater than 100
At least 5 separate orders exist
Total revenue exceeds ₹1,00,000
Display:
Product Name
Number of Orders
Total Quantity Sold
Total Revenue
Average Order Value*/
select
    orders3.product_name,
    COUNT(orders3.order_id) AS NumberOfOrders,
    SUM(orders3.quantity) AS TotalQuantitySold,
    SUM(orders3.amount) AS TotalRevenue,
    AVG(orders3.amount) AS AverageOrderValue
from orders3
group by
    orders3.product_name
having
    SUM(orders3.quantity) > 100
    AND COUNT(orders3.order_id) >= 5
    AND SUM(orders3.amount) > 100000;

--30--
/*The executive team wants a high-level customer sales report for a management dashboard.
Generate a customer-level dataset containing:
Customer ID
Customer Name
City
Number of Orders
Total Quantity Purchased
Total Purchase Value
Average Order Value
Minimum Order Value
Maximum Order Value
Only customers meeting both conditions should be included:
At least 3 orders
Total purchase value greater than ₹1,00,000
Sort the final report by Total Purchase Value descending.*/
select
    cust1.customer_id,
    cust1.customer_name,
    cust1.city,
    COUNT(orders3.order_id) AS NumberOfOrders,
    SUM(orders3.quantity) AS TotalQuantityPurchased,
    SUM(orders3.amount) AS TotalPurchaseValue,
    AVG(orders3.amount) AS AverageOrderValue,
    MIN(orders3.amount) AS MinimumOrderValue,
    MAX(orders3.amount) AS MaximumOrderValue
from cust1
inner join orders3
    on cust1.customer_id = orders3.customer_id
group by 
    cust1.customer_id,
    cust1.customer_name,
    cust1.city
having
    COUNT(orders3.order_id) >= 3
    AND SUM(orders3.amount) > 100000
order by 
    TotalPurchaseValue DESC;