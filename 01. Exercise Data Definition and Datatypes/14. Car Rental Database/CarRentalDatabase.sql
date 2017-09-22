CREATE DATABASE CarRental
USE CarRental
GO
CREATE TABLE Categories(
	[Id] INT IDENTITY NOT NULL,
	[CategoryName] NVARCHAR(20) NOT NULL,
	[DailyRate] NUMERIC(10, 2),
	[WeeklyRate] NUMERIC(10, 2),
	[MonthlyRate] NUMERIC(10, 2),
	[WeekendRate] NUMERIC(10, 2),
	CONSTRAINT PK_Categories PRIMARY KEY (Id)
)

CREATE TABLE Cars(
	[Id] INT IDENTITY NOT NULL,
	[PlateNumber] NVARCHAR(10) NOT NULL,
	[Manufacturer] NVARCHAR(15) NOT NULL,
	[Model] NVARCHAR(15) NOT NULL,
	[CarYear] SMALLINT,
	[CategoryId] INT NOT NULL,
	[Doors] SMALLINT,
	[Picture] VARBINARY(MAX),
	[Condition] NVARCHAR(500),
	[Available] BIT NOT NULL,
	CONSTRAINT PK_Cars PRIMARY KEY (Id)
)

CREATE TABLE Employees(
	[Id] INT IDENTITY NOT NULL,
	[FirstName] NVARCHAR(20) NOT NULL,
	[LastName] NVARCHAR(20) NOT NULL,
	[Title] NVARCHAR(10),
	[Notes] NVARCHAR(500),
	CONSTRAINT PK_Employees PRIMARY KEY (Id)
)

CREATE TABLE Customers(
	[Id] INT IDENTITY NOT NULL,
	[DriverLicenceNumber] INT NOT NULL,
	[FullName] NVARCHAR(80) NOT NULL,
	[Address] NVARCHAR(80) NOT NULL,
	[City] NVARCHAR(15) NOT NULL,
	[ZIPCode] INT,
	[Notes] NVARCHAR(500),
	CONSTRAINT PK_Customers PRIMARY KEY (Id)
)

CREATE TABLE RentalOrders(
	[Id] INT IDENTITY NOT NULL,
	[EmployeeId] INT NOt NULL,
	[CustomerId] INT NOt NULL,
	[CarId] INT NOT NULL,
	[TankLevel] SMALLINT NOT NULL,
	[KilometrageStart] INT NOT NULL,
	[KilometrageEnd] INT NOT NULL,
	[TotalKilometrage] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL,
	[TotalDays] INT NOT NULL,
	[RateApplied] NUMERIC (10, 2) NOT NULL,
	[TaxRate] NUMERIC (10, 2) NOT NULL,
	[OrderStatus] NVARCHAR(15),
	[Notes] NVARCHAR(500),
	CONSTRAINT PK_RentalOrders PRIMARY KEY (Id)
)

INSERT INTO Categories ([CategoryName])
VALUES ('Car'), 
	   ('Truck'), 
	   ('SUV')

INSERT INTO Cars ([PlateNumber], [Manufacturer], [Model], [CategoryId], [Available])
VALUES ('CA1234CA', 'BMW', '330', 1, 1),
	   ('CO5678CA', 'Mercedes', 'S65', 1, 0),
	   ('B8765CA', 'Trabant', '601', 1, 1)

INSERT INTO Employees([FirstName], [LastName])
VALUES ('Ivan', 'Petrov'),
	   ('Gosho', 'Mitkov'),
	   ('Petya', 'Petrova')

INSERT INTO Customers([DriverLicenceNumber], [FullName], [Address], [City])
VALUES (123456, 'Dimitur Dimitrov', 'st. George str. 25', 'Sofia'),
	   (654321, 'Dimitur Ivanov', 'Trepetlika str. 25', 'Sofia'),
	   (123456, 'Alexander Petrov', 'Vitosha bul. 25', 'Sofia')

INSERT INTO RentalOrders([EmployeeId], [CustomerId], [CarId], [TankLevel], [KilometrageStart], [KilometrageEnd], [TotalKilometrage], [StartDate], [EndDate], [TotalDays], [RateApplied], [TaxRate])
VALUES (1, 1, 1, 25, 95320, 95520, 200, '2017-06-25', '2017-06-27', 2, 150, 10),
	   (2, 2, 2, 45, 90820, 91820, 1000, '2017-05-20', '2017-05-25', 5, 430, 15),
	   (3, 3, 3, 15, 35000, 35100, 100, '2017-03-18', '2017-03-21', 3, 100, 10)

SELECT TOP (3) [Id]
      ,[PlateNumber]
      ,[Manufacturer]
      ,[Model]
      ,[CarYear]
      ,[CategoryId]
      ,[Doors]
      ,[Picture]
      ,[Condition]
      ,[Available]
  FROM [Cars]

SELECT TOP (3) [Id]
      ,[CategoryName]
      ,[DailyRate]
      ,[WeeklyRate]
      ,[MonthlyRate]
      ,[WeekendRate]
  FROM [Categories]

SELECT TOP (3) [Id]
      ,[DriverLicenceNumber]
      ,[FullName]
      ,[Address]
      ,[City]
      ,[ZIPCode]
      ,[Notes]
  FROM [Customers]

SELECT TOP (3) [Id]
    ,[FirstName]
    ,[LastName]
    ,[Title]
    ,[Notes]
FROM [Employees]

SELECT TOP (3) [Id]
      ,[EmployeeId]
      ,[CustomerId]
      ,[CarId]
      ,[TankLevel]
      ,[KilometrageStart]
      ,[KilometrageEnd]
      ,[TotalKilometrage]
      ,[StartDate]
      ,[EndDate]
      ,[TotalDays]
      ,[RateApplied]
      ,[TaxRate]
      ,[OrderStatus]
      ,[Notes]
  FROM [RentalOrders]