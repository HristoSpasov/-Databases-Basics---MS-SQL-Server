SELECT c.Name
  FROM Categories AS c
  JOIN Reports AS r ON c.Id = r.CategoryId
  JOIN Users AS u ON u.Id = r.UserId
  WHERE RIGHT(CAST(u.BirthDate AS DATE), LEN(CAST(u.BirthDate AS DATE)) - 5) = RIGHT(CAST(r.OpenDate AS DATE), LEN(CAST(r.OpenDate AS DATE)) - 5)
  GROUP BY(c.Name) 
  ORDER BY c.Name ASC
  