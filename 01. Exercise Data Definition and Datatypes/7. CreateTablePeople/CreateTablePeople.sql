CREATE TABLE People(
	Id INT NOT NULL IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX),
	Height NUMERIC(3, 2),
	[Weight] NUMERIC(10, 2),
	Gender CHAR(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
)

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES
('Ivan1', NULL, 1.50, 65.00, 'm', '01/02/2002', 'This is Ivan 1...'),
('Ivan2', NULL, 1.65, 60.50, 'm', '05/06/2007', 'This is Ivan 2...'),
('Ivan2', NULL, 1.65, 68.70, 'm', '05/06/2007', 'This is Ivan 2...'),
('Ivanka1', NULL, 1.62, 55.00, 'f', '03/04/1985', 'This is Ivanka1...'),
('Maria', NULL, 1.69, 48.50, 'f', '08/11/1989', 'This is Maria...')

SELECT TOP(5) 
	Id,
	[Name],
	Picture,
	Height,
	[Weight],
	Gender,
	Birthdate,
	Biography
FROM People