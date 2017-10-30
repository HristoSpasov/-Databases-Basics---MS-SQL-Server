SELECT c.Name,
       COUNT(e.Id) AS [Employees Number]
  FROM Categories AS c
  JOIN Departments AS d ON c.DepartmentId = d.Id
  JOIN Employees AS e ON e.DepartmentId = d.Id
  GROUP BY c.Name
  ORDER BY c.Name