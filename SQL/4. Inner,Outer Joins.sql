--A schema is like a folder inside a database.
--Most tables created by default go into the dbo schema (database owner).
--Using the schema makes SQL faster and removes ambiguity.
--Database.Schema.Table
--SQLTutorial.dbo.EmployeeDemographics

-- ==========================================================
-- INNER JOIN → Only matching rows
-- ==========================================================
SELECT EmployeeDemographics.EmployeeID, FirstName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID  -- Join condition
WHERE FirstName <> 'Michael'   -- Exclude Michael
ORDER BY Salary DESC;          -- Sort by salary descending

-- ==========================================================
-- LEFT JOIN → All left table rows + matches from right
-- ==========================================================
SELECT 
    e.EmployeeID,
    e.FirstName,
    s.JobTitle,
    s.Salary
FROM SQLTutorial.dbo.EmployeeDemographics e
LEFT JOIN SQLTutorial.dbo.EmployeeSalary s
    ON e.EmployeeID = s.EmployeeID;

-- ==========================================================
-- RIGHT JOIN → All right table rows + matches from left
-- ==========================================================
SELECT 
    e.EmployeeID,
    e.FirstName,
    s.JobTitle,
    s.Salary
FROM SQLTutorial.dbo.EmployeeDemographics e
RIGHT JOIN SQLTutorial.dbo.EmployeeSalary s
    ON e.EmployeeID = s.EmployeeID;

-- ==========================================================
-- FULL OUTER JOIN → All rows from both tables
-- ==========================================================
SELECT 
    e.EmployeeID,
    e.FirstName,
    s.JobTitle,
    s.Salary
FROM SQLTutorial.dbo.EmployeeDemographics e
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary s
    ON e.EmployeeID = s.EmployeeID;
