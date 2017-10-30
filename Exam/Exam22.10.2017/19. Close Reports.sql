CREATE TRIGGER trg ON Reports
AFTER UPDATE
AS
BEGIN
    DECLARE @CompletedStatusId INT;
    SET  @CompletedStatusId = (SELECT Id FROM Status
					   WHERE Label = 'completed')

    IF UPDATE(CloseDate)
    UPDATE Reports
    SET StatusId = @CompletedStatusId
    FROM INSERTED AS i
    JOIN DELETED d on i.Id = d.Id
    WHERE i.Id = Reports.Id
END

GO

UPDATE Reports
SET CloseDate = GETDATE()
WHERE EmployeeId = 5;

	 