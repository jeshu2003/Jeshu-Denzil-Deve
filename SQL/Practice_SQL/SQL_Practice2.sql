create database Company_DB;
use Company_DB;
create table Employees(
	Emp_ID int,
    Emp_Name varchar(30),
    Department varchar(30),
    Age int,
    Salary int
);

alter table Employees add column Email varchar(100);
alter table Employees modify column Salary decimal(10,2);
alter table Employees rename column Emp_Name to Employee_Name;
rename table Employees to Employee_Details;
create table Temporary_Employees as
select * from Employee_Details;
truncate table Temporary_Employees;
drop table Temporary_Employees;
rename table Employee_Details to Employees;

insert into Employees values
(101, "Arun", "IT", 24, 45000, "arun@example.com"),
(102, "Deborah", "Sales", 26, 35000, "deborah@example.com"),
(103, "James", "IT", 22, 15800, "james@example.com"),
(104, "Alice", "BPO", 24, 20500, "alice@example.com"),
(105, "Balu", "IT", 35, 18542, "balu@example.com");

select * from Employees;

insert into Employees (Emp_ID,Employee_Name,Department,Age,Salary) value
(111,"Karthik","IT",24,38000);

update Employees set salary = 42000
where Employee_Name = "Karthik";

update Employees set salary = salary+5000
where Department = "IT";

update Employees set Department = "Finance"
where Emp_ID = 105;

delete from Employees
where Emp_ID = 104;

delete from Employees
where salary < 25000;

select * from Employees
where salary > 35000;

select * from Employees 
where Department = "IT";

select * from Employees
where age between 23 and 28;

select * from Employees
where Department = "IT" or Department = "Finance";

select * from Employees
order by salary desc;

select * from Employees
order by salary desc
limit 3;

select * from Employees
order by Emp_ID
limit 3 offset 0;

select Employee_Name,salary,
case
when salary >= 50000 then "High Salary"
when salary >= 35000 then "Medium Salary"
else "Low Salary"
end as Salary_Category from Employees;

select Employee_Name,age,
case
when age >= 28 then "Senior"
when age >= 25 then "Mid-Level"
else "Junior"
end as Age_Category from Employees;