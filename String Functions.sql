create database stringdb
use stringdb;
CREATE TABLE Employees2(
    employee_id INT,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO Employees2
VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'IT', 'Ahmedabad'),
(102, 'Priya Patel', 'priya.patel@gmail.com', 'HR', 'Mumbai'),
(103, 'Amit Shah', 'amit.shah@gmail.com', 'Finance', 'Ahmedabad'),
(104, 'Neha Mehta', 'neha.mehta@gmail.com', 'IT', 'Pune'),
(105, 'Rohan Desai', 'rohan.desai@gmail.com', 'Sales', 'Delhi');

select * from Employees2;

--1) UPPER()--
--Converts all characters in a string to uppercase.--
select 
employee_id,
UPPER(city)
from Employees2;

--2)LOWER()--
--Converts all characters in a string to lowercase..--
select 
LOWER(email) AS email
from Employees2;

--3)LEN()--
--Returns the number of characters in a string.--
select 
employee_name,
LEN(employee_name) AS name_length
from Employees2;

--4)DATALENGTH()--
--Returns the number of bytes used to store a value.--
select 
LEN(employee_name) AS name_length,
DATALENGTH(employee_name) AS Byte_Count
from Employees2;

--5)CONCAT()--
--Combines two or more strings into one string.--
SELECT CONCAT(
    employee_id,
    ' | ',
    employee_name,
    ' | ',
    department
) AS Employee_Details
FROM Employees2;

--6)--
--CONCAT_WS() means Concatenate With Separator--
--It combines multiple strings using a specified separato--

SELECT
    CONCAT_WS(' - ', employee_name, department, city) AS Employee_Info
FROM Employees2;

--7)LEFT()--
--Returns a specified number of characters from the left side of a string.--
select 
city,
left(city,3) AS citycode
from Employees2;

--8)RIGHT()--
--Returns a specified number of characters from the right side of a string.--
select 
right(employee_name,5) AS Last_Five_Characters
from Employees2;

--9)SUBSTRING()--
--Extracts a portion of a string.--
SELECT
    SUBSTRING(employee_name, 1, 6) AS Extracted_Text
FROM Employees2;

--10--
--CHARINDEX()--
--Finds the position of a character or substring.--
SELECT
    employee_name,
    CHARINDEX(' ', employee_name) AS Space_Position
FROM Employees2;

--11-
--PATINDEX()--
--Searches for a pattern within a string and returns its starting position.--
SELECT
    employee_name,
    PATINDEX('%Sh%', employee_name) AS Position
FROM Employees2;

SELECT
    employee_name,
    PATINDEX('%a%', employee_name) AS Position
FROM Employees2;

--12) REPLACE()--
--Replaces one substring with another.--
SELECT
    REPLACE(employee_name, ' ', '_') AS Employee_Name
FROM Employees2;

--13)TRANSLATE()--
--Replaces individual characters with other characters.--
SELECT TRANSLATE('ABC123', 'ABC', 'XYZ');
SELECT TRANSLATE('123-456-789', '-', '/');

--14)TRIM()--
--Removes spaces from the beginning and end of a string.--
SELECT
    TRIM(employee_name) AS Clean_Name
FROM Employees2;

--15)LTRIM()--
--Removes spaces from the left side of a string.--
SELECT LTRIM('     Rahul');

--16)RTRIM()--
--Removes spaces from the right side of a string.--
SELECT RTRIM('Rahul     ');

--17)LTRIM() + RTRIM()--
--A traditional technique for removing spaces from both sides is:--
SELECT LTRIM(RTRIM(employee_name))
FROM Employees2;

--18)REVERSE()--
--Reverses the characters in a string.--
SELECT
    REVERSE(employee_name) AS Reversed_Name
FROM Employees2;

--19) SPACE()--
--Returns a specified number of spaces--
SELECT
    CONCAT(employee_name, REPLICATE('.', 5)) AS Formatted_Name
FROM Employees2;

--20)FORMAT()--
--Formats a value using a specified format.--
SELECT FORMAT(1234567, 'N0') AS Formatted_Number;

