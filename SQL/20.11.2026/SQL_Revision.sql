/* SQL - Revision */
CREATE DATABASE food_delivery;
USE food_delivery;

-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    signup_date DATE
);

-- Restaurants
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1) DEFAULT 3.0
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
);

-- Order_Items
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    item_name VARCHAR(100),
    quantity INT,
    item_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- Data:Customers
INSERT INTO customers VALUES
(1,'Arun','Chennai','arun@gmail.com','2025-01-10'),
(2,'Priya','Bangalore','priya@gmail.com','2025-02-15'),
(3,'Rahul','Chennai','rahul@gmail.com','2025-03-01'),
(4,'Divya','Hyderabad','divya@gmail.com','2025-03-10'),
(5,'Karthik','Bangalore','karthik@gmail.com','2025-04-05'),
(6,'Sneha','Chennai','sneha@gmail.com','2025-04-20'),
(7,'Vikram','Mumbai','vikram@gmail.com','2025-05-01'),
(8,'Meena','Hyderabad','meena@gmail.com','2025-05-15'),
(9,'Ajay','Pune','ajay@gmail.com','2025-06-01'),
(10,'Nisha','Chennai','nisha@gmail.com','2025-06-15');

-- Data:Restaurants
INSERT INTO restaurants VALUES
(101,'Spicy Kitchen','Chennai','Indian',4.5),
(102,'Pizza World','Bangalore','Italian',4.2),
(103,'Burger Hub','Hyderabad','Fast Food',3.9),
(104,'Wok Express','Chennai','Chinese',4.6),
(105,'Green Bowl','Pune','Healthy',4.7),
(106,'Taco House','Mumbai','Mexican',4.1);

-- Data:Orders
INSERT INTO orders VALUES
(1001,1,101,'2025-07-01',500,'Delivered'),
(1002,2,102,'2025-07-01',800,'Delivered'),
(1003,1,104,'2025-07-02',1200,'Delivered'),
(1004,3,101,'2025-07-02',300,'Cancelled'),
(1005,4,103,'2025-07-03',450,'Delivered'),
(1006,5,102,'2025-07-03',900,'Delivered'),
(1007,2,101,'2025-07-04',700,'Delivered'),
(1008,6,104,'2025-07-04',1500,'Delivered'),
(1009,7,106,'2025-07-05',350,'Pending'),
(1010,8,103,'2025-07-05',600,'Delivered'),
(1011,1,101,'2025-07-06',1000,'Delivered'),
(1012,9,105,'2025-07-06',400,'Cancelled'),
(1013,5,102,'2025-07-07',1100,'Delivered'),
(1014,10,104,'2025-07-07',750,'Delivered'),
(1015,3,101,'2025-07-08',650,'Delivered'),
(1016,6,104,'2025-07-08',950,'Delivered');

-- Data:Order_Items
INSERT INTO order_items VALUES
(1,1001,'Biryani',2,250),
(2,1002,'Pizza',2,400),
(3,1003,'Noodles',3,400),
(4,1004,'Burger',1,300),
(5,1005,'Burger',3,150),
(6,1006,'Pizza',2,450),
(7,1007,'Biryani',2,350),
(8,1008,'Fried Rice',3,500),
(9,1009,'Tacos',2,175),
(10,1010,'Burger',2,300),
(11,1011,'Biryani',2,500),
(12,1012,'Salad',2,200),
(13,1013,'Pizza',2,550),
(14,1014,'Noodles',3,250),
(15,1015,'Biryani',1,650),
(16,1016,'Fried Rice',2,475);

-- Data Display
select * from customers;
select * from restaurants;
select * from orders;
select * from order_items;

-- Database describe
desc customers;
desc restaurants;
desc orders;
desc order_items;

-- Questions
-- Select,Distinct,Limit, AS(alias)

-- 1.Select all the records
select * from customers;
select * from restaurants;
select * from orders;
select * from order_items;

-- 2.Display customer names and cities
select customer_name as Customer_Name, city as City
from customers;

-- 3.Display Unique customer cities
select distinct city from customers;

-- 4.Display first five customers
select * from customers
limit 5;

-- 5. Find the 3 most recently added customers
select * from customers
order by signup_date desc
limit 3;

