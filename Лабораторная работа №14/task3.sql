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

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_UPD')
	drop trigger TR_TEACHER_UPD;
go

create trigger TR_TEACHER_UPD on TEACHER after update
as
declare @t char(10), @tn varchar(100), @g char(1), @p char(20), @upd varchar(300);
print 'Update operation: ';
set @t = (select TEACHER from inserted);
set @tn = (select TEACHER_NAME from inserted)
set @g = (select GENDER from inserted);
set @p = (select PULPIT from inserted);
set @upd = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
insert into TR_AUDIT(STMT, TRNAME, CC) values('UPD', 'TR_TEACHER_UPD', @upd);
return;
go


update TEACHER set PULPIT = 'œŒË—Œ»' where TEACHER.TEACHER = '≈–’¬÷';
select * from TR_AUDIT;