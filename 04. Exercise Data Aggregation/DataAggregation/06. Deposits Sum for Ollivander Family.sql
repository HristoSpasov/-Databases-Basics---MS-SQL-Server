USE [Gringotts]
GO

SELECT [DepositGroup],
	   [TotalSum] = SUM([DepositAmount])
  FROM [WizzardDeposits]
WHERE [MagicWandCreator] = 'Ollivander family'
GROUP BY [DepositGroup]
