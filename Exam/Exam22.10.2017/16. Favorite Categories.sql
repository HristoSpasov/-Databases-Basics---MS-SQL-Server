SELECT [Department Name],
       [Category Name],
	  CAST((CAST(CountPerCategory AS DECIMAL(10, 2)) * 100.00 / CAST((SELECT COUNT(r.Id)
	     FROM Departments AS d
		JOIN Categories AS c ON d.Id = c.DepartmentId
		JOIN Reports AS r ON r.CategoryId = c.Id
		WHERE d.Name = [Department Name]
		GROUP BY d.Name) AS DECIMAL(10, 2))) AS DECIMAL(10,0))  AS Percentage
FROM
(SELECT 
  d.Name AS [Department Name],
  c.Name AS [Category Name],
  COUNT(r.Id) AS CountPerCategory
  FROM Departments AS d
  JOIN Categories AS c ON d.Id = c.DepartmentId
  JOIN Reports AS r ON r.CategoryId = c.Id
  GROUP BY d.Name, c.Name) AS selected
ORDER BY [Department Name] ASC, [Category Name] ASC, (CountPerCategory * 100 / (SELECT COUNT(r.Id)
	     FROM Departments AS d
		JOIN Categories AS c ON d.Id = c.DepartmentId
		JOIN Reports AS r ON r.CategoryId = c.Id
		WHERE d.Name = [Department Name]
		GROUP BY d.Name)) ASC