USE SoftUni;
GO

SELECT
       [e].[EmployeeID],
       [e].[FirstName],
       CASE
           WHEN [p].[StartDate] > '2004-12-31'
           THEN NULL
           ELSE [p].[Name]
       END AS [ProjectName]
  FROM [Employees] AS [e]
       JOIN [EmployeesProjects] AS [ep] ON [e].[EmployeeID] = [ep].[EmployeeID]
       JOIN [Projects] AS [p] ON [p].[ProjectID] = [ep].[ProjectID]
 WHERE [e].[EmployeeID] = 24;