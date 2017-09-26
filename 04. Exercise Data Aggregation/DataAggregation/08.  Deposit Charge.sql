USE [Gringotts]
GO

SELECT [DepositGroup],
	   [MagicWandCreator],
	   [MinDepositCharge] = MIN([DepositCharge])
  FROM [WizzardDeposits]
GROUP BY [DepositGroup], [MagicWandCreator]
ORDER BY [MagicWandCreator] ASC,
		 [DepositGroup] ASC 
