SELECT TOP (1000) [SalesQuotaKey]
      ,[EmployeeKey] as EmployeeID
      ,[DateKey] as Date
      ,[CalendarYear] as Year
      ,[CalendarQuarter] as Quarter
      ,[SalesAmountQuota] as Amount
      ,[Date] 
  FROM [dbo].[FactSalesQuota]
 where EmployeeKey = 284

