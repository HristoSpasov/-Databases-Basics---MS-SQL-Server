USE [SoftUni]
GO

SELECT *
  FROM [Towns]
 WHERE LEFT([Name], 1) IN ('M', 'K', 'B', 'E')
ORDER BY [Name] ASC