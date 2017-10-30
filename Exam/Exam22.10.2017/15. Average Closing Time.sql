SELECT d.Name,
 CASE
    WHEN AVG(DATEDIFF(DAY, r.OpenDate, r.CloseDate)) IS NULL THEN 'no info'
    ELSE CAST(AVG(DATEDIFF(DAY, r.OpenDate, r.CloseDate)) AS NVARCHAR(MAX))
   END AS [Average Duration]
  FROM Departments AS d
  JOIN Categories AS c ON d.Id = c.DepartmentId
  JOIN Reports AS r ON r.CategoryId = c.Id
  GROUP BY d.Name
  ORDER BY d.Name