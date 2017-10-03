USE Geography;
GO

WITH HighestPeakAndLongestRiver_CTE(
     [CountryName],
     [HighestPeakElevation],
     [LongestRiverLength])
     AS (
     SELECT
            [c].[CountryName],
            MAX([p].[Elevation]) AS [HighestPeakElevation],
            MAX([r].[Length]) AS [LongestRiverLength]
       FROM [Countries] AS [c]
            LEFT JOIN [MountainsCountries] AS [mc] ON [c].[CountryCode] = [mc].[CountryCode]
            LEFT JOIN [Mountains] AS [m] ON [mc].[MountainId] = [m].[Id]
            LEFT JOIN [Peaks] AS [p] ON [m].[Id] = [p].[MountainId]
            LEFT JOIN [CountriesRivers] AS [cr] ON [c].[CountryCode] = [cr].[CountryCode]
            LEFT JOIN [Rivers] AS [r] ON [r].[Id] = [cr].[RiverId]
      GROUP BY
               [c].[CountryName])
     SELECT TOP(5)
            *
       FROM [HighestPeakAndLongestRiver_CTE]
     ORDER BY
              [HighestPeakElevation] DESC,
              [LongestRiverLength] DESC,
		    [CountryName] ASC;