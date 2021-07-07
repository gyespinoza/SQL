USE recursoshumanos;

SELECT * FROM recursosHumanos.depto;
SELECT * FROM recursosHumanos.cargos;
DELETE FROM RecursosHumanos.depto;

--CRUD: insertar, leer, actualizar y eliminar
--insertar multiples registros
INSERT INTO empleado(nombreCompleto,direccion,codCargo,dui, numeroTelefono) 
VALUES
('Pedro Canales','San Miguel',1,'5634789-8','7856-4563'),
('Carmen Valladares','Usulutan',3,'7896426-5','7963-4747');


--insertar multiples registros y retornar el codigo de los registros insertados
INSERT INTO departamento(departamento) OUTPUT inserted.codDepartamento VALUES ('Compras'), ('Ventas');

--insertar registros a partir de otra tabla
INSERT INTO RecursosHumanos.depto(idDepto,departamento) SELECT codCargo, cargo  FROM RecursosHumanos.cargos;

/*
CREAR UNA TABLA EN LA BASE DE DATOS LLAMADA PRUEBA EN LA CUAL INSERTEN REGISTROS DE OTRA TABLA DE SU BASE DE DATOS
REALIZAR UNA INSERCION QUE MUESTRE UNA SALIDA
*/

SELECT * FROM empleado;
SELECT * FROM recursosHumanos.depto;

--ACTUALIZACION DE REGISTROS
UPDATE RecursosHumanos.depto SET departamento='Compras' WHERE idDepto=2;

UPDATE empleado SET direccion='Usulutan', numeroTelefono='2665-4569' WHERE codEmpleado=41;

--ELIMINAR REGISTROS
DELETE TOP(10) FROM recursoshumanos.depto; 
DELETE TOP(2) PERCENT FROM RecursosHumanos.depto;
DELETE FROM RecursosHumanos.depto WHERE idDepto=12;


--SELECCIONAR REGISTROS.
SELECT departamento FROM departamento order by departamento desc;

SELECT nombreCompleto, direccion, dui FROM empleado order by nombreCompleto desc, direccion asc;

--ordenar un conjunto de registros por una columna que no este en la lista de seleccion
SELECT nombreCompleto, dui FROM empleado ORDER BY direccion desc;

--ordenar por posiciones ordinales
SELECT nombreCompleto, direccion FROM empleado ORDER BY 1 desc;

--definiendo un numero de registros
SELECT TOP(5) nombreCompleto, direccion FROM empleado ORDER BY 2 desc, 1 asc;


--DISTINCT
SELECT DISTINCT direccion FROM empleado ORDER BY direccion;

---COMPARTA UNA CAPTURA DE PANTALLA UTILIZANDO DISTINCT 


--GROUP BY
SELECT direccion FROM empleado GROUP BY direccion;

SELECT codCargo, direccion FROM empleado GROUP BY codCargo, direccion ORDER BY codCargo desc;


--GROUP BY, COUNT
--cantidad de empleados x departamento
SELECT direccion, COUNT(codcargo) cantidadEmpleados FROM empleado GROUP BY direccion ORDER BY direccion desc;

SELECT count(codCargo) cantidadEmpleados FROM empleado WHERE direccion='San Miguel';


SELECT codCargo, direccion FROM empleado WHERE codCargo IN(10,14) GROUP BY codCargo, direccion;

--HAVING
SELECT direccion, codCargo FROM empleado GROUP BY direccion, codCargo HAVING codCargo>=5 ORDER BY codCargo desc;



/*
BASE DE DATOS NORTHWIND
*/
USE Northwind;
SELECT * FROM orders;

--combinar group by, having y order by
--los alias se escriben seguido del campo 
SELECT CustomerID Cliente, YEAR(OrderDate) Año, COUNT(OrderID) Ordenes FROM Orders
GROUP BY CustomerID, YEAR(OrderDate)
HAVING COUNT(OrderID)>=8
ORDER BY CustomerID desc;

--utilizando clausula GROUP BY
SELECT CustomerID, YEAR(OrderDate) Año FROM orders 
GROUP BY CustomerID, YEAR(OrderDate) ORDER BY CustomerID;


--DISTINCT
SELECT DISTINCT ShipCountry, ShipCity FROM orders ORDER BY ShipCountry, ShipCity;