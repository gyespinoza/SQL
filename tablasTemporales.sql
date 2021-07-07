USE Northwind;
--tablas temporales
--TABLAS TEMPORALES LOCALES
--utilizando SELECT
SELECT 
companyName, Address
INTO #temporary_customers --tabla temporal
FROM Customers
WHERE country='Mexico'

--consultar registro de la tabla temporal
SELECT * FROM #temporary_customers;

--utilizando CREATE 
CREATE TABLE #temporaryEjemplo2(companyName nvarchar(40));

--insercion de datos en tabla temporal
INSERT INTO #temporaryEjemplo2(companyName)
SELECT companyName FROM Customers WHERE country='USA';

SELECT * FROM #temporaryEjemplo2;

--TABLAS TEMPORALES GLOBALES
SELECT 
CategoryName, Description
INTO ##temporaryGlobal --tabla temporal global
FROM Categories;

--tabla global
CREATE TABLE ##temporalGlobal2 (categoryName nvarchar(15));

INSERT INTO ##temporalGlobal2(categoryName) SELECT CategoryName FROM Categories;


