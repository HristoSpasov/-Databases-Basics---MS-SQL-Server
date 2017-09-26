USE [SoftUni]
GO

SELECT [Count] = COUNT([Salary])
  FROM [Employees]
 WHERE [ManagerID] IS NULL