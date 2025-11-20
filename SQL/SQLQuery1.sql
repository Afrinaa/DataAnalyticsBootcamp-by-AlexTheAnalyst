--https://github.com/AlexTheAnalyst/SQL-Code

--CREATE TABLE EmployeeDemographics
--(	
--	EmployeeID int,
--	FirstName varchar(50),
--	LastName varchar(50),
--	Age int, 
--	Gender varchar(50)
--)
--CREATE TABLE EmployeeSalary 
--(
--	EmployeeID int,
--	JobTitle varchar(50),
--	Salary int
--)

--Insert into EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--SELECT TOP 5 *
--FROM EmployeeDemographics

--SELECT DISTINCT(Gender)
--FROM EmployeeDemographics

--SELECT COUNT(LastName) AS LastNameCount
--FROM EmployeeDemographics

--SELECT 
--	MAX(Salary) AS MaximumSalary, 
--	MIN(Salary) AS MinimumSalary,
--	AVG(Salary) AS AverageSalary
--FROM EmployeeSalary

/*
	:WHERE statements
	=, <>, <, >, AND, OR, LIKE, NULL, NOT NULL, IN
*/
--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE FirstName = 'Jim'
--WHERE Gender = 'Male' AND Age >=30
--WHERE LastName LIKE '%S%n' -- S in the begining S%, anywhere S%, and last %S
--WHERE FirstName IS NOT NULL
--WHERE FirstName IN ('Jim', 'Michael')

/*
	:GROUP BY, ORDER BY
*/
--SELECT Gender, COUNT(Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 30
--GROUP BY Gender
--ORDER BY CountGender DESC
--SELECT *
--FROM EmployeeDemographics
--ORDER BY 4 ASC, Gender DESC

/*
	:INNER JOINS, FULL/LEFT/RIGHT OUTER JOINS
*/
--SELECT EmployeeDemographics.EmployeeID, FirstName, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'Michael'
--ORDER BY Salary DESC

/*
	:UNION, UNION ALL
*/
--SELECT EmployeeID, FirstName, Age
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION
--SELECT EmployeeID, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeSalary
--ORDER BY EmployeeID

/*
	:Case Statements
*/
--SELECT FirstName, LastName, Age,
--CASE
--	WHEN Age > 30 THEN 'Old'
--	ELSE 'Young'
--END
--FROM SQLTutorial.dbo.EmployeeDemographics
--ORDER BY Age

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary*0.10)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary*0.05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary*0.08)
--	ELSE Salary + (Salary*0.03)
--END AS SalaryAfterRaise
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
	:Having Clause
*/
--SELECT JobTitle, AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)

/*
	 :Updating/Deleting Data
*/
--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics

--UPDATE SQLTutorial.dbo.EmployeeDemographics
--SET EmployeeID = 1012
--SET Age = 31, Gender = 'Female'
--WHERE FirstName = 'Michael' AND LastName = 'Scott'

--DELETE FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE EmployeeID = 1005

/*
	:third Table Creation
*/

--USE SQLTutorial;

--Create Table dbo.WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Insert into SQLTutorial.dbo.WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--SELECT * FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;

/*
	 :	Aliasing
*/
--SELECT FirstName  + ' ' + LastName AS FullName
--Select AVG(Age) AS AvgAge
--FROM [SQLTutorial].[dbo].[EmployeeDemographics]

--SELECT Demo.EmployeeID, Sal.Salary
--FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
--JOIN [SQLTutorial].[dbo].[EmployeeSalary] AS Sal
--	ON Demo.EmployeeID = Sal.EmployeeID

--SELECT Demo.EmployeeID, Demo.FirstName, Demo.FirstName, Sal.JobTitle, Ware.Age
--FROM [SQLTutorial].[dbo].EmployeeDemographics AS Demo
--LEFT JOIN [SQLTutorial].[dbo].EmployeeSalary AS Sal
--	ON Demo.EmployeeID = Sal.EmployeeID
--LEFT JOIN [SQLTutorial].[dbo].WareHouseEmployeeDemographics AS Ware
--	ON Demo.EmployeeID = Ware.EmployeeID

/*
	 :Partition By
*/

--SELECT FirstName, LastName, Gender, Salary
--, COUNT(Gender) OVER(PARTITION BY Gender) as TotalGender
--FROM SQLTutorial.dbo.EmployeeDemographics AS dem
--JOIN SQLTutorial.dbo.EmployeeSalary AS sal
--	ON dem.EmployeeID = sal.EmployeeID

--Partition By shows the table with all information where as Group By doesn't shows everything, for example:
--SELECT Gender, COUNT(Gender)
--FROM SQLTutorial.dbo.EmployeeDemographics AS dem
--JOIN SQLTutorial.dbo.EmployeeSalary as sal
--	ON dem.EmployeeID = sal.EmployeeID
--GROUP BY Gender

/*
	 :CTEs   used as subquery, doesn't get saved anywhere
*/
--WITH CTE_Employee AS 
--(
--SELECT FirstName, LastName, Gender, Salary
--, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
--, AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
--FROM SQLTutorial.dbo.EmployeeDemographics AS emp
--JOIN SQLTutorial.dbo.EmployeeSalary AS sal
--	on emp.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000'
--)
--SELECT *
--FROM CTE_Employee

/*
	 :temp tables 
*/

--CREATE TABLE #temp_Employee(
--EmployeeID int, 
--JObTitle varchar(100), 
--Salary int
--)

--INSERT INTO #temp_Employee VALUES (
--'1001' , 'HR', '45000'
--)

--INSERT INTO #temp_Employee 
--SELECT * 
--FROM SQLTutorial.dbo.EmployeeSalary

--Select * 
--FROM #temp_Employee

--DROP TABLE IF EXISTS #Temp_Employee2

--CREATE TABLE #Temp_Employee2 (
--JobTitle varchar(50),
--EmployeePerJob int, 
--AvgAge int, 
--AvgSalary int
--)

--INSERT INTO #Temp_Employee2
--SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics AS emp
--JOIN SQLTutorial.dbo.EmployeeSalary AS sal
--	ON emp.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--SELECT * FROM #Temp_Employee2

/*

	: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

--Select *
--From EmployeeErrors

---- Using Trim, LTRIM, RTRIM

--Select EmployeeID, TRIM(employeeID) AS IDTRIM
--FROM EmployeeErrors 

--Select EmployeeID, RTRIM(employeeID) as IDRTRIM
--FROM EmployeeErrors 

--Select EmployeeID, LTRIM(employeeID) as IDLTRIM
--FROM EmployeeErrors 

---- Using Replace

--Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
--FROM EmployeeErrors

---- Using Substring

--Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
--	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)

---- Using UPPER and lower

--Select firstname, LOWER(firstname)
--from EmployeeErrors

--Select Firstname, UPPER(FirstName)
--from EmployeeErrors

/*
	: Stored Procedures
*/


CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial.dbo.EmployeeDemographics emp
JOIN SQLTutorial.dbo.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee
GO;




CREATE PROCEDURE Temp_Employee2 
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee3
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle --- make sure to change this in this script from original above
group by JobTitle

Select * 
From #temp_employee3
GO;


exec Temp_Employee2 @jobtitle = 'Salesman'
exec Temp_Employee2 @jobtitle = 'Accountant'