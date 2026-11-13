/* Joins */
/*
Types:
Inner Join
Left Join
Right Join
Self Join
Cross Join
*/

create database flipkart;
use flipkart;

create table Customers(
	customer_id int primary key,
    customer_name varchar(30),
    city varchar(30)
);

create table Orders(
	order_id int primary key,
    customer_id int,
    product varchar(50),
    amount int,
    foreign key (customer_id) references Customers(customer_id)
);

insert into Customers values
(101,"Arun","Chennai"),
(102,"Priya","Bangalore"),
(103,"Kumar","Hyderabad"),
(104,"Divya","Coimbatore"),
(105,"Deva","Madurai");

insert into Orders values
(501,101,"Laptop",50000),
(502,101,"Mouse",1000),
(503,102,"Mobile",20000),
(504,105,"Keyboard",2000);

select * from Customers;
select * from Orders;

-- inner join
-- 1.customers who has placed order
select * from Customers c 
inner join Orders o on c.customer_id = o.customer_id;

-- 2.total amount for each customer
select c.customer_name,sum(o.amount) as Total_Amount
from customers c 
inner join orders o on c.customer_id = o.customer_id
group by c.customer_name;

-- 3.total amount and city of Customer
select c.customer_name,sum(o.amount) as Total_Amount, c.city as City
from customers c
inner join orders o on c.customer_id = o.customer_id
group by c.customer_name,c.city;

-- left join
-- 4.name,product,amount
select c.customer_name,o.product,o.amount
from customers c 
left join orders o on c.customer_id = o.customer_id;


-- 5.find the customer who doesn't place the order
select customer_name,o.product,o.amount
from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_id is null;

-- right join
-- 6.name,product,amount
select c.customer_name,o.product,o.amount
from customers c 
right join orders o on c.customer_id = o.customer_id;

-- 7. customer_details without order
select c.customer_name,o.product,o.amount
from customers c 
right join orders o on c.customer_id = o.customer_id
where order_id is null;

-- cross join
-- 8.customer name and product
select c.customer_name,o.product
from customers c
cross join orders o;

-- 9.customers who purchased more than 10000
select c.customer_name,o.product,o.amount
from customers c
cross join orders o
where o.amount > 10000;

-- self join
select c1.customer_name as group_1,
c2.customer_name as group_2
from customers c1 
join customers c2
on c1.customer_id < c2.customer_id; -- < => not to repeat

/* Most used:
		=> left join
		=> inner join
		=> self join
		=> cross join
*/