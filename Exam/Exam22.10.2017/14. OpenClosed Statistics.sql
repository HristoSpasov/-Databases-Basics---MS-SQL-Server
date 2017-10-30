SELECT e.FirstName + ' ' + e.LastName AS [Name],
        CAST((SELECT COUNT(*)
	     FROM Reports AS re
	    WHERE YEAR(re.CloseDate) = 2016 AND re.EmployeeId = r.EmployeeId) AS NVARCHAR(MAX))  + '/' +
	   CAST((SELECT COUNT(*)
	     FROM Reports AS re
	    WHERE YEAR(re.OpenDate) = 2016 AND re.EmployeeId = r.EmployeeId) AS NVARCHAR(MAX)) AS [Closed Open Reports]
       
  FROM Employees AS e
  LEFT JOIN Reports AS r ON r.EmployeeId = e.Id
  WHERE (SELECT COUNT(*)
	     FROM Reports AS re
	    WHERE YEAR(re.OpenDate) = 2016 AND re.EmployeeId = r.EmployeeId) > 0 OR
	    (SELECT COUNT(*)
	     FROM Reports AS re
	    WHERE YEAR(re.CloseDate) = 2016 AND re.EmployeeId = r.EmployeeId) > 0
  GROUP BY  e.FirstName + ' ' + e.LastName, e.Id, r.EmployeeId
  ORDER BY  e.FirstName + ' ' + e.LastName ASC, e.Id ASC