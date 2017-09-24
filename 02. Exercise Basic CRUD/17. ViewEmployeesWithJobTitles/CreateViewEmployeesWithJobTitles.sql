USE SoftUni
GO

CREATE VIEW v_EmployeeNameJobTitle
AS
SELECT [FirstName] + ' ' + COALESCE([MiddleName], '')  + ' ' + [LastName] AS [Full Name],
	   [JobTitle] AS [Job Title]
FROM Employees

GO

SELECT * FROM v_EmployeeNameJobTitle