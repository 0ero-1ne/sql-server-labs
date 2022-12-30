use UNIVER;

declare @subject varchar(10), @t varchar(1000) = '';
declare IsitSubjectsScroll cursor local static scroll
						for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT like 'ИСиТ';

open IsitSubjectsScroll;
fetch IsitSubjectsScroll into @subject;
print 'Первая дисциплина: ' + @subject;

fetch absolute 3 from IsitSubjectsScroll into @subject;
print 'Третья дисциплина: ' + @subject;

fetch prior from IsitSubjectsScroll into @subject;
print 'Вторая дисциплина: ' + @subject;

fetch relative 5 from IsitSubjectsScroll into @subject;
print 'Седьмая дисциплина: ' + @subject;

fetch absolute -2 from IsitSubjectsScroll into @subject;
print 'Предпоследняя дисциплина: ' + @subject;

fetch last from IsitSubjectsScroll into @subject;
print 'Последняя дисциплина: ' + @subject;

close IsitSubjectsScroll;