use UNIVER;

declare @subject varchar(10), @t varchar(1000) = '';
declare IsitSubjects cursor
						for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT like '����';

open IsitSubjects;
fetch IsitSubjects into @subject;
print '���������� ������� ����'
while @@FETCH_STATUS = 0
begin
	set @t = rtrim(@subject) + ', ' + @t;
	fetch IsitSubjects into @subject;
end;
print @t
close IsitSubjects;