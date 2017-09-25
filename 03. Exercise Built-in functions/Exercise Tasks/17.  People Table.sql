USE Orders
GO

CREATE TABLE People(
	[Id] INT NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(20) NOT NULL,
	[Birthdate] DATETIME NOT NULL
)

INSERT INTO People VALUES
(1, 'Viktor', '2000-12-07 00:00:00.000'),
(2, 'Steven', '1992-09-10 00:00:00.000'),
(3, 'Stephen', '1910-09-19 00:00:00.000'),
(4, 'John', '2010-01-06 00:00:00.000')

SELECT [Name],
	   [Age in Years] = DATEDIFF(YEAR, [Birthdate], GETDATE()),
	   [Age in Months] = DATEDIFF(MONTH, [Birthdate], GETDATE()),
	   [Age in Days] = DATEDIFF(DAY, [Birthdate], GETDATE()),
	   [Age in Minutes] = DATEDIFF(MINUTE, [Birthdate], GETDATE())
  FROM People