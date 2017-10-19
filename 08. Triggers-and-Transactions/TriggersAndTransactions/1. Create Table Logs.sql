USE Bank;
GO

CREATE TABLE [Logs]
             (
               [LogId]     INT IDENTITY PRIMARY KEY NOT NULL,
               [AccountId] INT,
               [OldSum]    MONEY,
               [NewSum]    MONEY
             );

GO

CREATE TRIGGER [trgAfterBalanceUpdate] ON [Accounts]
FOR UPDATE
AS
     DECLARE @AccountId INT;
     DECLARE @OldSum MONEY;
     DECLARE @NewSum MONEY;

     SELECT
            @AccountId = [i].[Id]
       FROM [inserted] AS [i];

     SELECT
            @OldSum =
       (
           SELECT
                  [d].[Balance]
             FROM [DELETED] AS [d]
        );

     SELECT
            @NewSum = [i].[Balance]
       FROM [inserted] AS [i];

     INSERT INTO [Logs]
     VALUES
            (
              @AccountId, @OldSum, @NewSum
            );

GO

UPDATE   [Accounts]
   SET
         [Balance]+=50
 WHERE
       [Id] = 1; 