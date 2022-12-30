use UNIVER;
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

if exists (select 1 from sys.triggers where name = 'TR_TEACHER_TRAN')
	drop trigger TR_TEACHER_TRAN;
go

create trigger TR_TEACHER_TRAN on TEACHER after insert, delete, update
as
declare @c int = (select count(*) from TEACHER);
	if (@c > 25)
	begin
		raiserror('Amount of teachers cannot be over 21', 10, 1);
		rollback;
	end;
return;
go

insert into TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT) values('ВЛКВ','Воликов Дмитрий Анатольевич','м','ИСиТ');