-- ======================================================
-- Count how many employees (per gender) are older than 30
-- GROUP BY: groups rows by Gender
-- COUNT(): counts how many records are in each group
-- ORDER BY: sorts the result so the biggest group appears first
-- ======================================================
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender
ORDER BY CountGender DESC;

-- ======================================================
-- Return all employee records
-- ORDER BY:
--   4 ASC  --> sorts by the 4th column in the table (Age) from smallest to largest
--   Gender DESC --> if Age is the same, sort Gender in reverse alphabetical order
-- ======================================================
SELECT *
FROM EmployeeDemographics
ORDER BY 4 ASC, Gender DESC;
