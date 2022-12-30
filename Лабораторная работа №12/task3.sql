use UNIVER;
go

IF EXISTS ( SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[PSUBJECT3]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
    DROP PROCEDURE [dbo].[PSUBJECT3];
go

create procedure PSUBJECT3 @p varchar(20)
as
begin
	declare @rows int = (select count(*) from SUBJECT);
	select * from SUBJECT where SUBJECT.PULPIT = @p;
end;
go

create table #SUBJECT
(
	SUBJECT char(10) primary key,
	SUBJECT_NAME varchar(100),
	PULPIT char(20)
);
go

insert #SUBJECT exec PSUBJECT3 @p = '»—Ë“';
insert #SUBJECT exec PSUBJECT3 @p = 'œŒË—Œ»';

select * from #SUBJECT;

drop table #SUBJECT;