-- 1. Create a database named MovieBooking
create database MovieBooking;
use MovieBooking;

-- 2. Create a table named Movies with the following columns: Movie_ID, Movie_Name, Genre, Language, Duration, Release_Year
create table Movies(
	Movie_ID int,
    Movie_Name varchar(30),
    Genre varchar(30),
    Language varchar(30),
    Release_Year int
);

insert into Movies values
(101, 'Mad Max: Fury Road', 'Action', 'English', 2015),
(102, 'John Wick: Chapter 4', 'Action', 'English', 2023),
(103, 'Interstellar', 'Adventure', 'English', 2014),
(104, 'Vikram', 'Action', 'Tamil', 2022),
(105, 'Life of Pi', 'Adventure', 'English', 2012),
(106, 'The Godfather', 'Crime', 'English', 1972),
(107, 'Vada Chennai', 'Crime', 'Tamil', 2018),
(108, 'The Conjuring', 'Horror', 'English', 2013),
(109, 'Bramayugam', 'Horror', 'Malayalam', 2024),
(110, 'The Martian', 'Survival', 'English', 2015),
(111, 'Manjummel Boys', 'Survival', 'Malayalam', 2024),
(112, '2018: Everyone is a Hero', 'Survival', 'Malayalam', 2023),
(113, 'Dangal', 'Sports', 'Hindi', 2016),
(114, 'Sarpatta Parambarai', 'Sports', 'Tamil', 2021);

select * from Movies;
truncate table Movies;
-- 3. Create a table named Customers with: Customer_ID, Customer_Name, Email, Phone, Age
create table Customers(
	Customer_ID int,
    Customer_Name varchar(30),
    Email varchar(30),
    Phone varchar(10),
    Age int
);

insert into Customers values
(101,"Dhanush","dhanush203@gmail.com","8512575489",23),
(102,"Deepak","deepk012@gmail.com","8012397878",26),
(103,"Ancy","ancy2003@gmail.com","9008122356",21),
(104,"Jothi","jothiraj@gmail.com","8844596923",29),
(105,"Chandran","chandrank@gmail.com","9566812121",31),
(106,"Bhagya","bhagyag@gmail.com","9012185623",35),
(107, 'Rahul', 'rahul2012@gmail.com', '9840123456', 14),
(108, 'Sneha', 'sneha.v@gmail.com', '9444567890', 18),
(109, 'Kavya', 'kavyashree@gmail.com', '8122334455', 16),
(110, 'Arjun', 'arjun99@gmail.com', '7358123456', 19),
(111, 'Meera', 'meera.krish@gmail.com', '9003112233', 12),
(112, 'Vijay', 'vijaymass@gmail.com', '8056778899', 17),
(113, 'Divya', 'divya2015@gmail.com', '9884556677', 11),
(114, 'Sanjay', 'sanjay.b@gmail.com', '9176223344', 20),
(115, 'Priya', 'priya.rockz@gmail.com', '6380112233', 15),
(116, 'Ashwin', 'ashwinwin@gmail.com', '9940556677', 13);

select * from Customers;

-- 4.Create a table named Bookings with: Booking_ID, Customer_ID, Movie_ID, Theatre_ID, Booking_Date, Tickets, Total_Amount.
create table Bookings(
	Booking_ID int,
    Customer_ID int,
    Movie_ID int,
    Theatre_ID int,
    Booking_Date varchar(30),
    Tickets int,
    Total_Amount int
);

insert into Bookings values
(500, 101, 101, 3, '15-05-2021', 2, 400),
(501, 102, 106, 5, '22-08-2022', 4, 800),
(502, 103, 103, 1, '10-12-2022', 1, 200),
(503, 104, 113, 8, '14-02-2023', 3, 600),
(504, 105, 104, 2, '25-06-2023', 2, 500),
(505, 106, 109, 10, '05-11-2024', 5, 1200),
(506, 102, 107, 4, '19-04-2023', 0, 0),
(507, 104, 101, 7, '30-09-2024', 0, 0),
(508, 101, 114, 6, '12-07-2024', 2, 450),
(509, 103, 108, 9, '28-12-2024', 3, 670),
(510, 106, 102, 3, '05-01-2025', 2, 500),
(511, 105, 110, 1, '14-02-2025', 4, 1000),
(512, 101, 105, 4, '20-05-2025', 1, 250),
(513, 104, 106, 2, '18-08-2025', 3, 750),
(514, 103, 112, 9, '25-12-2025', 2, 600),
(515, 102, 111, 5, '01-01-2026', 2, 500);

select * from Bookings;

-- Theatres Table
create table Theatres(
    Theatre_ID int,
    Theatre_Name varchar(30),
    Location varchar(30),
    Price int
);

insert into Theatres values
(1, 'PVR Cinemas', 'Velachery', 200),
(2, 'SPI Cinema Luxe', 'Royapettah', 250),
(3, 'AGS Cinemas', 'T Nagar', 200),
(4, 'Rohini Silver Screens', 'Koyambedu', 180),
(5, 'Inox Mall', 'Anna Nagar', 250),
(6, 'Vettri Theatres', 'Chromepet', 150),
(7, 'GK Cinemas', 'Porur', 150),
(8, 'Mayajaal Multiplex', 'ECR', 200),
(9, 'Sangam Multiplex', 'Kilpauk', 190),
(10, 'Palazzo Cinemas', 'Vadapalani', 240);

select * from Theatres;

-- 5.Add a new column Rating to the Movies table
alter table Movies add column Rating int;

-- 6.Add a new column Seat_Type to the Bookings table
alter table Bookings add column Seat_Type varchar(30);

-- 7.Change the size of the Movie_Name column to VARCHAR(150)
alter table Movies modify Movie_Name varchar(150);

-- 8.Rename the column Phone to Mobile_Number in the Customers table
alter table Customers rename column Phone to Mobile_Number;

-- 9.Rename the table Theatres to Cinema_Halls
rename table Theatres to Cinema_Halls;

-- 10.Remove the Rating column from the Movies Table
alter table Movies drop column Rating;

-- 11.Create a backup table named Movies_Backup using the structure and data of the Movies table

-- 12.Display the structure of all four tables
desc Bookings;
desc Customers;
desc Movies;
desc Cinema_Halls;

-- 13.Display all databases available in MySQL
show databases;

-- 14. Delete the entire Movies_Backup table from the database
drop table Movies_Backup;

-- 15.	Delete all bookings where the number of tickets is 0
delete from Bookings
where Tickets = 0;

-- 16.A particular customer permanently deleted their account. Delete the customer whose Customer_ID is 105
delete from Customers
where Customer_ID = 105;

-- 17.A theatre has stopped operating. Delete the theatre record with Theatre_ID = 4
delete from Cinema_Halls
where Theatre_ID = 4;

-- 18.Remove all booking records made before 2025-01-01.


-- 19.Delete all movies belonging to the Horror genre.
delete from Movies
where Genre = "Horror";

-- 20.A movie is no longer available in the application. Delete the movie with Movie_ID = 110
delete from Movies
where Movie_ID = 110;

-- 21.Delete all customers whose age is below 18
delete from Customers
where Age < 18;

-- 22.The management wants to clear all booking records while keeping the Bookings table structure. Write a query for this requirement.
truncate table Bookings;