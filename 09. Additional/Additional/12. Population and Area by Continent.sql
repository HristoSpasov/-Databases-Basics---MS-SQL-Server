USE Geography;
GO

SELECT
       [conts].[ContinentName],
       SUM([c].[AreaInSqKm]) AS [CountriesArea],
       SUM(CONVERT(BIGINT, [c].[Population])) AS [CountriesPopulation]
  FROM [Countries] AS [c]
       JOIN [Continents] AS [conts] ON [c].[ContinentCode] = [conts].[ContinentCode]
 GROUP BY
          [conts].[ContinentName]
ORDER BY
         SUM(CONVERT(BIGINT, [c].[Population])) DESC;