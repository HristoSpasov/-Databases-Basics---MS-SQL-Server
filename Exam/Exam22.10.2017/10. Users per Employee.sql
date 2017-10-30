SELECT e.FirstName + ' ' + e.LastName AS [Name],
	  COUNT(DISTINCT r.UserId) AS [Users Number]
  FROM Employees AS e
  LEFT JOIN Reports AS r ON e.Id = r.EmployeeId
  GROUP BY e.FirstName + ' ' + e.LastName
  ORDER BY (COUNT(DISTINCT r.UserId)) DESC, e.FirstName + ' ' + e.LastName ASC
