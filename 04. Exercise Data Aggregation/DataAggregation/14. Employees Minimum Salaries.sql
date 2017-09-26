USE [SoftUni]
GO

SELECT [DepartmentID],
       [MinimumSalary] = MIN([Salary])
  FROM [Employees]
 WHERE [DepartmentID] IN (2, 5, 7)  AND [HireDate] >= YEAR(2000)
 GROUP BY [DepartmentID]