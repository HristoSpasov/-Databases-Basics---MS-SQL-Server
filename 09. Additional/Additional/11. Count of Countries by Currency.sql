USE Geography;
GO

SELECT
       [cur].[CurrencyCode],
       [cur].[Description] AS [Currency],
       COUNT([c].[CountryName]) AS [NumberOfCountries]
  FROM [Countries] AS [c]
       RIGHT JOIN [Currencies] AS [cur] ON [c].[CurrencyCode] = [cur].[CurrencyCode]
 GROUP BY
          [cur].[CurrencyCode],
          [cur].[Description]
ORDER BY
         COUNT([c].[CountryName]) DESC,
         [cur].[Description] ASC;