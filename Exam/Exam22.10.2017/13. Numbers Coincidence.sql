SELECT u.Username
  FROM Users as u
  WHERE u.UserName LIKE('[0-9]%') AND (SELECT COUNT(*)
							    FROM Reports AS r
							    WHERE r.UserId = u.Id AND
							    r.CategoryId = CAST(LEFT(u.Username, 1) AS INT)) > 0 OR
	   u.Username LIKE('%[0-9]') AND (SELECT COUNT(*)
							    FROM Reports AS r
							    WHERE r.UserId = u.Id AND
 							    r.CategoryId = CAST(Right(u.Username, 1) AS INT)) > 0
  ORDER BY u.Username