CREATE DATABASE [UniversityDatabase];
GO
USE UniversityDatabase;
GO

CREATE TABLE [Majors]
             (
               [MajorID] INT NOT NULL PRIMARY KEY,
               [Name]    NVARCHAR(50) NOT NULL
             );

CREATE TABLE [Students]
             (
               [StudentID]     INT NOT NULL PRIMARY KEY,
               [StudentNumber] INT NOT NULL,
               [StudentName]   VARCHAR(50) NOT NULL,
               [MajorID]       INT FOREIGN KEY REFERENCES [Majors](
                                                          [MajorID])
             );

CREATE TABLE [Payments]
             (
               [PaymentID]     INT NOT NULL PRIMARY KEY,
               [PaymentDate]   DATE DEFAULT(GETDATE()),
               [PaymentAmount] DECIMAL(10, 2) DEFAULT(0),
               [StudentID]     INT NOT NULL
                                   FOREIGN KEY REFERENCES [Students](
                                                          [StudentID])
             );

CREATE TABLE [Subjects]
             (
               [SubjectID]   INT NOT NULL PRIMARY KEY,
               [SubjectName] VARCHAR(50) NOT NULL
             );

CREATE TABLE [Agenda]
             (
               [StudentID] INT NOT NULL,
               [SubjectID] INT NOT NULL,
               CONSTRAINT [PK_Agenda] PRIMARY KEY([StudentID], [SubjectID]),
               CONSTRAINT [FK_StudentID] FOREIGN KEY([StudentID]) REFERENCES [Students](
                                                                             [StudentID]),
               CONSTRAINT [FK_SubjectID] FOREIGN KEY([SubjectID]) REFERENCES [Subjects](
                                                                             [SubjectID])
             );