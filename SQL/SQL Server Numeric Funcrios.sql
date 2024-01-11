--Return the absolute value of a number:
SELECT Abs(-243.5) AS AbsNum;


--Return the arc cosine of a number
SELECT ACOS(0.25);


--Return the arc sine of a number
SELECT ASIN(0.25);


--Return the arc tangent of a number
SELECT ATAN(2.5);


--Return the arc tangent of two values
SELECT ATN2(0.50, 1);


--AVG Of Salary
Select AVG(Salary) from Employeen

--top value
SELECT CEILING(25.75) AS CeilValue;
SELECT CEILING(25.25) AS CeilValue;


--Count
Select Count(EmployeeID) from Employeen


SELECT COS(DEGREES(90));


SELECT COT(6);


--Convert a radian value into degrees
SELECT DEGREES(90);


--Return e raised to the power of 1
SELECT EXP(1);


--Upper Value
SELECT FLOOR(25.75) AS FloorValue;
SELECT FLOOR(25.25) AS FloorValue;


--Return the natural logarithm of 2
SELECT LOG(2);


--Return the base-10 logarithm of 2:
SELECT LOG10(2);


--MAX Of Salary
Select MAX(Salary) from Employeen


--MIN Of Salary
Select MIN(Salary) from Employeen


SELECT PI()/180;


SELECT POWER(4, 2);


--Convert a degree value into radians:
SELECT RADIANS(180);


SELECT RAND()*10000;


--ROUND(number, decimals, operation)
SELECT ROUND(235.415, 2) AS RoundValue;


--Return the sign of a number:
SELECT SIGN(255.5);



SELECT SIN(2);


SELECT SQRT(64);


SELECT SQUARE(8);



--Sum Of Salary
Select SUM(Salary) from Employeen


--Return the tangent of a number:
SELECT TAN(1.75)

Select 1/COT(1.75)