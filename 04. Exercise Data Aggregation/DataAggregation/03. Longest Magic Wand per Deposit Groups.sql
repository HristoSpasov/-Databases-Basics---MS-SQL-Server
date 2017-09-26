USE [Gringotts]
GO

SELECT [DepositGroup]
  FROM [WizzardDeposits]
GROUP BY [DepositGroup]
HAVING AVG(MagicWandSize) = (
	SELECT TOP(1) AVG(MagicWandSize)
	  FROM [WizzardDeposits]
	  GROUP BY [DepositGroup]
	  ORDER BY AVG(MagicWandSize)
)