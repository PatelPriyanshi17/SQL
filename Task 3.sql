create database sales_transactionsdb;
use sales_transactionsdb;

create table sales_transactions(
transaction_id int primary key,
customer_name varchar(50),
product_name varchar(50),
category varchar(50),
quantity int,
unit_price int,
discount_percent int,
city varchar(50),
payment_mode varchar(30),
salesperson varchar(50),
customer_type varchar(30));

insert into sales_transactions(transaction_id,customer_name,product_name,category,quantity,unit_price,discount_percent,city,payment_mode,salesperson,customer_type) values 
(1001,'Aarav Mehta','Laptop Pro 15','Electronics',2,75000,10,'Ahmedabad','Online','Rahul','Premium'),
(1002,'Priya Shah','Office Chair','Furniture',5,12000,8,'Mumbai','Card','Neha','Regular'),
(1003,'Rohan Patel','Smartphone X','Electronics',3,45000,12,'Ahmedabad','UPI','Amit','Premium'),
(1004,'Sneha Verma','Refrigerator','Appliances',1,68000,15,'Delhi','Card','Priya','VIP'),
(1005,'Karan Joshi','Dining Table','Furniture',4,18000,5,'Pune','Cash','Rahul','Regular'),
(1006,'Ananya Rao','Laptop Air 14','Electronics',1,62000,7,'Bangalore','Online','Neha','Premium'),
(1007,'Vikram Singh','Washing Machine','Appliances',2,42000,18,'Jaipur','UPI','Amit','Regular'),
(1008,'Meera Kapoor','Smartphone Pro','Electronics',4,55000,20,'Mumbai','Card','Priya','VIP'),
(1009,'Aditya Shah','Sofa Set','Furniture',3,35000,10,'Ahmedabad','Online','Rahul','Premium'),
(1010,'Ishita Patel','Air Conditioner','Appliances',2,58000,12,'Surat','UPI','Neha','Premium'),
(1011,'Raj Malhotra','Gaming Laptop','Electronics',2,95000,15,'Delhi','Card','Amit','VIP'),
(1012,'Kavya Desai','Bookshelf','Furniture',6,9000,5,'Pune','Cash','Priya','Regular'),
(1013,'Arjun Mehta','Smart TV 55','Electronics',2,72000,18,'Bangalore','Online','Rahul','Premium'),
(1014,'Nisha Sharma','Microwave Oven','Appliances',3,22000,8,'Ahmedabad','UPI','Neha','Regular'),
(1015,'Yash Patel','Refrigerator Pro','Appliances',1,82000,20,'Mumbai','Card','Amit','VIP'),
(1016,'Simran Kaur','Office Desk','Furniture',5,16000,12,'Delhi','Online','Priya','Regular'),
(1017,'Dev Kumar','Smartphone Ultra','Electronics',3,68000,10,'Jaipur','UPI','Rahul','Premium'),
(1018,'Riya Shah','Washing Machine Pro','Appliances',4,48000,22,'Surat','Card','Neha','Premium'),
(1019,'Manav Joshi','Premium Sofa','Furniture',2,65000,15,'Ahmedabad','Online','Amit','VIP'),
(1020,'Pooja Mehta','Tablet Pro','Electronics',5,32000,8,'Pune','UPI','Priya','Regular'),
(1021,'Harsh Verma','Laptop Ultra','Electronics',3,88000,25,'Mumbai','Card','Rahul','VIP'),
(1022,'Neel Shah','Air Conditioner Pro','Appliances',2,76000,10,'Delhi','Online','Neha','Premium'),
(1023,'Tanvi Rao','Dining Set','Furniture',4,28000,18,'Bangalore','Cash','Amit','Regular'),
(1024,'Siddharth Patel','Smart TV Pro','Electronics',6,60000,12,'Surat','UPI','Priya','Premium'),
(1025,'Aisha Khan','Double Door Refrigerator','Appliances',2,92000,20,'Ahmedabad','Card','Rahul','VIP'),
(1026,'Mohit Singh','Executive Chair','Furniture',7,14000,10,'Jaipur','Online','Neha','Regular'),
(1027,'Diya Mehta','Gaming Monitor','Electronics',3,52000,15,'Delhi','UPI','Amit','Premium'),
(1028,'Varun Shah','Washing Machine','Appliances',5,38000,28,'Mumbai','Cash','Priya','Regular'),
(1029,'Isha Patel','Luxury Sofa','Furniture',3,78000,12,'Pune','Card','Rahul','VIP'),
(1030,'Dhruv Sharma','Business Laptop','Electronics',2,110000,18,'Bangalore','Online','Neha','VIP');

select * from sales_transactions;

--1--
/*Display all transactions.
Arrange the records by unit_price from highest to lowest and, for transactions having the same unit price, arrange them by quantity from highest to lowest.*/
select * from sales_transactions 
order by unit_price desc,
quantity desc;

