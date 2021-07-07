USE Northwind;

SELECT * FROM [Order Details];
SELECT * FROM Products;
SELECT * FROM Categories;
SELECT * FROM Employees;
SELECT * FROM EmployeeTerritories;
SELECT * FROM Orders;

--funciones
--precio promedio de productos
SELECT AVG(UnitPrice) "Precio Promedio" FROM [Order Details];

--obtener el precio promedio de los productos por categoría
SELECT c.CategoryName, ROUND(AVG(UnitPrice),2) PrecioPromedio
FROM products p INNER JOIN Categories c ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName HAVING AVG(UnitPrice) > 25 ORDER BY PrecioPromedio;

--cantidad de productos
SELECT COUNT(*) FROM Products 

--cantidad de productos por categoria y precio promedio por categoria
SELECT c.CategoryName, COUNT(*) CantidadProductos, ROUND(AVG(UnitPrice),2) PrecioPromedio
FROM products p INNER JOIN Categories c ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName;

--mostrar la cantidad de empleados por ciudad.
SELECT city, COUNT(EmployeeID) cantidadEmpleados FROM Employees GROUP By city;

--cantidad de productos en bodega
SELECT SUM(UnitsInStock) TotalProductos FROM Products;

--cantidad de productos en stock por proveedor
SELECT SupplierID, SUM(UnitsInStock) UnidadesxProveedor FROM Products GROUP BY SupplierID;

SELECT s.CompanyName, SUM(UnitsInStock) UnidadesxProveedor
FROM Products p INNER JOIN Suppliers s ON p.SupplierID= s.SupplierID
GROUP BY s.CompanyName HAVING SUM(UnitsInStock)>=100 ORDER BY UnidadesxProveedor DESC;

--funciones min() max()
SELECT MAX(UnitPrice), MIN(UnitPrice) FROM Products;

--nombre de producto con el precio mas alto
SELECT ProductID, ProductName, UnitPrice FROM Products 
WHERE UnitPrice=(SELECT MAX(UnitPrice) FROM Products);

--nombre de producto con el precio mas bajo
SELECT ProductID, ProductName, UnitPrice FROM Products 
WHERE UnitPrice=(SELECT MIN(UnitPrice) FROM Products);

--precio mas alto por categoria
SELECT c.CategoryName, MIN(UnitPrice) FROM Products p 
INNER JOIN Categories c ON p.CategoryID=c.CategoryID GROUP BY c.CategoryName;


--funciones de fecha
--DATEADD() agrega un valor a una fecha definida
SELECT DATEADD(YEAR,1,'2019-12-31') 

--determinar la fecha de entrega de las ordenes cuyo fecha de entrega sea nula
SELECT OrderID, CustomerID, OrderDate,DATEADD(MONTH,1, OrderDate) fechaEntrega
FROM Orders WHERE ShippedDate IS NULL ORDER BY fechaEntrega DESC;

--DATEDIFF obtiene la diferencia entre rangos de fecha
SELECT OrderID, CustomerID, DATEDIFF(day, orderDate, ShippedDate) dias FROM Orders
WHERE DATEDIFF(day, orderDate, ShippedDate)<=5 ;

--funciones string
SELECT ASCII('A') A

SELECT UPPER(CONCAT(CONCAT(firstname,' ', lastname),HomePhone,' ',CONCAT(city,' ', Region), PostalCode) )
FROM Employees ORDER BY FirstName;

SELECT REPLACE('Administracion de Bases de Datos II', 'Administracion','Admón.')

SELECT lastname, REPLACE(lastname, 'Suyama','Gomez') FROM Employees;



--EJERCICIO COMPLEMENTARIO
--Combine el uso de dos funciones y dos operadores, clausulas en la base de datos northwind, 
--en una consulta.