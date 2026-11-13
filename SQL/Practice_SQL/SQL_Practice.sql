-- create
create database SQL_Practice;
use SQL_Practice;
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30)
);
-- insert
INSERT INTO Employees VALUES
(101, 'Arun', 24, 'IT', 25000, 'Chennai'),
(102, 'Bala', 26, 'HR', 30000, 'Coimbatore'),
(103, 'Charan', 23, 'Finance', 28000, 'Chennai'),
(104, 'David', 28, 'IT', 40000, 'Bangalore'),
(105, 'Ezhil', 25, 'Sales', 22000, 'Madurai'),
(106, 'Farhan', 27, 'HR', 35000, 'Chennai'),
(107, 'Gokul', 29, 'Finance', 45000, 'Bangalore'),
(108, 'Hari', 22, 'IT', 20000, 'Salem'),
(109, 'John', 30, 'Sales', 38000, 'Coimbatore'),
(110, 'Karthik', 26, 'IT', 32000, 'Chennai');

-- select
SELECT * FROM Employees;

-- alter 
alter table Employees add column email varchar(100);
alter table Employees add column Experience int;
alter table Employees modify Salary decimal(12,2);
alter table Employees rename column Emp_Name to Employee_Name;
alter table Employees add column Joining_Date date;
alter table Employees drop column Experience;

-- update
update Employees set Salary = 30000
where Emp_ID = 101;

update Employees set City = "Chennai"
where Emp_ID = 102;

update Employees set Salary = Salary+5000
where Department = "IT";

update Employees set Salary = Salary*1.1;

update Employees set City = "Coimbatore"
where Salary < 25000;

update Employees set Age = 29
where Employee_Name = "David";

update Employees set Department = "Marketing"
where Department = "Sales";

-- delete
delete from Employees
where Emp_ID = 108;

delete from Employees
where Department = "Marketing";

delete from Employees
where Salary < 25000;

delete from Employees
where Employee_Name = "Gokul";

delete from Employees
where City = "Madurai";