--2--
/*Identify transactions where the unit price is greater than 50000 and the quantity purchased is greater than 1.
Display:
Customer Name
Product Name
Category
Quantity
Unit Price
City*/
select customer_name,
product_name,
category,
Quantity,
Unit_Price,
City 
from sales_transactions 
where unit_price>50000 
and Quantity >1; 

--3--
/*Identify transactions made by Premium customers where the unit price is greater than 25000.
Display the complete transaction information.
Arrange the result from highest unit price to lowest unit price.*/
select * from sales_transactions 
where customer_type='Premium'
and unit_price>25000 
order by unit_price desc;

--4--
/*Identify transactions where the discount percentage is greater than 15 and the quantity purchased is at least 3.
Display all transaction details.
Arrange the result by discount percentage from highest to lowest.*/
select * from sales_transactions 
where discount_percent>15 
and quantity=3 
order by discount_percent desc;

--5--
/*Identify transactions from:
Ahmedabad
Mumbai
Delhi
where the unit price is greater than 20000.
Display:
Customer Name
Product Name
Category
Quantity
Unit Price
City
Arrange the results first by city and then by unit price from highest to lowest.*/
select customer_name,
product_name,
category,
quantity,
unit_price,
city 
from sales_transactions 
where city in ('Ahmedabad','Mumbai','Delhi')
and unit_price>20000 
order by city asc,unit_price desc;
 
 --6--
 /*Identify transactions where the payment mode is either Online or Card, the quantity is greater than 2, and the unit price is above 15000.
Display:
Customer Name
Product Name
Quantity
Unit Price
Payment Mode
Arrange the result by quantity from highest to lowest.*/
select customer_name,
product_name,
quantity,
unit_price,
payment_mode 
from sales_transactions 
where payment_mode in ('Online','Card')
and quantity>2 
and unit_price>15000 
order by quantity desc;

--7--
/*Identify transactions belonging to either:
Electronics
Furniture
Appliances
where the discount percentage is less than 10.
Display the complete transaction information.
Arrange the result by discount percentage from lowest to highest*/
select * from sales_transactions 
where category in ('Electronics','Furniture','Appliances')
And discount_percent<10 
order by discount_percent asc;

--8--
/*Identify transactions made by customers who are either Premium or Regular, where the unit price is greater than 30000 and the quantity is greater than 1.
Display:
Customer Name
Customer Type
Product Name
Quantity
Unit Price
Arrange the result by unit price from highest to lowest.*/
select customer_name,
customer_type,
product_name,
quantity,
unit_price 
from  sales_transactions 
where customer_type in('Premium','Regular')
and unit_price>30000 
and quantity >1 
order by unit_price desc;

--9--
/*Identify transactions handled by salespersons other than a selected salesperson, where the quantity is greater than 4 and the discount percentage is less than 20.
Display all transaction details.
Arrange the result by quantity from highest to lowest.*/
select *from sales_transactions 
where salesperson!='Neha'
and quantity>4 
and discount_percent<20 
order by quantity desc;

--10--
/*Identify transactions satisfying either of the following business conditions:
Quantity is greater than 5 and unit price is greater than 10000
Quantity is between 2 and 5 and unit price is greater than 50000
Display:
Transaction ID
Customer Name
Product Name
Quantity
Unit Price
Category
Arrange the result by unit price from highest to lowest.*/
select 
transaction_id,
customer_name,
product_name,
quantity,
unit_price,
category 
from sales_transactions 
where 
(quantity>5 and unit_price>10000)
or 
(quantity between 2 and 5 and unit_price>50000)
order by unit_price desc;

--11--
/*Identify transactions from cities other than Ahmedabad where:
Quantity is greater than 2
Unit price is greater than 20000
Payment mode is not Cash
Display the complete transaction information.
Arrange the result by unit price from highest to lowest.*/
select * from sales_transactions
where city !='Ahmedabad'
and quantity>2 
and unit_price>20000 
and payment_mode!='Cash' 
order by unit_price desc;

--12--
/*Identify Electronics transactions where:
Unit price is greater than 40000
Quantity is greater than 1
Discount percentage is less than 15
Display:
Customer Name
Product Name
Quantity
Unit Price
Discount Percentage
Customer Type
Arrange the result by unit price from highest to lowest.*/
select customer_name,
product_name,
quantity,
unit_price,
discount_percent,
customer_type 
from sales_transactions 
where category='Electronics' 
and unit_price>40000 
and quantity>1 
and discount_percent<15 
order by unit_price desc;

--13--
/*Identify Furniture transactions where the quantity is greater than 3 or the unit price is greater than 25000.
Display:
Customer Name
Product Name
Quantity
Unit Price
Discount Percentage
City
Arrange the result by quantity from highest to lowest.*/
select customer_name,
product_name,
quantity,
unit_price,
discount_percent,
city 
from sales_transactions 
where category='Furniture' 
and quantity>3 
or unit_price>25000  
order by quantity desc;

