USE recursoshumanos;

--creando copia de respaldo
EXEC sp_addumpdevice 'disk', 'backupRHumanos', 
'C:\Users\gabri\Desktop\backupRH.bak'
BACKUP DATABASE recursosHumanos TO backupRHumanos

--RESTAURAR BASE DE DATOS COMPLETA
RESTORE DATABASE recursoshumanos FROM backupRH;