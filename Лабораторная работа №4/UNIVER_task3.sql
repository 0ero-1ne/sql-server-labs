use UNIVER;

SELECT AUDITORIUM.AUDITORIUM as [Auditorium Code], AUDITORIUM_TYPE.AUDITORIUM_TYPE as [Auditorium Type]
FROM AUDITORIUM, AUDITORIUM_TYPE
WHERE AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

SELECT AUDITORIUM.AUDITORIUM as [Auditorium Code], AUDITORIUM_TYPE.AUDITORIUM_TYPENAME as [Auditorium Name]
FROM AUDITORIUM, AUDITORIUM_TYPE
WHERE AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE AND
AUDITORIUM_TYPE.AUDITORIUM_TYPENAME LIKE '%���������%';