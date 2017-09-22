CREATE TABLE Users(
	[Id] BIGINT IDENTITY,
	[Username] VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	[ProfilePicture] VARBINARY(MAX),
	[LastLoginTime] SMALLDATETIME,
	[IsDeleted] BIT
)

ALTER TABLE Users
ADD CONSTRAINT PK_Id PRIMARY KEY (Id)

INSERT INTO Users([Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted]) VALUES
('Ivan1', '1', NULL, '01/02/2002', 1),
('Ivan2', '2', NULL, '05/06/2007', 1),
('Ivan2', '3', NULL, '05/06/2007', 0),
('Ivanka1', '4', NULL, '03/04/1985', 1),
('Maria', '5', NULL, '08/11/1989', 0)

SELECT TOP(5) 
	[ID],
	[Username],
	[Password],
	[ProfilePicture],
	[LastLoginTime],
	[IsDeleted]
FROM Users