--21)STRING_AGG()--
--Combines values from multiple rows into a single string.--
--This is especially useful with GROUP BY.--
SELECT
    department,
    STRING_AGG(employee_name, ', ') AS Employees
FROM Employees2
GROUP BY department;

--22)STRING_SPLIT()--
--Splits a string into multiple rows based on a separator.--
SELECT value
FROM STRING_SPLIT('SQL,Python,Power BI,Excel', ',');

--23)ASCII()--
--Returns the ASCII value of the first character.--
SELECT ASCII('A');

--24)CHAR()--
--Converts an ASCII code into a character.--
SELECT CHAR(65);

--25)UNICODE()--
--Returns the Unicode value of the first character.--
SELECT UNICODE('A');

--26)NCHAR()--
--Returns a Unicode character corresponding to a Unicode code point.--
SELECT NCHAR(65);

--27)DIFFERENCE()--
--Compares two strings based on their SOUNDEX() values.--
--It returns a value from 0 to 4.--
SELECT DIFFERENCE('Smith', 'Smyth');

--28)SOUNDEX()--
--Returns a four-character code representing the approximate phonetic representation of a string.--
SELECT SOUNDEX('Smith');
SELECT
    SOUNDEX('Smith') AS Name1,
    SOUNDEX('Smyth') AS Name2;

--32. QUOTENAME()--
SELECT QUOTENAME('Employees');

--33. STR()--
SELECT STR(123.45, 10, 2);

--34. STRING_ESCAPE()--
SELECT STRING_ESCAPE('Rahul "Sharma"', 'json');

--35. SPACE() vs REPLICATE()--
SELECT SPACE(5);
SELECT REPLICATE('*', 5);

--36. CONCAT() vs + Operator--
SELECT employee_name + ' - ' + department
FROM Employees;

SELECT CONCAT(employee_name, ' - ', department)
FROM Employees;

SELECT CONCAT('Rahul', NULL, 'Sharma');

--37. Combining String Functions--
SELECT
    UPPER(TRIM(employee_name)) AS Clean_Name
FROM Employees;

SELECT
    LEFT(
        employee_name,
        CHARINDEX(' ', employee_name) - 1
    ) AS First_Name
FROM Employees;

SELECT
    RIGHT(
        employee_name,
        LEN(employee_name) - CHARINDEX(' ', employee_name)
    ) AS Last_Name
FROM Employees;

--38. Create Employee Username--
SELECT
    LOWER(REPLACE(employee_name, ' ', '.')) AS Username
FROM Employees;

--39. Extract Email Username--
SELECT
    LEFT(
        email,
        CHARINDEX('@', email) - 1
    ) AS Email_Username
FROM Employees;

--40. Extract Email Domain--
SELECT
    SUBSTRING(
        email,
        CHARINDEX('@', email) + 1,
        LEN(email)
    ) AS Email_Domain
FROM Employees;

--41. Find Employees From Gmail--
SELECT *
FROM Employees
WHERE email LIKE '%@gmail.com';


SELECT *
FROM Employees
WHERE CHARINDEX('@gmail.com', email) > 0;

--42. Standardize Names--
SELECT
    UPPER(LEFT(employee_name, 1)) +
    LOWER(SUBSTRING(employee_name, 2, LEN(employee_name))) AS Employee_Name
FROM Employees;

--43. String Functions in WHERE--

SELECT *
FROM Employees
WHERE LEN(employee_name) > 10;

SELECT *
FROM Employees
WHERE LEFT(employee_name, 1) = 'R';

SELECT *
FROM Employees
WHERE employee_name LIKE '%ah%';

--44. String Functions in ORDER BY--
SELECT
    employee_name,
    LEN(employee_name) AS Name_Length
FROM Employees
ORDER BY LEN(employee_name) DESC;

--45. String Functions with GROUP BY


SELECT
    UPPER(city) AS City,
    COUNT(*) AS Employee_Count
FROM Employees
GROUP BY UPPER(city);

--46. String Functions with CASE

SELECT
    employee_name,
    CASE
        WHEN LEN(employee_name) > 12 THEN 'Long Name'
        WHEN LEN(employee_name) >= 8 THEN 'Medium Name'
        ELSE 'Short Name'
    END AS Name_Category
FROM Employees;


