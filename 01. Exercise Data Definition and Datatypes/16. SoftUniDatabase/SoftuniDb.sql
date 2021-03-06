CREATE DATABASE SoftUni
USE SoftUni

GO

CREATE TABLE Towns (
	[Id] INT IDENTITY NOT NULL,
	[Name] NVARCHAR(15),
	CONSTRAINT PK_Towns PRIMARY KEY (Id)
)

CREATE TABLE Addresses (
	[Id] INT IDENTITY NOT NULL,
	[AddressText] NVARCHAR(15),
	[TownId] INT NOT NULL,
	CONSTRAINT PK_Addresses PRIMARY KEY (Id),
	CONSTRAINT FK_Towns FOREIGN KEY ([TownId])
	REFERENCES Towns(Id)
) 

CREATE TABLE Departments (
	[Id] INT IDENTITY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,	
	CONSTRAINT PK_Departments PRIMARY KEY (Id)
)

CREATE TABLE Employees (
	[Id] INT IDENTITY NOT NULL,
	[FirstName] NVARCHAR(15) NOT NULL,
	[MiddleName] NVARCHAR(15),
	[LastName] NVARCHAR(15) NOT NULL,
	[JobTitle] NVARCHAR(30),
	[DepartmentId] INT NOT NULL,
	[HireDate] DATE NOT NULL,
	[Salary] NUMERIC,
	[AddressId] INT,
	CONSTRAINT PK_Employees PRIMARY KEY (Id),
	CONSTRAINT FK_Drpartment FOREIGN KEY ([DepartmentId])
	REFERENCES Departments (Id),
	CONSTRAINT FK_Address FOREIGN KEY ([AddressId])
	REFERENCES Addresses (Id)
)