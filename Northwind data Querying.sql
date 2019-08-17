USE [Northwind]

/**************************************************************
SELECT
	T2.[CategoryID]
	,T2.[CategoryName]
	,COUNT(*) AS [Total de Productos por Categoria]
FROM
	[Northwind].[dbo].[Products] T1 WITH(NOLOCK)
	JOIN [Northwind].[dbo].[Categories] T2 ON T1.[CategoryID] = T2.[CategoryID]
GROUP BY 
	T2.[CategoryName]
	,T2.[CategoryID]
HAVING
	COUNT(*) > 10
ORDER BY 
	1
--*************************************************************/
/**************************************************************
SELECT
	T1.[CompanyName]
	,YEAR(T2.[OrderDate])
	,SUM(T3.[Quantity]) [Total de Productos]
FROM 
	[Northwind].[dbo].[Customers] T1
	INNER JOIN [Northwind].[dbo].[Orders] T2 ON T1.[CustomerID] = T2.[CustomerID]
	INNER JOIN [Northwind].[dbo].[Order Details] T3 ON T2.[OrderID] = T3.[OrderID] 
WHERE
	YEAR(T2.[OrderDate]) = 1996
GROUP BY 
	T1.[CompanyName]
	,YEAR(T2.[OrderDate])
--*************************************************************/
/**************************************************************
SELECT
	T2.[CategoryName]
	,MAX(T1.[UnitPrice]) [Precio maximo]
	,MIN(T1.[UnitPrice]) [Precio minimo]
FROM 
	[Northwind].[dbo].[Products] T1
	INNER JOIN [Northwind].[dbo].[Categories] T2 ON T1.[CategoryID] = T2.[CategoryID]
GROUP BY 
	T2.[CategoryName]
--*************************************************************/
/**************************************************************
SELECT
	T1.[FirstName] + ' ' + T1.[LastName] [Empleado]
	,COUNT(T2.[OrderID]) [Oredenes por empleado]
FROM 
	[Northwind].[dbo].[Employees] T1
	INNER JOIN [Northwind].[dbo].[Orders] T2 ON T1.[EmployeeID] = T2.[EmployeeID]
GROUP BY 
	T1.[FirstName] + ' ' + T1.[LastName] 
--*************************************************************/
SELECT
	T1.[CompanyName] 
	,COUNT(T2.[ProductID]) [Productos por proveedor]
FROM 
	[Northwind].[dbo].[Suppliers] T1
	INNER JOIN [Northwind].[dbo].[Products] T2 ON T1.[SupplierID] = T2.[SupplierID] AND T2.[Discontinued] = 0
--WHERE 
--	T2.[Discontinued] = 0
GROUP BY 
	T1.[CompanyName]
--*************************************************************/
--select top 1 * from [Northwind].[dbo].[PRODUCTS]

