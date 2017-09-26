USE [SoftUni]
GO

SELECT [DepartmentID], [ThirdHighestSalary]
  FROM (SELECT DISTINCT [DepartmentID], [Salary] AS [ThirdHighestSalary],
        DENSE_RANK () OVER (PARTITION BY [DepartmentID] ORDER BY [Salary] DESC) rnk
FROM Employees) T
WHERE T.rnk = 3