USE [SoftUni]
GO

SELECT [Name]
  FROM [Towns]
 WHERE DATALENGTH([Name]) IN (5, 6)
ORDER BY [Name]