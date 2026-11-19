/* CTE - Common Table Expressions */
create database Swiggydb;
use Swiggydb;

-- Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Restaurants
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(50),
    cuisine VARCHAR(50),
    city VARCHAR(50)
);

-- Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- Data:Customers
INSERT INTO Customers VALUES
(1,'Arun','Chennai'),
(2,'Bala','Coimbatore'),
(3,'Charan','Chennai'),
(4,'Divya','Madurai'),
(5,'Ezhil','Bangalore'),
(6,'Farah','Chennai');

-- Data:Restaurants
INSERT INTO Restaurants VALUES
(101,'A2B','South Indian','Chennai'),
(102,'Dominos','Pizza','Chennai'),
(103,'SS Hyderabad','Biryani','Coimbatore'),
(104,'Burger King','Fast Food','Bangalore'),
(105,'Anjappar','Chettinad','Madurai');

-- Data:Orders
INSERT INTO Orders VALUES
(1001,1,101,250,'2026-11-01','Delivered'),
(1002,1,102,450,'2026-11-02','Delivered'),
(1003,2,103,600,'2026-11-03','Delivered'),
(1004,2,103,300,'2026-11-04','Cancelled'),
(1005,3,101,350,'2026-11-05','Delivered'),
(1006,3,102,700,'2026-11-06','Delivered'),
(1007,4,105,500,'2026-11-07','Pending'),
(1008,4,105,400,'2026-11-08','Delivered'),
(1009,5,104,800,'2026-11-09','Delivered'),
(1010,5,104,250,'2026-11-10','Delivered'),
(1011,6,101,150,'2026-11-11','Cancelled'),
(1012,6,102,550,'2026-11-12','Delivered');

-- Retrieve Data
select * from Customers;
select * from Restaurants;
select * from Orders;

-- Types
-- 1.Simple CTE
-- Find all delivered orders
with delivered_orders as(
select * from orders
where status = "Delivered")
select * from delivered_orders;

-- Find all delivered orders who ordered greater than 500
with delivered_orders as (
select * from orders
where status = "Delivered")
select * from delivered_orders
where order_amount > 500;

-- 2. CTE using WHERE
-- Find all delivered orders who ordered greater than 500
with delivered_orders as (
select * from orders
where status = "Delivered")
select * from delivered_orders
where order_amount > 500;

-- 3.CTE with aggregate functions
-- Calculate the total of the delivered customers
with cust_spending as(
	select customer_id,sum(order_amount) as Total,status
    from orders where status = "Delivered"
    group by customer_id
)select * from cust_spending;

-- 4. CTE using HAVING
-- Find the delivered customers whose ordered amount is greater than 500
with cust_spent as(
	select customer_id,sum(order_amount) as Total,status
    from orders where status = "Delivered"
    group by customer_id
    having Total >= 500
)select * from cust_spent;

-- 5. CTE using JOIN
-- Find the delivered customers whose ordered amount is greater than 500
with cust_details as(
	select customer_id,sum(order_amount) as Total,status
    from orders where status = "Delivered"
    group by customer_id
)select c.customer_id,c.customer_name,cd.total
from customers c
join cust_details cd on c.customer_id = cd.customer_id;

-- 6.Multiple CTE
with cust_spend as(
	select customer_id,status,sum(order_amount) as Total from Orders
    where status = "Delivered"
    group by customer_id),
    High_Spending as(
		select * from cust_spend
where total >= 500)
select c.customer_name,h.total from customers c
join High_Spending h on c.customer_id = h.customer_id;

-- 7. Multiple CTE using Windows function
with cust_spend as(
	select customer_id,status,sum(order_amount) as Total from Orders
    where status = "Delivered"
    group by customer_id),
    Rank_Table as(
		select *,dense_rank() over(order by total desc) as Rank_No from cust_spend)
select c.customer_name,Total,r.Rank_No from customers c
join Rank_Table r on c.customer_id = r.customer_id;

-- 8. Find restaurants having more than one order using CTE and group by
with Restaurant_Stats as(
select restaurant_id,count(order_id) as No_Of_Orders
from orders
group by restaurant_id
having No_Of_Orders > 1)
select r.restaurant_id,r.restaurant_name,rs.No_Of_Orders as Total_Orders
from Restaurants r
join Restaurant_Stats rs on r.restaurant_id = rs.restaurant_id;