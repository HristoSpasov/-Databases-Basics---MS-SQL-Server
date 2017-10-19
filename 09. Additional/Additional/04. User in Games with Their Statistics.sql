USE Diablo;
GO

SELECT
       *
  FROM
  (
      SELECT
             [u].[Username] AS [Username],
             [g].[Name] AS [Game],
             MAX([chars].[Name]) AS [Character],
             SUM([ugis].[Strength]) + MAX([gts].[Strength]) + MAX([charsStats].[Strength]) AS [Strength],
             SUM([ugis].[Defence]) + MAX([gts].[Defence]) + MAX([charsStats].[Defence]) AS [Defence],
             SUM([ugis].[Speed]) + MAX([gts].[Speed]) + MAX([charsStats].[Speed]) AS [Speed],
             SUM([ugis].[Mind]) + MAX([gts].[Mind]) + MAX([charsStats].[Mind]) AS [Mind],
             SUM([ugis].[Luck]) + MAX([gts].[Luck]) + MAX([charsStats].[Luck]) AS [Luck]
        FROM [UsersGames] AS [ug]
             JOIN [Users] AS [u] ON [u].[Id] = [ug].[UserId]
             JOIN [Games] AS [g] ON [g].[Id] = [ug].[GameId]
             JOIN [GameTypes] AS [gt] ON [g].[GameTypeId] = [gt].[Id]
             JOIN [Statistics] AS [gts] ON [gts].[Id] = [gt].[BonusStatsId]
             JOIN [UserGameItems] AS [ugi] ON [ug].[Id] = [ugi].[UserGameId]
             JOIN [Items] AS [i] ON [i].[Id] = [ugi].[ItemId]
             JOIN [Statistics] AS [ugis] ON [ugis].[Id] = [i].[StatisticId]
             JOIN [Characters] AS [chars] ON [chars].[Id] = [ug].[CharacterId]
             JOIN [Statistics] AS [charsStats] ON [charsStats].[Id] = [chars].[StatisticId]
       GROUP BY
                [u].[Username],
                [g].[Name]
   ) AS [grouped]
ORDER BY
         [Strength] DESC,
         [Defence] DESC,
         [Speed] DESC,
         [Mind] DESC,
         [Luck] DESC;