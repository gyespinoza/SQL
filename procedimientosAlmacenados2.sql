USE Northwind;

---bloques de codigo, bloque anonimo
BEGIN
	DECLARE @valor1 int=30, @valor2 int =10;
	IF(@valor1>0)
	BEGIN
		IF(@valor1<@valor2)
			PRINT 'Valor1 es mayor a cero, y valor1 es menor a valor2';
		ELSE
			PRINT 'Valor1 es mayor a cero, y valor1 es mayor a valor2'
	END
END;


CREATE PROCEDURE evaluar
AS
BEGIN --define un bloque de declaraciones, conjunto de sentencias
		DECLARE @valor1 int=30, @valor2 int =10;
		IF(@valor1>0)
		BEGIN
			IF(@valor1<@valor2)
				PRINT 'Valor1 es mayor a cero, y valor1 es menor a valor2';
			ELSE
				PRINT 'Valor1 es mayor a cero, y valor1 es mayor a valor2'
		END
END;

EXEC evaluar;




--ESCRIBIR EL BLOQUE DENTRO DE UN PROCEDIMIENTO ALMACENADO
--DEBERA RECIBIR UN ARGUMENTO LLAMADO @precio
BEGIN
DECLARE @VAL INT=22;
	SELECT
		ProductID, ProductName, UnitPrice
	FROM
		Products
	WHERE
		UnitPrice>5000

	--evaluar si existen productos cuyo precio unitario sea mayor a 500
	IF @@ROWCOUNT=0
		PRINT 'No existen productos cuyo precio sea mayor a 30' + CONVERT(VARCHAR(10), @VAL);
	ELSE
		PRINT 'Si existen productos cuyo precio es mayor a 30';
END


--DETERMINAR SI LAS VENTAS DE UN AñO SON MAYORES A 50,000
BEGIN
	DECLARE @ventaAnual INT; --almacena la venta anual

	SELECT
		@ventaAnual=SUM(od.Quantity*od.UnitPrice)
	FROM
		[Order Details] od
		INNER JOIN Orders o ON o.OrderID= od.OrderID
	WHERE
		YEAR(OrderDate) = 1996

	SELECT @ventaAnual  'Venta Anual'; --imprime la sumatoria de venta de un año

	--evaluar
	IF @ventaAnual>50000
		PRINT 'Las ventas del año 1996 son mayores a $ 50,0000.00'
	ELSE
		PRINT 'Las ventas del año 1996 son menores a $ 50,000.00'	
END


--VARIABLES EN SQL 
DECLARE @annio INT; --declaracion de variable
SET @annio=1996; --asignar valor a una variable

SELECT
		p.ProductName, o.OrderDate
	FROM
		[Order Details] od
		INNER JOIN Orders o ON o.OrderID= od.OrderID
		INNER JOIN Products p ON p.ProductID=od.ProductID
	WHERE
		YEAR(OrderDate) = @annio



--variables para almacenar resultados de consultas
DECLARE @cantidadProductos INT;

SET @cantidadProductos=(
	SELECT 
		COUNT(*)
	FROM
		Products
);

--mostrar resultados
SELECT @cantidadProductos 'Cantidad de Productos';


--encriptar procedimiento almacenado
ALTER PROCEDURE evaluar WITH ENCRYPTION
AS
BEGIN --define un bloque de declaraciones, conjunto de sentencias
		DECLARE @valor1 int=30, @valor2 int =10;
		IF(@valor1>0)
		BEGIN
			IF(@valor1<@valor2)
				PRINT 'Valor1 es mayor a cero, y valor1 es menor a valor2';
			ELSE
				PRINT 'Valor1 es mayor a cero, y valor1 es mayor a valor2'
		END
END;

--mostrar el contenido de un procedimiento
sp_helptext evaluar;




--AGREGAR A GUIA DE LA SEMANA
--EJERCICIOS COMPLEMENTARIOS

--ESCRIBIR EL BLOQUE DENTRO DE UN PROCEDIMIENTO ALMACENADO
--DEBERA RECIBIR UN ARGUMENTO LLAMADO @precio
BEGIN
DECLARE @VAL INT=22;
	SELECT
		ProductID, ProductName, UnitPrice
	FROM
		Products
	WHERE
		UnitPrice>5000

	--evaluar si existen productos cuyo precio unitario sea mayor a 500
	IF @@ROWCOUNT=0
		PRINT 'No existen productos cuyo precio sea mayor a 30' + CONVERT(VARCHAR(10), @VAL);
	ELSE
		PRINT 'Si existen productos cuyo precio es mayor a 30';
END
-- 2. Mostrar el nombre del producto con el precio mas alto, debera almacenar el nombre en una variable
-- 3. Crear un procedimiento almacenado de su base de datos que este encriptado
