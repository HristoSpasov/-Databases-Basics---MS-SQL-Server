USE Softuni;
GO

CREATE PROC [dbo].[usp_GetEmployeesFromTown]
       (
               @townName VARCHAR(50)
       )
AS
     SELECT
            [e].[FirstName],
            [e].[LastName]
       FROM [Employees] AS [e]
            JOIN [Addresses] AS [a] ON [e].[AddressID] = [a].[AddressID]
            JOIN [Towns] AS [t] ON [t].[TownID] = [a].[TownID]
      WHERE [t].[Name] = @townName;