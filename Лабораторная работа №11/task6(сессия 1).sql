use UNIVER;

create table GOODS
(
	Name varchar(50) primary key,
	Price int not null
);

insert into GOODS values ('������ ������� �����', 2),
						 ('����� ��������� �����', 1),
						 ('������� ������� �����', 2);

create table ORDERS
(
	Good varchar(50),
	Qty int not null
);

insert into ORDERS values ('������ ������� �����', 3),
						   ('����� ��������� �����', 1),
						   ('������� ������� �����', 2);

select * from GOODS;

begin tran;
	insert GOODS values ('�������', 1);
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

insert into GOODS values ('������ ������� �����', 2),
						 ('����� ��������� �����', 1),
						 ('������� ������� �����', 2);

create table ORDERS
(
	Good varchar(50),
	Qty int not null
);

insert into ORDERS values ('������ ������� �����', 3),
						   ('����� ��������� �����', 1),
						   ('������� ������� �����', 2);

begin tran
 update ORDERS set Qty = 5 where Good like '����� ��������� �����';
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

insert into GOODS values ('������ ������� �����', 2),
						 ('����� ��������� �����', 1),
						 ('������� ������� �����', 2);

create table ORDERS
(
	Good varchar(50),
	Qty int not null
);

insert into ORDERS values ('������ ������� �����', 3),
						   ('����� ��������� �����', 1),
						   ('������� ������� �����', 2);

begin tran;
	insert GOODS values ('�������', 1);
	waitfor delay '00:00:05';
commit tran;

select * from GOODS;

drop table GOODS;
drop table ORDERS;