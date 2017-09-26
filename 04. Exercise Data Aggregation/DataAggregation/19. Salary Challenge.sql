USE [SoftUni]
GO

SELECT TOP(10) [FirstName], [LastName], [DepartmentID]
FROM [Employees] e
WHERE [Salary] > (SELECT AVG([Salary]) FROM [Employees] e2 WHERE e2.[DepartmentID] = e.[DepartmentID])
ORDER BY [DepartmentID]