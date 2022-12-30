use UNIVER;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[PSUBJECT2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    DROP PROCEDURE [dbo].[PSUBJECT2]
go

create procedure PSUBJECT2 @p varchar(20), @c int output
as
begin
	declare @rows int = (select count(*) from SUBJECT);
	print 'Parametres: pulpit - ' + @p + ', @c = ' + cast(@c as varchar(3));
	select SUBJECT.SUBJECT [Code],
		   SUBJECT.SUBJECT_NAME [Subject],
		   SUBJECT.PULPIT [Pulpit]
	from SUBJECT where SUBJECT.PULPIT = @p;
	set @c = @@rowcount;
	return @rows;
end;
go

declare @countSubjectsOfISIT int = 0, @countSubjects int = 0;

exec @countSubjects = PSUBJECT2 @p = 'ศั่า', @c = @countSubjectsOfISIT output;
print 'Common amount of subjects: ' + cast(@countSubjects as varchar(3));
print 'Common amount of subjects in ศั่า: ' + cast(@countSubjectsOfISIT as varchar(3));