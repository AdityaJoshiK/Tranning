
INSERT INTO MANAGER (ID,NAME,CITY,STATE,COUNTRY)
VALUES (1,'Aditya','Rajkot','Gujarat','India')


Update MANAGER
set ID=1
Where Name='Aditya'

Delete From MANAGER where id=1

Select Top 3 * From CUSTOMERS

SELECT TOP 50 PERCENT * FROM Customers
Order by CNAME

Select COUNT(*) AS Total FROM BORROW

Select SUM() From DEPOSIT

--copy two column data
--join,key,index

Update DEPOSIT
Set NEwamount=71000
where ACTNO=5

Update DEPOSIT
set NEwamount=amount,
amount=NEwamount

Select * from DEPOSIT
Select COUNT(AMOUNT),Date From BORROW
Group by BNAME
order by Date DESC

Select DISTINCT COUNT(ACTNO) from DEPOSIT
Select  COUNT(DISTINCT ACTNO) from DEPOSIT

INSERT INTO BRANCH (BNAME, CITY, STATE, COUNTRY, NUMBER) VALUES ('HDFC Bank', 'Mumbai', 'Maharashtra', 'India', '1234567890');
INSERT INTO BRANCH (BNAME, CITY, STATE, COUNTRY, NUMBER) VALUES ('ICICI Bank', 'Delhi', 'Delhi', 'India', '9876543210');
INSERT INTO BRANCH (BNAME, CITY, STATE, COUNTRY, NUMBER) VALUES ('SBI Bank', 'Chennai', 'Tamil Nadu', 'India', '0987654321');
INSERT INTO BRANCH (BNAME, CITY, STATE, COUNTRY, NUMBER) VALUES ('Axis Bank', 'Kolkata', 'West Bengal', 'India', '1098765432');
INSERT INTO BRANCH (BNAME, CITY, STATE, COUNTRY, NUMBER) VALUES ('Kotak Mahindra Bank', 'Bangalore', 'Karnataka', 'India', '2109876543');

INSERT INTO CUSTOMERS (CNAME,CITY,STATE,COUNTRY) VALUES ('John Doe','Mumbai','Maharashtra','India');
INSERT INTO CUSTOMERS (CNAME,CITY,STATE,COUNTRY) VALUES ('Jane Doe','Delhi','Delhi','India');
INSERT INTO CUSTOMERS (CNAME,CITY,STATE,COUNTRY) VALUES ('Peter Parker','Chennai','Tamil Nadu','India');
INSERT INTO CUSTOMERS (CNAME,CITY,STATE,COUNTRY) VALUES ('Mary Jane Watson','Kolkata','West Bengal','India');
INSERT INTO CUSTOMERS (CNAME,CITY,STATE,COUNTRY) VALUES ('Bruce Wayne','Bangalore','Karnataka','India');

INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE) VALUES (1,'John Doe','HDFC Bank',10000.00,'2023-11-09 18:12:30');
INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE) VALUES (2,'Jane Doe','ICICI Bank',20000.00,'2023-11-09 18:12:30');
INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE) VALUES (3,'Peter Parker','SBI Bank',30000.00,'2023-11-09 18:12:30');
INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE) VALUES (4,'Mary Jane Watson','Axis Bank',40000.00,'2023-11-09 18:12:30');
INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE) VALUES (5,'Bruce Wayne','Kotak Mahindra Bank',50000.00,'2023-11-09 18:12:30');

INSERT INTO MANAGER (NAME,CITY,STATE,COUNTRY) VALUES ('Aditya','Rajkot','Gujarat','India');
INSERT INTO MANAGER (NAME,CITY,STATE,COUNTRY) VALUES ('John Doe','Mumbai','Maharashtra','India');
INSERT INTO MANAGER (NAME,CITY,STATE,COUNTRY) VALUES ('Jane Doe','Delhi','Delhi','India');
INSERT INTO MANAGER (NAME,CITY,STATE,COUNTRY) VALUES ('Peter Parker','Chennai','Tamil Nadu','India');
INSERT INTO MANAGER (NAME,CITY,STATE,COUNTRY) VALUES ('Mary Jane Watson','Kolkata','West Bengal','India');

select * from CUSTOMERS

select * from CUSTOMERS
where CNAME Like '%e' --name ends with e

select * from CUSTOMERS
where cname like '%a%'

select * from CUSTOMERS
where CITY like '_umbai'

select * from CUSTOMERS
where cname like '[a]%'

select * from CUSTOMERS
where cname like '[a-z]%'

select * from CUSTOMERS
where state in ('Gujarat','Delhi')

	select * from BORROW
	where AMOUNT between 10000 and 20000

select * from CUSTOMERS
inner join Employee
on CUSTOMERS.ID=Employee.EmployeeID

select * from CUSTOMERS
inner join DEPOSIT
on CUSTOMERS.ID=DEPOSIT.ACTNO

select * from CUSTOMERS
left join Employee
on CUSTOMERS.ID=Employee.EmployeeID
