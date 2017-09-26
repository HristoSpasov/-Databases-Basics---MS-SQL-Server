USE [SoftUni]
GO

SELECT * 
  INTO [EmployeesWithSalaryOver30000]
  FROM [Employees]
 WHERE [Salary] > 30000

 DELETE FROM [EmployeesWithSalaryOver30000]
 WHERE [ManagerID] = 42

 UPDATE [EmployeesWithSalaryOver30000]
    SET [Salary] = [Salary] + 5000
  WHERE [DepartmentID] = 1

SELECT [DepartmentId],
       [AverageSalary] = AVG([Salary])
  FROM [EmployeesWithSalaryOver30000]
 GROUP BY [DepartmentId]  