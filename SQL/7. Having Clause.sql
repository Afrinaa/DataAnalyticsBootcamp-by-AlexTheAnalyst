-- ============================================================
-- Calculate the average salary per JobTitle
-- Only include job titles where the average salary is greater than 45,000
-- Use HAVING to filter aggregated groups (SUM, COUNT, AVG, MIN, MAX, etc.) after grouping.
-- ============================================================

SELECT 
    JobTitle,           -- Employee's job title
    AVG(Salary)          -- Calculate the average salary per JobTitle
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID  -- Join employee info with salary
GROUP BY JobTitle       -- Group results by JobTitle to compute AVG(Salary) per job
HAVING AVG(Salary) > 45000  -- Only include groups with average salary greater than 45,000
ORDER BY AVG(Salary);       -- Sort the results by average salary in ascending order
