use UNIVER;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[SUBJECT_REPORT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    DROP PROCEDURE [dbo].[SUBJECT_REPORT];
go

create procedure SUBJECT_REPORT @p char(50)
as
declare @rc int = 0;
begin try
	declare @d varchar(20), @out varchar(300) = '';
	declare DisPul cursor for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p;

	if not exists (select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p)
		raiserror('Error', 11, 1);
	else
		open DisPul;
		fetch DisPul into @d;
		print 'Disciplines of pulpit ' + rtrim(@p) + ': ';
		while @@fetch_status = 0
		begin
			set @out = rtrim(@d) + ', ' + @out;
			set @rc = @rc + 1;
			fetch DisPul into @d;
		end
		set @out = substring(@out, 1, len(@out) - 1);
		print @out;
		close DisPul;
		return @rc;
end try
begin catch
	print 'Parameters error';
	if error_procedure() is not null
		print 'Procedure name: ' + error_procedure();
	return @rc;
end catch;
go

declare @rc int;
exec @rc = SUBJECT_REPORT @p = 'ศั่า';
print 'Amount: ' + cast(@rc as varchar(5));