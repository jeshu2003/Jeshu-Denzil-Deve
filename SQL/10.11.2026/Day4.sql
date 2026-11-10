/* Data Types and Constraints */
create database Amazon;
use Amazon;
-- Primary Key
create table orders(
	order_id int Primary Key,
    customer_name varchar(50),
    product_name varchar(50),
    price decimal(10,2)
);
insert into orders values
(101,"Prabhu","Nike Air Jordan",2500.17),
(102,"Alice","Woman Handbag",1588.12),
(103,"Dinesh","Playstation 5",48500.10),
(104,"Bala","Marvel Tshirt",385.25),
(105,"Jeshu","HP Pavillion Laptop",38450.42);
-- (101,"Arjun","Levis Jeans",500.12); -- primary key error

select * from orders;

-- Not Null
create table products(
	product_id int primary key,
    product_name varchar(100) not null,
    price decimal(10,2)
);

insert into products values
(1,"HP Pavillion Laptop",38400.12),
(2,"Woman Handbag",1500.00),
(3,"Playstation 5",48000.05);
-- (4,NULL,12500.12), (10,5200.12) -- not null error

select * from products;

-- unique
create table customers(
	customer_id int primary key,
    customer_name varchar(50) not null,
    email varchar(100) unique
);

insert into customers values
(500,"Dinesh","dinesh203@gmail.com"),
(501,"Alice","alice.r@gmail.com"),
(502,"Jeshu","jeshu2003@gmail.com");
-- (503,"Bala","dinesh203@gmail.com") unique error

select * from customers;

-- check
create table Product1(
	product_id int primary key,
    product_name varchar(100) not null,
    price decimal(10,2) check(price > 0)
);

insert into Product1 values
(1,"Phillips Trimmer",1400.12),
(2,"Boat Airbuds",1250.30),
(3,"Dell laptop",45000.12);
-- (4,"Iphone",-12500) check error;

select * from Product1;

-- default
create table orders1(
	order_id int primary key,
    customer_name varchar(50),
    order_status varchar(20) default 'Pending'
);

insert into orders1(order_id,customer_name) values
(201,"Jeshu"),
(202,"Dinesh"),
(203,"Prabhu");

select * from orders1;

-- foreign key
create table customers2(
	customer_id int primary key,
    customer_name varchar(45) not null
);

insert into customers2 values
(1,"Arun"),
(2,"Bharath"),
(3,"Anaya"),
(4,"Harini");

select * from customers2;

create table orders2(
	order_id int primary key,
    product_name varchar(100),
    customer_id int,
    foreign key(customer_id)
    references customers2(customer_id)
);

insert into orders2 values
(01,"Wireless Mouse",1),
(02,"Makeup Kit",4);
-- (03,"Hair dryer",5) error

select * from orders2;

-- date & datetime
create table data(
	start_date date,
    end_date datetime
);

insert into data values
("2021-02-12","2021-03-29 11:25:15"),
("2022-08-01","2022-10-01 12:30:25"),
("2025-12-31","2026-01-01 12:00:15");

select * from data;

-- composite key
create table cart_items(
	customer_id int,
    product_id int,
    quantity int not null,
    primary key (customer_id,product_id) -- grouping
);

insert into cart_items values
(1,101,23),
(2,102,45),
(3,103,50);

select * from cart_items;

desc cart_items;