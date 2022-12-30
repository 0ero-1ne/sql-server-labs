use UNIVER;

declare @subject varchar(10), @t varchar(1000) = '';
declare IsitSubjectsUpdate cursor local dynamic
						for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT like 'ИСиТ' for update;

open IsitSubjectsUpdate;
fetch IsitSubjectsUpdate into @subject;
delete SUBJECT where current of IsitSubjectsUpdate;
fetch IsitSubjectsUpdate into @subject;
update SUBJECT set SUBJECT.PULPIT = 'исит' where current of IsitSubjectsUpdate;
close IsitSubjectsUpdate;