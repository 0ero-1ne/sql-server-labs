use UNIVER;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[PAUDITORIUM_INSERTX]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    DROP PROCEDURE [dbo].[PAUDITORIUM_INSERTX];
go

create procedure PAUDITORIUM_INSERTX @a char(20), @t char(10), @c int = 0, @n varchar(50), @tn varchar(30)
as
declare @rc int = 1;
begin try
	set transaction isolation level SERIALIZABLE;
	begin tran
		insert into AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) values (@t, @tn);
		exec @rc = PAUDITORIUM_INSERT @a, @t, @c, @n;
	commit tran;
	return @rc;
end try
begin catch
	print 'Error code: ' + cast(error_number() as varchar(6));
	print 'Error message: ' + error_message();
	print 'Error level: ' + cast(error_severity() as varchar(6));
	print 'Error state: ' + cast(error_state() as varchar(8));
	print 'Error line: ' + cast(error_line() as varchar(8));
	if error_procedure() is not null
		print 'Procedure name: ' + error_procedure();
	return -1;
end catch;
go

declare @rc int;
exec @rc = PAUDITORIUM_INSERTX @a = '201-3a', @t = 'ЛБ-Б', @c = 20, @n = '201-3a', @tn = 'Лабораторный класс б';
print 'Procedure code: ' + cast(@rc as varchar(3));