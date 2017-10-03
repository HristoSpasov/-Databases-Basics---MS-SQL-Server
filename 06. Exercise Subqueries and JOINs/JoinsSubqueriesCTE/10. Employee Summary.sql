USE SoftUni;
GO

SELECT TOP (50)
       [e].[EmployeeID],
       [e].[Firstname]+' '+[e].[LastName] AS [EmployeeName],
       [e1].[FirstName]+' '+[e1].[LastName] AS [ManagerName],
       [d].[Name] AS [DepartmentName]
  FROM [Employees] AS [e]
       JOIN [Departments] AS [d] ON [e].[DepartmentID] = [d].[DepartmentID]
       JOIN [Employees] AS [e1] ON [e].[ManagerID] = [e1].[EmployeeID]
ORDER BY
         [e].[EmployeeID];