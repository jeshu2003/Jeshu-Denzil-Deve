/* GenAI Application – SQL Data Types and Constraints */
-- 1.Create Database: GenAI_App
create database GenAI_App;
use GenAI_App;

/* 
2.Create a table named Users with the following columns:
• user_id – Integer, Primary Key
• username – Maximum 50 characters, cannot be NULL
• email – Maximum 100 characters, must be unique
• age – Integer, must be 18 or above
• phone – Fixed 10 characters
• registration_date – Date
• account_status – Default value should be 'Active'
*/
create table Users(
	user_id int primary key,
    username varchar(50) not null,
    email varchar(100) unique,
    age int check (age >= 18),
    phone varchar(10),
    registration_date date,
    account_status varchar(50) default 'Active'
);

/* 
3. Create a table named AI_Models with:
• model_id – Integer, Primary Key
• model_name – Maximum 50 characters, cannot be NULL
• model_version – Maximum 20 characters
• is_available – Boolean, default value TRUE
*/
create table AI_Models(
	model_id int primary key,
    model_name varchar(50) not null,
    model_version varchar(20),
    is_available boolean default TRUE
);

/* 
4. Create a table named Conversations with:
• chat_id – Integer, Primary Key
• user_id – Integer, Foreign Key referencing Users
• model_id – Integer, Foreign Key referencing AI_Models
• user_prompt – Text, cannot be NULL
• ai_response – Text
• token_count – Integer, must be zero or above
• chat_time – Date and Time
*/
create table Conversations(
	chat_id int primary key,
    user_id int,
    model_id int,
    user_prompt text not null,
    ai_response text,
    token_count int check (token_count >= 0),
    chat_time datetime,
    foreign key (user_id) references Users(user_id),
    foreign key (model_id) references AI_Models(model_id)
);

/* Payments Table */
create table Payments (
    payment_id int primary key,
    user_id int,
    amount decimal(10,2),
    payment_date datetime,
    payment_status varchar(20) default 'Pending',
    foreign key (user_id) references Users(user_id)
);

insert into Users values
(1, 'Arun', 'arun@gmail.com', 22, '9876543210', '2026-01-10', 'Active'),
(2, 'Bala', 'bala@gmail.com', 28, '9876543211', '2026-01-12', 'Active'),
(3, 'Charan', 'charan@gmail.com', 19, '9876543212', '2026-02-05', 'Inactive'),
(4, 'David', 'david@gmail.com', 32, '9876543213', '2026-02-15', 'Active'),
(5, 'Ezhil', 'ezhil@gmail.com', 25, '9876543214', '2026-03-01', 'Active'),
(6, 'Farhan', 'farhan@gmail.com', 30, '9876543215', '2026-03-10', 'Inactive'),
(7, 'Gokul', 'gokul@gmail.com', 21, '9876543216', '2026-04-02', 'Active'),
(8, 'Hari', 'hari@gmail.com', 27, '9876543217', '2026-04-12', 'Active'),
(9, 'Imran', 'imran@gmail.com', 35, '9876543218', '2026-05-01', 'Active'),
(10, 'John', 'john@gmail.com', 24, '9876543219', '2026-05-15', 'Inactive');

insert into AI_Models values
(101, 'GPT-4', '4.0', TRUE),
(102, 'GPT-3.5', '3.5', TRUE),
(103, 'Gemini', '1.5', TRUE),
(104, 'Claude', '3.0', TRUE),
(105, 'Llama', '3.1', FALSE),
(106, 'Mistral', '7B', TRUE),
(107, 'DeepSeek', 'R1', FALSE),
(108, 'PaLM', '2.0', FALSE),
(109, 'Cohere', 'Command-R', TRUE),
(110, 'Phi', '3.0', TRUE);

insert into Conversations values
(1001, 1, 101, 'Explain Python', 'Python is a programming language.', 250, '2026-06-01 09:30:00'),
(1002, 2, 102, 'Explain SQL', 'SQL is used to manage databases.', 350, '2026-06-02 10:15:00'),
(1003, 3, 103, 'What is AI?', 'AI stands for Artificial Intelligence.', 600, '2026-06-03 11:00:00'),
(1004, 4, 104, 'Explain Machine Learning', 'ML enables computers to learn from data.', 750, '2026-06-04 12:30:00'),
(1005, 5, 105, 'What is Deep Learning?', 'Deep Learning uses neural networks.', 450, '2026-06-05 13:45:00'),
(1006, 6, 106, 'Explain RAG', 'RAG combines retrieval and generation.', 900, '2026-06-06 14:00:00'),
(1007, 7, 107, 'What is NLP?', 'NLP helps computers understand language.', 150, '2026-06-07 15:20:00'),
(1008, 8, 108, 'Explain Neural Networks', 'Neural networks are inspired by the human brain.', 800, '2026-06-08 16:10:00'),
(1009, 9, 109, 'What is Python used for?', 'Python is used in web development and AI.', 550, '2026-06-09 17:30:00'),
(1010, 10, 110, 'Explain Data Science', 'Data Science extracts insights from data.', 300, '2026-06-10 18:00:00');

insert into Payments values
(201, 1, 250.00, '2026-06-01 10:00:00', 'Completed'),
(202, 2, 750.00, '2026-06-02 11:00:00', 'Completed'),
(203, 3, 450.00, '2026-06-03 12:00:00', 'Pending'),
(204, 4, 1200.00, '2026-06-04 13:00:00', 'Completed'),
(205, 5, 500.00, '2026-06-05 14:00:00', 'Completed'),
(206, 6, 850.00, '2026-06-06 15:00:00', 'Failed'),
(207, 7, 150.00, '2026-06-07 16:00:00', 'Completed'),
(208, 8, 2000.00, '2026-06-08 17:00:00', 'Completed'),
(209, 9, 650.00, '2026-06-09 18:00:00', 'Pending'),
(210, 10, 350.00, '2026-06-10 19:00:00', 'Completed');

/* 
Queries and Tasks
7.Display all records from the four tables.
8.Display only the username and email of all users.
9.Display users whose age is greater than 25.
10.Display AI models that are currently available.
11.Display conversations where token_count is greater than 500.
12.Display payments with an amount greater than ₹500.
13.Try inserting a duplicate email into the Users table. Observe the result.
14.Try inserting a user below 18 years of age. Observe the result.
15.Insert a payment without specifying payment_status. Check the default value.
*/

-- 1.Display all records from the four tables
select * from Users;
select * from AI_Models;
select * from Conversations;
select * from Payments;

-- 2.Display only the username and email of all users
select username,email from Users;

-- 3.Display users whose age is greater than 25
select * from Users
where age > 25;

-- 4.Display AI Models that are currently available
select * from AI_Models
where is_available = TRUE;

-- 5.Display Conversations where token_count is greater than 500
select * from Conversations
where token_count > 500;

-- 6.Display Payments with an amount greater than 500
select * from Payments
where amount > 500;

-- 7.Try inserting a duplicate email into the Users table. Observe the result
insert into Users values
(11,"Jeshu","david@gmail.com",23,8015012051,"2025-11-15","Active");

-- 8.Try inserting a user below 18 years of age. Observe the result
insert into Users values
(12,"Adam","adam21@gmail.com",15,7512095610,"2025-01-23","Active");

-- 9.Insert a payment without specifying payments_status.check the default value 
insert into Payments (payment_id,user_id,amount,payment_date)
values (211,10,1500.05,"2026-10-20 01:15:25");
select * from Payments
where payment_id = 211;
