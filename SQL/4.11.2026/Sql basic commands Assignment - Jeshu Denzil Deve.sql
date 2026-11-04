/* Scenario 1: Student Management System
A college wants to maintain student details in a database.
Table Name: Students
Columns:
	-> Student_ID
	-> Student_Name
	-> Age
	-> Department
	-> City
	-> Marks
*/

-- create database named CollegeDB
create database CollegeDB;
use CollegeDB;

-- create a table: Students
create table Students(
	Student_ID int,
    Student_Name varchar(30),
    Age int,
    Department varchar(30),
    City varchar(30),
    Marks int
);
desc Students;

-- insert records into the table
insert into Students values
(101,"Arun",21,"Python","Chennai",85),
(102,"Priya",22,"Java","Madurai",90),
(103,"Kumar",20,"Python","Coimbatore",75),
(104,"Divya",21,"SQL","Chennai",95),
(105,"Rahul",23,"Java","Salem",80);

-- display all columns from Student Table
select * from Students;

-- display Student_Name and Department
select Student_Name, Department
from Students;

-- display Student_Name and Marks
select Student_Name, Marks
from Students;

-- display all student records in ascending order of Marks
select * from Students
order by Marks;

-- display all student records in ascending order of Marks
select * from Students
order by Marks desc;

-- display student names in alphabetical order.
select * from Students
order by Student_Name;

-- display student records in descending order of Student_ID.
select * from Students
order by Student_ID desc;