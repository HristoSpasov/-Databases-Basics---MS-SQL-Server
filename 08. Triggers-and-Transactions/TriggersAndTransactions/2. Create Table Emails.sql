USE Bank;
GO

CREATE TABLE [NotificationEmails]
             (
               [Id]        INT
               PRIMARY KEY IDENTITY NOT NULL,
               [Recipient] INT NOT NULL,
               [Subject]   VARCHAR(100) NOT NULL,
               [Body]      VARCHAR(100) NOT NULL
             );

GO

CREATE TRIGGER [trg_MessageAfterUpdate] ON [Accounts]
FOR UPDATE
AS
     DECLARE @Recipient INT;
     DECLARE @Subject VARCHAR(100);
     DECLARE @Body VARCHAR(100);

     SELECT
            @Recipient = [Id]
       FROM [inserted];

     SELECT
            @Subject = Concat('Balance change for account: ', @Recipient);

     SELECT
            @Body = Concat('On ',
                            (
                                SELECT
                                       CONVERT(VARCHAR(10), GETDATE(), 101)+' '+RIGHT(CONVERT(VARCHAR, GETDATE(), 100), 7)
                             ), ' your balance was changed from ',
                            (
                                SELECT
                                       [Balance]
                                  FROM [deleted]
                             ), ' to ',
                            (
                                SELECT
                                       [Balance]
                                  FROM [inserted]
                             ), '.');

     INSERT INTO [NotificationEmails]
     (
            [Recipient],
            [Subject],
            [Body]
     )
     VALUES
            (
              @Recipient, @Subject, @Body
            );

GO

UPDATE   [Accounts]
   SET
         [Balance]-=200
 WHERE
       [Id] = 1; 