USE Bank; 
GO
CREATE OR ALTER PROCEDURE [usp_DepositMoney]
                (
               @AccountId   INT,
               @moneyAmount MONEY
                ) AS BEGIN TRANSACTION;


UPDATE   [Accounts]
   SET
         [Balance]+=@moneyAmount
 WHERE
       [Id] = @AccountId;
COMMIT;
	    

GO
CREATE PROCEDURE [usp_DepositMoney]
                (
               @AccountId   INT,
               @moneyAmount MONEY
                ) AS
BEGIN

    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE   [Accounts]
           SET
                 [Balance] = [Balance] + @moneyAmount
         WHERE
               [Accounts].[Id] = @AccountId;

        COMMIT;
    END TRY
    BEGIN CATCH

        SELECT
               ERROR_MESSAGE();

        IF @@TRANCOUNT > 0
            ROLLBACK;
    END CATCH;
END;
    

GO
EXEC [dbo].[usp_DepositMoney]
         1, 20.00;
