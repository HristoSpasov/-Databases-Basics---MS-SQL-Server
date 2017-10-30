CREATE OR ALTER PROCEDURE usp_AssignEmployeeToReport(@employeeId INT, @reportId INT)
AS
BEGIN
BEGIN TRANSACTION
UPDATE Reports
SET EmployeeId = @employeeId
WHERE Id = @reportId

IF((SELECT e.DepartmentId FROM Employees AS e
	WHERE e.Id = @employeeId) = 
	(SELECT c.DepartmentId FROM Categories AS c
	   JOIN Reports AS r ON r.CategoryId = c.Id
	   WHERE r.Id = @reportId))
BEGIN
    UPDATE Reports
SET EmployeeId = @employeeId
WHERE Id = @reportId
COMMIT
    
END
ELSE
BEGIN

ROLLBACK;
    THROW 51000, 'Employee doesn''t belong to the appropriate department!', 1; 

END
END
GO

EXEC usp_AssignEmployeeToReport 17, 4;
SELECT EmployeeId FROM Reports WHERE id = 2
