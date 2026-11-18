/* Sub-query and Windows Function */
CREATE DATABASE Netflix_DB;
USE Netflix_DB;

CREATE TABLE Netflix_Content (
    content_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    content_type VARCHAR(20),
    release_year INT,
    duration INT,
    rating DECIMAL(3,1),
    views INT,
    country VARCHAR(50)
);

INSERT INTO Netflix_Content VALUES
(1,'Dark','Sci-Fi','Series',2017,50,8.8,95000,'Germany'),
(2,'Stranger Things','Sci-Fi','Series',2016,55,8.7,98000,'USA'),
(3,'Breaking Bad','Crime','Series',2008,48,9.5,99000,'USA'),
(4,'Money Heist','Crime','Series',2017,45,8.2,97000,'Spain'),
(5,'Wednesday','Comedy','Series',2022,40,7.8,92000,'USA'),
(6,'The Crown','Drama','Series',2016,55,8.6,85000,'UK'),
(7,'Squid Game','Thriller','Series',2021,50,8.0,99000,'South Korea'),
(8,'Lupin','Crime','Series',2021,45,7.5,78000,'France'),
(9,'Narcos','Crime','Series',2015,50,8.8,89000,'USA'),
(10,'The Witcher','Fantasy','Series',2019,55,7.9,87000,'USA'),
(11,'Extraction','Action','Movie',2020,116,6.8,95000,'USA'),
(12,'Bird Box','Thriller','Movie',2018,124,6.6,88000,'USA'),
(13,'Enola Holmes','Mystery','Movie',2020,123,6.7,75000,'UK'),
(14,'The Gray Man','Action','Movie',2022,122,6.5,82000,'USA'),
(15,'Red Notice','Action','Movie',2021,118,6.3,91000,'USA'),
(16,'Dangal','Drama','Movie',2016,161,8.3,96000,'India'),
(17,'RRR','Action','Movie',2022,187,8.0,99000,'India'),
(18,'Jawan','Action','Movie',2023,169,7.0,98000,'India'),
(19,'Leo','Action','Movie',2023,164,7.2,97000,'India'),
(20,'The Irishman','Crime','Movie',2019,209,7.8,70000,'USA'),
(21,'Lucifer','Fantasy','Series',2016,45,8.1,91000,'USA'),
(22,'Elite','Drama','Series',2018,50,7.3,83000,'Spain'),
(23,'Dark Desire','Thriller','Series',2020,40,6.5,68000,'Mexico'),
(24,'You','Thriller','Series',2018,45,7.7,90000,'USA'),
(25,'Ozark','Crime','Series',2017,60,8.5,86000,'USA'),
(26,'Vikings','History','Series',2013,45,8.5,89000,'Canada'),
(27,'The Last Kingdom','History','Series',2015,55,8.5,84000,'UK'),
(28,'Peaky Blinders','Crime','Series',2013,55,8.8,93000,'UK'),
(29,'Cobra Kai','Action','Series',2018,35,8.4,81000,'USA'),
(30,'Manifest','Drama','Series',2018,45,7.1,79000,'USA'),
(31,'The Adam Project','Sci-Fi','Movie',2022,106,6.7,86000,'USA'),
(32,'Interstellar','Sci-Fi','Movie',2014,169,8.7,99000,'USA'),
(33,'Inception','Sci-Fi','Movie',2010,148,8.8,97000,'USA'),
(34,'The Platform','Thriller','Movie',2019,94,7.0,76000,'Spain'),
(35,'The Killer','Thriller','Movie',2023,118,6.7,65000,'USA'),
(36,'The Mother','Action','Movie',2023,115,5.6,85000,'USA'),
(37,'The Old Guard','Action','Movie',2020,125,6.7,80000,'USA'),
(38,'Army of the Dead','Action','Movie',2021,148,5.8,77000,'USA'),
(39,'Glass Onion','Mystery','Movie',2022,139,7.1,88000,'USA'),
(40,'Knives Out','Mystery','Movie',2019,130,7.9,94000,'USA'),
(41,'The Queen’s Gambit','Drama','Series',2020,50,8.5,96000,'USA'),
(42,'Bridgerton','Romance','Series',2020,55,7.3,90000,'UK'),
(43,'Heartstopper','Romance','Series',2022,30,8.6,72000,'UK'),
(44,'One Piece','Adventure','Series',2023,60,8.3,97000,'Japan'),
(45,'Alice in Borderland','Thriller','Series',2020,45,7.7,93000,'Japan'),
(46,'Kingdom','Horror','Series',2019,50,8.3,85000,'South Korea'),
(47,'All of Us Are Dead','Horror','Series',2022,55,7.5,89000,'South Korea'),
(48,'The Glory','Drama','Series',2022,50,8.2,94000,'South Korea'),
(49,'Physical 100','Reality','Series',2023,60,7.7,80000,'South Korea'),
(50,'Sweet Home','Horror','Series',2020,50,7.2,82000,'South Korea'),
(51,'The Social Dilemma','Documentary','Movie',2020,94,7.6,75000,'USA'),
(52,'Our Planet','Documentary','Series',2019,50,9.0,92000,'UK'),
(53,'The Tinder Swindler','Documentary','Movie',2022,114,7.1,87000,'UK'),
(54,'Formula 1','Documentary','Series',2019,45,8.5,95000,'UK'),
(55,'My Octopus Teacher','Documentary','Movie',2020,85,8.1,70000,'South Africa'),
(56,'The Sea Beast','Animation','Movie',2022,115,7.1,80000,'USA'),
(57,'Klaus','Animation','Movie',2019,96,8.2,78000,'Spain'),
(58,'Leo','Animation','Movie',2023,102,7.0,86000,'USA'),
(59,'Vivo','Animation','Movie',2021,95,6.7,74000,'USA'),
(60,'Wish Dragon','Animation','Movie',2021,98,7.2,76000,'China'),
(61,'The Office','Comedy','Series',2005,25,9.0,96000,'USA'),
(62,'Friends','Comedy','Series',1994,22,8.9,99000,'USA'),
(63,'Brooklyn Nine-Nine','Comedy','Series',2013,22,8.4,93000,'USA'),
(64,'Emily in Paris','Romance','Series',2020,30,6.9,88000,'France'),
(65,'The Good Place','Comedy','Series',2016,25,8.2,82000,'USA'),
(66,'Top Boy','Crime','Series',2011,50,8.4,76000,'UK'),
(67,'The Rain','Sci-Fi','Series',2018,45,6.3,67000,'Denmark'),
(68,'Ragnarok','Fantasy','Series',2020,45,7.3,71000,'Norway'),
(69,'The Sandman','Fantasy','Series',2022,50,7.7,89000,'UK'),
(70,'Shadow and Bone','Fantasy','Series',2021,50,7.5,73000,'USA'),
(71,'The Highwaymen','Crime','Movie',2019,132,6.9,62000,'USA'),
(72,'The Trial of the Chicago 7','Drama','Movie',2020,129,7.7,80000,'USA'),
(73,'Ma Rainey','Drama','Movie',2020,94,6.9,68000,'USA'),
(74,'The Power of the Dog','Drama','Movie',2021,126,6.8,65000,'UK'),
(75,'The Dig','Drama','Movie',2021,112,7.1,71000,'UK'),
(76,'The White Tiger','Drama','Movie',2021,125,7.1,92000,'India'),
(77,'Gangubai Kathiawadi','Drama','Movie',2022,154,7.8,90000,'India'),
(78,'RRR Behind Scenes','Documentary','Movie',2022,45,7.5,60000,'India'),
(79,'Paatal Lok','Crime','Series',2020,45,8.0,85000,'India'),
(80,'Delhi Crime','Crime','Series',2019,50,8.5,88000,'India'),
(81,'Sacred Games','Crime','Series',2018,50,8.5,93000,'India'),
(82,'Kota Factory','Drama','Series',2019,40,9.0,95000,'India'),
(83,'Aspirants','Drama','Series',2021,45,9.1,97000,'India'),
(84,'Little Things','Romance','Series',2016,25,8.2,70000,'India'),
(85,'Mismatched','Romance','Series',2020,35,5.8,78000,'India'),
(86,'She','Crime','Series',2020,40,6.4,72000,'India'),
(87,'The Family Man','Action','Series',2019,50,8.7,99000,'India'),
(88,'Farzi','Crime','Series',2023,50,8.4,96000,'India'),
(89,'Asur','Thriller','Series',2020,45,8.5,89000,'India'),
(90,'Drishyam','Thriller','Movie',2015,160,8.2,98000,'India'),
(91,'Andhadhun','Thriller','Movie',2018,139,8.2,93000,'India'),
(92,'Article 15','Crime','Movie',2019,130,8.1,81000,'India'),
(93,'Tumbbad','Horror','Movie',2018,104,8.2,75000,'India'),
(94,'Bulbbul','Horror','Movie',2020,94,6.6,68000,'India'),
(95,'Ludo','Comedy','Movie',2020,150,7.6,84000,'India'),
(96,'Badhaai Do','Comedy','Movie',2022,147,7.0,73000,'India'),
(97,'Chennai Express','Comedy','Movie',2013,141,6.0,90000,'India'),
(98,'Jamtara','Crime','Series',2020,30,7.3,77000,'India'),
(99,'Guns & Gulaabs','Comedy','Series',2023,45,7.7,82000,'India'),
(100,'Kaala Paani','Drama','Series',2023,45,7.6,86000,'India');

