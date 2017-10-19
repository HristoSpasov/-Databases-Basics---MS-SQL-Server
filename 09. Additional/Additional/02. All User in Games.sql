USE Diablo;
GO

WITH cte_Users_UsersGames(
     [Id],
     [Username],
     [Level],
     [Cash])
     AS (
     SELECT
            [ug].[Id],
            [u].[UserName],
            [ug].[Level],
            [ug].[Cash]
       FROM [UsersGames] AS [ug]
            JOIN [Users] AS [u] ON [ug].[USerId] = [u].[Id]),
     cte_UsersGames_Games(
     [Id],
     [Game])
     AS (
     SELECT
            [ug].[Id],
            [g].[Name]
       FROM [UsersGames] AS [ug]
            JOIN [Games] AS [g] ON [ug].[GameId] = [g].[Id]),
     cte_UsersGames_GameTypes(
     [Id],
     [Game Type])
     AS (
     SELECT
            [ug].[Id],
            [gt].[Name]
       FROM [UsersGames] AS [ug]
            JOIN [Games] AS [g] ON [ug].[GameId] = [g].[Id]
            JOIN [GameTypes] AS [gt] ON [g].[GameTypeId] = [gt].[Id]),
     cte_UsersGames_Character(
     [Id],
     Character)
     AS (
     SELECT
            [ug].[Id],
            [c].[Name]
       FROM [UsersGames] AS [ug]
            JOIN [Characters] AS [c] ON [ug].[CharacterId] = [c].[Id])
     SELECT
            [Game],
            [Game Type],
            [Username],
            [Level],
            [Cash],
            [Character]
       FROM [cte_Users_UsersGames]
            JOIN [cte_UsersGames_Games] ON [cte_UsersGames_Games].[Id] = [cte_Users_UsersGames].[Id]
            JOIN [cte_UsersGames_GameTypes] ON [cte_Users_UsersGames].[Id] = [cte_UsersGames_GameTypes].[Id]
            JOIN [cte_UsersGames_Character] ON [cte_Users_UsersGames].[Id] = [cte_UsersGames_Character].[Id]
     ORDER BY
              [Level] DESC,
              [Username] ASC,
              [Game] ASC;