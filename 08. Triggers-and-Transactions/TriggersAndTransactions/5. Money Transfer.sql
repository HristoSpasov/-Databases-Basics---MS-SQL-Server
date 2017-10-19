USE Bank;
GO

CREATE PROCEDURE [usp_TransferMoney]
       (
               @senderId   INT,
               @receiverId INT,
               @amount     MONEY
       )
AS
     BEGIN
         BEGIN TRANSACTION;

         IF(@amount < 0)
             BEGIN
                 ROLLBACK;
         END;

         UPDATE   [Accounts]
            SET
                  [Balance]-=@amount
          WHERE
                [Id] = @senderId;

         UPDATE   [Accounts]
            SET
                  [Balance]+=@amount
          WHERE
                [Id] = @receiverId;

         COMMIT;
     END;

GO

EXEC [usp_TransferMoney] 1, 2, 20