USE Geography;
GO

WITH Selection_CTE
     AS (
     SELECT
            [c].[CountryName],
            [p].[PeakName],
            [p].[Elevation],
            [m].[MountainRange]
       FROM [Countries] AS [c]
            LEFT OUTER JOIN [MountainsCountries] AS [mc] ON [c].[CountryCode] = [mc].[CountryCode]
            LEFT OUTER JOIN [Mountains] AS [m] ON [mc].[MountainId] = [m].[Id]
            LEFT OUTER JOIN [Peaks] AS [p] ON [m].[Id] = [p].[MountainId])
     SELECT TOP(5)
            [CountryName] AS [Country],
            [PeakName] AS [HighestPeakName],
            [Elevation] AS [HighestPeakElevation],
            [MountainRange] AS [Mountain]
       FROM
       (
           SELECT
                  [CountryName],
                  CASE
                      WHEN [PeakName] IS NULL
                      THEN '(no highest peak)'
                      ELSE [PeakName]
                  END AS [PeakName],
                  CASE
                      WHEN [Elevation] IS NULL
                      THEN 0
                      ELSE [Elevation]
                  END AS [Elevation],
                  CASE
                      WHEN [MountainRange] IS NULL
                      THEN '(no mountain)'
                      ELSE [MountainRange]
                  END AS [MountainRange],
                  DENSE_RANK() OVER(PARTITION BY [CountryName] ORDER BY [Elevation] DESC) AS [RankedElevation]
             FROM [Selection_CTE]
        ) AS [grouped]
      WHERE [RankedElevation] = 1
     ORDER BY
              [CountryName] ASC,
              [PeakName] ASC;
