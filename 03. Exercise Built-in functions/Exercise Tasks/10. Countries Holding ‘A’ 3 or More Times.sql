USE [Geography]
GO

SELECT [CountryName], [IsoCode] AS [ISO Code]
  FROM [Countries]
WHERE DATALENGTH([CountryName]) - DATALENGTH(REPLACE([CountryName], 'A', '')) >= 3
ORDER BY [IsoCode]