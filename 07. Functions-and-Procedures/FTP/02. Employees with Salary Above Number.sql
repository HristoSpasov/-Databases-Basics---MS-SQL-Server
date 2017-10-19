USE Softuni;
GO

CREATE PROC [dbo].[usp_GetEmployeesSalaryAboveNumber]
       (
               @minSalary DECIMAL(18, 4)
       )
AS
     SELECT
            [FirstName],
            [LastName]
       FROM [Employees]
      WHERE [Salary] >= @minSalary;
