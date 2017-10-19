USE Diablo;
GO

SELECT
       [Provider] AS [Email Provider],
       COUNT([Provider]) AS [Number Of Users]
  FROM
  (
      SELECT
             SUBSTRING([Email], CHARINDEX('@', [Email])+1, LEN([Email])-CHARINDEX('@', [Email])) AS [Provider]
        FROM [Users]
   ) AS [providers]
 GROUP BY
          [Provider]
ORDER BY
         COUNT([Provider]) DESC,
         [Provider] ASC;

