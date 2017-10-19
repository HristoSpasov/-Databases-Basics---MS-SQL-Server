USE Bank;
GO

CREATE PROCEDURE [usp_WithdrawMoney]
       (
               @AccountId   INT,
               @moneyAmount MONEY
       )
AS
     BEGIN
         BEGIN TRANSACTION;
         UPDATE   [Accounts]
            SET
                  [Balance]-=@moneyAmount
          WHERE
                [Id] = @AccountId;

         COMMIT;
     END; 

GO

EXECUTE [usp_WithdrawMoney]
         1, 20;