use UNIVER;
go

declare @hdoc int;
declare @doc varchar(1000) = '
<?xml version="1.0" encoding="windows-1251" ?>
<SUBJECTS>
	<SUBJECT SUBJECT="SUB1" SUBJECT_NAME="Subject 1" PULPIT="ИСиТ" />
	<SUBJECT SUBJECT="SUB2" SUBJECT_NAME="Subject 2" PULPIT="ИСиТ" />
	<SUBJECT SUBJECT="SUB3" SUBJECT_NAME="Subject 3" PULPIT="ИСиТ" />
</SUBJECTS>
';

exec sp_xml_preparedocument @hdoc output, @doc;

insert SUBJECT select SUBJECT, SUBJECT_NAME, PULPIT
from openxml(@hdoc, '/SUBJECTS/SUBJECT', 0)
with(SUBJECT char(10), SUBJECT_NAME varchar(100), PULPIT char(20));

select * from SUBJECT;