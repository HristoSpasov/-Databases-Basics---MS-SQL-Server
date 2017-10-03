USE SoftUni;
GO

SELECT
       MIN([grouped].[AvgSalary])
  FROM
  (
      SELECT
             [DepartmentID],
             AVG([Salary]) AS [AvgSalary]
        FROM [Employees]
       GROUP BY
                [DepartmentID]
   ) AS [grouped];