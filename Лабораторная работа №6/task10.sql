use UNIVER;

select P1.SUBJECT [Subject],
	   P1.NOTE [Mark],
	   (
	       select count(*)
		   from PROGRESS P2
		   where P2.SUBJECT = P1.SUBJECT
	   ) [Amount]
from PROGRESS P1
group by P1.SUBJECT, P1.NOTE
HAVING NOTE in (8, 9);