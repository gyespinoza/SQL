USE recursoshumanos;
SELECT * FROM empleado;

CREATE TABLE empleados(
	codEmpleado INT PRIMARY KEY,
	nombreCompleto VARCHAR(50) NOT NULL
);

INSERT INTO empleados(codEmpleado,nombreCompleto) VALUES (1,'Juan Villanueva'), 
(2,'Maria Garcia'), (3,'Josefa Lopez'), (4,'Alejandro Romero'), (5,'Alberto Galeas');
INSERT INTO empleados(codEmpleado,nombreCompleto) VALUES (6,'Martin Flores');
INSERT INTO empleados(codEmpleado,nombreCompleto) VALUES (7,'Carmen Olivares');
INSERT INTO empleados(codEmpleado,nombreCompleto) VALUES (9,'Angel Gabriel');

--UNIONES
--INNER JOIN
--retorna los registro coincidentes de ambas tablas
SELECT emps.codEmpleado,emps.nombreCompleto, emp.codEmpleado, emp.nombreCompleto
FROM empleado emp INNER JOIN empleados emps ON emp.nombreCompleto=emps.nombreCompleto;

--LEFT JOIN
--selecciona los registros de la tabla de la izquierda y los registros coincidentes de la tabla
--de la derecha
SELECT emp.codEmpleado CodigoEmpleado,emp.nombreCompleto NombreEmpleado,
emps.codEmpleado CodigoEmpleados, emps.nombreCompleto NombreEmpleados
FROM empleado emp LEFT JOIN empleados emps ON emp.nombreCompleto=emps.nombreCompleto;

--RIGHT JOIN
--selecciona los registro de la tabla de la derecha y los registros coincidentes de la tabla
--de la izquierda
SELECT emp.codEmpleado CodigoEmpleado,emp.nombreCompleto NombreEmpleado,
emps.codEmpleado CodigoEmpleados, emps.nombreCompleto NombreEmpleados
FROM empleado emp RIGHT JOIN empleados emps ON emp.nombreCompleto=emps.nombreCompleto;

--FULL JOIN
--retorna las filas de ambas tablas, con las coincidencias de ambos lados
SELECT emp.codEmpleado CodigoEmpleado,emp.nombreCompleto NombreEmpleado,
emps.codEmpleado CodigoEmpleados, emps.nombreCompleto NombreEmpleados
FROM empleado emp FULL JOIN empleados emps ON emp.nombreCompleto=emps.nombreCompleto;


USE Northwind;
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Suppliers;
SELECT * FROM [Order Details];
SELECT * FROM Orders;
--INNER JOIN
SELECT 
	p.ProductName Producto,
	c.CategoryName Categoría,
	s.CompanyName Proveedor
FROM Products p 
INNER JOIN Categories c ON c.CategoryID=p.CategoryID
INNER JOIN Suppliers s ON s.SupplierID= p.SupplierID
ORDER BY CategoryName DESC;

--LEFT JOIN
--obtener los productos que esten o no incluidos en las ordenes
SELECT p.ProductName, od.OrderID
FROM Products p LEFT JOIN [Order Details] od ON od.ProductID=p.ProductID


SELECT 
	p.ProductID,
	p.ProductName, 
	c.CategoryName,
	od.OrderID,
	o.OrderDate
FROM 
Products p 
LEFT JOIN Categories c ON c.CategoryID=p.CategoryID
LEFT JOIN [Order Details] od ON od.ProductID=p.ProductID
LEFT JOIN Orders o ON o.OrderID=od.OrderID
ORDER BY c.CategoryName;
