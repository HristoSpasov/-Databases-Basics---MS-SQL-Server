USE Diablo;
GO

DECLARE @UsersGameId INT =
  (
      SELECT
             [Id]
        FROM [UsersGames]
       WHERE [GameId] =
        (
            SELECT
                   [Id]
              FROM [Games]
             WHERE [Name] = 'Safflower'
         )
             AND [UserId] =
        (
            SELECT
                   [Id]
              FROM [Users]
             WHERE [Username] = 'Stamat'
         )
   );

BEGIN TRY
-- Begin transaction from first group 11 and 12
    BEGIN TRANSACTION;
-- Get total sum of item price from groups 11 and 12
    DECLARE @FirstSum MONEY =
      (
          SELECT
                 SUM([Price])
            FROM [Items]
           WHERE [MinLevel] IN(11, 12)
       );

-- Current cash
    DECLARE @CurrentCash MONEY =
      (
          SELECT
                 [Cash]
            FROM [UsersGames]
           WHERE [Id] = @UsersGameId
       );

-- Check if user has enough cash
    IF(@CurrentCash - @FirstSum < 0)
        BEGIN
            ROLLBACK;
    END;
        ELSE
        BEGIN

-- Add Items to user
            INSERT INTO [UserGameItems]
            (
                   [UserGameId],
                   [ItemId]
            )
            SELECT
                   @UsersGameId,
                   [Id]
              FROM [Items]
             WHERE [MinLevel] IN(11, 12);

-- Update user cash
            UPDATE   [UsersGames]
               SET
                     [Cash] = @CurrentCash - @FirstSum
             WHERE
                   [Id] = @UsersGameId;

 -- Commit changes from first transaction
            COMMIT;
    END;
END TRY
BEGIN CATCH
    ROLLBACK;
END CATCH;

BEGIN TRY
 -- Begin transaction from second group 19 and 21
    BEGIN TRANSACTION;
-- Get total sum of item price from groups 19 to 21
    DECLARE @SecondSum MONEY =
      (
          SELECT
                 SUM([Price])
            FROM [Items]
           WHERE [MinLevel] BETWEEN 19 AND 21
       );

-- Current cash
    SET @CurrentCash =
      (
          SELECT
                 [Cash]
            FROM [UsersGames]
           WHERE [Id] = @UsersGameId
       );

-- Check if user has enough cash
    IF(@CurrentCash - @SecondSum < 0)
        BEGIN
            ROLLBACK;
    END;
        ELSE
        BEGIN

-- Add Items to user
            INSERT INTO [UserGameItems]
            (
                   [UserGameId],
                   [ItemId]
            )
            SELECT
                   @UsersGameId,
                   [Id]
              FROM [Items]
             WHERE [MinLevel] BETWEEN 19 AND 21;

-- Update user cash
            UPDATE   [UsersGames]
               SET
                     [Cash] = @CurrentCash - @SecondSum
             WHERE
                   [Id] = @UsersGameId;

 -- Commit changes from first transaction
            COMMIT;
    END;
END TRY
BEGIN CATCH
    ROLLBACK;
END CATCH;


SELECT
       [i].[Name] AS [Item Name]
  FROM [Items] AS [i]
       JOIN [UserGameItems] AS [ugi] ON [ugi].[ItemId] = [i].[Id]
 WHERE [ugi].[UserGameId] = @UsersGameId
ORDER BY
         [Item Name];