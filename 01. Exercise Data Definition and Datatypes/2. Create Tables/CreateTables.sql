USE Minions

CREATE TABLE Minions
(
	Id INT Not Null PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL,
	Age nvarchar(50) 
)

CREATE TABLE Towns
(
	ID INT NOT NULL PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL
)