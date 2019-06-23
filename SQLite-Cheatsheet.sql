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
UPDATE Author    --  <---
SET authorStreet = '12 Park Lane'
WHERE authorFirstName = 'Mark';  --  <---Don't Forget Me!

--------------------------------------
--Deletes a row matching the WHERE clause
DELETE
FROM AuthorTemp
WHERE authorFirstName = 'Mark'; -- <--- Don't Forget Me!

------------------------------------------
--The following lists (with examples) the
--data types used in SQLite
INTEGER (1000);
REAL (1000.0);
STRING ('1000', 'Dylan is the king'); --Case Sensitive
DATE ('2019-06-24') --Format Sensitive
NULL
--A 'literal' represents a constant value

------------------------------------------
--The following lists suppported OPERATORS
||		-- 	<--- Usually used in the SELECT statement
* 		-- 	<--- Usually used in the SELECT statement
/ 		-- 	<--- Usually used in the SELECT statement
%
+
-
<		--  <--- used in a BETWEEN statement
<=		--  <--- used in a BETWEEN statement
>		--  <--- used in a BETWEEN statement
>=		--  <--- used in a BETWEEN statement
NOT		-- 	<--- returns TRUE if the condition is FALSE
AND		-- 	<--- returns TRUE if both conditions are met
OR		-- 	<--- returns TRUE if either condition is TRUE

----			------			-------			-----			-----
--Concatenation Example
SELECT authorFirstName || ' ' || authorLastName AS 'Name'
FROM Author;

----			------			-------			-----			-----
--Arithmetic Example
SELECT staffCode, salary, salary/12 AS 'Monthly'
FROM StaffAssignment;

----			------			-------			-----			-----
--Logical Example
SELECT staffCode, salary
FROM StaffAssignment
WHERE salary IS NOT 72000
	AND salary > 50000
	OR salary = 45000;

----			------			-------			-----			-----
--Comparison Example
SELECT staffCode, salary
FROM StaffAssignment
WHERE salary BETWEEN 54000 AND 72000;  -- 	<--- HERE
--OR-- (slightly less efficient method)
SELECT staffCode, salary
FROM StaffAssignment
WHERE salary >= 54000
	AND salary <= 72000;

	----			------			-------			-----			-----
	--'IN' Example
SELECT staffCode, salary
FROM StaffAssignment
WHERE salary IN (54000, 72000);
	--'NOT IN' Example
SELECT staffCode, salary
FROM StaffAssignment
WHERE salary NOT IN (35000, 40000, 45000, 48000, 50000, 64000);

----			------			-------			-----			-----
--'IS' Example
--in SQLite the 'IS' operator is equivalent to = and == -
--Similarly, 'IS NOT' is equivalent to <> and =!
SELECT *
FROM Book
WHERE bookType IS NULL; 	--		<---

----			------			-------			-----			-----
--Sorting Example
SELECT authorLastName, authorFirstName
FROM Author
ORDER BY authorLastName DESC, authorFirstName;

--can be done in ascending (ASC) or descending (DESC) order
--This comes last in a SELECT statement

---------------------------------------------------
--Overview of Single-row functions
• Manipulate data item
• Accept argument and return one value
• Act on each row returned
• Return one result per row
• Can be nested


	-----			------			-------			---------			-------
--List of STRING functions (Single-row)
Function								Description
LOWER(X) --	<---It returns a copy of string X with all ASCII characters converted to lower case
UPPER(X)	--	<---It returns a copy of string X with all ASCII characters converted to upper case
SUBSTR(X,Y) or SUBSTR(X,Y,Z) --	<---It returns a substring of string X that begins with the Y-th character and which is Z characters long
LENGTH(X)	--	<---It returns the number of characters in string X
INSTR(X,Y)	--	<---It finds the first occurrence of string Y within string X and returns the number of prior characters plus 1, or 0 if Y is nowhere found within X
REPLACE(X,Y,Z)	--	<---It returns a string formed by substituting string Z for every occurrence of string Y in string X
RTRIM(X) or RTRIM(X,Y)	--	<---It returns a string formed by removing any and all characters that appear in Y (or white spaces if Y is not provided) from the right side of X
LTRIM(X) or LTRIM(X,Y)	--	<---It returns a string formed by removing any and all characters that appear in Y (or white spaces if Y is not provided) from the left side of X
TRIM(X) or TRIM(X,Y)	--	<---It returns a string formed by removing any and all characters that appear in Y (or white spaces if Y is not provided) from both ends of X
IFNULL(X,Y) --	<---It returns a copy of its first non-NULL argument; it could be used to replace a NULL value from a column with an alternative value
TYPEOF(X) --	<---It returns a string that indicates the datatype of the expression X: null, integer, real, text, or blob
UNICODE(X) --	<---It returns the numeric unicode code point corresponding to the first character of the string X

-----			------			-------			---------			-------
--List of Numeric functions (Single-row)
Function					Description
ABS(X)	 --	<---It returns the absolute value of number X
MAX(X,Y,...)	 --	<---It returns the maximum value among the list of numeric arguments
MIN(X,Y,...)	 --	<---It returns the minimum value among the list of numeric arguments
ROUND(X) or ROUND(X,Y)	 --	<---It returns a floating-point value X rounded to Y digits to the right of the decimal point. If the Y argument is omitted, it is assumed to be 0
RANDOM()	 --	<---It returns a pseudo-random integer between -9223372036854775808 and +9223372036854775807

-----			------			-------			---------			-------
--List of Date functions (Single-row)
Function					Description
DATE(X,Y,...)	--	<---It returns the date in this format: YYYY-MM-DD
TIME(X,Y,...)	--	<---It returns the date in this format: HH:MM:SS
DATETIME(X,Y,...)	--	<---It returns the date and time in this format: YYYY-MM-DD HH:MM:SS
JULIANDAY(X,Y,...)	--	<---It returns the Julian day - the number of days since noon in Greenwich on November 24, 4714 B.C.
STRFTIME(F,X,Y,...)	--	<---It returns the date formatted according to the format string F specified as the first argument. The DATE(), TIME() and DATETIME() functions are equivalent to STRFTIME() with certain formats

--Date function example
SELECT staffCode, ROUND((JULIANDAY('now', 'localtime') - JULIANDAY(StartDate, 'localtime'))/7) AS 'Weeks'
FROM StaffAssignment;

----------------------------------------------------------
