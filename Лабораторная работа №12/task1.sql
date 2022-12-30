use UNIVER;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[PSUBJECT1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    DROP PROCEDURE [dbo].[PSUBJECT1]
go

create procedure PSUBJECT1
as
begin
	declare @rows int = (select count(*) from SUBJECT);
	select SUBJECT.SUBJECT [Code],
		   SUBJECT.SUBJECT_NAME [Subject],
		   SUBJECT.PULPIT [Pulpit]
	from SUBJECT;
	return @rows;
end;
go

declare @countSubjects int = 0;
exec @countSubjects = PSUBJECT1;
print 'Amount of subject: ' + cast(@countSubjects as varchar(3));