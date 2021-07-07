CREATE DATABASE recursoshumanos;
use recursoshumanos;

use master;
SELECT name FROM master.sys.databases;
EXEC sp_databases;


DROP DATABASE IF EXISTS recursoshumanos;


CREATE SCHEMA DesarrolloHumano;
CREATE SCHEMA RecursosHumanos;

SELECT 
    s.name AS schema_name, 
    u.name AS schema_owner
FROM 
    sys.schemas s
INNER JOIN sys.sysusers u ON u.uid = s.principal_id
ORDER BY 
    s.name;




--crear inicios de sesion para la base de datos
CREATE LOGIN GerenteGeneral WITH PASSWORD='ugb2020'
CREATE LOGIN GerenteRH WITH PASSWORD='ugb2020'

--crear usuarios para la base de datos
CREATE USER JoseFlores FOR LOGIN GerenteGeneral WITH DEFAULT_SCHEMA=DesarrolloHumano
CREATE USER AndreaFlores FOR LOGIN GerenteRH WITH DEFAULT_SCHEMA=RecursosHumanos




--asignando permisos sobre los esquemas
GRANT SELECT
ON SCHEMA::RecursosHumanos
TO AndreaFlores
WITH GRANT OPTION


--ASIGNAR PERMISOS SOBRE TABLAS
GRANT INSERT ON OBJECT::RecursosHumanos.empleado TO AndreaFlores

--quitar permisos
REVOKE INSERT ON OBJECT::RecursosHumanos.empleado TO AndreaFlores

--quitar permisos sobre une squema
REVOKE SELECT ON SCHEMA::RecursosHUmanos TO AndreaFLores CASCADE


ALTER SCHEMA DesarrolloHumano  TRANSFER OBJECT::RecursosHumanos.empleado;  

DROP SCHEMA IF EXISTS DesarrolloHumano;



select * from desarrollohumano.empleado

EXEC sp_rename 'desarrollohumano.empleado', 'empleados';




DROP SCHEMA IF EXISTS RecursoHumano;

