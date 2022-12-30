use UNIVER;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[PAUDITORIUM_INSERT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    DROP PROCEDURE [dbo].[PAUDITORIUM_INSERT];
go

create procedure PAUDITORIUM_INSERT @a char(20), @t char(10), @c int = 0, @n varchar(50)
as
begin try
	insert into AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) values(@a, @t, @c, @n);
	return 1;
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
exec @rc = PAUDITORIUM_INSERT @a = '200-3a', @t = 'À - ', @c = 90, @n = '200-3a';
print 'Insert code: ' + cast(@rc as varchar(5));