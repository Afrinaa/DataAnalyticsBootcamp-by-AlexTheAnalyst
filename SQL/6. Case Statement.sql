-- ============================================================
-- Example of using CASE statement to categorize employees by age
-- ============================================================

SELECT FirstName, LastName, Age,
CASE        
	WHEN Age > 30 THEN 'Old'   -- If age is greater than 30, label as 'Old'
	ELSE 'Young'               -- Otherwise, label as 'Young'
END AS AgeCategory             -- Give a name to the new column
FROM SQLTutorial.dbo.EmployeeDemographics
ORDER BY Age;                     

-- ============================================================
-- Calculate new salary after applying raise based on JobTitle
-- ============================================================

SELECT FirstName, LastName, JobTitle, Salary,
CASE        -- Conditional logic to calculate raise
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.10)      -- 10% raise for Salesman
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)    -- 5% raise for Accountant
	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.08)            -- 8% raise for HR
	ELSE Salary + (Salary * 0.03)                                  -- 3% raise for all others
END AS SalaryAfterRaise   -- Name for the new calculated column
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID  -- Join to match employee with salary
