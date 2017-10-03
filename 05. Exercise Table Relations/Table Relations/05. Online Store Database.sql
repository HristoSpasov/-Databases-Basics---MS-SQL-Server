CREATE DATABASE [OnlineStore];
GO
USE [OnlineStore];
GO

CREATE TABLE [Cities]
             (
               [CityID] INT NOT NULL PRIMARY KEY,
               [Name]   VARCHAR(20) NOT NULL
             );

CREATE TABLE [Customers]
             (
               [CustomerID] INT NOT NULL PRIMARY KEY,
               [Name]       VARCHAR(50) NOT NULL,
               [Birthday]   DATE,
               [CityID]     INT NOT NULL
                                FOREIGN KEY REFERENCES [Cities](
                                                       [CityID])
             );

CREATE TABLE [Orders]
             (
               [OrderID]    INT NOT NULL PRIMARY KEY,
               [CustomerID] INT NOT NULL
                                FOREIGN KEY REFERENCES [Customers](
                                                       [CustomerID])
             );

CREATE TABLE [ItemTypes]
             (
               [ItemTypeID] INT NOT NULL PRIMARY KEY,
               [Name]       VARCHAR(50) NOT NULL,
             );

CREATE TABLE [Items]
             (
               [ItemID]     INT NOT NULL PRIMARY KEY,
               [Name]       VARCHAR(50) NOT NULL,
               [ItemTypeID] INT NOT NULL,
               CONSTRAINT [FK_ItemType] FOREIGN KEY([ItemTypeID]) REFERENCES [ItemTypes](
                                                                             [ItemTypeID])
             );

CREATE TABLE [OrderItems]
             (
               [OrderID] INT NOT NULL,
               [ItemID]  INT NOT NULL,
               CONSTRAINT [PK_OrdersItems] PRIMARY KEY([OrderID], [ItemID]),
               CONSTRAINT [FK_OrderID] FOREIGN KEY([OrderID]) REFERENCES [Orders](
                                                                         [OrderID]),
               CONSTRAINT [FK_ItemID] FOREIGN KEY([ItemID]) REFERENCES [Items](
                                                                       [ItemID])
             );