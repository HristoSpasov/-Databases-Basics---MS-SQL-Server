USE Bank;
GO

CREATE PROC [dbo].[usp_GetHoldersWithBalanceHigherThan]
       (
               @money MONEY
       )
AS
     SELECT
            [gr].[FirstName] AS [First Name],
            [gr].[LastName] AS [Last Name]
       FROM
       (
           SELECT
                  [ac].[FirstName],
                  [ac].[LastName],
                  SUM([a].[Balance]) AS [Balance]
             FROM [AccountHolders] AS [ac]
                  JOIN [Accounts] AS [a] ON [ac].[Id] = [a].[AccountHolderId]
            GROUP BY
                     [ac].[FirstName],
                     [ac].[LastName]
        ) AS [gr]
      WHERE [gr].[Balance] > @money;