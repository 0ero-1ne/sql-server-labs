use UNIVER;

declare @subject varchar(10), @t varchar(1000) = '';
declare IsitSubjectsDynamic cursor local dynamic
						for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT like '����';

open IsitSubjectsDynamic;
print '���������� �����: ' + cast(@@CURSOR_ROWS as varchar(5));
insert SUBJECT values('��', '������ ������������', '����');
fetch IsitSubjectsDynamic into @subject;
while @@FETCH_STATUS = 0
begin
	set @t = rtrim(@subject) + ', ' + @t;
	fetch IsitSubjectsDynamic into @subject;
end;
print @t
close IsitSubjectsDynamic;

delete from SUBJECT where SUBJECT.SUBJECT like '��';