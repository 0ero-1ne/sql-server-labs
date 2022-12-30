use UNIVER;

declare @subject varchar(10), @t varchar(1000) = '';
declare IsitSubjectsStatic cursor local static
						for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT like '����';

open IsitSubjectsStatic;
print '���������� �����: ' + cast(@@CURSOR_ROWS as varchar(5));
insert SUBJECT values('���', '���������������� ���������� ������', '����');
fetch IsitSubjectsStatic into @subject;
while @@FETCH_STATUS = 0
begin
	set @t = rtrim(@subject) + ', ' + @t;
	fetch IsitSubjectsStatic into @subject;
end;
print @t
close IsitSubjectsStatic;

delete from SUBJECT where SUBJECT.SUBJECT like '���';