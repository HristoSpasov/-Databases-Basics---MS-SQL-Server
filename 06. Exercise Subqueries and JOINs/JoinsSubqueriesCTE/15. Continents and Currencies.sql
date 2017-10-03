USE Geography;
GO


WITH ContinentsCurrenciesSelection_CTE(
     [ContinentCode],
     [CurrencyCode],
     [CurrencyUsage])
     AS (
     SELECT
            [conts].[ContinentCode],
            [curr].[CurrencyCode],
            COUNT(*) AS [CurrencyUsage]
       FROM [Countries] AS [c]
            JOIN [Currencies] AS [curr] ON [c].[CurrencyCode] = [curr].[CurrencyCode]
            JOIN [Continents] AS [conts] ON [c].[ContinentCode] = [conts].[ContinentCode]
      GROUP BY
               [conts].[ContinentCode],
               [curr].[CurrencyCode]
      HAVING COUNT(*) > 1)
     SELECT
            [ContinentCode],
            [CurrencyCode],
            [CurrencyUsage]
       FROM
       (
           SELECT
                  *,
                  DENSE_RANK() OVER(PARTITION BY [ContinentCode] ORDER BY [CurrencyUsage] DESC) AS [Rank]
             FROM [ContinentsCurrenciesSelection_CTE]
        ) AS [ccs]
      WHERE RANK = 1
     ORDER BY
              [ContinentCode] ASC;