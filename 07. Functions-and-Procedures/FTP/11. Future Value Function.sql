USE Bank;
GO

CREATE FUNCTION [dbo].[ufn_CalculateFutureValue](
               @sum          MONEY,
               @interestRate FLOAT,
               @years        [INT])
RETURNS money
AS
     BEGIN
         RETURN @sum * (POWER((1 + @interestRate), @years));
     END;
