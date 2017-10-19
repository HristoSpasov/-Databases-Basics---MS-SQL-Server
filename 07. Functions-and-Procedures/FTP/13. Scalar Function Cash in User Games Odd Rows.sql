USE Diablo;
GO

CREATE FUNCTION [dbo].[ufn_CashInUsersGames]
                (
               @gameName NVARCHAR(100)
                )
RETURNS TABLE
AS
     RETURN
     WITH cte_GameCashInOddRows(
          [Cash],
          [RowNumber])
          AS (
          SELECT
                 [ug].[Cash] AS [Cash],
                 ROW_NUMBER() OVER(ORDER BY [ug].[Cash] DESC) AS [RowNumber]
            FROM [UsersGames] AS [ug]
                 JOIN [Games] AS [g] ON [ug].[GameId] = [g].[Id]
           WHERE [g].[Name] = @gameName)
          SELECT
                 SUM([Cash]) AS [SumCash]
            FROM [cte_GameCashInOddRows]
           WHERE [RowNumber] % 2 = 1;

		