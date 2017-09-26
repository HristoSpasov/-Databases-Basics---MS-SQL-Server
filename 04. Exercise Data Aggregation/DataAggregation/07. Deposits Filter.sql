USE [Gringotts]
GO

SELECT [DepositGroup],
	   [TotalSum] = SUM([DepositAmount])
  FROM [WizzardDeposits]
 WHERE [MagicWandCreator] = 'Ollivander family'
 GROUP BY [DepositGroup]
 HAVING SUM([DepositAmount]) < 150000
 ORDER BY [TotalSum] DESC