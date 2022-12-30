USE master;
GO

IF DB_ID('VOLK_MyBase') IS NOT NULL 
DROP DATABASE VOLK_MyBase;
GO

CREATE DATABASE VOLK_MyBase
ON PRIMARY
(
	name = N'VOLK_MyBase_mdf', filename = N'D:\Базы данных\Лабораторная работа №3\VOLK_MyBase_mdf.mdf',
	size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb
),
(
	name = N'VOLK_MyBase_ndf', filename = N'D:\Базы данных\Лабораторная работа №3\VOLK_MyBase_ndf.ndf',
	size = 10240Kb, maxsize = 1Gb, filegrowth = 25%
),
filegroup FG1
(
	name = N'VOLK_MyBase_fg1_1', filename = N'D:\Базы данных\Лабораторная работа №3\VOLK_MyBase_fg1_1.ndf',
	size = 10240Kb, maxsize = 1Gb, filegrowth = 25%
),
(
	name = N'VOLK_MyBase_fg1_2', filename = N'D:\Базы данных\Лабораторная работа №3\VOLK_MyBase_fg1_2.ndf',
	size = 10240Kb, maxsize = 1Gb, filegrowth = 25%
)
LOG ON
(
	name = N'VOLK_MyBase_log', filename = N'D:\Базы данных\Лабораторная работа №3\VOLK_MyBase_log.ldf',
	size = 10240Kb, maxsize = 2048Gb, filegrowth = 10%
);

GO

USE VOLK_MyBase;

CREATE TABLE providers
(
	provider_id int NOT NULL PRIMARY KEY,
	title nvarchar(50) UNIQUE
) on FG1;

CREATE TABLE addresses
(
	address_id int NOT NULL PRIMARY KEY,
	region nvarchar(25),
	city nvarchar(25),
	street nvarchar(25),
	house_number int,
	flat_num int
) on FG1;

CREATE TABLE customers
(
	customer_id int NOT NULL PRIMARY KEY,
	first_name nvarchar(25),
	second_name nvarchar(25),
	email nvarchar(50) UNIQUE,
	address_id int FOREIGN KEY REFERENCES addresses(address_id),
	phone nchar(13)
) on FG1;

CREATE TABLE details
(
	detail_id int NOT NULL PRIMARY KEY,
	sku nvarchar(15),
	title nvarchar(100),
	in_stock int,
	price real,
	provider_id int FOREIGN KEY REFERENCES providers(provider_id)
) on FG1;

CREATE TABLE orders
(
	order_id int NOT NULL PRIMARY KEY,
	detail_id int FOREIGN KEY REFERENCES details(detail_id),
	customer_id int FOREIGN KEY REFERENCES customers(customer_id),
	amount int,
	note varchar(MAX),
	order_date date
) on FG1;

ALTER TABLE addresses DROP COLUMN flat_num;
ALTER TABLE addresses ADD flat_number int CHECK(flat_number > 0);

INSERT INTO providers VALUES (1, 'Dmitry co.'), 
						     (2, 'Dororo'), 
							 (3, 'Master-lomaster'),
							 (4, 'Domorad'),
							 (5, 'Boka-Boka');

INSERT INTO addresses VALUES (1, 'Brest', 'Ivanovo', 'Proselochnaya', 31, NULL),
						     (2, 'Minsk', 'Minsk', 'Bobruiskaya', 25, 418),
							 (3, 'Minsk', 'Minsk', 'Sverdlova', 13, NULL);

INSERT INTO customers VALUES (1, 'Dmitry', 'Volikov', 'volikovd17@gmail.com', 2, '+375292543689'),
						     (2, 'Ivan', 'Erokhovets', 'ivan.erokhovets@gmail.com', 2, '+375298889944'),
							 (3, 'Polina', 'Volikova', 'polina.volikova@gmail.com', 1, '+375334445566'),
							 (4, 'Timofey', 'Volikov', 'timofey.volikov@gmail.com', 1, '+375292979869');

INSERT INTO details VALUES (1, 'GHUI8899', 'Hammer "Storm"', 5, 7.66, 3),
						   (2, 'BKJBDLLS', 'Red LED', 25, 0.15, 1),
						   (3, 'KHB398HF', 'Semiconductor NF7889', 24, 1.25, 1),
						   (4, 'JBS6D991', 'Kurama mask 25/46 cm', 4, 2.45, 2),
						   (5, 'ISDUV8SW', 'Yellow LED', 30, 0.15, 4),
						   (6, 'S6VASUIS', 'Green LED', 30, 0.15, 4),
						   (7, 'NDOW9998', 'Black LED', 30, 0.15, NULL);

INSERT INTO orders VALUES (1, 1, 1, 2, 'NOTE #1', '2022/10/8'),
						  (2, 1, 2, 1, 'NOTE #2', '2021/10/8'),
						  (3, 4, 3, 2, 'NOTE #3', '2020/10/8'),
						  (4, 2, 1, 10, 'NOTE #4', '2019/10/8'),
						  (5, 6, 4, 10, 'NOTE #5', '2022/10/15'),
						  (6, 5, 4, 10, 'NOTE #6', '2022/10/15');