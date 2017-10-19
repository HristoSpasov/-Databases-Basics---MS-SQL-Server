USE Geography;
GO

UPDATE   [Countries]
   SET
         [CountryName] = 'Burma'
 WHERE
       [CountryName] = 'Myanmar';


INSERT INTO [Monasteries]
(
       [Name],
       [CountryCode]
)
VALUES
       (
         'Hanga Abbey',
         (
             SELECT
                    [CountryCode]
               FROM [countries]
              WHERE [CountryName] = 'Tanzania'
          )
       );

INSERT INTO [Monasteries]
(
       [Name],
       [CountryCode]
)
VALUES
       (
         'Myin-Tin-Daik',
         (
             SELECT
                    [CountryCode]
               FROM [countries]
              WHERE [CountryName] = 'Myanmar'
          )
       );


SELECT
       [conts].[ContinentName],
       [c].[CountryName],
       COUNT([m].[Name]) AS [MonasteriesCount]
  FROM [Countries] AS [c]
       INNER JOIN [Continents] AS [conts] ON [c].[ContinentCode] = [conts].[ContinentCode]
       LEFT OUTER JOIN [Monasteries] AS [m] ON [m].[CountryCode] = [c].[CountryCode]
 WHERE [c].[IsDeleted] = 0
 GROUP BY
          [conts].[ContinentName],
          [c].[CountryName]
ORDER BY
         [MonasteriesCount] DESC,
         [c].[CountryName] ASC;
