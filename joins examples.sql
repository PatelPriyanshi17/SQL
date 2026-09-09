/*joins*/
create table customers2(
id int primary key,
name varchar(50),
age int,
address varchar(50));

insert into customers2(id,name,age,address) values 
(1,'rohan',21,'India'),
(2,'riya',22,'USA'),
(3,'het',23,'India'),
(4,'hiren',24,'UK');

select * from customers2;

create table orders(
oid int ,
id int primary key,
item varchar(50),
amount varchar(50));

insert into orders (oid,id,item,amount) values 
(01,1,'pizza',260),
(02,2,'dosa',160),
(03,5,'wrop',150),
(04,7,'burger',270);

select * from orders;


--inner join--
select * from 
customers2 inner join orders
on customers2.id=orders.id;

--right--
select * from 
customers2 right join orders 
on customers2.id=orders.id;

--left--
select * from 
customers2 left join orders 
on customers2.id=orders.id;

--full join--
select * from 
customers2 full join orders 
on customers2.id=orders.id;



