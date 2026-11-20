create database demo;
use demo;

create table departments (
    dept_id int primary key,
    dept_name varchar(50),
    location varchar(50)
);

create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    dept_id int,
    salary decimal(10,2),
    manager_id int,
    hire_date date,
    foreign key (dept_id) references departments(dept_id)
);

create table projects (
    project_id int primary key,
    project_name varchar(50),
    emp_id int,
    project_budget decimal(12,2),
    status varchar(20),
    foreign key (emp_id) references employees(emp_id)
);

insert into departments values
(1, 'it', 'chennai'),
(2, 'hr', 'bangalore'),
(3, 'finance', 'hyderabad'),
(4, 'marketing', 'chennai'),
(5, 'sales', 'mumbai'),
(6, 'operations', 'pune');

insert into employees values
(101, 'arun', 1, 75000, null, '2020-01-15'),
(102, 'bala', 1, 60000, 101, '2021-03-10'),
(103, 'charan', 1, 85000, 101, '2019-06-20'),
(104, 'david', 1, 55000, 101, '2022-07-12'),
(105, 'elango', 2, 50000, null, '2020-08-01'),
(106, 'farhan', 2, 45000, 105, '2021-09-15'),
(107, 'ganesh', 2, 65000, 105, '2018-04-18'),
(108, 'hari', 3, 90000, null, '2019-02-25'),
(109, 'imran', 3, 70000, 108, '2022-01-05'),
(110, 'john', 3, 65000, 108, '2023-05-11'),
(111, 'karthik', 4, 55000, null, '2020-11-20'),
(112, 'lokesh', 4, 48000, 111, '2021-12-10'),
(113, 'manoj', 5, 80000, null, '2018-07-30'),
(114, 'naveen', 5, 60000, 113, '2022-03-14'),
(115, 'praveen', 5, 60000, 113, '2023-08-19'),
(116, 'rahul', 6, 72000, null, '2019-05-16'),
(117, 'sanjay', 6, 58000, 116, '2021-06-21'),
(118, 'vikram', 6, 72000, 116, '2020-09-11'),
(119, 'ajay', 1, 85000, 101, '2023-02-14'),
(120, 'mohan', 3, 50000, 108, '2024-01-10');

insert into projects values
(201, 'ai chatbot', 101, 500000, 'completed'),
(202, 'web application', 102, 300000, 'ongoing'),
(203, 'data analytics', 103, 450000, 'completed'),
(204, 'automation', 104, 200000, 'ongoing'),
(205, 'recruitment portal', 105, 150000, 'completed'),
(206, 'hr analytics', 106, 250000, 'ongoing'),
(207, 'financial dashboard', 108, 600000, 'completed'),
(208, 'audit system', 109, 350000, 'ongoing'),
(209, 'marketing campaign', 111, 180000, 'completed'),
(210, 'sales crm', 113, 700000, 'ongoing'),
(211, 'customer portal', 114, 400000, 'completed'),
(212, 'business intelligence', 103, 550000, 'ongoing'),
(213, 'cloud migration', 116, 800000, 'completed'),
(214, 'inventory system', 117, 320000, 'ongoing'),
(215, 'reporting system', 118, 420000, 'completed');

select * from departments;
select * from employees;
select * from projects;

select * from
(select emp_name,salary,rank() over(order by salary desc) as Rank_No
from employees
where salary > (select avg(salary) from employees)
) as Salary_Stats;

select * from
(select emp_name,salary,dept_id,dense_rank() over(partition by dept_id order by salary desc) as Rank_No
from employees) as Highest_Salary
where Rank_No = 1;

select * from (
	select emp_name,salary,dept_id,
    avg(salary) over(partition by dept_id) as Dept_Avg_Salary,
    dense_rank() over(partition by dept_id order by salary desc) as Rank_No
    from employees
)as Highest_Avg_Salary 
where salary > Dept_Avg_Salary;

select * from (
	select emp_name,salary,dept_id,
    avg(salary) over() as Company_Avg_Salary,
    avg(salary) over(partition by dept_id) as Dept_Avg_Salary,
    row_number() over(partition by dept_id order by salary desc) as Row_No
    from employees
)as Highest_Avg_Salary 
where Dept_Avg_Salary > Company_Avg_Salary;

select * from(
	select distinct salary,dense_rank() over(order by salary desc) as Rank_No
    from employees
) as Second_High where Rank_No = 2;

select * from(
	select emp_name,salary,dept_id,dense_rank() over(partition by dept_id order by salary desc) as Rank_No
    from employees
)as Top_Two where Rank_No <= 2;

select emp_name,salary,Manager_salary,(salary-Manager_Salary) as Difference,Rank_No
from(
select emp_name,salary,
(select t2.salary from employees t2 where t2.emp_id = t1.manager_id) as Manager_salary,
dense_rank() over(partition by dept_id order by salary desc) as Rank_No from employees t1) as Analysis
where salary > Manager_Salary;

select * from(
	select emp_name,dept_id,salary,
    count(case when salary > (select avg(salary) from employees)then 1 end) over(partition by dept_id) as Dept_Count,
    avg(salary) over() as Company_Avg_Salary,
    dense_rank() over(partition by dept_id order by salary desc) as Rank_No
    from employees
)as Analysis
where salary > Company_Avg_Salary
and dept_count >= 2;

select * from(
	select emp_name,dept_id,salary,
    dense_rank() over(partition by dept_id order by salary desc) as Rank_No
    from employees
)as Analysis 
where Rank_No = 2;

select * from(
select *,(
select min(t2.hire_date)from employees t2 
where t2.dept_id = t1.dept_id) as First_Hire_Date,
row_number() over(partition by dept_id order by hire_date) as Row_No 
from employees t1)as Stats
where hire_date > First_Hire_Date;