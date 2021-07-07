USE recursoshumanos;

--subconsulta escalar
--devuelve un solo valor (una columna y una fila)
SELECT 
cargo, salary
FROM recursoshumanos.cargos
WHERE codDepartamento=(SELECT codDepartamento FROM departamento WHERE departamento='Ventas');

SELECT c.cargo,c.salary FROM RecursosHumanos.cargos c INNER JOIN departamento d ON
d.codDepartamento=c.codDepartamento WHERE departamento='ventas';

--subconsulta IN
SELECT 
cargo, salary
FROM recursoshumanos.cargos
WHERE codDepartamento IN (SELECT codDepartamento FROM departamento);

SELECT c.cargo,c.salary fROM RecursosHumanos.cargos c INNER JOIN departamento d ON
d.codDepartamento=c.codDepartamento;

--subconsulta NOT IN
SELECT
cargo
FROM RecursosHumanos.cargos WHERE codCargo NOT IN(SELECT codCargo FROM empleado);

--con base de datos Northwind
USE Northwind;

--subconsulta de anidacion
--obtener los productos cuyo precio sea mayor al precio promedio de los productos
--de las categorias Beverages y Seafood,ordenado por precio
SELECT
ProductName,UnitPrice
FROM Products 
	WHERE UnitPrice>
	(
		SELECT 
			AVG(UnitPrice) 
		FROM Products
		WHERE CategoryID IN 
			(
				SELECT CategoryID FROM Categories
				WHERE CategoryName='Beverages'
				OR CategoryName='Seafood'
			)
	) ORDER BY UnitPrice;


--subconsulta utilizada como expresion de columna
SELECT 
OrderID, OrderDate,
(
	SELECT MAX(UnitPrice)
	FROM [Order Details] od
	WHERE od.OrderID=o.OrderID
) PrecioMaximo
FROM Orders o
ORDER BY PrecioMaximo


--JOIN con 3 tablas
SELECT
p.ProductName, o.OrderID, od.Quantity
FROM Products p INNER JOIN [Order Details] od ON od.ProductID=p.ProductID
INNER JOIN Orders o ON o.OrderID=od.OrderID


SELECT
p.ProductName
FROM Products p
WHERE p.ProductID IN
(
	SELECT
	 ProductID
	FROM [Order Details] od
	WHERE od.OrderID IN
	(
		SELECT 
			OrderID
		FROM Orders
	)
)

--subsoncultas para insercion y actualizacion de datos
USE recursoshumanos;

CREATE TABLE prueba(id int identity(1,1), nombre varchar(50));

--insertar datos mediante subconsulta
INSERT INTO prueba(nombre)
SELECT cargo FROM RecursosHumanos.cargos 
WHERE codDepartamento IN(SELECT DISTINCT codDepartamento FROM departamento);

SELECT * FROM prueba;

--actualizar datos mediante subconsulta
UPDATE prueba SET nombre='Nuevo'
WHERE nombre IN(SELECT cargo FROM RecursosHumanos.cargos)