use UNIVER;
go

/*insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
values (24, '������� ������� �����������', '2004-02-17',
'
<INFO>
	<PASSPORT TYPE="AB" NUMBER="2345678" DATE="23.10.2013"/>
	<PHONE>+375291234567</PHONE>
	<ADDRESS>
		<COUNTRY>��</COUNTRY>
		<CITY>�������</CITY>
		<STREET>����������</STREET>
		<HOME>31</HOME>
	</ADDRESS>
</INFO>
'
);*/

select * from STUDENT where NAME = '������� ������� �����������';

/*update STUDENT set INFO =
'
<INFO>
	<PASSPORT TYPE="AB" NUMBER="2345678" DATE="23.10.2013"/>
	<PHONE>+375291234568</PHONE>
	<ADDRESS>
		<COUNTRY>��</COUNTRY>
		<CITY>�������</CITY>
		<STREET>����������</STREET>
		<HOME>31</HOME>
	</ADDRESS>
</INFO>
'
where INFO.value('(/ADDRESS/CITY)[1]','varchar(100)') = '����������';
*/

select NAME[���],
INFO.value('(/INFO/PASSPORT/@TYPE)[1]','varchar(20)') [����� ��������],
INFO.value('(/INFO/PASSPORT/@NUMBER)[1]','varchar(20)') [����� ��������],
INFO.query('/INFO/ADDRESS') [�����]
from STUDENT
where NAME = '������� ������� �����������';