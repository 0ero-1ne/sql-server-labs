use UNIVER;
go

if object_id (N'FSUBJECTS', N'IF') IS NOT NULL
    drop function FSUBJECTS;
go

create function FSUBJECTS(@p char(20)) returns char(300)
as
begin
	declare @tv char(10)
	declare @t varchar(300) = 'Subjects: ';
	
	declare FSUB cursor local
	for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p;

	open FSUB;
	fetch FSUb into @tv;
	while @@FETCH_STATUS = 0
	begin
		set @t = @t + ', ' + rtrim(@tv);
		fetch FSUB into @tv;
	end;
	return @t;
end;
go

select PULPIT.PULPIT, dbo.FSUBJECTS(PULPIT.PULPIT) from PULPIT;