select * from Netflix_Content;

-- 1.Find the highest rate content
select * from Netflix_Content
where rating = (select max(rating) from Netflix_Content);

-- 2.Display all the content belonging to genre that have at least one Indian title
select * from Netflix_Content
where genre in (select distinct genre from Netflix_Content
where country = "India");

-- 3.Find the content with ratings greater than all / any  ratings of comedy genre
select * from Netflix_Content
where rating > all(select rating from Netflix_Content
where genre="Comedy"); 

select * from Netflix_Content
where rating > any(select rating from Netflix_Content
where genre="Comedy");

 -- 4. Find the content who's rating is greater than its genre's average rating
 select * from Netflix_Content N1
 where rating > (select avg(rating) from Netflix_Content N2
 where N2.genre = N1.genre);
 
 -- SUB-QUERY + WINDOWS FUNCTION
 -- 5. Find the top 3 high rated content for each genre
 select * from
 (select Title,genre,rating,dense_rank() over(partition by genre
 order by rating desc) as Genre_Rank
 from Netflix_Content) as Ranked_Content
 where Genre_Rank <= 3;
 
 -- 6. Find the highest viewed content in each country
 select * from
 (select Title,Genre,Views,Country,row_number() over(partition by country
 order by views desc) as Row_Num from Netflix_Content) as Content
 where Row_Num = 1;
 
 -- 7. Find the second_highest rating content from each genre
 select * from
 (select Title,Genre,Rating,dense_rank() over(partition by genre order by rating desc)
 as Second_Rank from Netflix_Content) as Content
 where Second_Rank = 2;
 
 -- 8. Find the highest rated movie in every country
 select * from
 (select Title,Genre,Country,Content_Type,Rating,dense_rank() over(partition by country order by rating desc)
 as Rank_No from Netflix_Content
 where Content_Type = 'Movie') as Content_Type
 where Rank_No = 1;
 
 -- 9.Find the top 2 most viewed movies in each genre
 select * from
 (select Title,Genre,Content_Type,Views,dense_rank() over(partition by genre order by views desc)
 as Most_Viewed from Netflix_Content where Content_Type = "Movie") as Movies
 where Most_Viewed <= 2;
 
 -- 10. Find genre whose avg rating is greater than overall rating
 select distinct genre, Avg_Genre_Rating, Overall_Rating
from(SELECT genre,AVG(rating) OVER () AS Overall_Rating, AVG(rating) OVER (PARTITION BY genre) AS Avg_Genre_Rating from Netflix_Content
) AS Genre_Rating WHERE Avg_Genre_Rating > Overall_Rating;
 -- lag
 select *,lag(views) over(partition by genre order by release_year) as pre_views
 from Netflix_Content;
 
-- lead 
select *,lead(views) over(partition by genre order by release_year) as pre_views
from Netflix_Content;

-- to display all the content with 8 above is high raring,5 above is mid rating and below 5 is low rating using subquery
select * from(
select *,
case
when rating >= 8 then "High Rating"
when rating >= 5 then "Medium Rating"
else "Low Rating"
end as Rating_Category from netflix_content) as Netflix;