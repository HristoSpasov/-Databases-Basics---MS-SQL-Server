USE [Gringotts]
GO

DECLARE @startId INT = 1
DECLARE @endId INT
SELECT @endId =  COUNT(Id) FROM [WizzardDeposits]
DECLARE @sum DECIMAL(10, 2) = 0.0

WHILE @startId <  @endId
BEGIN
    DECLARE @current DECIMAL(10, 2)
	DECLARE @next DECIMAL(10, 2)
	SELECT @current =  [DepositAmount] FROM [WizzardDeposits] WHERE [Id] = @startId
	SELECT @next =  [DepositAmount] FROM [WizzardDeposits] WHERE [Id] = @startId + 1
	SET @sum = @sum + (@current - @next)

	SET @startId = @startId + 1
END

SELECT @sum AS [SumDifference]