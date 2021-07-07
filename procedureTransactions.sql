use recursoshumanos;

--bloques try.... catch...
BEGIN TRY
	--acciones 
END TRY
BEGIN CATCH
	--acciones
END CATCH

--PROCEDIMIENTO EN TRANSACCIONES
CREATE PROCEDURE guardarCargo
	@pcargo VARCHAR(25)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO RecursosHumanos.cargos(cargo) VALUES (@pcargo)
			SET NOCOUNT ON;
			IF @@TRANCOUNT >0
				PRINT 'El registro se ha guardado de forma exitosa'
				COMMIT
	END TRY
	BEGIN CATCH
		SET NOCOUNT ON;
		IF @@TRANCOUNT >0
			PRINT 'NO SE HA PODIDO REALIZAR LA TRANSACCION'
			ROLLBACK
			SELECT ERROR_NUMBER() AS NumeroError
			SELECT ERROR_MESSAGE()  AS MensajeError
	END CATCH
END;


EXEC guardarCargo 'Nuevo';