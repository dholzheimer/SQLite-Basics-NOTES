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
Multi-row functions
--work on multiple rows to give one result per group
--AKA group or aggregate functions
Function							Description
COUNT(*) or COUNT(X)		--	<---The COUNT(X) function returns a count of the number of times that X is not NULL in a group. The COUNT(*) function (with no arguments) returns the total number of rows in the group
MAX(X)		--	<---It returns the maximum value of all values in the group
MIN(X)		--	<---It returns the minimum value of all values in the group
AVG(X)		--	<---It returns the average value of all values in the group
SUM(X) or TOTAL(X)		--	<---It returns sum of all non-NULL values in the group
GROUP_CONCAT(X,Y)		--	<---It returns a string which is the concatenation of all non-NULL values of X. If parameter Y is present then it is used as the separator between instances of X

-------------------------------------------------------
--------------------------------------------------------
GROUP BY clause
--Often the intention of using multi-row function is to apply them to selected group, where the group is defined by the data
--The GROUP BY clause allows a multi-row function to be used on each group specified
--All columns in the SELECT statement that are not associated with the multi-row function MUST be placed in the GROUP BY clause
{Example}
SELECT staffCity, COUNT(staffCity) AS '# of Staff'
FROM Staff
GROUP BY staffCity;  --	<---

{Example}
SELECT roleID, AVG(salary)
FROM StaffAssignment
GROUP BY roleID;

-------------------------------------------------------
-------------------------------------------------------
HAVING clause
--The HAVING clause is used to filter the result from a SELECT statement with a multi-row function and a GROUP BY clause
{Example}
SELECT branchNo, AVG(salary)
FROM StaffAssignment
GROUP BY branchNo
HAVING AVG(salary) > 54000;

-----------------------------------------------------
------------------------------------------------------
JOIN
--Joins combine columns from multiple tables
--Most of the time a join condition is specified
--It is required to prefix the column name with
----the table name or table alias when the same column
----name exists in more than one table
{Example}
SELECT bookCode, w.authorNo, a.authorNo, authorFirstName
FROM Writing w, Author a
WHERE w.authorNo = a.authorNo
	AND a.authorNo IN (1, 2);
	--Instead of using the full table name,
	--it is easier to use a table alias to differentiate
	--among the same named columns from two or more tables
-------			-----------			--------		----------		-------
JOIN types

INNER JOIN
--It requires each row in the two joined tables to have matching rows
--It could use either implicit join notation or explicit join notation
--Equi-Join vs Non Equi-Join
{Example} <---Equi-Join
SELECT bookTitle, authorLastName, pubName, pubDate
FROM Author a, Writing w, Book b, Publisher p
WHERE a.authorNo = w.authorNo
	AND b.bookCode = w.bookCode
	AND w.pubCode = p.pubCode;

{Example} <---Non Equi-Join
SELECT bookCode, price, bookGrade
FROM BookPrice p, BookGrade g
WHERE price BETWEEN minValue AND maxValue;

---------------
OUTER JOIN
--The joined table retains each row even if no other matching row exists
--Left outer join always contains all rows of the left table even if the join condition does not find any matching row in the right table
-- No implicit join notation is allowed
--Right outer join and full outer join are not supported in SQLite
{Example}
SELECT authorLastName, bookCode
FROM Author a LEFT OUTER JOIN Writing w
ON a.authorNo = w.authorNo;
--When there is no matching bookCode for an author, a NULL is given

---------------
CROSS JOIN
--It joins each row of one table to each row of the other table
{Example}
SELECT bookCode, a.authorNo
FROM Writing w, Author a;
--This shoud be avoided in most cases


----------------
SELF JOIN
--It joins a table to itself
{Example}
SELECT c.pubName AS 'Publisher', p.pubName AS 'Parent'
FROM Publisher c, Publisher p
WHERE c.parentPubCode = p.pubCode;

-------------------------------------------------
Subqueries
--Subqueries execute before the main query, and the results
----of the subquery is used to solve the main query.
--Subqueries can be used in SELECT, FROM, WHERE, and/or HAVING clauses
{Example}
Q: 'Who has a higher salary than Jones?'
	Main Query: 'Staff with a higher salary than Jones'
	Subquery: "Jone's salary"

-----------------------
{WHERE subquery}

SELECT staffLastName, salary
FROM Staff s, StaffAssignment sa
WHERE s.staffCode = sa.staffCode
	AND salary > (SELECT salary
								FROM Staff s, StaffAssignment sa
								WHERE s.staffCode = sa.staffCode
									AND LOWER(staffLastName) = 'jones');



