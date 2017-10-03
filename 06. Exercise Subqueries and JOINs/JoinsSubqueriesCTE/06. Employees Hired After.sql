USE Softuni;
GO

SELECT
       [e].[FirstName],
       [e].[LastName],
       [E].[HireDate],
       [d].[Name] AS [DepetName]
  FROM [Employees] AS [e]
       JOIN [Departments] AS [d] ON [e].[DepartmentID] = [d].[DepartmentID]
 WHERE [e].[HireDate] >= YEAR(1999)
       AND [d].[Name] IN('Sales', 'Finance')
ORDER BY
         [e].[HireDate] ASC;