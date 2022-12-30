use UNIVER;
go

if object_id (N'FFACPUL', N'IF') IS NOT NULL
    drop function FFACPUL;
go

create function FFACPUL(@f varchar(10), @p varchar(20)) returns table
as return
select F.FACULTY, P.PULPIT
from FACULTY F
left outer join PULPIT P
on P.FACULTY = F.FACULTY
where F.FACULTY = isnull(@f, F.FACULTY)
and
P.PULPIT = isnull(@p, P.PULPIT);
go

select * from dbo.FFACPUL(NULL, NULL);
select * from dbo.FFACPUL('ÈÒ', NULL);
select * from dbo.FFACPUL(NULL, 'ÈÑèÒ');
select * from dbo.FFACPUL('ÈÒ', 'ÈÑèÒ');