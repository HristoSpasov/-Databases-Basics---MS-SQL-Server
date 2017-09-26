USE [Gringotts]
GO

SELECT [DepositGroup]
  FROM [WizzardDeposits]
GROUP BY [DepositGroup]
ORDER BY AVG([MagicWandSize])

select top 1 With Ties DepositGroup from WizzardDeposits 
group by DepositGroup 
order by AVG(MagicWandSize)

select DepositGroup from WizzardDeposits 
group by DepositGroup
Having AVG(MagicWandSize)=(select MIN(a.av) from (select DepositGroup,AVG(MagicWandSize) as av from WizzardDeposits
group by DepositGroup) as a)