SELECT [DepositGroup],
       [TotalSum] = SUM([DepositAmount])
  FROM [WizzardDeposits]
  GROUP BY [DepositGroup]