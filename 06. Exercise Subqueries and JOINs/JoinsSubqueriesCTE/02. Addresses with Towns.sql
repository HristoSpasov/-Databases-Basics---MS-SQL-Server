USE softuni;
GO

SELECT TOP (50)
       [e].[FirstName],
       [e].[LastName],
       [t].[Name] AS [Town],
       [a].[AddressText]
  FROM [Employees] AS [e]
       JOIN [Addresses] AS [a] ON [e].[AddressId] = [a].[AddressId]
       JOIN [Towns] AS [t] ON [a].[TownId] = [t].[TownId]
ORDER BY
         [e].[FirstName] ASC,
         [e].[LastName] ASC;