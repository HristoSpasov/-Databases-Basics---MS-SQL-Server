SELECT r.OpenDate,
       r.Description,
	  u.Email AS [Reporter Email]
  FROM Reports AS r
  JOIN Categories AS c ON c.Id = r.CategoryId
  JOIN Departments AS d ON d.Id = c.DepartmentId
  JOIN USers AS u ON u.Id = r.UserId
WHERE CloseDate IS NULL AND
      LEN([Description]) > 20 AND
	 [Description] LIKE ('%str%')
	 AND d.Name IN ('Infrastructure', 'Emergency', 'Roads Maintenance')
ORDER BY r.OpenDate ASC, u.Email ASC, r.Id ASC

	
