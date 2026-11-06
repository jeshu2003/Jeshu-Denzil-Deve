create database sample;
show databases;
use sample;
create table students(
	id int,
    name varchar(30),
    age int,
    course varchar(30)
);
insert into students values
(1,"jeshu",23,"GEN AI"),
(2, "asher", 22, "Python");
describe students;
select * from students;


create database company;
use company;
create table employees(
	emp_id int,
    emp_name varchar(35),
    department varchar(30),
    designation varchar(30),
    salary int
);

insert into employees values
(101,"Deva","IT","Python Developer",25000),
(102,"Saranya","IT","Data Engineer",29500),
(103,"Alan","BPO","Voice Process Associate",35000);

select * from employees;