/* Aggregate Functions */

create database NetflixDB;
use NetflixDB;

create table Netflix(
	show_id int primary key,
    title varchar(100),
    genre varchar(50),
    country varchar(50),
    release_year int,
    rating decimal(3,1),
    total_views int,
    show_type varchar(20)
);

insert into Netflix values
(1,  'Stranger Things', 'Sci-Fi',   'USA',     2016, 9.0, 500000, 'Series'),
(2,  'Dark',            'Sci-Fi',   'Germany', 2017, 8.7, 300000, 'Series'),
(3,  'Money Heist',     'Crime',    'Spain',   2018, 8.5, 700000, 'Series'),
(4,  'Extraction',      'Action',   'USA',     2020, 7.5, 800000, 'Movie'),
(5,  'Wednesday',       'Comedy',   'USA',     2022, 8.2, 600000, 'Series'),
(6,  'RRR',             'Action',   'India',   2022, 8.8, 900000, 'Movie'),
(7,  'Leo',             'Action',   'India',   2023, 7.8, 750000, 'Movie'),
(8,  'Lupin',           'Crime',    'France',  2021, 7.9, 400000, 'Series'),
(9,  'The Platform',    'Thriller', 'Spain',   2019, 7.0, 250000, 'Movie'),
(10, 'Dangal',          'Drama',    'India',   2016, 8.4, 650000, 'Movie');

select * from Netflix;

-- count => no. of occurences
-- 1.count total rows
select count(*) as Total_rows
from Netflix;

-- 2.count only movies
select count(*) as Total_Movies
from Netflix
where show_type = "Movie";

-- sum()
-- 3.sum of total views
select sum(total_views) as Total_views from Netflix;

-- avg()
-- 4. average of rating
select avg(rating) as Average_Rating
from Netflix;

-- min()
-- 5. Minimum views
select min(total_views) as Min_total_views
from Netflix;

-- max()
-- 6. Maximum views
select max(total_views) as Max_total_views
from Netflix;

-- group by
-- 7. Group By Genre
select genre,count(*) as Total
from netflix
group by genre;

-- 8.Total Views by Genre
select genre,sum(total_views) as Total_Views
from netflix
group by genre;

-- 9.Average rating by genre
select genre,avg(rating) as Average_Rating
from netflix
group by genre;

-- 10. Highest Rated title in each genre
select genre,title,
max(rating) as Highest_Rating_Title
from netflix
group by genre,title;

-- 11. Minimum and Maximum Views by Genre
select genre,min(total_views) as Minimum_Views,
max(total_views) as Maximum_Views
from netflix
group by genre;

-- having
select genre,count(*) as Total_Title
from netflix
group by genre
having count(*) >= 2;

-- 13.Find countries having more than 1 movie
select country,count(*) as Total_Movies
from Netflix
where show_type = "Movie" 
group by country
having count(*) > 1;

-- 14.Find genre having average ratings above 8
select genre,avg(rating) as Average_Rating
from Netflix
group by genre
having avg(rating) > 8;

-- 15.Show the 5 records with least rating
select genre,rating
from Netflix
group by genre,rating
order by rating
limit 5;

-- 16.How many Movies and Series are there in each country
select country,
count("Movie") as Total_Movies,
count("Series") as Total_Series
from netflix
group by country;

-- 17.Count Movies and Series separately
select sum(case when show_type = 'Movie' then 1 else 0 end) as Total_Movies,
sum(case when show_type = 'Series' then 1 else 0 end) as Total_Series
from Netflix;

-- 18.Count Movies and Series separately by country
select country,
sum(case when show_type = 'Movie' then 1 else 0 end) as Total_Movies,
sum(case when show_type = 'Series' then 1 else 0 end) as Total_Series
from Netflix
group by country;