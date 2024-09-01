
SET SQL_SAFE_UPDATES = 0;

USE taller_prueba;

UPDATE Empleados
SET nombre = "Danna Moncayo"
WHERE Empleados.nombre = "Marlon Moncayo";

SELECT * FROM taller_prueba.empleados;


