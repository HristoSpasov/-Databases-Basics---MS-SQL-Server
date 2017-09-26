USE [SoftUni]
GO

SELECT [DepartmentID],
       [TotalSalary] = SUM([Salary])
  FROM [Employees]
GROUP BY [DepartmentID]
ORDER BY [DepartmentID]