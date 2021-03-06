USE [Diablo]
GO

SELECT [Name] AS [Game],
	   [Part of the Day] = 
	    	CASE
	    		WHEN DATEPART(HOUR, [Start]) BETWEEN 0 AND 11 THEN 'Morning' 
	    		WHEN DATEPART(HOUR, [Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
	    		ELSE 'Evening'
	    	END,
	   [Duration] =
			CASE
				WHEN [Duration] <= 3 THEN 'Extra Short'
				WHEN [Duration] BETWEEN 4 AND 6 THEN 'Short'
				WHEN [Duration] > 6 THEN 'Long'
				ELSE 'Extra Long'
			END
  FROM [Games]
ORDER BY [Name], [Duration], [Part of the Day]