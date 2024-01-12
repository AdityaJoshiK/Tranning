SELECT ASCII(Name) as name,Name --Ascii returns ascii value
FROM Employee;


SELECT CHAR(65) AS CodeToCharacter; --Return the character based on the number


SELECT CHARINDEX('t', 'Customer') AS MatchPosition;--searches for a substring in a string, and returns the position.
Select CHARINDEX('d',Name) from Employee


--concat
Select CONCAT('Name is ',Name) from Employee
Select 'Name is '+Name from Employee

SELECT CONCAT_WS('.', 'www', 'W3Schools', 'com');--seprate given words with . or any char

--DataLength
SELECT DATALENGTH('W3Schools.com');
SELECT LEN('W3Schools.com');

--difference of both
SELECT DIFFERENCE('Juice', 'Jucy');
SELECT DIFFERENCE('Juice', 'Banana');


--FORMAT(value, format, culture)
DECLARE @d DATETIME = '12/01/2018';
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',
               FORMAT (@d, 'd', 'no') AS 'Norwegian Result',
               FORMAT (@d, 'd', 'zu') AS 'Zulu Result';

SELECT FORMAT(GETDATE(), 'MM/dd/yyyy') AS FormattedDate;


--Left function
SELECT LEFT('SQL Tutorial', 3) AS ExtractString;


--Len Function
SELECT LEN('aditya');


--Lowecase convert
SELECT LOWER('SQL Tutorial is FUN!');


--Remove Left Spcae
SELECT LTRIM('     SQL Tutorial        a') AS LeftTrimmedString;


--Return the Unicode character based on the number code 65
SELECT NCHAR(65) AS NumberCodeToUnicode;

--Find Given substring in string and return index
SELECT PATINDEX('%schools%', 'W3Schools.com');

--Quotename quote given string in bracket.
SELECT QUOTENAME('abcdef');	
SELECT QUOTENAME('abcdef', '()');


--Replace T by m
SELECT REPLACE('SQL Tutorial', 'T', 'M');


--Duplicate
SELECT REPLICATE('SQL Tutorial', 5);

SELECT REPLICATE(Name, 2) as Name
FROM Employee;




--Reverse
SELECT REVERSE('SQL Tutorial');


--The RIGHT() function extracts a number of characters from a string (starting from right).
SELECT RIGHT('SQL Tutorial', 3) AS ExtractString;


--Remove space from right
SELECT RTRIM('SQL Tutorial     ') AS RightTrimmedString;


-- similarity of two strings, and return a four-character code
SELECT SOUNDEX('Juice'), SOUNDEX('A');


--Returns given space
SELECT SPACE(10);


--Return a number as a string (STR(number, length, decimals))
SELECT STR(185.476, 6, 2);


--The STUFF() function deletes a part of a string and then inserts another part into the string, starting at a specified position.
--STUFF(string, start, length, new_string)
SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');


--Extract 3 characters from a string, starting in position 1
SELECT SUBSTRING('SQL Tutorial', 1, 5) AS ExtractString;

-- TRANSLATE used to replace multiple characters in a string with another set of characters.
SELECT TRANSLATE('Monday', 'Monday', 'Sunday'); 
SELECT TRANSLATE('Hello World', 'elo', '123') AS TranslatedString;
--it replace e by 1,l-2,o-3


--Remove leading and trailing spaces from a string:
SELECT TRIM('     SQL Tutorial!     ') AS TrimmedString;


--Return an integer value (the Unicode value), for the first character
SELECT UNICODE('Atlanta');


--Convert the text to upper-case:
SELECT UPPER('SQL Tutorial is FUN!');


--20-23,17,12,1,110,120,Cast