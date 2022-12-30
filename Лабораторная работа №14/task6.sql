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

if exists (select 1 from sys.triggers where name = 'TR_TEACHER')
	drop trigger TR_TEACHER;
go

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_INS')
	drop trigger TR_TEACHER_INS;
go

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_DEL')
	drop trigger TR_TEACHER_DEL;
go

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_UPD')
	drop trigger TR_TEACHER_UPD;
go

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_DEL1')
	drop trigger TR_TEACHER_DEL1;
go

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_DEL2')
	drop trigger TR_TEACHER_DEL2;
go

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_DEL3')
	drop trigger TR_TEACHER_DEL3;
go

create trigger TR_TEACHER_DEL1 on TEACHER after delete
as
declare @t char(10), @tn varchar(100), @g char(1), @p char(20), @del varchar(300);
print 'TR_TEACHER_DEL1';
	set @t = (select TEACHER from deleted);
	set @tn = (select TEACHER_NAME from deleted)
	set @g = (select GENDER from deleted);
	set @p = (select PULPIT from deleted);
	set @del = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
insert into TR_AUDIT(STMT, TRNAME, CC) values('DEL', 'TR_TEACHER_DEL1', @del);
return;
go

create trigger TR_TEACHER_DEL2 on TEACHER after delete
as
declare @t char(10), @tn varchar(100), @g char(1), @p char(20), @del varchar(300);
print 'TR_TEACHER_DEL2';
	set @t = (select TEACHER from deleted);
	set @tn = (select TEACHER_NAME from deleted)
	set @g = (select GENDER from deleted);
	set @p = (select PULPIT from deleted);
	set @del = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
insert into TR_AUDIT(STMT, TRNAME, CC) values('DEL', 'TR_TEACHER_DEL2', @del);
return;
go

create trigger TR_TEACHER_DEL3 on TEACHER after delete
as
declare @t char(10), @tn varchar(100), @g char(1), @p char(20), @del varchar(300);
print 'TR_TEACHER_DEL3';
	set @t = (select TEACHER from deleted);
	set @tn = (select TEACHER_NAME from deleted)
	set @g = (select GENDER from deleted);
	set @p = (select PULPIT from deleted);
	set @del = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
insert into TR_AUDIT(STMT, TRNAME, CC) values('DEL', 'TR_TEACHER_DEL3', @del);
return;
go

exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL3', @order = 'First', @stmttype = 'DELETE';
exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL2', @order = 'Last', @stmttype = 'DELETE';

select t.name,
	   e.type_desc 
from sys.triggers t
join sys.trigger_events e  
on t.object_id = e.object_id where OBJECT_NAME(t.parent_id) = 'TEACHER' and e.type_desc = 'DELETE' ;

delete from TEACHER where TEACHER.TEACHER = 'ÂËÊÂ';
select * from TR_AUDIT;