-- ============================================================
-- Example: Using a Common Table Expression (CTE) with window functions
-- ============================================================

-- Define a CTE named CTE_Employee
WITH CTE_Employee AS 
(
    SELECT 
        FirstName, 
        LastName, 
        Gender, 
        Salary,
        -- Window function: count the number of employees per gender
        COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
        -- Window function: calculate average salary per gender
        AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
    FROM SQLTutorial.dbo.EmployeeDemographics AS emp  -- Table alias for EmployeeDemographics
    JOIN SQLTutorial.dbo.EmployeeSalary AS sal       -- Table alias for EmployeeSalary
        ON emp.EmployeeID = sal.EmployeeID
    WHERE Salary > 45000  -- Only include employees with Salary greater than 45000
)

-- Select all columns from the CTE
SELECT *
FROM CTE_Employee;

-- ============================================================
-- Explanation:
-- 1. CTE (Common Table Expression) allows you to create a temporary named result set.
-- 2. COUNT() OVER(PARTITION BY Gender) counts employees per gender, but keeps all individual rows.
-- 3. AVG() OVER(PARTITION BY Gender) calculates the average salary per gender without collapsing rows.
-- 4. WHERE filters the rows before window functions are applied.
-- 5. The final SELECT retrieves all columns from the CTE.
-- ============================================================
