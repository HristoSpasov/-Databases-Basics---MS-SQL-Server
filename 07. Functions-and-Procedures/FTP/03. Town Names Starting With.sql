USE Softuni;
GO

CREATE PROC [dbo].[usp_GetTownsStartingWith]
       (
               @firstLetter VARCHAR(MAX)
       )
AS
     SELECT
            [Name] AS [Town]
       FROM [Towns]
      WHERE [Name] LIKE CONCAT(@firstLetter, '%'); 