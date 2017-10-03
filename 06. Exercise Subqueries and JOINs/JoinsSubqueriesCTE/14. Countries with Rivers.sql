USE Geography;
GO

SELECT TOP (5)
       [c].[CountryName],
       [r].[RiverName]
  FROM [Countries] AS [c]
       LEFT OUTER JOIN [CountriesRivers] AS [cr] ON [c].[CountryCode] = [cr].[CountryCode]
       LEFT OUTER JOIN [Rivers] AS [r] ON [r].[Id] = [cr].[RiverId]
 WHERE [c].[ContinentCode] IN
  (
      SELECT
             [ContinentCode]
        FROM [Continents] AS [conts]
       WHERE [conts].[ContinentName] = 'Africa'
   )
ORDER BY
         [c].[CountryName] ASC;