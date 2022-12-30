use UNIVER;
go

select rtrim(AUDITORIUM.AUDITORIUM) [AUDITORIUM], AUDITORIUM.AUDITORIUM_CAPACITY, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM
join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
where AUDITORIUM_TYPE.AUDITORIUM_TYPE = '��'
for xml auto, root('Auditoriums'), elements;