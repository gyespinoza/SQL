USE recursoshumanos;

--crear vista sobre esquema especifico
CREATE VIEW RecursosHumanos.InformacionEmpleados
AS
SELECT 
e.nombreCompleto "Nombre Empleado",
c.cargo Cargo,
c.salary Salario
FROM empleado e
INNER JOIN RecursosHumanos.cargos c
ON c.codCargo=e.codCargo;

--consular la vista
SELECT Cargo FROM RecursosHumanos.InformacionEmpleados;

--encriptar vista, cargos por departamento
CREATE VIEW [Cargo Depto]
WITH ENCRYPTION
AS
SELECT
c.cargo,
d.departamento
FROM RecursosHumanos.cargos c 
INNER JOIN departamento d ON d.codDepartamento=c.codDepartamento;

--consultar la vista creada
EXEC sp_helptext CargoDepto;
EXEC sp_helptext InformacionEmpleados;

SELECT * FROM CargoDepto;


USE Northwind;

--VISTA VENTAS
CREATE VIEW ventas
AS
SELECT
	o.OrderDate,
	p.ProductID,
	p.ProductName,
	od.Quantity * od.UnitPrice Venta
FROM Orders o
INNER JOIN [Order Details] od ON od.OrderID=o.OrderID
INNER JOIN Products p ON p.ProductID=od.ProductID;

--consultar vista
SELECT * FROM ventas;

SELECT * FROM Customers;

--redefinir vista
CREATE OR ALTER VIEW ventas (
	OrderDate, 
	contactName,
	ProductID, 
	ProductName,
	Venta
)
AS 
SELECT
	o.OrderDate,
	c.ContactName,
	p.ProductID,
	p.ProductName,
	od.Quantity*p.UnitPrice venta
FROM
Orders o INNER JOIN [Order Details] od ON od.OrderID=o.OrderID
INNER JOIN Products p ON p.ProductID= od.ProductID
INNER JOIN Customers c ON c.CustomerID=o.CustomerID

SELECT * FROM ventas;


--vista VentaEmpleados
CREATE VIEW VentaEmpleados
(
	nombreEmpleado,
	fecha,
	venta
)
AS
SELECT
	CONCAT(e.FirstName,' ', e.LastName),
	o.OrderDate,
	SUM(od.Quantity*od.UnitPrice) venta
FROM
[Order Details] od INNER JOIN Orders o ON o.OrderID=od.OrderID
INNER JOIN Employees e ON e.EmployeeID=o.EmployeeID
GROUP BY
	e.FirstName, e.LastName, o.OrderDate;

--consultar vista
SELECT * FROM VentaEmpleados;

--consultar vistas de la base de datos northwind
EXEC sp_helptext [Sales by Category];
EXEC sp_helptext [Sales Totals by Amount];

SELECT * FROM [Sales Totals by Amount];

--eliminar vistas de la base de datos recursoshumanos
USE recursoshumanos;

DROP VIEW IF EXISTS
cargoDepto, InformacionEmpleados;
