USE [Gringotts]
GO

SELECT [DepositGroup],
       [IsDepositExpired],
       [AverageInterest] = AVG([DepositInterest])
  FROM [WizzardDeposits]
WHERE [DepositStartDate] > '1985-01-01'
GROUP BY [DepositGroup], [IsDepositExpired]
ORDER BY [DepositGroup] DESC,
         [IsDepositExpired] ASC