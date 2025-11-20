-- ============================================================
-- Select all records from EmployeeDemographics table
-- ============================================================
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics;

-- ============================================================
-- Update employee details
-- ============================================================
UPDATE SQLTutorial.dbo.EmployeeDemographics
SET 
    EmployeeID = 1012,   -- Change EmployeeID
    Age = 31,            -- Update Age
    Gender = 'Female'    -- Update Gender
WHERE FirstName = 'Michael' AND LastName = 'Scott';  -- Only update Michael Scott

-- ============================================================
-- Delete an employee record
-- ============================================================
DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1005;  -- Delete employee with ID 1005

-- ============================================================
-- Always use a WHERE clause for UPDATE and DELETE unless you want to affect all rows.
-- ============================================================