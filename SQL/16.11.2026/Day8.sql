/* Sub-query */
create database AmazonDB;
use AmazonDB;

create table employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO employees VALUES
(101, 'Arun', 'IT', 50000, 'Chennai'),
(102, 'Priya', 'HR', 35000, 'Bangalore'),
(103, 'Kumar', 'IT', 60000, 'Chennai'),
(104, 'Divya', 'Finance', 45000, 'Madurai'),
(105, 'Ravi', 'HR', 30000, 'Chennai'),
(106, 'Meena', 'Finance', 55000, 'Bangalore'),
(107, 'Suresh', 'IT', 40000, 'Madurai'),
(108, 'Anu', 'Finance', 70000, 'Chennai');

select * from employees;

/*
Single-row sub query
Comparison Operators are used (=, !=, <, <=, >, >=) in the outer query
*/

-- 1.Find employees who are getting salary more than its average
select * from employees
where salary > (
select avg(salary) from employees
);

-- 2.Find employees who are getting highest salary
select * from employees
where salary = (
select max(salary) from employees);

/* Multiple-row sub-query
IN,ANY,ALL are used
*/

select distinct department from Employees
where city = "Chennai";

-- IN 
-- 3. Find employees who are working in the departments which is in Chennai city
select * from employees
where department in (select distinct department from employees
where city = "Chennai");

-- ANY
-- 4.Find employee(s) who is getting salary more than HR Department
select * from employees
where salary > any(
select salary from employees
where department = "HR");

-- ALL
-- 4.Find employee(s) who is getting salary more than HR Department
select * from employees
where salary > all(
select salary from employees
where department = "IT");

/* 3. Correlated Sub-query 
1. give alias for the table as t1 , t2 (or your own)
2. inner query should use t2
3. outer query should use t2 for t1
*/


select * from employees t1
where salary > (
select avg(salary) from employees t2
where t2.department = t1.department);
