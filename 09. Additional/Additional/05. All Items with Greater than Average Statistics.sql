USE Diablo;
GO
DECLARE @avgMind NUMERIC(10, 2)  =
  (
      SELECT
             AVG([Mind])
        FROM [Statistics]
   );
DECLARE @avgLuck NUMERIC(10, 2)  =
  (
      SELECT
             AVG([Luck])
        FROM [Statistics]
   );
DECLARE @avgSpeed NUMERIC(10, 2)  =
  (
      SELECT
             AVG([Speed])
        FROM [Statistics]
   );

SELECT
       [i].[Name],
       [i].[Price],
       [i].[MinLevel],
       [s].[Strength],
       [s].[Defence],
       [s].[Speed],
       [s].[Luck],
       [s].[Mind]
  FROM [Items] AS [i]
       JOIN [Statistics] AS [s] ON [s].[Id] = [i].[StatisticId]
 WHERE [s].[Mind] > @AvgMind
       AND [s].[Luck] > @avgLuck
       AND [s].[Speed] > @avgSpeed
ORDER BY
         [i].[Name]; 