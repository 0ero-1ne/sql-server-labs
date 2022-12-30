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

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_DEL')
	drop trigger TR_TEACHER_DEL;
go

create trigger TR_TEACHER_DEL on TEACHER after delete
as
declare @t char(10), @tn varchar(100), @g char(1), @p char(20), @del varchar(300);
print 'Delete opeartion: ';
set @t = (select TEACHER from deleted);
set @tn = (select TEACHER_NAME from deleted)
set @g = (select GENDER from deleted);
set @p = (select PULPIT from deleted);
set @del = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
insert into TR_AUDIT(STMT, TRNAME, CC) values('DEL', 'TR_TEACHER_DEL', @del);
return;
go

delete from TEACHER where TEACHER.TEACHER = 'ÂËÊÂ';
select * from TR_AUDIT;