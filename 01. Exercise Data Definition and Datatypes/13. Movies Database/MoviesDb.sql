CREATE TABLE Directors(
	Id INT IDENTITY NOT NUll,
	DirectorName NVARCHAR(50) NOT NUll,
	Notes NVARCHAR(MAX),
    CONSTRAINT PK_DirectorsPrimaryKey PRIMARY KEY (Id)
)

CREATE TABLE Genres(
	Id INT IDENTITY NOT NUll,
	GenreName NVARCHAR(50) NOT NUll,
	Notes NVARCHAR(MAX),
    CONSTRAINT PK_GenresPrimaryKey PRIMARY KEY (Id)
)

CREATE TABLE Categories(
	Id INT IDENTITY NOT NUll,
	CategoryName NVARCHAR(50) NOT NUll,
	Notes NVARCHAR(MAX),
    CONSTRAINT PK_CategoriesPrimaryKey PRIMARY KEY (Id)
)

CREATE TABLE Movies(
	Id INT IDENTITY NOT NUll,
	Title NVARCHAR(80) NOT NULL,
	DirectorId INT  NOT NULL,
	CopyrightYear INT,
	Length INT,
	GenreId INT,
	CategoryId INT,
	Rating NUMERIC,
	Notes NVARCHAR(MAX),
    CONSTRAINT PK_MoviesPrimaryKey PRIMARY KEY (Id)
)

INSERT INTO Directors (DirectorName, Notes) 
VALUES ('Director 1', 'Director 1 is...'),
	   ('Director 2', 'Director 2 is...'),
	   ('Director 3', 'Director 3 is...'),
	   ('Director 4', 'Director 4 is...'),
	   ('Director 5', 'Director 5 is...')

INSERT INTO Genres (GenreName, Notes) 
VALUES ('Genre 1', 'Genre 1 is...'),
	   ('Genre 2', 'Genre 2 is...'),
	   ('Genre 3', 'Genre 3 is...'),
	   ('Genre 4', 'Genre 4 is...'),
	   ('Genre 5', 'Genre 5 is...')

INSERT INTO Categories (CategoryName, Notes) 
VALUES ('Category 1', 'Category 1 is...'),
	   ('Category 2', 'Category 2 is...'),
	   ('Category 3', 'Category 3 is...'),
	   ('Category 4', 'Category 4 is...'),
	   ('Category 5', 'Category 5 is...')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating ,Notes)
VALUES ('Movie 1', 1, 2005, 90, 1, 1, 4.5, 'Movie 1 is...'),
	   ('Movie 2', 2, 1990, 100, 2, 2, 5.5, 'Movie 2 is...'),
	   ('Movie 3', 3, 1988, 135, 3, 3, 3.5, 'Movie 3 is...'),
	   ('Movie 4', 4, 2005, 145, 4, 4, 3.2, 'Movie 4 is...'),
	   ('Movie 5', 5, 2009, 142, 5, 5, 8.0, 'Movie 5 is...')

SELECT TOP (5) 
	  Id,
      CategoryName,
      Notes
  FROM Categories

SELECT TOP (5) 
	Id,
    DirectorName,
    Notes
FROM Directors

SELECT TOP (5) 
	Id,
    GenreName,
    Notes
FROM Genres

SELECT TOP (5) 
	Id,
    Title,
    DirectorId,
    CopyrightYear,
    Length,
    GenreId,
    CategoryId,
    Rating,
    Notes
  FROM Movies