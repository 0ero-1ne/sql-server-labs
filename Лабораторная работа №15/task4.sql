use UNIVER;
go

/*insert into STUDENT(IDGROUP, NAME, BDAY, INFO)
values (24, 'Воликов Дмитрий Анатольевич', '2004-02-17',
'
<INFO>
	<PASSPORT TYPE="AB" NUMBER="2345678" DATE="23.10.2013"/>
	<PHONE>+375291234567</PHONE>
	<ADDRESS>
		<COUNTRY>РБ</COUNTRY>
		<CITY>Иваново</CITY>
		<STREET>Просёлочная</STREET>
		<HOME>31</HOME>
	</ADDRESS>
</INFO>
'
);*/

select * from STUDENT where NAME = 'Воликов Дмитрий Анатольевич';

/*update STUDENT set INFO =
'
<INFO>
	<PASSPORT TYPE="AB" NUMBER="2345678" DATE="23.10.2013"/>
	<PHONE>+375291234568</PHONE>
	<ADDRESS>
		<COUNTRY>РБ</COUNTRY>
		<CITY>Иваново</CITY>
		<STREET>Просёлочная</STREET>
		<HOME>31</HOME>
	</ADDRESS>
</INFO>
'
where INFO.value('(/ADDRESS/CITY)[1]','varchar(100)') = 'Просёлочная';
*/

select NAME[ФИО],
INFO.value('(/INFO/PASSPORT/@TYPE)[1]','varchar(20)') [Серия паспорта],
INFO.value('(/INFO/PASSPORT/@NUMBER)[1]','varchar(20)') [Номер паспорта],
INFO.query('/INFO/ADDRESS') [Адрес]
from STUDENT
where NAME = 'Воликов Дмитрий Анатольевич';