USE Diablo;
GO

WITH cte_aggregatedData(
     [Username],
     [Game],
     [Items Count],
     [Items Price])
     AS (
     SELECT
            [u].[Username] AS [Username],
            [g].[Name] AS [Game],
            COUNT([i].[Name]) AS [Items Count],
            SUM([i].[Price]) AS [Items Price]
       FROM [USersGames] AS [ug]
            JOIN [Games] AS [g] ON [ug].[GameId] = [g].[Id]
            JOIN [Users] AS [u] ON [ug].[UserId] = [u].[Id]
            JOIN [UserGameItems] AS [ugi] ON [ug].[Id] = [ugi].[UserGameId]
            JOIN [Items] AS [i] ON [i].[Id] = [ugi].[ItemId]
      GROUP BY
               [u].[Username],
               [g].[Name])
     SELECT
            *
       FROM [cte_aggregatedData]
      WHERE [Items Count] >= 10
     ORDER BY
              [Items Count] DESC,
              [Items Price] DESC,
              [Username] ASC;
