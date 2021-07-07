USE recursoshumanos;

SELECT * FROM recursoshumanos.cargos;

--operadores de comparacion
--operadores logicos
--operadores de asignacion
--operadores matematicos
SELECT 40+20;

SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary>=400;
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary BETWEEN 900 AND 2000;
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary NOT BETWEEN 900 AND 2000;
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary IN(900,1200,2000,400);
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary NOT IN(1200,9000,400);

--operador OR
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary<400 OR salary>900 ORDER BY salary;
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary=800 OR salary=1200 OR salary=400 ORDER BY salary DESC;
--reemplazar OR por IN
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE salary IN (800,1200,400) ORDER BY salary DESC;
--operador AND
SELECT cargo, salary FROM RecursosHumanos.cargos WHERE (salary=400 OR salary=1200) AND cargo='Gerente';


--obtener la edad de los empleados a partir de la fecha de nacimiento, ordenar por alias
SELECT * FROM empleado;
SELECT nombreCompleto, DATEDIFF(YEAR,fechaNac, GETDATE()) As Edad FROM empleado WHERE DATEDIFF(YEAR,fechaNac, GETDATE())
LIKE '%2' ORDER BY Edad;

SELECT nombreCompleto, DATEDIFF(YEAR,fechaNac, GETDATE()) As Edad FROM empleado WHERE DATEDIFF(YEAR,fechaNac, GETDATE())
NOT IN(20,25) ORDER BY Edad;

SELECT nombreCompleto, DATEDIFF(YEAR,fechaNac, GETDATE()) As Edad FROM empleado WHERE DATEDIFF(YEAR,fechaNac, GETDATE())
BETWEEN 19 AND 22 ORDER BY Edad;

SELECT nombreCompleto, DATEDIFF(YEAR,fechaNac, GETDATE()) As Edad FROM empleado WHERE DATEDIFF(YEAR,fechaNac, GETDATE())>=20 ORDER BY Edad;

--NORTHWIND
USE Northwind;
SELECT * FROM Products;
SELECT * FROM [Order Details];
SELECT * FROM Employees;

SELECT ProductName, CategoryID, UnitPrice FROM Products WHERE (CategoryID=1 OR CategoryID=2) AND UnitPrice>10 ORDER BY CategoryID DESC,UnitPrice;

--estableciendo condicion a partir de una consulta
SELECT ProductName, UnitPrice FROM Products WHERE ProductID IN (SELECT ProductID FROM [Order Details] 
WHERE UnitPrice<10) ORDER BY ProductName;


--operador LIKE
--muestra los apellidos que empiecen con la letra s
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName LIKE 's%' ORDER BY FirstName;

--mostrar apellidos que finalicen con an
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName LIKE '%an' ORDER BY FirstName;

--mostrar apellidos que empiecen con la letra s y finalicen con la letra a
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName LIKE 's%a' ORDER BY FirstName;

--el guion bajo indica un caracter, devuelve los apellidos cuya segunda letra sea 'a'
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName LIKE '_a%' ORDER BY FirstName;

--filtrar apellido mediante lista de caracteres, filtrar los apellidos que empiecen con L, K o C
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName LIKE '[LKC]%' ORDER BY FirstName;

--definiendo rango de caracteres
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName LIKE '[A-K]%' ORDER BY FirstName;

--mostrar los apellidos que no esten dentro de un rango
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName LIKE '[^A-K]%' ORDER BY FirstName;

--mostrar apellidos que no empiecen con la letra S
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE LastName NOT LIKE 'D%' ORDER BY FirstName;

--para realizar busqueda utilizo LIKE '%terminobusqueda%'

--funciones para valores nulos, reemplazar texto en valores nulos
SELECT CONCAT(firstname, lastname) AS nombre, ISNULL(Region,'No region') FUNCIONISNULL, COALESCE(Region, 'No region') FUNCIONCOALESCE FROM employees;
