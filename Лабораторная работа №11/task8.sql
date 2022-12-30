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

begin tran
	insert GOODS values ('�������', 1);
	print @@trancount;
	begin tran
		update ORDERS set Good = '�������' where Good = '����� ��������� �����';
		print @@trancount;
	commit tran;
commit tran;

select count(*) 'Goods �������' from GOODS where Name = '�������';
select count(*) 'Orders �������' from ORDERS where Good = '�������';

drop table GOODS;
drop table ORDERS;