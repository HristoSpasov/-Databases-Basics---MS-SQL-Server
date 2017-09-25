USE [SoftUni]
GO

SELECT [FirstName], [LastName]
  FROM [Employees]
 WHERE LEN(LTRIM(RTRIM(LastName))) = 5