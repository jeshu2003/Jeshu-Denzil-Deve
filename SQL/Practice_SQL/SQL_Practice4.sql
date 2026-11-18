create database demodb;
use demodb;

create table departments (
    dept_id int primary key,
    dept_name varchar(50),
    location varchar(50)
);

create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    job_role varchar(50),
    salary decimal(10,2),
    dept_id int,
    manager_id int,
    hire_date date,
    foreign key (dept_id) references departments(dept_id)
);

create table projects (
    project_id int primary key,
    project_name varchar(100),
    dept_id int,
    budget decimal(12,2),
    foreign key (dept_id) references departments(dept_id)
);

create table employee_projects (
    emp_id int,
    project_id int,
    hours_worked int,
    primary key (emp_id, project_id),
    foreign key (emp_id) references employees(emp_id),
    foreign key (project_id) references projects(project_id)
);

insert into departments values
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Chennai'),
(5, 'Data Science', 'Hyderabad');

insert into employees values
(101, 'arun', 'manager', 90000, 1, null, '2020-01-15'),
(102, 'bala', 'developer', 60000, 1, 101, '2021-03-10'),
(103, 'charan', 'developer', 75000, 1, 101, '2022-06-20'),
(104, 'divya', 'analyst', 55000, 2, null, '2021-07-12'),
(105, 'elango', 'hr executive', 45000, 2, 104, '2022-02-18'),
(106, 'farah', 'accountant', 65000, 3, null, '2020-09-25'),
(107, 'ganesh', 'analyst', 50000, 3, 106, '2023-01-05'),
(108, 'hari', 'marketing executive', 48000, 4, null, '2022-11-11'),
(109, 'indhu', 'marketing manager', 80000, 4, 108, '2019-04-22'),
(110, 'jagan', 'data scientist', 95000, 5, null, '2021-12-01'),
(111, 'kavya', 'data analyst', 70000, 5, 110, '2022-08-14'),
(112, 'lokesh', 'developer', 60000, 1, 101, '2023-05-19'),
(113, 'meena', 'data scientist', 95000, 5, 110, '2024-01-10'),
(114, 'naveen', 'accountant', 65000, 3, 106, '2024-03-15'),
(115, 'priya', 'developer', 75000, 1, 101, '2024-06-01');

insert into projects values
(201, 'website development', 1, 500000),
(202, 'recruitment system', 2, 200000),
(203, 'financial dashboard', 3, 350000),
(204, 'marketing campaign', 4, 250000),
(205, 'ai chatbot', 5, 800000),
(206, 'data analytics', 5, 600000);

insert into employee_projects values
(102, 201, 120),
(103, 201, 150),
(112, 201, 100),
(115, 201, 130),
(104, 202, 90),
(105, 202, 110),
(106, 203, 140),
(107, 203, 100),
(114, 203, 120),
(108, 204, 80),
(109, 204, 160),
(110, 205, 180),
(111, 205, 120),
(113, 205, 160),
(110, 206, 100),
(111, 206, 150);

select * from employees
where salary > (select avg(salary) from employees);

select * from employees
where salary = (select max(salary) from employees);

select * from employees
where dept_id = (select dept_id from departments
where dept_id = 1);

select * from employees
where salary = (select salary from employees
where emp_name = "bala");

select * from employees
where salary > (select salary from employees
where emp_name = "arun");

select * from employees
where dept_id in (select distinct dept_id
from departments where location = "Chennai");

select * from employees
where salary > any(select salary from employees
where dept_id = 2);

select * from employees
where salary > all(select salary from employees
where dept_id = 3);

select * from employees e
where emp_id in (select emp_id from employee_projects);

select * from employees t1
where salary > (select avg(salary)
from employees t2 where t2.dept_id = t1.dept_id
group by dept_id);

select * from employees t1
where salary = (select max(salary)
from employees t2 where t2.dept_id = t1.dept_id
group by dept_id);