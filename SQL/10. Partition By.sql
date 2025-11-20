-- ============================================================
-- Example 1: Using COUNT() with OVER(PARTITION BY)
-- ============================================================
SELECT 
    FirstName, 
    LastName, 
    Gender, 
    Salary,
    -- COUNT(Gender) OVER(PARTITION BY Gender) calculates the total number of employees
    -- in each Gender group, but does not collapse rows. All original rows are shown.
    COUNT(Gender) OVER(PARTITION BY Gender) AS TotalGender
FROM SQLTutorial.dbo.EmployeeDemographics AS dem   -- 'dem' is table alias
JOIN SQLTutorial.dbo.EmployeeSalary AS sal         -- 'sal' is table alias
    ON dem.EmployeeID = sal.EmployeeID;

-- ============================================================
-- Explanation:
-- PARTITION BY divides the result set into groups (here by Gender)
-- COUNT() OVER(PARTITION BY Gender) counts rows per group
-- But unlike GROUP BY, it does not aggregate the rows into a single row per group
-- ============================================================

-- ============================================================
-- Example 2: Using GROUP BY
-- ============================================================
SELECT 
    Gender, 
    COUNT(Gender) AS CountPerGender  -- Counts number of employees per gender
FROM SQLTutorial.dbo.EmployeeDemographics AS dem
JOIN SQLTutorial.dbo.EmployeeSalary AS sal
    ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender;  -- Aggregates rows by Gender, returns one row per gender

-- ============================================================
-- Key Difference:
-- - PARTITION BY: keeps all original rows, adds aggregate info per group
-- - GROUP BY: collapses rows into one per group, losing individual row details
-- ============================================================
