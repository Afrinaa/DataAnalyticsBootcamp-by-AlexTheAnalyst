-- ============================================================
-- Subqueries (in the SELECT, FROM, and WHERE clauses)
-- ============================================================
USE SQLTutorial;
GO

-- View the base table
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary;


-- ============================================================
-- 1. SUBQUERY IN THE SELECT CLAUSE
-- Returns a new calculated column for each row
-- Subquery must return a SINGLE VALUE (scalar)
-- ============================================================
SELECT 
    EmployeeID, 
    Salary,
    (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary   -- Same for every row
FROM EmployeeSalary;


-- ============================================================
-- Same result using WINDOW FUNCTION (Partition By)
-- AVG(Salary) OVER() gives the overall average for all rows
-- ============================================================
SELECT 
    EmployeeID, 
    Salary,
    AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary;


-- ============================================================
-- Why GROUP BY does NOT produce the same result
-- GROUP BY forces SQL to collapse rows into groups
-- You cannot show raw row-level data (EmployeeID, Salary)
-- AND a non-grouped aggregate in the same output
-- ============================================================
SELECT 
    EmployeeID, 
    Salary,
    AVG(Salary) AS AllAvgSalary       -- This becomes row-level average, not full average
FROM EmployeeSalary
GROUP BY EmployeeID, Salary           -- You are grouping every row individually
ORDER BY EmployeeID;


-- ============================================================
-- 2. SUBQUERY IN THE FROM CLAUSE
-- A subquery used as a table is called a "derived table"
-- Must give it an alias (a)
-- ============================================================
SELECT 
    a.EmployeeID, 
    a.AllAvgSalary
FROM 
    (
        SELECT 
            EmployeeID, 
            Salary, 
            AVG(Salary) OVER () AS AllAvgSalary
        FROM EmployeeSalary
    ) a
ORDER BY a.EmployeeID;


-- ============================================================
-- 3. SUBQUERY IN THE WHERE CLAUSE
-- Returns a list of EmployeeIDs to filter the main query
-- ============================================================
SELECT 
    EmployeeID, 
    JobTitle, 
    Salary
FROM EmployeeSalary
WHERE EmployeeID IN (
        SELECT EmployeeID
        FROM EmployeeDemographics
        WHERE Age > 30          -- Only employees older than 30
    );
