-- ============================================
-- Create a table to store employee basic info
-- ============================================
CREATE TABLE EmployeeDemographics
(	
	EmployeeID int,          -- Unique employee identifier
	FirstName varchar(50),   -- Employee first name
	LastName varchar(50),    -- Employee last name
	Age int,                 -- Employee age
	Gender varchar(50)       -- Employee gender
)

-- ===============================================
-- Create a table to store employee salary details
-- ===============================================
CREATE TABLE EmployeeSalary 
(
	EmployeeID int,          -- Employee ID (matches EmployeeDemographics)
	JobTitle varchar(50),    -- Employee job title
	Salary int               -- Employee salary amount
)

-- =====================================================
-- Insert sample employee records into demographics table
-- =====================================================
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

-- ==================================================
-- Insert sample salary data for each employee
-- ==================================================
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

-- ====================================================
-- Select the first 5 records from EmployeeDemographics
-- ====================================================
SELECT TOP 5 *
FROM EmployeeDemographics

-- ==========================================
-- Return a list of unique genders in the table
-- ==========================================
SELECT DISTINCT(Gender)
FROM EmployeeDemographics

-- ==========================================
-- Count how many employees have a last name 
-- ==========================================
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics

-- =======================================================
-- Get the highest, lowest, and average salary information
-- =======================================================
SELECT 
	MAX(Salary) AS MaximumSalary, 
	MIN(Salary) AS MinimumSalary,
	AVG(Salary) AS AverageSalary
FROM EmployeeSalary
