USE Geography;
GO

SELECT
       [CountryName],
       [ContinentName],
       CASE
           WHEN [TotalLength] = 0
           THEN 0
           ELSE [RiversCount]
       END AS [RiversCount],
       [TotalLength]
  FROM
  (
      SELECT
             [CountryName],
             [ContinentName],
             COUNT([RiverName]) AS [RiversCount],
             SUM([Length]) AS [TotalLength]
        FROM
        (
            SELECT
                   [c].[CountryName],
                   [conts].[ContinentName],
                   ISNULL([r].[RiverName], 0) AS [RiverName],
                   ISNULL([r].[Length], 0) AS [Length]
              FROM [Countries] AS [c]
                   LEFT OUTER JOIN [CountriesRivers] AS [cr] ON [c].[CountryCode] = [cr].[CountryCode]
                   LEFT OUTER JOIN [Rivers] AS [r] ON [r].[Id] = [cr].[RiverId]
                   INNER JOIN [Continents] AS [conts] ON [conts].[ContinentCode] = [c].[ContinentCode]
         ) AS [selected]
       GROUP BY
                [ContinentName],
                [CountryName]
   ) AS [grouped]
ORDER BY
         [RiversCount] DESC,
         [TotalLength] DESC,
         [CountryName] ASC;
