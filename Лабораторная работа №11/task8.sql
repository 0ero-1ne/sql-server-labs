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

begin tran
	insert GOODS values ('Блокнот', 1);
	print @@trancount;
	begin tran
		update ORDERS set Good = 'Блокнот' where Good = 'Синяя шариковая ручка';
		print @@trancount;
	commit tran;
commit tran;

select count(*) 'Goods блокнот' from GOODS where Name = 'Блокнот';
select count(*) 'Orders блокнот' from ORDERS where Good = 'Блокнот';

drop table GOODS;
drop table ORDERS;