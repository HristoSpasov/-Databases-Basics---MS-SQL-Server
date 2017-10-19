USE Softuni;
GO

CREATE PROCEDURE [usp_AssignProject]
                (
               @emloyeeId INT,
               @projectId INT
                ) AS
BEGIN
    BEGIN TRANSACTION;

    IF(
        (
            SELECT
                   COUNT([ProjectId])
              FROM [EmployeesProjects]
             WHERE [EmployeeId] = @emloyeeId
             GROUP BY
                      [EmployeeId]
         ) >= 3)
        BEGIN
            RAISERROR('The employee has too many projects!', 16, 1);
            ROLLBACK;
            RETURN;
    END;

    INSERT INTO [EmployeesProjects]
    VALUES
           (
             @emloyeeId, @projectId
           );

    COMMIT;
END;

GO
[usp_AssignProject]
         2, 4;