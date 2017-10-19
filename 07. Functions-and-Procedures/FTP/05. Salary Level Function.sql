USE Softuni;
GO

CREATE FUNCTION [dbo].[ufn_GetSalaryLevel]
                (
               @salary DECIMAL(18, 4)
                )
RETURNS VARCHAR(50)
AS
     BEGIN
         DECLARE @returnString VARCHAR(50);

         SET @returnString = CASE
                                 WHEN @salary < 30000
                                 THEN 'Low'
                                 WHEN @salary BETWEEN 30000 AND 50000
                                 THEN 'Average'
                                 ELSE 'High'
                             END;

         RETURN @returnString;
     END;