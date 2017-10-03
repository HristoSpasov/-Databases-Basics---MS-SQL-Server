CREATE TABLE [Models]
             (
               [ModelID]        INT NOT NULL,
               [Name]           VARCHAR(10) NOT NULL,
               [ManufacturerID] INT NOT NULL
             );

CREATE TABLE [Manufacturers]
             (
               [ManufacturerID] INT NOT NULL,
               [Name]           VARCHAR(10) NOT NULL,
               [EstablishedOn]  DATE NOT NULL
             );

ALTER TABLE [Manufacturers]
ADD CONSTRAINT [PK_Manufacturers] PRIMARY KEY([ManufacturerID]);

ALTER TABLE [Models]
ADD CONSTRAINT [PK_Models] PRIMARY KEY([ModelID]);

ALTER TABLE [Models]
ADD CONSTRAINT [FK_ManufacturerID] FOREIGN KEY([ManufacturerID]) REFERENCES [Manufacturers](
                                                                            [ManufacturerID]);

INSERT INTO [Manufacturers]
VALUES
       (
         1, 'BMW', '1916-03-07'
       ),
       (
         2, 'Tesla', '2003-01-01'
       ),
       (
         3, 'Lada', '1966-05-01'
       );

INSERT INTO [Models]
VALUES
       (
         101, 'X1', 1
       ),
       (
         102, 'i6', 1
       ),
       (
         103, 'ModelS', 2
       ),
       (
         104, 'ModelX', 2
       ),
       (
         105, 'Model3', 2
       ),
       (
         106, 'Nova', 3
       );