USE Softuni;
GO

CREATE PROC [dbo].[usp_EmployeesBySalaryLevel]
       (
               @salaryLevel VARCHAR(10)
       )
AS
     SELECT
            [selected].[FirstName],
            [selected].[LastName]
       FROM
       (
           SELECT
                  [FirstName],
                  [LastName],
                  [dbo].[ufn_GetSalaryLevel]([Salary]) AS [SalaryLevel]
             FROM [Employees]
        ) AS [selected]
      WHERE [selected].[SalaryLevel] = @salaryLevel;