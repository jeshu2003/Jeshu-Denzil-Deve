/* Window Function */
create table Amazon_Sales(
	sale_id int primary key,
    category varchar(30),
    product varchar(30),
    sale_date date,
    amount int 
);

insert into Amazon_Sales values
(1, 'Electronics', 'iPhone 15', '2026-01-05', 80000),
(2, 'Electronics', 'Echo Dot', '2026-01-12', 5000),
(3, 'Electronics', 'Kindle', '2026-01-20', 12000),
(4, 'Electronics', 'Fire TV Stick', '2026-01-28', 5000),
(5, 'Books', 'Atomic Habits', '2026-01-03', 500),
(6, 'Books', 'Deep Work', '2026-01-15', 600),
(7, 'Books', 'Python Crash Course', '2026-01-25', 600),
(8, 'Books', 'Clean Code', '2026-02-02', 900);

select * from Amazon_Sales;

select * from Amazon_Sales t1
where exists (select 1 from Amazon_Sales t2
where t2.amount = t1.amount and t2.sale_id <> t1.sale_id);

select * from Amazon_Sales t1
where not exists (select 1 from Amazon_Sales t2
where t2.amount = t1.amount and t2.sale_id <> t1.sale_id);

select category,sum(amount) as Total from Amazon_Sales
group by category;

-- Window function
-- over(partition by)
select category,product,amount,
sum(amount) over(partition by category) as Total
from Amazon_Sales;

-- 1.Ranking Function
-- row_number by amount in descending order
select *, row_number()
over(order by amount desc) as R_No
from Amazon_Sales;

-- row_number by product in ascending / descending order
select *, row_number()
over(order by product) as R_No
from Amazon_Sales;

select *, row_number()
over(order by product desc) as R_No
from Amazon_Sales;

-- rank: if you need skipping points
select *, rank()
over (order by amount desc) as Rank_No
from Amazon_Sales;

-- dense rank: if you don't need skipping points
select *, dense_rank()
over (order by amount desc) as Rank_No
from Amazon_Sales;

-- ntile
select *,ntile(3)
over () as Product_Name
from Amazon_Sales;

-- 2.Aggregate Window Function
-- find the sum of each category (partition by each category)
select category, sum(amount) over (partition by category) as Total_Amount
from Amazon_Sales
order by category desc;

-- find the average of each category (partition by each category)
select category, avg(amount) over (partition by category) as Average_Amount
from Amazon_Sales
order by category desc;

-- find the no.of.products in each category (partition by each category)
select distinct category,count(product) over(partition by category) as No_Of_Products
from Amazon_sales;

-- find the minimum and maximum amount in each category
select distinct category,max(amount) over(partition by category) as Maximum_Amount,
min(amount) over (partition by category) as Minimum_Amount
from Amazon_sales;

-- 3. Value Function
-- first_value
select *,first_value(amount) over(order by amount desc) as 1st_value
from amazon_sales;

select *,first_value(amount) over(partition by category order by sale_date) as Max_value
from amazon_sales;

-- last_value
select *,last_value(amount) over(partition by category) as Max_value
from amazon_sales;