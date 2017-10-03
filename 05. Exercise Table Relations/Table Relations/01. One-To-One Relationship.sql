CREATE TABLE Passports(
	[PassportID] INT NOT NULL,
	[PassportNumber] VARCHAR(10) NOT NULL
)

CREATE TABLE Persons(
	[PersonID] INT NOT NULL,
	[FirstName] VARCHAR(10) NOT NULL,
	[Salary] DECIMAL(10,2) NOT NULL,
	[PassportID] INT NOT NULL
)

ALTER TABLE Passports
ADD CONSTRAINT PK_Passports PRIMARY KEY([PassportID])

ALTER TABLE Persons
ADD CONSTRAINT PK_Persons PRIMARY KEY([PersonID])

ALTER TABLE Persons
ADD CONSTRAINT FK_PassportID FOREIGN KEY([PassportID])
REFERENCES Passports ([PassportID])

ALTER TABLE Persons
ADD CONSTRAINT UQ_PassportID UNIQUE([PassportID])

INSERT INTO [Passports] VALUES
 (101, 'N34FG21B'),
 (102, 'K65LO4R7'),
 (103, 'ZE657QP2')

INSERT INTO [Persons] VALUES
 (1, 'Roberto', 43300.00, 102),
 (2, 'Tom', 56100.00, 103),
 (3, 'Yana', 60200.00, 101)