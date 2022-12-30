use UNIVER;

create table GOODS
(
	Name varchar(50) primary key,
	Price int not null
);

insert into GOODS values ('Черная гелевая ручка', 2),
						 ('Синяя шариковая ручка', 1),
						 ('Красная гелевая ручка', 2);

create table ORDERS
(
	Good varchar(50),
	Qty int not null
);

insert into ORDERS values ('Черная гелевая ручка', 3),
						   ('Синяя шариковая ручка', 1),
						   ('Красная гелевая ручка', 2);

select * from GOODS;

begin tran;
	insert GOODS values ('Блокнот', 1);
	waitfor delay '00:00:05';
rollback tran;

drop table GOODS;
drop table ORDERS

-----------------------------------------------------------------------------

create table GOODS
(
	Name varchar(50) primary key,
	Price int not null
);

insert into GOODS values ('Черная гелевая ручка', 2),
						 ('Синяя шариковая ручка', 1),
						 ('Красная гелевая ручка', 2);

create table ORDERS
(
	Good varchar(50),
	Qty int not null
);

insert into ORDERS values ('Черная гелевая ручка', 3),
						   ('Синяя шариковая ручка', 1),
						   ('Красная гелевая ручка', 2);

begin tran
 update ORDERS set Qty = 5 where Good like 'Синяя шариковая ручка';
 waitfor delay '00:00:05';
rollback tran;

select * from GOODS;

drop table GOODS;
drop table ORDERS;

---------------------------------------------------------------------------------------

create table GOODS
(
	Name varchar(50) primary key,
	Price int not null
);

insert into GOODS values ('Черная гелевая ручка', 2),
						 ('Синяя шариковая ручка', 1),
						 ('Красная гелевая ручка', 2);

create table ORDERS
(
	Good varchar(50),
	Qty int not null
);

insert into ORDERS values ('Черная гелевая ручка', 3),
						   ('Синяя шариковая ручка', 1),
						   ('Красная гелевая ручка', 2);

begin tran;
	insert GOODS values ('Блокнот', 1);
	waitfor delay '00:00:05';
rollback tran;

select * from GOODS;

drop table GOODS;
drop table ORDERS;