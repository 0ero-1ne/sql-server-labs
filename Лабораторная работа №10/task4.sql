use UNIVER;

declare @subject varchar(10), @t varchar(1000) = '';
declare IsitSubjectsScroll cursor local static scroll
						for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT like '����';

open IsitSubjectsScroll;
fetch IsitSubjectsScroll into @subject;
print '������ ����������: ' + @subject;

fetch absolute 3 from IsitSubjectsScroll into @subject;
print '������ ����������: ' + @subject;

fetch prior from IsitSubjectsScroll into @subject;
print '������ ����������: ' + @subject;

fetch relative 5 from IsitSubjectsScroll into @subject;
print '������� ����������: ' + @subject;

fetch absolute -2 from IsitSubjectsScroll into @subject;
print '������������� ����������: ' + @subject;

fetch last from IsitSubjectsScroll into @subject;
print '��������� ����������: ' + @subject;

close IsitSubjectsScroll;