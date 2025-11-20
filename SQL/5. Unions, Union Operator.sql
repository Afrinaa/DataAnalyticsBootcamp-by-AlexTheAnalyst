-- ======================================================
-- UNION vs UNION ALL:
-- - UNION: combines results from multiple SELECTs and removes duplicates
-- - UNION ALL: combines results from multiple SELECTs and keeps duplicates
-- ======================================================

SELECT EmployeeID, FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID
