USE Bank;
GO

CREATE PROC [dbo].[usp_GetHoldersFullName]
AS
     SELECT
            CONcat([FirstName], ' ', [LastName]) AS [FullName]
       FROM [AccountHolders];

	  