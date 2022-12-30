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

create trigger TR_TEACHER on TEACHER after INSERT, DELETE, UPDATE  
as
declare @t char(10), @tn varchar(100), @g char(1), @p char(20), @res varchar(300);
declare @ins int = (select count(*) from inserted),
        @del int = (select count(*) from deleted);
		
if  @ins > 0 and  @del = 0  
begin 
    print 'Insert event: ';
    set @t = (select TEACHER from inserted);
	set @tn = (select TEACHER_NAME from inserted)
	set @g = (select GENDER from inserted);
	set @p = (select PULPIT from inserted);
	set @res = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
    insert into TR_AUDIT(STMT, TRNAME, CC) values('INS', 'TR_TEACHER', @res);
end; 
else		  	 
if @ins = 0 and  @del > 0  
begin 
    print 'Delete event: ';
    set @t = (select TEACHER from deleted);
	set @tn = (select TEACHER_NAME from deleted)
	set @g = (select GENDER from deleted);
	set @p = (select PULPIT from deleted);
	set @res = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);
	insert into TR_AUDIT(STMT, TRNAME, CC) values('DEL', 'TR_TEACHER', @res);
end; 
else	  
if @ins > 0 and  @del > 0  
begin 
    print 'Update event: '; 
    set @t = (select TEACHER from inserted);
	set @tn = (select TEACHER_NAME from inserted)
	set @g = (select GENDER from inserted);
	set @p = (select PULPIT from inserted);
	
	set @res = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p);

    set @t = (select TEACHER from deleted);
	set @tn = (select TEACHER_NAME from deleted)
	set @g = (select GENDER from deleted);
	set @p = (select PULPIT from deleted);
	
	set @res = rtrim(@t) + ' ' + rtrim(@tn) + ' ' + rtrim(@g) + ' ' + rtrim(@p) + ' ' + @res;
    
	insert into TR_AUDIT(STMT, TRNAME, CC) values('UPD', 'TR_TEACHER', @res); 
end;  
return;
go

insert into TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT) values('ВЛКВ','Воликов Дмитрий Анатольевич','м','ИСиТ');
delete from TEACHER where TEACHER.TEACHER = 'ЕРХВЦ';
update TEACHER set PULPIT = 'ПОиСОИ' where TEACHER.TEACHER = 'АНДРШК';

select * from TR_AUDIT;