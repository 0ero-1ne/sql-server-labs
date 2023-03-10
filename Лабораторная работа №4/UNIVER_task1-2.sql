use UNIVER;

-- first task
SELECT AUDITORIUM.AUDITORIUM as [Auditorium Code], AUDITORIUM_TYPE.AUDITORIUM_TYPE as [Auditorium Type]
FROM AUDITORIUM
INNER JOIN AUDITORIUM_TYPE
ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

-- second task
SELECT AUDITORIUM.AUDITORIUM as [Auditorium Code], AUDITORIUM_TYPE.AUDITORIUM_TYPENAME as [Auditorium Name]
FROM AUDITORIUM
INNER JOIN AUDITORIUM_TYPE
ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
WHERE AUDITORIUM_TYPE.AUDITORIUM_TYPENAME LIKE '%?????????%';