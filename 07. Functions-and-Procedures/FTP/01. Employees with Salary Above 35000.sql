USE Softuni;
GO

CREATE PROC [dbo].[usp_GetEmployeesSalaryAbove35000]
AS
     SELECT
            [FirstName],
            [LastName]
       FROM [Employees]
      WHERE [Salary] > 35000;