-- WHERE
-- 6.Find customers from Chennai or Bangalore
select * from customers
where city = "Chennai" or city = "Bangalore";

select * from customers
where city in ("Chennai","Bangalore");

-- 7.Find customers whose email is missing
select * from customers
where email is null;

-- 8.Find customers whose name starts with "A"
select * from customers
where customer_name like "A%";

-- 9.Find deliver orders above 500 from restaurants 101 and 104
select restaurant_id,order_amount from orders
where restaurant_id in(101,104) and order_amount >= 500;

-- Delete,alter,add,modify,update,drop
-- 10.Change customer 1 city to Coimbatore
update customers set city="Coimbatore"
where customer_id = 1;

select * from customers
where customer_id = 1;

-- 11. Add a phone number column
alter table customers add column phone_no varchar(10);
desc customers;

-- 12. Change 10 to 20 for phone number
alter table customers modify column phone_no varchar(20);

-- 13. Drop the phone number column
alter table customers drop column phone_no;

-- Aggregate functions
-- 14. Calculate the total order value
select sum(order_amount) as Total_Order_Amount
from orders;

-- 15. Find the highest and lowest order amount
select max(order_amount) as Highest_Order_Amount,min(order_amount) as Lowest_Order_Amount
from orders;

-- 16. Find restaurants with more than 2 orders
select restaurant_id,count(*) as No_Of_Orders
from orders 
group by restaurant_id
having count(*) > 2;

-- 17. Find restaurants with average order value above 700
select restaurant_id,avg(order_amount) as Average_Order_Amount
from orders
group by restaurant_id
having avg(order_amount) > 700;

select round(order_amount) from orders;

-- Case When, Group By, Having, Order By
-- 18. Categorize order amount by: above 1000 high, above 500 medium and below 500 low
select *,
case
when order_amount > 1000 then "High Amount"
when order_amount > 500 then "Medium Amount"
else "Low Amount"
end as Order_Category from orders;

-- 19. Calculate revenue for each restaurant
select restaurant_id,sum(order_amount) as Revenue
from orders
group by restaurant_id;

-- Constraints
-- 21. Create a student table with primary key and required name
create table student_details(
	roll_no int primary key,
    student_name varchar(40) not null,
    age int ,
    department varchar(40) not null
);

desc student_details;

-- 22. Create a product table with positive price check
create table product(
	product_id int primary key,
    product_name varchar(40) not null,
    price int check(price > 0)
);

desc product;

-- 23. create an enrollment table with a composite key
create table enroll(
	reg_id int,
    roll_no int,
    candidate_name varchar(40) not null,
    age int,
    primary key (reg_id,roll_no)
);

desc enroll;

-- JOINS
-- 24. show customer names with their orders
select c.customer_id,c.customer_name,o.order_amount
from customers c 
inner join orders o
on c.customer_id = o.customer_id;

-- 25. show customers including those without orders
select * from customers c
left join orders o 
on c.customer_id = o.customer_id;

-- 26. Show every possible customers with restaurants combination
select c.customer_name,o.restaurant_id
from customers c 
cross join orders o 
on c.customer_id = o.customer_id;

-- Outer Join (left + UNION + right)
select c.customer_name,o.order_id
from customers c
left join orders o 
on c.customer_id = o.customer_id 
union select c.customer_name,o.order_id
from customers c 
right join orders o 
on c.customer_id = o.customer_id;

-- Sub-query
-- 27.Find customers who placed one order using exists
select * from customers o1
where exists(select 1 from orders o2 where o2.customer_id = o1.customer_id);

-- Windows Function
-- 28.Divide Orders into four amount groups
select *, ntile(4) over(order by order_amount desc) as Amount_Group
from orders;

-- Sub-query + Windows Function
-- 29.Find the top 3 restaurants by the delivered revenue
select * from 
(
	select restaurant_id,sum(order_amount),order_status,
	dense_rank() over(order by sum(order_amount) desc) as Rank_No
	from orders 
    where order_status = "Delivered"
    group by restaurant_id
)as Restaurants
where Rank_No <= 3;

-- CTE
-- 30.List delivered orders above 700
with Delivered_Orders as(
select order_id,restaurant_id,order_amount,order_status
from orders where order_status = "Delivered"
having order_amount >= 700 )
select * from Delivered_Orders;