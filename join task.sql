/*Topics Covered
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
ON condition
WHERE with JOIN
ORDER BY with JOIN
GROUP BY with JOIN
Aggregate Functions with JOIN
HAVING with JOIN
Finding Matching Records
Finding Unmatched Records*/

create table cust(
customerid int primary key,
customername varchar(50),
city varchar(50));

insert into cust(customerid,customername,city) values 
(101,'piyu','surat'),
(102,'hitu','jaipur'),
(103,'neel','udaipur'),
(104,'heli','surat'),
(105,'krisha','rajastan');


select * from cust;

create table orderss(
orderid int primary key,
customerid int,
productname varchar(50),
quantity int,
amount decimal(10,2));

insert into orderss(orderid,customerid,productname,quantity,amount)values 
(1,101,'Laptop',1,75000),
(2,108,'Mouse',2,1500),
(3,103,'Keyboard',1,2500),
(4,104,'Headphones',2,5000),
(5,109,'Printer',1,12000);

select * from orderss;

--1--
/*Write a query to display:
Customer ID
Customer Name
City
Order ID
Product Name
Amount
Use an INNER JOIN.*/
select 
cust.customerid,
cust.customername,
cust.city,
orderss.orderid,
orderss.productname,
orderss.amount 
from cust 
inner join orderss 
on cust.customerid=orderss.customerid;

--2--
/*Display all customers who have placed an order.
Show:
Customer Name
City
Product Name
Order Amount
Use INNER JOIN.*/
select 
cust.customername,
cust.city,
orderss.productname,
orderss.amount as orderamount 
from cust 
inner join orderss 
on cust.customerid=orderss.customerid;

--3--
/*Display all customers, including customers who have not placed any orders.
Show:
Customer ID
Customer Name
Order ID
Product Name
Amount
Use LEFT JOIN.*/
select 
cust.customerid,
cust.customername,
orderss.orderid,
orderss.productname,
orderss.amount 
from cust 
left join orderss 
on cust.customerid=orderss.customerid;

--4--
/*Find all customers who have not placed any order.
Display:
Customer ID
Customer Name
City
Use LEFT JOIN.*/
select 
cust.customerid,
cust.customername,
cust.city
from cust 
left join orderss 
on cust.customerid=orderss.customerid
where orderss.customerid IS NULL;

--5--
/*Display all orders, including orders whose customer does not exist in the Customers table.
Show:
Order ID
Customer ID
Customer Name
Product Name
Amount
Use RIGHT JOIN.*/
select 
orderss.orderid,
orderss.customerid,
cust.customername,
orderss.productname,
orderss.amount 
from cust 
right join orderss 
on cust.customerid=orderss.customerid;

--6--
/*Find all orders that do not have a matching customer.
Display:
Order ID
Customer ID
Product Name
Amount
Use RIGHT JOIN.*/
select 
orderss.orderid,
orderss.customerid,
orderss.productname,
orderss.amount 
from cust 
right join orderss 
on cust.customerid=orderss.customerid
where cust.customerid IS NULL;

--7--
/*Use FULL OUTER JOIN to display all customers and all orders, whether they have a match or not.
Display:
Customer ID
Customer Name
Order ID
Product Name
Amount*/
select 
cust.customerid,
cust.customername,
orderss.orderid,
orderss.productname,
orderss.amount 
from cust 
full join orderss 
on cust.customerid=orderss.customerid;

--8--
/*Find customers whose order amount is greater than 10000.
Display:
Customer Name
Order ID
Product Name
Amount
Use:
INNER JOIN
WHERE*/
select 
cust.customername,
orderss.orderid,
orderss.productname,
orderss.amount 
from cust 
inner join orderss 
on cust.customerid=orderss.customerid
where orderss.amount>10000;

--9--
/*Find all orders placed by customers from Delhi.
Display:
Customer Name
City
Order ID
Product Name
Amount
Use INNER JOIN.*/
select
cust.customername,
cust.city,
orderss.orderid,
orderss.productname,
orderss.amount 
from cust 
inner join orderss 
on cust.customerid=orderss.customerid
where cust.city='udaipur';

--10--
/*Find all customers who ordered a quantity greater than 2.
Display:
Customer Name
Product Name
Quantity
Amount
Sort the result by quantity in descending order.*/
select 
cust.customername,
orderss.productname,
orderss.quantity ,
orderss.amount 
from cust 
inner join orderss 
on cust.customerid=orderss.customerid
where orderss.quantity >2
order by orderss.quantity desc;

