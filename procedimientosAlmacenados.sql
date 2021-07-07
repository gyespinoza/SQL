--PROCEDIMIENTOS ALMACENADOS
USE Northwind;

CREATE PROCEDURE clientesCompania --nombre del procedimiento
AS --separar el encabezado del cuerpo del procedimiento almacenado
BEGIN --declaracion es opcional mas es una buena practica
	SELECT CompanyName, ContactName FROM Customers ORDER BY CompanyName
END; --finaliza la declaracion


--ejecutar procedimiento almacenado
EXECUTE clientesCompania;
EXEC clientesCompania;

--modificar procedimiento almacenado
ALTER PROCEDURE clientesCompania --nombre del procedimiento
AS --separar el encabezado del cuerpo del procedimiento almacenado
BEGIN --declaracion es opcional mas es una buena practica
	SELECT CompanyName, ContactName, Address FROM Customers ORDER BY CompanyName
END; --finaliza la declaracion

--eliminar procedimiento almacenado
DROP PROCEDURE clientesCompania;


--PROCEDIMIENTOS CON PARAMETROS
ALTER PROCEDURE clientesCompania(@direccion NVARCHAR(10))  --nombre del procedimiento| @ indica el nombre del parametro
AS --separar el encabezado del cuerpo del procedimiento almacenado
BEGIN --declaracion es opcional mas es una buena practica
	SELECT 
		CompanyName, ContactName, Address 
	FROM Customers 
	WHERE
		Address LIKE @direccion+'%' --se establece el parametro para filtarr los datos
	ORDER BY CompanyName
END; --finaliza la declaracion


--ejecutar el procedimiento
EXEC clientesCompania 'e';


ALTER PROCEDURE productoPrecio( --procedimiento con dos o mas parametros
	@precio AS DECIMAL=8,
	@unidades AS INT=3,
	@producto AS VARCHAR(10)='a'
) --recibe el parametro precio
AS
BEGIN
	SELECT
		ProductName, UnitPrice, UnitsInStock
	FROM Products
	WHERE
		UnitPrice>=@precio AND --filtra los resultados a partir del parametro @precio
		UnitsInStock>@unidades AND
		ProductName LIKE '%' + @producto + '%'
	ORDER BY UnitPrice
END;

EXEC productoPrecio @precio=10


--parametros de salida
CREATE PROCEDURE productos(
	@nombreP AS VARCHAR(10),
	@cantidadProductos INT OUTPUT --define un parametro de salida
)AS
BEGIN
	SELECT
		ProductName, UnitPrice
	FROM Products
	WHERE
		ProductName LIKE @nombreP + '%'

	SELECT @cantidadProductos= @@ROWCOUNT --cuenta los registros de la tabla
END;

--definir una variable para almacenar el valor de retorno del parametro de salida
DECLARE @cantidad INT; --almacenara el valor del parametro de salida
EXEC productos @nombreP='e', @cantidadProductos=@cantidad OUTPUT;
SELECT @cantidad AS 'Cantidad de Productos';


