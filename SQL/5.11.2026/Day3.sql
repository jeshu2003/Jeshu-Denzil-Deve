/*-------------------- Activity ------------------------------------*/
-- database: flower_db
create database flower_db;
use flower_db;

-- flowers
create table Flowers(
	flower_id int,
    flower_name varchar(40),
    color varchar(40),
    price int,
    stock int
);

-- insert values in flowers
insert into Flowers values
(101,"Rose","Red",50,10),
(102,"Sunflower","Yellow",100,25),
(103,"Jasmine","White",90,5),
(104,"Lilly","White",20,30),
(105,"Rose","Yellow",45,6);

-- retrieve
select * from Flowers;

-- customers
create table Customers(
	Customer_id int,
    Customer_name varchar(30),
    City varchar(30),
    Phone_No varchar(10)
);

-- insert values in Customers
insert into Customers values
(201,"Sanjay","Chennai","9987653123"),
(202,"Karthik","Madurai","8876609889"),
(203,"Shanmugan","Salem","9994000239"),
(204,"Keerthana","Banglore","7773987508"),
(205,"Sangeetha","Trichy","9940015224");

-- retrieve
select * from Customers;

-- orders
create table Orders(
	order_id int,
    cust_id int,
    flower_id int,
    Quantity int,
    Total_amount int
);

insert into Orders values
(1020,11,101,2,100),
(1021,12,102,10,250),
(1022,13,103,6,30),
(1023,14,104,5,150),
(1024,15,105,8,48);

-- retrieve
select * from Orders;

-- 1. Display all tables
select * from Flowers;
select * from Customers;
select * from Orders;
show tables;

-- 2. Display all table structures
desc Flowers;
desc Customers;
desc Orders;

-- 3. Retrieve all records from the tables
select * from Flowers;
select * from Customers;
select * from Orders;

-- 4. Retrieve Flower_Name and Price
select flower_Name, price
from Flowers;

-- 5. Display the flower's data whose price is > 100
update flowers set price = 1500
where flower_id = 103;
select * from Flowers
where price > 100;

-- 6. Display flower's data whose color is red
select * from Flowers
where color = "Red";

-- 7. Display flower's data whose stock > 50
update flowers set stock = 65
where flower_id = 101;
select * from Flowers
where stock > 50;

-- 8. Display flowers based on price in  ascending order
select * from Flowers
order by price;

-- 9. Increase / Change the Price of rose to 20.rs
update flowers set price = 20
where flower_id = 101;
select * from Flowers;

-- 10. Change 4th customer's city to Trichy
update Customers set City = "Trichy"
where Customer_ID = 202;
select * from Customers;

-- 11. Delete Customer_ID = 4 and Flower_ID = 2
delete from Customers
where Customer_ID = 204;

delete from Flowers
where flower_id = 102;

select * from Customers;
select * from Flowers;

-- 12. Add a new column named "flower_type" in Flowers table
alter table Flowers add flower_type varchar(30);
desc Flowers;

-- 13. Modify "flower_name" column size to 100
alter table Flowers modify flower_name varchar(100);
desc Flowers;

-- 14. Rename Flowers to Flower_Table
rename table Flowers to Flower_Table;
show tables;

-- distinct - unique values
-- 15. Retrieve distinct City from Customers
select distinct City
from Customers;
-- 16. Retrieve distinct flower_name,color from Flower_Name
select distinct flower_name,color
from Flower_Table;

-- 17. show the first two Order data from Orders table
select * from Orders
limit 2;

-- 18. show the first three flower data using price column in descending order
select * from Flower_Table
order by price desc
limit 3;