--14--
/*Identify transactions where:
Customer type is Premium
Payment mode is not Cash
Quantity is greater than 1
Unit price is greater than 20000
Display the complete transaction information.
Arrange the result from highest unit price to lowest.*/
select * from sales_transactions 
where customer_type='Premium' 
and payment_mode !='Cash' 
and quantity>1 
and unit_price>20000 
order by unit_price desc;

--15--
/*Identify transactions where the unit price is greater than 50000 and the discount percentage is greater than 10.
Exclude transactions where the payment mode is Cash.
Display:
Customer Name
Product Name
Category
Unit Price
Discount Percentage
Payment Mode
Arrange the result by discount percentage from highest to lowest.*/
select  customer_name,
product_name,
category,
unit_price,
discount_percent,
payment_mode 
from sales_transactions
where unit_price>50000 
and discount_percent>10 
and payment_mode!='Cash' 
order by discount_percent desc;

--16--
/*Identify transactions satisfying any of the following:
Electronics transactions with quantity greater than 2 and discount below 15
Furniture transactions with quantity greater than 3 and unit price above 20000
Appliance transactions with unit price above 40000
Display all transaction information.
Arrange the final result by unit price from highest to lowest.*/
select * from sales_transactions 
where (category='Electronics' 
and quantity>2 
and discount_percent<15)
or 
(category='Furniture' 
and quantity>3 
and unit_price>20000 )
or 
(category='Appliances' 
and unit_price>40000 )
order by unit_price desc;

--17--
/*Identify transactions where the customer is either Premium or VIP, the transaction is not from Ahmedabad, and either:
Quantity is greater than 3
Unit price is greater than 60000
Display:
Customer Name
Customer Type
Product Name
Quantity
Unit Price
City
Payment Mode
Arrange the results by unit price from highest to lowest.*/
select customer_name,
customer_type,
product_name,
quantity,
unit_price,
city,
payment_mode 
from sales_transactions 
where customer_type in ('Premium','VIP') 
and city !='Ahmedabad' 
and (quantity>3 or  unit_price>60000) 
order by unit_price desc;

--18--
/*Identify transactions where:
Discount percentage is greater than 20
Quantity is greater than 2
Unit price is less than 50000
Exclude:
Cash transactions
Transactions from Mumbai
Display the complete transaction information.
Arrange the result by discount percentage from highest to lowest.*/
select * from sales_transactions 
where 
discount_percent>20 
and quantity>2 
and unit_price<50000 
and payment_mode!='cash' 
and city!='Mumbai' 
order by discount_percent desc;

--19--
/*Management wants to review transactions that satisfy at least one of the following conditions:
Premium customer purchasing an Electronics product above 40000
VIP customer purchasing any product above 50000
Regular customer purchasing more than 5 units with a unit price above 10000
Transactions paid by Cash should not be included.
Display:
Transaction ID
Customer Name
Product Name
Category
Quantity
Unit Price
Discount Percentage
Customer Type
Payment Mode
City
Salesperson
Arrange the final report by unit price from highest to lowest.*/
select  
transaction_id,
customer_name,
product_name,
category,
quantity,
unit_price,
discount_percent,
customer_type,
payment_mode,
city,
salesperson 
from sales_transactions  
where 
(customer_type='Premium' 
and category='Electronics' 
and unit_price>40000) 
or 
(customer_type='VIP' 
and unit_price>50000) 
or 
(customer_type='Regular' 
and quantity>5 
and unit_price>10000)
and payment_mode!='Cash'
order by unit_price desc;

--20--
/*The management team wants to identify high-priority sales transactions for detailed business review.
A transaction qualifies when it satisfies the business rules below.
Customer & Product Conditions
Premium customers purchasing Electronics with unit price above 35000
VIP customers purchasing Furniture with quantity greater than 2
Regular customers purchasing any product with unit price above 75000
Additional Conditions
Transactions with discount greater than 25% must not be included.
Cash transactions must not be included.
Transactions from Ahmedabad must not be included.
Display:
Transaction ID
Customer Name
Product Name
Category
Quantity
Unit Price
Discount Percentage
City
Payment Mode
Salesperson
Customer Type
Arrange the final result by:
Highest unit price
Highest quantity
Highest discount percentage*/
select 
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
from sales_transactions 
where(
(customer_type='Premium' 
and category='Electronics' 
and unit_price>35000) 
or 
(customer_type='VIP' 
and category='Furniture'
and quantity>2 )
or 
(customer_type='Regular' 
and unit_price>75000)) 
and discount_percent<=25 
and payment_mode!='cash' 
and city!='Ahmedabad' 
order by unit_price desc,
quantity desc,
discount_percent desc;



       