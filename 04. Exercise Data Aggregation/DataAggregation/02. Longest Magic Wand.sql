USE [Gringotts]
GO

SELECT TOP(1) [LongestMagicWand] = [MagicWandSize] 
  FROM [WizzardDeposits]
ORDER BY [MagicWandSize] DESC