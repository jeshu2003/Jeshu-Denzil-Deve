/* Filtering and Sorting */
create database uberdb;
use uberdb;

create table uber_rides(
	ride_id int,
    customer_name varchar(35) not null,
    pickup_city varchar(35) not null,
    fare int not null,
    ride_status varchar(35) not null,
    driver_id int
);

insert into uber_rides values
(101,"Arun","Chennai",250,"Completed",501),
(102,"Priya","Bangalore",650,"Completed",502),
(103,"Karthik","Chennai",450,"Cancelled",503),
(104,"Divya","Hyderabad",900,"Completed",504), 
(105,"Ravi","Chennai",150,"Pending",NULL),
(106,"Meena","Bangalore",750,"Cancelled",506),
(107,"Suresh","Chennai",550,"Completed",507),
(108,"Nila","Hyderabad",300,"Pending",NULL);

select * from uber_rides;

-- where clause
-- 1. Find rides booked by Arun
select * from uber_rides
where customer_name = "Arun";

-- 2. Find rides from Chennai
select * from uber_rides
where pickup_city = "Chennai";

-- 3. Find driver_id is NULL
select * from uber_rides
where driver_id is null;

-- 4. pickup location is Chennai and fare is greater than
select * from uber_rides
where pickup_city = "Chennai" and fare > 300;

-- 5. find completed rides from Chennai using and
select * from uber_rides
where pickup_city = "Chennai" and ride_status = "Completed";

-- 6.to display all rides except cancelled rides
select * from uber_rides
where not ride_status="Cancelled";

-- Comparison Operators: =, !=, <, <=, >, >=
-- 7. find rides costing more than 500
select * from uber_rides
where fare > 500;

-- 8. find rides cost less than 200
select * from uber_rides
where fare < 200;

-- case when
-- 9. categorize ride fares
select ride_id, 
customer_name, 
fare,
case 
when fare >= 700 then "High Fare"
when fare >= 500 then "Medium Fare"
when fare >= 300 then "Low Fare"
else "NA"
end as fare_category from uber_rides;

-- 10. categorize ride status
select ride_id, customer_name,ride_status,
case 
when ride_status = "Completed" then "Ride Completed"
when ride_status = "Pending" then "Waiting for a driver"
when ride_status = "Cancelled" then "Ride Cancelled"
else "NA"
end as ride_category from uber_rides;

-- in operator
-- 11.retrieve data from Chennai and Hyderabad
select pickup_city from uber_rides;
select * from uber_rides
where pickup_city in ("Chennai","Hyderabad");

-- 12. fare price between 300 and 500
select * from uber_rides
where fare between 300 and 500;

-- like
/* S% - starts with
%a - ends with
%i% - contains letter
A___ - A followed by 3 characters
_ - 1 character
*/

-- 13.customer name starts with S
select * from uber_rides
where customer_name like "S%";

-- 14. ends with i 
select * from uber_rides
where customer_name like "%i";

-- 15. name containing letter r
select * from uber_rides
where customer_name like "%r%";

-- 16. names with exactly 4 characters
select * from uber_rides
where customer_name like "____";

-- is not null
-- 17.to identify all rides where customer is already assigned
select * from uber_rides
where driver_id is not NULL;

-- 18. order by fare ascending and descending
select * from uber_rides
order by fare;

-- 19. order by fare descending
select * from uber_rides
order by fare desc;

-- 20. display only three rides
select * from uber_rides
limit 3;

-- 21. display top 3 expensive rides
select * from uber_rides
order by fare desc
limit 3;

-- 22. display latest two bookings
select * from uber_rides
order by ride_id desc
limit 2;

-- offset
select * from uber_rides
limit 3 offset 3;

-- 23. Find unique cities
select distinct pickup_city 
from uber_rides;

-- 24. To find unique ride status
select distinct ride_status
from uber_rides;

-- 25. Find unique fares
select distinct fare
from uber_rides;

-- 26. to find unique pickup_city and ride_status
select distinct pickup_city,ride_status
from uber_rides;

-- 27. Find the top 2 expensive rides from chennai
select * from uber_rides
where pickup_city = "Chennai"
order by fare desc
limit 2;

-- 28. Display only two unique cities
select distinct pickup_city
from uber_rides
limit 2;

-- 29. Find 2 latest completed rides
select * from uber_rides
where ride_status = "Completed"
limit 2 offset 2;

/*Actvity*/
select * from uber_rides
where customer_name = "Priya";

select * from uber_rides
where pickup_city = "Bangalore";

select * from uber_rides
where fare > 400;

select * from uber_rides
where fare <= 300;

select * from uber_rides
where pickup_city = "Chennai" and ride_status = "Completed";

select * from uber_rides
where ride_status = "Pending" or ride_status = "Cancelled";

select * from uber_rides
where not ride_status = "Completed";

select * from uber_rides
where pickup_city in ("Chennai","Bangalore","Hyderabad");

select * from uber_rides
where fare between 200 and 600;

select * from uber_rides
where customer_name like "S%";

select * from uber_rides
where customer_name like "%a";

select * from uber_rides
where customer_name like "%i%";

select * from uber_rides
where driver_id is null;

select * from uber_rides
where driver_id is not null;

select * from uber_rides
order by fare;

select * from uber_rides
order by fare desc;

select * from uber_rides
order by fare desc
limit 2;

select distinct pickup_city
from uber_rides;

select distinct ride_status
from uber_rides;

select ride_id,customer_name,fare,
case
when fare >=700 then "High Fare"
when fare >=500 then "Medium Fare"
when fare >=300 then "Low Fare"
else "NA"
end as fare_category from uber_rides;