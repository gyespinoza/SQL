/*comentarios de varias lineas*/
--comentario de una linea


/*
PROCESO DE CREACION DE BASE DE DATOS
*/
--Reglas para creacion de base de datos
--los nombres de las bases de datos son unicos dentro de una instancia
--los nombres poseen un maximo de 128 caracteres

CREATE DATABASE recursoshumanos; --crear base de datos

--verificar la creacion de la base de datos
use master; --permite utilizar la base de datos
SELECT name FROM master.sys.databases; --consultar si la base de datos existe mediante una vista
EXEC sp_databases; --consultar si la base de datos existe mediante un procedimiento almacenado

/*
ELIMINAR BASE DE DATOS
*/
--DROP DATABASE, elimina la base de dato sy tambien los archivos del disco
--asegurarse de tener una copia de seguridad, en caso de querer restaurarla 

DROP DATABASE IF EXISTS recursoshumanos;


/*
CREACION DE ESQUEMAS
*/
USE recursoshumanos; --base de datos en donde se crearan los esquemas

CREATE SCHEMA DesarrolloHumano;
CREATE SCHEMA RecursosHumanos;


/*
CREAR TABLAS, CON RESTRICCIONES
*/

CREATE TABLE departamento(
	codDepartamento int PRIMARY KEY IDENTITY(1,1), --clave primaria auto incrementable
	departamento varchar(50) NOT NULL
);

CREATE TABLE cargo(
	codCargo int IDENTITY(1,1) PRIMARY KEY,
	cargo varchar(25) NOT NULL,
	codDepartamento int NOT NULL,
	FOREIGN KEY (codDepartamento) REFERENCES departamento(codDepartamento)
);

CREATE TABLE empleado(
	codEmpleado int IDENTITY(1,1) PRIMARY KEY,
	nombreCompleto varchar(40),
	direccion varchar(50),
	codCargo int NOT NULL,
	dui varchar(10) UNIQUE, --RESTRICCION DE FILA
	numeroTelefono varchar(9),
	CONSTRAINT fk_cargo FOREIGN KEY (codCargo) REFERENCES cargo (codCargo)
);
