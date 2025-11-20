-- ============================================================
-- Create a stored procedure that builds a temporary summary table
-- ============================================================
CREATE PROCEDURE Temp_Employee  
AS
    -- ----------------------------------------------------------
    -- Drop the temp table if it already exists (prevents errors)
    -- ----------------------------------------------------------
    DROP TABLE IF EXISTS #temp_employee;

    -- ----------------------------------------------------------
    -- Create a temporary table to store aggregated job metrics
    -- ----------------------------------------------------------
    CREATE TABLE #temp_employee (
        JobTitle varchar(100),     
        EmployeesPerJob int,       
        AvgAge int,                
        AvgSalary int              
    );

    -- ----------------------------------------------------------
    -- Insert aggregated data from the main tables
    -- ----------------------------------------------------------
    INSERT INTO #temp_employee
    SELECT 
        JobTitle, 
        COUNT(JobTitle),     
        AVG(Age),            
        AVG(Salary)          
    FROM SQLTutorial.dbo.EmployeeDemographics emp
    JOIN SQLTutorial.dbo.EmployeeSalary sal
        ON emp.EmployeeID = sal.EmployeeID
    GROUP BY JobTitle;       -- Must group by JobTitle for aggregates

    -- ----------------------------------------------------------
    -- Return all data from the temporary table
    -- ----------------------------------------------------------
    SELECT * 
    FROM #temp_employee;
GO;

-- ----------------------------------------------------------
-- How to run the procedure:
-- ----------------------------------------------------------
EXEC Temp_Employee;