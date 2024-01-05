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

SELECT DIFFERENCE('Juice', 'Jucy');