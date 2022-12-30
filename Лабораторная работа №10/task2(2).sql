use UNIVER;

declare IsitSubjectsGlobal cursor global
for
select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT like 'ศั่า';

declare @subject varchar(10), @t varchar(1000) = '';
	open IsitSubjectsGlobal;
	fetch IsitSubjectsGlobal into @subject;
	print '1. ' + @subject;
	go

declare @subject varchar(10), @t varchar(1000) = '';
	fetch IsitSubjectsGlobal into @subject;
	print '2. ' + @subject;
	go