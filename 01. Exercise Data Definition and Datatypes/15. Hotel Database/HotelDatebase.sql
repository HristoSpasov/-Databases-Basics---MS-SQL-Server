CREATE DATABASE Hotel
USE Hotel

CREATE TABLE Employees(
	Id INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(50),
	Notes NVARCHAR(500)
	CONSTRAINT PK_Employees PRIMARY KEY (Id)
)

CREATE TABLE Customers(
	AccountNumber BIGINT NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber NVARCHAR(50) NOT NULL,
	EmergencyName NVARCHAR(50),
	EmergencyNumber NVARCHAR(50),
	Notes NVARCHAR(500)
	CONSTRAINT PK_Customers PRIMARY KEY (AccountNumber)
)

CREATE TABLE RoomStatus(
	RoomStatus NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(500)
	CONSTRAINT PK_RoomStatus PRIMARY KEY (RoomStatus)
)

CREATE TABLE RoomTypes (
	RoomType NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(500)
	CONSTRAINT PK_RoomTypes PRIMARY KEY (RoomType)
)

CREATE TABLE BedTypes (
	BedType NVARCHAR(20)  NOT NULL,
	Notes NVARCHAR(500)
	CONSTRAINT PK_BedTypes PRIMARY KEY (BedType)
)

CREATE TABLE Rooms (
	RoomNumber INT NOT NULL,
	RoomType NVARCHAR(20) NOT NULL,
	BedType NVARCHAR(20) NOT NULL,
	Rate NUMERIC,
	RoomStatus NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(500)
	CONSTRAINT PK_Rooms PRIMARY KEY (RoomNumber)
)

CREATE TABLE Payments (
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	PaymentDate DATE NOT NULL,
	AccountNumber BIGINT NOT NULL,
	FirstDateOccupied DATE,
	LastDateOccupied DATE,
	TotalDays INT,
	AmountCharged NUMERIC(10, 2) NOT NULL,
	TaxRate NUMERIC,
	TaxAmount NUMERIC,
	PaymentTotal NUMERIC(10, 2) NOT NULL,
	Notes NVARCHAR(500)
	CONSTRAINT PK_Paymentss PRIMARY KEY (Id)
)

CREATE TABLE Occupancies (
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	DateOccupied DATE,
	AccountNumber BIGINT NOT NULL,
	RoomNumber INT NOT NULL,
	RateApplied NUMERIC(10, 2),
	PhoneCharge NUMERIC(10, 2),
	Notes NVARCHAR(500)
	CONSTRAINT PK_Occupancies PRIMARY KEY (Id)
)

INSERT INTO Employees (FirstName, LastName) 
VALUES
('Mitko', 'Georgiev'),
('Pesho', 'Peshev'),
('Shosho', 'Shoshev')

INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber)
VALUES
(11111111111, 'Ivan', 'Ivanov', '+359123456789'),
(22222222222, 'Vili', 'Petrov', '+359786548646'),
(33333333333, 'Veso', 'Parcala', '+359445464446')

INSERT INTO RoomStatus (RoomStatus)
VALUES
('OCC'),
('AVAIL'),
('CLEAN')

INSERT INTO RoomTypes (RoomType) 
VALUES
('Single'),
('Double'),
('Triple')

INSERT INTO BedTypes (BedType) 
VALUES
('Single'),
('Double'),
('Queen')

INSERT INTO Rooms (RoomNumber, RoomType, BedType, RoomStatus) 
VALUES
(1, 'Single', 'Double', 'OCC'),
(5, 'Double', 'King', 'AVAIL'),
(22, 'Triple', 'Single', 'CLEAN')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, AmountCharged, PaymentTotal, TaxRate) 
VALUES
(1, GETDATE(), 45631633133, 50.20, 50.20, 2.8),
(3, GETDATE(), 45786534998, 40.20, 40.20, 3.1),
(2, GETDATE(), 75586555536, 250.20, 250.20, 2.1)

INSERT INTO Occupancies (EmployeeId, AccountNumber, RoomNumber) 
VALUES
(2, 21521212555, 1),
(1, 45465456565, 5),
(2, 78765321354, 22)