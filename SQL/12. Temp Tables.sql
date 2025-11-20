-- ============================================================
-- Create a temporary table to store employee salary info
-- Temporary tables start with # and exist only during the session
-- ============================================================
CREATE TABLE #temp_Employee(
    EmployeeID int,       -- Employee ID
    JobTitle varchar(100),-- Employee job title
    Salary int            -- Employee salary
);

-- ============================================================
-- Insert a single employee record into the temporary table
-- ============================================================
INSERT INTO #temp_Employee VALUES (
    1001, 'HR', 45000
);

-- ============================================================
-- Insert all records from the EmployeeSalary table into the temporary table
-- ============================================================
INSERT INTO #temp_Employee 
SELECT * 
FROM SQLTutorial.dbo.EmployeeSalary;

-- ============================================================
-- Select all records from the temporary table to verify
-- ============================================================
SELECT * 
FROM #temp_Employee;

-- ============================================================
-- Drop another temporary table if it exists
-- Useful to avoid errors when creating the table below
-- ============================================================
DROP TABLE IF EXISTS #Temp_Employee2;

-- ============================================================
-- Create another temporary table to store aggregated job statistics
-- ============================================================
CREATE TABLE #Temp_Employee2 (
    JobTitle varchar(50),     -- Employee job title
    EmployeePerJob int,       -- Count of employees per job
    AvgAge int,               -- Average age per job
    AvgSalary int             -- Average salary per job
);

-- ============================================================
-- Insert aggregated data into the new temporary table
-- ============================================================
INSERT INTO #Temp_Employee2
SELECT 
    JobTitle, 
    COUNT(JobTitle),      -- Number of employees per job
    AVG(Age),             -- Average age per job
    AVG(Salary)           -- Average salary per job
FROM SQLTutorial.dbo.EmployeeDemographics AS emp
JOIN SQLTutorial.dbo.EmployeeSalary AS sal
    ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle;       -- Group by job title for aggregation

-- ============================================================
-- Select all data from the second temporary table
-- ============================================================
SELECT * 
FROM #Temp_Employee2;
