USE Softuni;
GO

CREATE FUNCTION [dbo].[ufn_IsWordComprised]
                (
               @setOfLetters VARCHAR(MAX),
               @word         VARCHAR(MAX)
                )
RETURNS BIT
AS
     BEGIN
         DECLARE @isComprised BIT = 1;
         DECLARE @wordIndex [INT] = 1;

         WHILE(@wordIndex <= LEN(@word))
             BEGIN
                 DECLARE @charToSearch CHAR;
                 SET @charToSearch = SUBSTRING(@word, @wordIndex, 1);

                 IF CHARINDEX(@charToSearch, @setOfLetters) = 0
                     BEGIN
                         SET @isComprised = 0;
                         BREAK;
                 END;
                 SET @wordIndex+=1;
             END;

         RETURN @isComprised;
     END;