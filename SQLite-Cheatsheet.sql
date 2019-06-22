--This creates a Table and defines the rows
CREATE TABLE Author
(authorNo INTEGER PRIMARY KEY NOT NULL,
authorFirstName TEXT,
authorLastName TEXT, 
authorStreet TEXT, 
authorSuburb TEXT); 

-------------------------------
--This Creates a Temp Table using
-- a SELECT statement (Point Query)
CREATE TABLE AuthorTemp 
	AS SELECT * 
		FROM Author
		WHERE authorSuburb = 'Meadowbank';

--------------------------------------
--This Alters an existing Table's
--Table Name, Column Name, Adds a column
ALTER TABLE Author
RENAME TO MeadowbankAuthor;

ALTER TABLE Author
RENAME COLUMN authorStreet
	TO streetAddress;

ALTER TABLE Author
ADD authorCity TEXT;

---------------------------------------
--This Drops a table from the DB
DROP TABLE MeadowbankAuthor;

--------------------------------------
--Inserts new values INTO specific
--columns of a table
INSERT INTO Author
	(authorFirstName, authorLastName
		authorStreet, authorSuburb,
		authorCity)
	 VALUES ('De Silva', 'Clarice',
	 	'21 Park View Street', 'Park View',
	 	'Auckland');

---------------------------------------
--Inserts table values from an existing 
--table using a SELECT statement
INSERT INTO AuthorTemp
	SELECT authorFirstName, authorLastName,
		authorStreet, authorSuburb, authorCity
	FROM Author; 

----------------------------------------
--Selects all columns
SELECT *     -- <---
FROM Book;

------------------------------------------
--Selects specific columns
SELECT bookCode 'Book Code', bookTitle 'Title'
FROM Book;

-----------------------------------------
--Selects only unique values and removes
--any duplicates from the results
SELECT DISTINCT staffCity 'City' --  <---
FROM Staff;

------------------------------------------
--Limits the number of rows that are 
--returned by the query to 3
SELECT *
FROM Book
LIMIT 3; -- 	<---

-------------------------------------------
--Limits the number of rows returned to 3 rows
--and Offsets the rows by 2 rows
SELECT *
FROM Book
LIMIT 3
OFFSET 2;			-- 	<---

-----------------------------------------
--Sets a condition for the query.
--Commonly used in SELECT, UPDATE, DELETE statements
--When a WHERE condition is specified,
--each row from the input data is evaluated
--as a boolean expression (T/F). Rows which 
--return FALSE or NULL are not included in results
SELECT roleID, branchNo, staffCode
FROM StaffAssignment
WHERE roleID = 4; 		--  <---

-----------------------------------------
--Updates values within an existing table
--Always use a WHERE clause in an UPDATE 
UPDATE Author
SET authorStreet = '12 Park Lane'
WHERE authorFirstName = 'Mark'




