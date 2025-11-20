-- ============================================================
-- Drop the EmployeeErrors table if it already exists
-- ============================================================
DROP TABLE EmployeeErrors;

-- ============================================================
-- Create a table with intentionally messy data
-- ============================================================
CREATE TABLE EmployeeErrors (
    EmployeeID varchar(50),
    FirstName varchar(50),
    LastName varchar(50)
);

-- ============================================================
-- Insert incorrect / dirty data for string function demonstrations
-- ============================================================
INSERT INTO EmployeeErrors VALUES
    ('1001  ', 'Jimbo', 'Halbert'),               -- Extra spaces at END of EmployeeID
    ('  1002', 'Pamela', 'Beasely'),              -- Extra spaces at START of EmployeeID
    ('1005', 'TOby', 'Flenderson - Fired');       -- Last name contains extra text

-- View raw data
SELECT *
FROM EmployeeErrors;


---------------------------------------------------------------
-- TRIM, LTRIM, RTRIM
---------------------------------------------------------------

-- TRIM: removes both leading and trailing spaces
SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors;

-- RTRIM: removes spaces only on the RIGHT side
SELECT EmployeeID, RTRIM(EmployeeID) AS IDRTRIM
FROM EmployeeErrors;

-- LTRIM: removes spaces only on the LEFT side
SELECT EmployeeID, LTRIM(EmployeeID) AS IDLTRIM
FROM EmployeeErrors;


---------------------------------------------------------------
-- REPLACE
-- Replace unwanted text inside a string
---------------------------------------------------------------
SELECT 
    LastName, 
    REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM EmployeeErrors;


---------------------------------------------------------------
-- SUBSTRING
-- Extract part of a string (start position, length)
-- Used here to match partial names between tables
---------------------------------------------------------------
SELECT 
	Substring(err.FirstName,1,3), 
	Substring(dem.FirstName,1,3), 
	Substring(err.LastName,1,3), 
	Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN SQLTutorial.dbo.EmployeeDemographics dem
    ON SUBSTRING(err.FirstName, 1, 3) = SUBSTRING(dem.FirstName, 1, 3)
   AND SUBSTRING(err.LastName, 1, 3) = SUBSTRING(dem.LastName, 1, 3);


---------------------------------------------------------------
-- UPPER and LOWER
-- Convert string to upper-case or lower-case
---------------------------------------------------------------

-- LOWER: Convert to lowercase
SELECT FirstName, LOWER(FirstName) AS FirstNameLower
FROM EmployeeErrors;

-- UPPER: Convert to uppercase
SELECT FirstName, UPPER(FirstName) AS FirstNameUpper
FROM EmployeeErrors;
