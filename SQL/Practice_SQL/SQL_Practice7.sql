create database employee_db;
use employee_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(12,2),
    start_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE employee_projects (
    assignment_id INT PRIMARY KEY,
    emp_id INT,
    project_id INT,
    hours_worked INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO departments VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Chennai'),
(4, 'Marketing', 'Hyderabad'),
(5, 'Sales', 'Coimbatore'),
(6, 'Operations', 'Bangalore');

INSERT INTO employees VALUES
(101, 'Arun', 1, 60000, '2021-01-15', NULL),
(102, 'Bala', 1, 45000, '2022-03-10', 101),
(103, 'Charan', 1, 75000, '2020-06-20', 101),
(104, 'David', 2, 35000, '2023-02-12', NULL),
(105, 'Ezhil', 2, 40000, '2021-08-25', 104),
(106, 'Farhan', 3, 55000, '2022-11-05', NULL),
(107, 'Gokul', 3, 65000, '2019-04-18', 106),
(108, 'Hari', 4, 30000, '2023-07-01', NULL),
(109, 'Imran', 4, 42000, '2022-09-15', 108),
(110, 'Jeeva', 5, 38000, '2021-12-10', NULL),
(111, 'Karthik', 5, 48000, '2020-10-22', 110),
(112, 'Lokesh', 1, 52000, '2024-01-05', 101),
(113, 'Manoj', 3, 70000, '2023-05-17', 106),
(114, 'Naveen', 2, 32000, '2024-06-11', 104),
(115, 'Praveen', 5, 45000, '2022-04-30', 110),
(116, 'Rahul', 6, 50000, '2021-09-19', NULL),
(117, 'Sanjay', 6, 40000, '2023-03-21', 116),
(118, 'Vijay', 1, 45000, '2025-02-14', 101);

INSERT INTO projects VALUES
(201, 'AI Chatbot', 500000, '2023-01-10', 1),
(202, 'Website Development', 300000, '2022-05-15', 1),
(203, 'Employee Management', 150000, '2023-06-01', 2),
(204, 'Financial Analysis', 400000, '2021-09-20', 3),
(205, 'Digital Marketing', 200000, '2022-11-10', 4),
(206, 'Sales Automation', 350000, '2023-03-05', 5),
(207, 'Cloud Migration', 600000, '2024-01-15', 1),
(208, 'Process Optimization', 250000, '2023-08-12', 6);

INSERT INTO employee_projects VALUES
(1, 101, 201, 120),
(2, 102, 201, 100),
(3, 103, 202, 150),
(4, 112, 207, 180),
(5, 118, 202, 90),
(6, 104, 203, 100),
(7, 105, 203, 130),
(8, 106, 204, 140),
(9, 107, 204, 160),
(10, 113, 204, 110),
(11, 108, 205, 80),
(12, 109, 205, 120),
(13, 110, 206, 100),
(14, 111, 206, 150),
(15, 115, 206, 130),
(16, 116, 208, 120),
(17, 117, 208, 90),
(18, 101, 207, 70),
(19, 103, 201, 60),
(20, 106, 208, 40);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM employee_projects;

with EmployeeData as (
	select * from employees
) select * from EmployeeData;

with ITEmployees as (
	select * from employees
	where dept_id = 1
)select * from ITEmployees;

with HighSalaryEmployees as(
	select * from employees
    where salary >= 50000
)select * from HighSalaryEmployees;

with RecentEmployees as(
	select * from employees
    where hire_date > "2022-01-01"
)select * from RecentEmployees;

with EmployeeNames as(
	select emp_id,emp_name,salary
	from employees
)select * from EmployeeNames;

with forty_greater as(
	select * from employees
	where salary > 40000
)select * from forty_greater;

with IT_and_Finance as(
	select * from employees
    where dept_id in(1,3)
)select * from IT_and_Finance;

with hire_between as(
	select * from employees
    where hire_date between "2021-01-01" and "2023-12-31"
)select * from hire_between;

with EmpNames as(
	select emp_id,emp_name from employees
    where emp_name like "A%" or emp_name like "S%"
)select * from EmpNames;

with salary_between as(
	select * from employees
    where salary between 35000 and 60000
    and dept_id != 2
    order by dept_id,emp_id
)select * from salary_between;

with Total_Salary as(
select sum(salary) as Total_Salary from employees
)select * from Total_Salary;

with Average_Employee_Salary as(
	select emp_name,round(avg(salary)) as Average_Salary
    from employees
    group by emp_name
)select * from Average_Employee_Salary;

with Minimum_Maximum_Salary as(
select round(min(salary)) as Minimum_salary,round(max(salary)) as Maximum_salary
from employees
)select * from Minimum_Maximum_Salary;

with Total_Employees as(
	select count(*) as No_Of_Employees
    from employees
)select * from Total_Employees;

with Department_Salary as(
	select d.dept_name,e.dept_id,round(sum(e.salary)) as Total_Salary,round(avg(e.salary)) as Average_Salary
    from departments d join employees e 
    on d.dept_id = e.dept_id
    group by d.dept_name,e.dept_id
)select * from Department_Salary;

with Employee_Count_Per_Dept as(
select d.dept_id,d.dept_name,count(e.emp_id) as No_Of_Employees
from employees e join departments d on e.dept_id = d.dept_id
group by d.dept_id,d.dept_name
having No_Of_Employees > 2
)select * from Employee_Count_Per_Dept;

with Average_Salary as(
	select d.dept_id,d.dept_name,round(avg(e.salary)) as Average
	from employees e join departments d on e.dept_id = d.dept_id
	group by d.dept_id,d.dept_name
    having Average > 45000
)select * from Average_Salary;

with Total_Salary as(
	select d.dept_id,d.dept_name,round(sum(e.salary)) as Total
	from employees e join departments d on e.dept_id = d.dept_id
	group by d.dept_id,d.dept_name
    having Total > 100000 
)select * from Total_Salary;

with Department_Stats as(
	select d.dept_name,count(e.emp_id) as No_Of_Employees,round(avg(salary)) as Average_Salary
    from employees e join departments d on e.dept_id = d.dept_id
    group by d.dept_name
    having No_Of_Employees >= 3 and Average_Salary > 40000
)select * from Department_Stats;

with Employee_Department as(
	select e.emp_id as Employee_ID,e.emp_name as Employee_Name,d.dept_name as Department
	from employees e
	inner join departments d 
	on e.dept_id = d.dept_id
)select * from Employee_Department;

with Locations as(
	select e.emp_id as Employee_ID,e.emp_name as Employee_Name,
	d.dept_name as Department,d.location as Location
	from employees e
	inner join departments d 
	on e.dept_id = d.dept_id
)select * from Locations;

with Project_Stats as(
	select e.emp_name,p.project_name,ep.hours_worked
    from employees e join employee_projects ep
    on e.emp_id = ep.emp_id
    join projects p 
    on ep.project_id = p.project_id
)select * from Project_Stats;

with Salary_Analysis as(
	select e.emp_name,d.dept_name,e.salary
    from employees e join departments d on e.dept_id = d.dept_id
    where e.salary > 45000
)select * from Salary_Analysis;

with Employee_Counts as(
	select d.dept_name,count(e.emp_id) as Total_Employees
    from employees e
    left join departments d 
    on e.dept_id = d.dept_id
    group by d.dept_name
)select * from Employee_Counts;

with Employee_Manager as(
	select e1.emp_name as Employee_Name,e2.emp_name as Manager_Name,d1.dept_name as Department_Name
    from employees e1 join employees e2 
    on e1.manager_id = e2.emp_id
    left join departments d1 on e1.dept_id = d1.dept_id
)select * from Employee_Manager;