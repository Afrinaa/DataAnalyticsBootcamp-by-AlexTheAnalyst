-- ============================================
-- Return all columns for employees named Jim
-- ============================================
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE FirstName = 'Jim';

-- ======================================================
-- Return male employees age 30 or older
-- ======================================================
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Gender = 'Male' 
  AND Age >= 30;

-- =======================================================
-- Return employees whose last name contains 'S' and ends in 'n'
-- LIKE patterns:
--   S%    = starts with S
--   %S%   = contains S anywhere
--   %n    = ends with n
-- =======================================================
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE LastName LIKE '%S%n';

-- ======================================================
-- Return all rows where FirstName is not NULL
-- ======================================================
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE FirstName IS NOT NULL;

-- ======================================================
-- Return rows where FirstName is either Jim or Michael
-- ======================================================
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael');
