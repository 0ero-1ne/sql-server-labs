use UNIVER;
go

if object_id (N'TR_AUDIT', N'U') is null
create table TR_AUDIT
(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),
	TRNAME varchar(50),
	CC varchar(300)
);
go

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_INS')
	drop trigger TR_TEACHER_INS;
go

create trigger TR_TEACHER_INS on TEACHER after insert
as
declare @t char(10), @tn varchar(100), @g char(1), @p char(20), @in varchar(300);
print 'Insert operation: ';
set @t = (select TEACHER from inserted);
set @tn = (select TEACHER_NAME from inserted)
set @g = (select GENDER from inserted);
set @p = (select PULPIT from inserted);
set @in = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
insert into TR_AUDIT(STMT, TRNAME, CC) values('INS', 'TR_TEACHER_INS', @in);
return;
go

insert into TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT) values('ВЛКВ','Воликов Дмитрий Анатольевич','м','ИСиТ');
insert into TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT) values('ЕРХВЦ','Ероховец Иван Александрович','м','ИСиТ');
insert into TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT) values('АНДРШК','Андрушок Андрей Русланович','м','ИСиТ');

select * from TR_AUDIT;