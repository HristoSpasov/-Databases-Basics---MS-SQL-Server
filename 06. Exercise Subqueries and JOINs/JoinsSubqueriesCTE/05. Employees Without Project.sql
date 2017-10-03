USE Softuni;
GO

SELECT TOP (3)
       [e].[EmployeeID],
       [e].[FirstName]
  FROM [Employees] AS [e]
       LEFT OUTER JOIN [EmployeesProjects] AS [ep] ON [e].[EmployeeID] = [ep].[EmployeeID]
 WHERE [ep].[ProjectId] IS NULL;