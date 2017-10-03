USE Softuni; 
GO

SELECT
       [e].[EmployeeID],
       [e].[FirstName],
       [e].[LastName],
       [d].[Name]
  FROM [Employees] AS [e]
       JOIN [Departments] AS [d] ON [e].[DepartmentId] = [d].[DepartmentId]
 WHERE [d].[Name] = 'Sales'
ORDER BY
         [e].[EmployeeId] ASC;