--11--
/*Calculate the total amount spent by every customer.
Display:
Customer ID
Customer Name
Total Amount
Customers who have not placed any orders should also appear.
Use:
LEFT JOIN
GROUP BY
SUM()*/
select 
cust.customerid,
cust.customername,
sum(orderss.amount) as totalamount
from cust 
left join orderss 
on cust.customerid=orderss.customerid
group by cust.customerid,cust.customername;

--12--
/*Find the total number of orders placed by each customer.
Display:
Customer ID
Customer Name
Total Orders
Customers with no orders should also appear.
Use:
LEFT JOIN
GROUP BY
COUNT()*/
select 
cust.customerid,
cust.customername,
COUNT(orderss.orderid) as totalorders
from cust 
left join orderss 
on cust.customerid=orderss.customerid
group by cust.customerid,cust.customername;

--13--
/*Calculate the average order amount for each customer.
Display:
Customer Name
Average Order Amount
Only display customers who have placed at least one order.
Use:
INNER JOIN
GROUP BY
AVG()*/
select 
cust.customername,
AVG(orderss.amount) as AverageOrderAmount
from cust 
inner join orderss 
on cust.customerid=orderss.customerid
group by cust.customername;

--14--
/*Find the customer who placed the order with the highest amount.
Display:
Customer Name
Order ID
Product Name
Amount*/
select top 1  with ties 
cust.customername,
orderss.orderid,
orderss.productname,
orderss.amount 
from cust 
inner join orderss 
on cust.customerid=orderss.customerid
order by orderss.amount desc; 

--15--
/*Find the customer who placed the order with the lowest amount.
Display:
Customer Name
Order ID
Product Name
Amount*/
select top 1
cust.customername,
orderss.orderid,
orderss.productname,
orderss.amount 
from cust 
inner join orderss 
on cust.customerid=orderss.customerid
order by orderss.amount asc; 

--16--
/*Create a customer-wise summary containing:
Customer ID
Customer Name
Number of Orders
Total Quantity
Total Amount
Include customers who have no orders.
Use:
LEFT JOIN
GROUP BY
COUNT()
SUM()*/
select 
cust.customerid,
cust.customername,
COUNT(orderss.orderid) AS NumberofOrders,
SUM(orderss.quantity) as totalquantity,
SUM(orderss.amount) as totalamount
from cust
left join orderss 
on cust.customerid=orderss.customerid
group by cust.customerid,cust.customername;

--17--
/*Calculate the total amount spent by each customer.
Display only customers whose total spending is greater than ₹20,000.
Use:
LEFT JOIN
GROUP BY
SUM()
HAVING*/
select 
cust.customerid,
cust.customername,
SUM(orderss.amount) AS totalspending
from cust 
left join orderss 
on cust.customerid=orderss.customerid
group by cust.customerid,cust.customername
having sum(orderss.amount)>20000;

--18--
/*Find customers who have placed more than one order.
Display:
Customer ID
Customer Name
Number of Orders
Use:
JOIN
GROUP BY
COUNT()
HAVING*/
select 
cust.customerid,
cust.customername,
COUNT(orderss.orderid) AS NumberofOrders
from cust 
join orderss 
on cust.customerid=orderss.customerid
group by cust.customerid,cust.customername
having COUNT(orderss.orderid)>1;

--19--
/*Using FULL OUTER JOIN, identify:
Customers who have orders
Customers who do not have orders
Orders whose customers do not exist
Display the appropriate customer and order information*/
select 
cust.customerid,
cust.customername,
orderss.orderid,
orderss.amount
from cust 
full outer join orderss 
on cust.customerid=orderss.customerid;

--20--
/*Create a complete order report using INNER JOIN.
The report should contain:
Customer ID
Customer Name
City
Order ID
Product Name
Quantity
Amount
Total Value
Calculate:
Total Value = Quantity × Amount*/
select
cust.customerid,
cust.customername,
cust.city,
orderss.orderid,
orderss.productname,
orderss.quantity,
orderss.amount,
(orderss.Quantity * orderss.Amount) AS  ASTotalValue
from cust 
inner join orderss 
on cust.customerid=orderss.customerid;



