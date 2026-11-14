create database Kompany;
use Kompany;

create table Departments(
	Dept_ID int primary key,
    Dept_Name varchar(50),
    Location varchar(50)
);

insert into Departments values
(101, 'HR', 'Chennai'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Mumbai'),
(104, 'Marketing', 'Hyderabad'),
(105, 'Sales', 'Coimbatore');

create table Employees(
	Emp_ID int primary key,
    Emp_Name varchar(50),
    Age int,
    Salary decimal(10,2),
    Dept_ID int,
    foreign key (Dept_ID) references Departments(Dept_ID)
);

insert into Employees values
(1, 'Arun', 25, 30000, 102),
(2, 'Priya', 27, 45000, 101),
(3, 'Karthik', 24, 28000, 102),
(4, 'Divya', 29, 55000, 103),
(5, 'Rahul', 26, 35000, 104),
(6, 'Sneha', 28, 50000, 103),
(7, 'Vijay', 23, 25000, NULL),
(8, 'Meena', 30, 60000, 102);

select e.emp_name,d.dept_name
from employees e
inner join departments d on e.dept_id = d.dept_id;

select e.emp_name,d.dept_name
from employees e
left join departments d on e.dept_id = d.dept_id;

select e.emp_name,d.dept_name
from employees e
right join departments d on e.dept_id = d.dept_id;

select e.emp_name,e.salary,d.location
from employees e
left join departments d on e.dept_id = d.dept_id;

select e.emp_name,d.dept_name
from employees e
inner join departments d on e.dept_id = d.dept_id
where d.dept_name = "IT";

select e.emp_name,d.dept_name,e.salary
from employees e
left join departments d on e.dept_id = d.dept_id
where e.salary > 30000;

select d.dept_name,count(e.emp_name) as No_Of_Employees
from departments d
left join employees e on d.dept_id = e.dept_id
group by d.dept_name;

select d.dept_name,avg(e.salary) as Average_Salary
from departments d
left join employees e on d.dept_id = e.dept_id
group by d.dept_name;

select d.dept_name,count(e.emp_name) as No_Of_Employees
from departments d
left join employees e on d.dept_id = e.dept_id
where e.dept_id is null
group by d.dept_name;

select e.emp_name
from employees e
left join departments d on e.dept_id = d.dept_id
where d.dept_id is null;

select distinct e1.emp_name,e1.dept_id,e1.salary
from employees e1
left join employees e2 on e1.dept_id = e2.dept_id and e1.salary < e2.salary
where e2.emp_id is null and e1.dept_id is not null;

select d.dept_name,count(e.emp_name) as No_of_Employees
from employees e
left join departments d on e.dept_id = d.dept_id
group by d.dept_name
having count(e.emp_name) > 1;

select e.emp_name,d.dept_name
from employees e
left join departments d on e.dept_id = d.dept_id
order by e.salary desc;

select e.emp_name,d.dept_name
from employees e
cross join departments d;

select distinct e1.emp_name,e1.dept_id,e1.salary
from employees e1 
inner join employees e2 on e1.dept_id = e2.dept_id
group by e1.emp_id, e1.emp_name, e1.dept_id, e1.salary
having e1.salary > avg(e2.salary);