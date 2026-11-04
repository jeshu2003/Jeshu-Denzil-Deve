-- ddl
-- create
create database demo_db;
use demo_db;
create table customer(
	id int,
    name varchar(30),
    address varchar(30),
    mail_id varchar(30),
    ph_no int
);
describe customer;
-- alter
alter table customer add location varchar(30);
alter table customer modify name varchar(50);
alter table customer drop column mail_id;
-- rename
rename table customer to customer_table;
show tables;
-- truncate
truncate table customer_table;
-- drop
drop table customer_table;
show databases;
drop database demo_db;

-- dml
create database swiggy_db;
use swiggy_db;
create table orders(
	c_id int,
    o_id int,
    food_item varchar(30),
    amount int
);
desc orders;
show tables;
show databases;
-- insert
insert into orders values
(1,100,"Chicken Biriyani",120),
(2,101,"Chicken Fried Rice", 130),
(3,102,"Veg.Salad",50),
(4,103,"Chocolate Milkshake",70),
(5,104,"Mango Juice",60),
(1,105,"Chicken 65",145),
(1,106,"Butter Naan",100),
(3,107,"Mushroom Chukka",125),
(3,108,"Veg.Biriyani",75),
(2,109,"Chilli Chicken",65);

select * from orders;

-- update
update orders set food_item = "Butter Naan" 
where o_id = 106;

update orders set amount = 85
where o_id = 103;

-- delete
delete from orders 
where c_id = 5;

delete from orders
where o_id = 106;

-- dql
-- select
select * from orders;
select c_id,food_item
from orders;
select * from orders
where amount > 100;
select * from orders
where food_item = "Chocolate Milkshake";
select * from orders
order by amount desc;

select * from orders
order by amount desc,
o_id desc;