USE SQLTutorial;

Create Table dbo.WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into SQLTutorial.dbo.WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

SELECT * FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;

-- ============================================================
-- Example 1: Create a full name column by combining first and last name
-- ============================================================
SELECT 
    FirstName + ' ' + LastName AS FullName   -- 'FullName' is a column alias
FROM [SQLTutorial].[dbo].[EmployeeDemographics];

-- ============================================================
-- Example 2: Calculate the average age of all employees
-- ============================================================
SELECT 
    AVG(Age) AS AvgAge  -- 'AvgAge' is a column alias
FROM [SQLTutorial].[dbo].[EmployeeDemographics];

-- ============================================================
-- Example 3: Using table aliases for easier JOINs
-- ============================================================
SELECT 
    Demo.EmployeeID,   -- 'Demo' is an alias for EmployeeDemographics
    Sal.Salary         -- 'Sal' is an alias for EmployeeSalary
FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
JOIN [SQLTutorial].[dbo].[EmployeeSalary] AS Sal
    ON Demo.EmployeeID = Sal.EmployeeID;

-- ============================================================
-- Example 4: Multiple LEFT JOINs with table aliases
-- ============================================================
SELECT 
    Demo.EmployeeID,
    Demo.FirstName,       -- Employee first name from Demo alias
    Demo.FirstName,       -- Duplicate column (intentional as in original code)
    Sal.JobTitle,         -- Job title from Sal alias
    Ware.Age              -- Age from Ware alias
FROM [SQLTutorial].[dbo].EmployeeDemographics AS Demo
LEFT JOIN [SQLTutorial].[dbo].EmployeeSalary AS Sal
    ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQLTutorial].[dbo].WareHouseEmployeeDemographics AS Ware
    ON Demo.EmployeeID = Ware.EmployeeID;
