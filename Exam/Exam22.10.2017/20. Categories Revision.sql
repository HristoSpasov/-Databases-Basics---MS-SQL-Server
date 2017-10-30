SELECT * FROM(
SELECT [Category Name],
	  SUM(ReportsWaiting + ReportsInProgress) AS [Reports Number],
	  CASE
	   WHEN SUM(ReportsWaiting + ReportsInProgress) - ReportsInProgress > 0 THEN 'waiting'
	   WHEN SUM(ReportsWaiting + ReportsInProgress) - ReportsWaiting > 0 THEN 'in progress'
	   ELSE 'equal'
	   END AS [Main Status]
FROM
(SELECT 
  c.Name AS [Category Name],
  ISNULL((SELECT COUNT(r.Id) WHERE r.StatusId IN (SELECT Id FROM STATUS WHERE Label IN ('waiting'))), 0) AS ReportsWaiting,
  ISNULL((SELECT COUNT(r.Id) WHERE r.StatusId IN (SELECT Id FROM STATUS WHERE Label IN ('in progress'))), 0) AS ReportsInProgress
  FROM Categories AS c
  JOIN Reports AS r ON r.CategoryId = c.Id
  JOIN Status AS s ON s.Id = r.StatusId
  GROUP BY c.Name, r.StatusId) AS selected
  GROUP BY [Category Name], ReportsInProgress, ReportsWaiting) AS sel
  ORDER BY [Category Name], SUM(ReportsWaiting + ReportsInProgress),  CASE
	   WHEN SUM(ReportsWaiting + ReportsInProgress) - ReportsInProgress > 0 THEN 'waiting'
	   WHEN SUM(ReportsWaiting + ReportsInProgress) - ReportsInProgress < 0 THEN 'in progress'
	   ELSE 'equal'
	   END
  
