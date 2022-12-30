use UNIVER;

-- part 1
SELECT BOOKS.title	as Book, LIB.title as [Library]
FROM BOOKS
FULL OUTER JOIN LIB
ON BOOKS.id = LIB.book_id
WHERE LIB.book_id IS NULL AND BOOKS.title IS NOT NULL;

-- part 2
SELECT BOOKS.title	as Book, LIB.title as [Library]
FROM BOOKS
FULL OUTER JOIN LIB
ON BOOKS.id = LIB.book_id
WHERE LIB.book_id IS NOT NULL AND BOOKS.title IS NULL;

-- part 3
SELECT BOOKS.title	as Book, LIB.title as [Library]
FROM BOOKS
FULL OUTER JOIN LIB
ON BOOKS.id = LIB.book_id
WHERE LIB.book_id IS NOT NULL AND BOOKS.title IS NOT NULL;