{Single-row Subquery}
<'Who gets paid the highest?'>
SELECT staffLastName
FROM Staff s, StaffAssignment sa
WHERE s.staffCode = sa.staffCode
	AND salary = (SELECT MAX(salary)
									FROM StaffAssignment);


{Multi-row subquery}
<'Who makes a higher salary than the staff with "roleID = 1" ?'>
SELECT staffLastName
FROM Staff
WHERE staffCode IN (SELECT staffCode
										FROM StaffAssignment
										WHERE salary > (SELECT MIN(salary)
																		FROM StaffAssignment
																		WHERE roleID = 1));
---------------------
{HAVING subquery}
<'Which branches have salaries higher than the minimum salary?'>
SELECT branchNo, MIN(salary)
FROM StaffAssignment
GROUP BY branchNo
HAVING MIN(salary) > (SELECT MIN(salary)
											FROM StaffAssignment);


----------------------
{FROM subquery}
<'Subquery could also be used as a table in the FROM clause
which could participate in a join just like any other table'>

SELECT MIN(avgSalary)
FROM (SELECT branchNo, AVG(salary) AS 'avgSalary'
			 FROM StaffAssignment
			 GROUP BY branchNo) t; <---- note that this table projrction can be joined to other tables in the query


---------------------------
{UPDATE Subqueries}
<'Note that it is very important to include a WHERE clause
otherwise it will screw the table up'>

{Example}
UPDATE StaffAssignment
SET salary = (SELECT salary
							FROM StaffAssignment
							WHERE staffCode = 7)
WHERE salary = (SELECT MIN(salary)
								FROM StaffAssignment);


---------------------------------------
{DELETE Subqueries}
<'Note that it is very important to include a WHERE clause
otherwise it will screw the table up'>

{Example}
DELETE FROM BookPrice
WHERE bookCode = (SELECT bookCode
									FROM Book
									WHERE bookTitle = 'Secrets');

----------------------------------------------------------------------------------------

{Constraints}
<'Constraints maintain data integrity by controlling
which values can be stored within a column'>

<'These ocnstraints are supoorted in SQLite...'>
PRIMARY KEY --  <---- must be both UNIQUE and NOT NULL;
UNIQUE --  <---- requires that all values in a column or a group of columns are distinct from the others;
NOT NULL --  <---- this ensures that a value in the column may never be NULL;
DEFAULT --  <---- this prevents the absence of a value by assigning a default value for a column;
CHECK --  <---- checks the values from an INSERT or UPDATE statement meet the specified req's (This is normally done in JS nowadays)
FOREIGN KEY --  <---- ensures that where a key value in one table logically refers to data in another table, the data in the other table acually exists (ENFORCES relationships between tables)


{UNIQUE Example}  ----------
CREATE TABLE Contact (
	id INTEGER PRIMARY KEY NOT NULL,
	name TEXT,
	phone TEXT,
	UNIQUE (name, phone) --  <----
);


{DEFAULT Example} -----------
CREATE TABLE MyTime (
	id INTEGER PRIMARY KEY NOT NULL,
	mytime DATE NOT NULL DEFAULT(DATETIME('now', 'localtime'))  --  <------
);


{CHECK Example} --------------
CREATE TABLE Contact (
	id INTEGER PRIMARY KEY NOT NULL,
	name TEXT,
	phone TEXT,
	CHECK(LENGTH(phone) >= 7 )
);

{FOREIGN KEY Example}-----------
CREATE TABLE BookPrice (
	bookCode INTEGER NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE,
	price REAL,
	PRIMARY KEY (bookCode, StartDate),
	FOREIGN KEY (bookCode) REFERENCES Book(bookCode)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);



---------------------------------------------------------------------------------------
{CASE Expression}
<'A CASE expression works like a IF-THEN-ELSE in other
 programming languages; It allows us to do different
 things on each row of a SELECT statement based on
 the value of a column'>

{CASE Example}
SELECT staffCode, role, salary, CASE
	WHEN LOWER(role) = 'branch manager' THEN salary*0.9
	WHEN LOWER(role) = 'sales person' THEN salary
	WHEN LOWER(role) =  'office admin' THEN salary*1.15
	END revisedSalary
FROM StaffAssignment s, Role r
WHERE s.roleID = r.roleID;


---------------------------------------------------------------------------------------
{CAST Expression}
<'A CAST expression is used to convert data from one
type to another; It is useful when we need a certain
data type to use as an input;'>

{CAST example}
SELECT staffCode, CAST(salary AS INTEGER) AS 'Salary' --  <----
FROM StaffAssignment;



--This is just a quick practice for me and should be deleted from the doc
