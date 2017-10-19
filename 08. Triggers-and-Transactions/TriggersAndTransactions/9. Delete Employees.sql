USE SoftUni;
GO

DROP TABLE [Deleted_Employees];

CREATE TABLE [Deleted_Employees]
             (
               [EmployeeId]   [INT]
               PRIMARY KEY IDENTITY NOT NULL,
               [FirstName]    VARCHAR(50) NOT NULL,
               [LastName]     VARCHAR(50) NOT NULL,
               [MiddleName]   VARCHAR(50),
               [JobTitle]     VARCHAR(50) NOT NULL,
               [DepartmentId] [INT] NOT NULL,
               [Salary]       MONEY NOT NULL
             );
GO

CREATE TRIGGER [trgAfterDeleteFromEmpl] ON [Employees] AFTER DELETE 
AS
INSERT INTO [Deleted_Employees]
(
       [FirstName],
       [LastName],
       [MiddleName],
       [JobTitle],
       [DepartmentId],
       [Salary]
)
select FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary
   from deleted    

INSERT INTO [Employees]
(
       [FirstName],
       [LastName],
       [MiddleName],
       [JobTitle],
       [DepartmentID],
       [ManagerID],
       [HireDate],
       [Salary],
       [AddressID]
)
VALUES
       (
         'Guy', 'Gilbert', 'R', 'Production Technician', 7, NULL, '1998-07-31 00:00:00', 12500.00, 166
       );

DELETE [Employees]
 WHERE
       [EmployeeId] = 294;

		 