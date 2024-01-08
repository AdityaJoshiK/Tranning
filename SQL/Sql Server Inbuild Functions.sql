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

--20-23,17,12,1,110,120,Cast