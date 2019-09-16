use master
go

SET LANGUAGE SPANISH
GO

if exists(select * from SysDataBases where name = 'Farmacia')
	begin
		drop database Farmacia
	end
go

create database Farmacia
go

use Farmacia
go

create table Farmaceutica
(
	ruc int primary key,
	nombre varchar(20) not null,
	correo varchar(50) not null,
	calle varchar(50) not null,
	numero int not null,
	apto int
)
go

create table Medicamento
(
	ruc int not null foreign key references Farmaceutica(ruc),
	codigo int IDENTITY(0000, 1) not null,
	nombre varchar(20) not null,
	descripcion varchar(100),
	precio int not null,
	primary key(ruc, codigo)
)
go

create table Usuario
(
	nomUsu varchar(20) primary key,
	pass varchar(20) not null,
	nombre varchar(20) not null,
	apellido varchar(20) not null
)
go

create table Cliente
(
	nomUsu varchar(20) primary key foreign key references Usuario(nomUsu),
	dirEntrega varchar(100) not null,
)
go

create table Telefono
(
	nomUsu varchar(20) not null foreign key references Cliente(nomUsu),
	telefono int not null,
	primary key(nomUsu, telefono)
)
go

create table Empleado
(
	nomUsu varchar(20) primary key foreign key references Usuario(nomUsu),
	horaInicio time not null,
	horaFinal time not null
)
go

create table Pedido
(
	numero int IDENTITY(1,1) primary key,
	cliente varchar(20) foreign key references Cliente(nomUsu),
	rucMedicamento int not null,
	codMedicamento int not null,
	foreign key (rucMedicamento, codMedicamento) references Medicamento(ruc, codigo),
	cantidad int,
	estado int
)
go

--------------------------------------------------------------------------------------------------------
-----------------------------------------Carga de Datos-------------------------------------------------
INSERT Farmaceutica VALUES(123456789, 'MediCure', 'pedidos@medicure.com', '18 de Julio', 1432, 003)
INSERT Farmaceutica VALUES(111111111, 'FarmaCure', 'pedidos@farmacure.com', '18 de Julio', 1433, 004)
INSERT Farmaceutica VALUES(222222222, 'MediCasa', 'pedidos@medicasa.com', 'Canelones', 1336, 005)
INSERT Farmaceutica VALUES(333333333, 'MediPlus', 'pedidos@mediplus.com', 'Bv. Artigas', 2735, null)
INSERT Farmaceutica VALUES(444444444, 'FarmaCatec', 'pedidos@farmacatec.com', '18 de Julio', 1001, 101)
INSERT Farmaceutica VALUES(555555555, 'HealthFarma', 'pedidos@healthfarma.com', 'Av. Brasil', 1781, null)
INSERT Farmaceutica VALUES(666666666, 'FarmaSalus', 'pedidos@farmasalus.com', 'Av. Gral. Garibaldi', 2934, null)
INSERT Farmaceutica VALUES(777777777, 'SaludPrimero', 'pedidos@saludprimero.com', 'Maldonado', 1022, 103)
INSERT Farmaceutica VALUES(888888888, 'Farmaceuticasa', 'pedidos@farmaceuticasa.com', 'Av. Libertador', 731, null)
INSERT Farmaceutica VALUES(999999999, 'RondeauMedicamentos', 'pedidos@rondeaumedicamentos.com', 'Av. Gral. Rondeau', 1012, null)
GO

INSERT Medicamento VALUES(123456789, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(123456789, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(123456789, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(123456789, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(123456789, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(111111111, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(111111111, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(111111111, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(111111111, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(111111111, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(222222222, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(222222222, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(222222222, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(222222222, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(222222222, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(333333333, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(333333333, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(333333333, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(333333333, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(333333333, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(444444444, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(444444444, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(444444444, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(444444444, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(444444444, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(555555555, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(555555555, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(555555555, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(555555555, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(555555555, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(666666666, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(666666666, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(666666666, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(666666666, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(666666666, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(777777777, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(777777777, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(777777777, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(777777777, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(777777777, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(888888888, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(888888888, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(888888888, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(888888888, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(888888888, 'Alergel', 'Inhibidor de alergias', 90)

INSERT Medicamento VALUES(999999999, 'Dipirona', 'Calma dolores en general', 100)
INSERT Medicamento VALUES(999999999, 'AntiGripal', 'Calma sintomas gripales', 120)
INSERT Medicamento VALUES(999999999, 'AntiMigra', 'Calma dolor de cabeza', 90)
INSERT Medicamento VALUES(999999999, 'AntiFem', 'Calma dolores menstruales', 90)
INSERT Medicamento VALUES(999999999, 'Alergel', 'Inhibidor de alergias', 90)
GO

--Empleados
INSERT Usuario VALUES('admin', 'pass', 'Generico', 'Generico')
INSERT Usuario VALUES('Edward', 'pass', 'Edward', 'Rodriguez')
INSERT Usuario VALUES('Jose', 'pass', 'Jose', 'Perez')
INSERT Usuario VALUES('Juan', 'pass', 'Juan', 'Serrat')
INSERT Usuario VALUES('Pepe', 'pass', 'Pepe', 'Garcia')

INSERT Empleado VALUES('admin', '20190912 08:00', '16:00:00')
INSERT Empleado VALUES('Edward', '20190912 08:00', '16:00:00')
INSERT Empleado VALUES('Jose', '20190912 16:00', '00:00:00')
INSERT Empleado VALUES('Juan', '20190912 16:00', '00:00:00')
INSERT Empleado VALUES('Pepe', '20190912 12:00', '20:00:00')

--Clientes
INSERT Usuario VALUES('Ramon', 'pass', 'Ramon', 'Fernandez')
INSERT Usuario VALUES('Felipe', 'pass', 'Felipe', 'Fernandez')

INSERT Cliente VALUES('Ramon', '18 de Julio 2030')
INSERT Cliente VALUES('Felipe', 'Gonzalo Ramirez 1204')

INSERT Telefono VALUES('Ramon', 24009000)
INSERT Telefono VALUES('Felipe', 098303353)
GO

INSERT Pedido VALUES('Ramon', 123456789, 0000, 8, 0)
INSERT Pedido VALUES('Ramon', 123456789, 0001, 10, 0)
INSERT Pedido VALUES('Ramon', 123456789, 0002, 5, 0)
INSERT Pedido VALUES('Ramon', 123456789, 0003, 3, 0)
INSERT Pedido VALUES('Ramon', 123456789, 0004, 1, 0)

INSERT Pedido VALUES('Felipe', 111111111, 0005, 15, 0)
INSERT Pedido VALUES('Felipe', 111111111, 0006, 5, 0)
INSERT Pedido VALUES('Felipe', 111111111, 0007, 5, 0)
INSERT Pedido VALUES('Felipe', 111111111, 0008, 1, 0)
INSERT Pedido VALUES('Felipe', 111111111, 0009, 1, 0)
GO

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
-----------------------------------Procedimientos Almacenados-------------------------------------------
CREATE PROCEDURE EliminarUsuario
@nomUsu VARCHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Usuario WHERE nomUsu = @nomUsu)
		RETURN -1 --Esto es, no existe ese Usuario
	BEGIN TRAN
		DELETE Cliente WHERE nomUsu = @nomUsu
		DELETE Empleado WHERE nomUsu = @nomUsu
		DELETE Usuario WHERE nomUsu = @nomUsu
	COMMIT TRAN
	RETURN 1
END
GO

CREATE PROCEDURE LogueoUsuario
@nomUsu VARCHAR(20),
@pass VARCHAR(20)
AS
BEGIN
	SELECT *
	FROM Usuario U
	WHERE U.nomUsu = @nomUsu AND U.pass = @pass
END
GO

CREATE PROCEDURE AltaEmpleado
@nomUsu VARCHAR(20),
@pass VARCHAR(20),
@nombre VARCHAR(20),
@apellido VARCHAR(20),
@horaInicio TIME,
@horaFinal TIME
AS
BEGIN
	BEGIN TRAN
		INSERT Usuario VALUES(@nomUsu, @pass, @nombre, @apellido)
		if @@ERROR <> 0
			begin
				ROLLBACK TRAN
				return -1 --Esto es, error de transaccion
			end
		INSERT Empleado VALUES(@nomUsu, @horaInicio, @horaFinal)
		if @@ERROR <> 0
			BEGIN
				ROLLBACK TRAN
				return -1 --Esto es, error de transaccion
			END
	COMMIT TRAN
	RETURN 1 --Esto es, transaccion exitosa
END
GO

CREATE PROCEDURE ModificarEmpleado
@nomUsu VARCHAR(20),
@pass VARCHAR(20),
@nombre VARCHAR(20),
@apellido VARCHAR(20),
@horaInicio TIME,
@horaFinal TIME
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Empleado WHERE nomUsu = @nomUsu)
		RETURN -1 --Esto es, no existe un empleado con ese nombre

	IF EXISTS(SELECT * FROM Cliente WHERE nomUsu = @nomUsu)
		RETURN -2 --Esto es, ERROR - Se esta intentando modificar un cliente, no un empleado

	BEGIN TRAN
		UPDATE Usuario
			SET pass = @pass, nombre = @nombre, apellido = @apellido
			WHERE nomUsu = @nomUsu
			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRAN
					RETURN -1
				END
		UPDATE Empleado
			SET horaInicio = @horaInicio, horaFinal = @horaFinal
			WHERE nomUsu = @nomUsu
			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRAN
					RETURN -1
				END
	COMMIT TRAN
	RETURN 1
END
GO

CREATE PROCEDURE EliminarEmpleado
@nomUsu VARCHAR(20)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Empleado WHERE nomUsu = @nomUsu)
		RETURN -1 --Esto es, Error - No existe empleado con ese nombre de usuario
	ELSE
		BEGIN
			BEGIN TRAN
				DELETE Empleado WHERE nomUsu = @nomUsu
				IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRAN
						RETURN -2 --Error SQL
					END
				DELETE Usuario WHERE nomUsu = @nomUsu
				IF @@ERROR <> 0
					BEGIN
						ROLLBACK TRAN
						RETURN -2 --Error SQL
					END
			COMMIT TRAN
			RETURN 1
		END
END
GO

CREATE PROCEDURE BuscarEmpleado
@nomUsu VARCHAR(20)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Empleado WHERE nomUsu = @nomUsu)
		RETURN -1 --No existe empleado
	ELSE
		BEGIN
		SELECT * FROM Empleado WHERE nomUsu = @nomUsu
		END
END
GO

CREATE PROCEDURE AltaCliente
@nomUsu VARCHAR(20),
@pass VARCHAR(20),
@nombre VARCHAR(20),
@apellido VARCHAR(20),
@dirEntrega VARCHAR(100)
AS
BEGIN
	BEGIN TRAN
		INSERT Usuario VALUES(@nomUsu, @pass, @nombre, @apellido)
		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRAN
				RETURN -1 --Error SQL
			END
		INSERT Cliente VALUES(@nomUsu, @dirEntrega)
		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRAN
				RETURN -1 --Error SQL
			END
	COMMIT TRAN
	RETURN 1 --Transaccion exitosa
END
GO

CREATE PROCEDURE AltaFarmaceutica
@ruc int,
@nombre varchar(20),
@correo varchar(50),
@calle varchar(50),
@numero int,
@apto int
AS
BEGIN
	BEGIN TRAN
		INSERT Farmaceutica VALUES(@ruc, @nombre, @correo, @calle, @numero, @apto)
		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRAN
				RETURN -1 --Error SQL
			END
	COMMIT TRAN
	RETURN 1 --Transaccion exitosa
END
GO

CREATE PROCEDURE ModificarFarmaceutica
@ruc int,
@nombre varchar(20),
@correo varchar(50),
@calle varchar(50),
@numero int,
@apto int
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Farmaceutica WHERE ruc = @ruc)
		RETURN -1 --Esto es, no existe una farmaceutica con ese nombre

	UPDATE Farmaceutica
	SET nombre = @nombre, correo = @correo, calle = @calle, numero = @numero, apto = @apto
	WHERE ruc = @ruc
	IF @@ERROR <> 0
		RETURN -1
	ELSE
		RETURN 1
END
GO

CREATE PROCEDURE EliminarFarmaceutica
@ruc int
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Farmaceutica WHERE ruc = @ruc)
		RETURN -1 --Esto es, no existe Farmaceutica con ese ruc

	IF EXISTS(SELECT * FROM Pedido P INNER JOIN Medicamento M ON P.rucMedicamento = M.ruc WHERE P.rucMedicamento = @ruc)
		RETURN -2 --Esto es, no se puede eliminar, hay pedidos asociados a esta farmaceutica

	IF NOT EXISTS(SELECT * FROM Pedido P INNER JOIN Medicamento M ON P.rucMedicamento = M.ruc WHERE P.rucMedicamento = @ruc)
		BEGIN
			IF NOT EXISTS(SELECT * FROM Medicamento WHERE ruc = @ruc)
				BEGIN
					DELETE Farmaceutica WHERE ruc = @ruc
					RETURN 1 --Esto es, transaccion exitosa
				END
			ELSE IF EXISTS(SELECT * FROM Medicamento WHERE ruc = @ruc)
				BEGIN
					BEGIN TRAN
						DELETE Medicamento WHERE ruc = @ruc
						IF @@ERROR <> 0
							BEGIN
								ROLLBACK TRAN
								RETURN -1 --Error SQL
							END
						DELETE Farmaceutica WHERE ruc = @ruc
						IF @@ERROR <> 0
							BEGIN
								ROLLBACK TRAN
								RETURN -1 --Error SQL
							END
					COMMIT TRAN
					RETURN 1 --Esto es, transaccion exitosa
				END
		END
END
GO

CREATE PROCEDURE BuscarFarmaceutica
@ruc INT
AS
BEGIN
	IF EXISTS (SELECT * FROM Farmaceutica WHERE ruc = @ruc)
		SELECT * FROM Farmaceutica WHERE ruc = @ruc
	ELSE
		RETURN -1 --Esto es, no se encontro Farmaceutica con ese RUC
END	
GO

CREATE PROCEDURE AltaMedicamento
@ruc INT,
@nombre VARCHAR(20),
@descripcion VARCHAR(100),
@precio INT
AS
BEGIN
	BEGIN TRAN
		INSERT Medicamento VALUES(@ruc, @nombre, @descripcion, @precio)
		IF @@ERROR <> 0
			BEGIN
				ROLLBACK TRAN
				RETURN -2 --Esto es, error de SQL
			END
	COMMIT TRAN
	RETURN 1 --Esto es, transaccion exitosa
END
GO

CREATE PROCEDURE ModificarMedicamento
@ruc INT,
@codigo INT,
@nombre VARCHAR(20),
@descripcion VARCHAR(100),
@precio INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Medicamento WHERE ruc = @ruc AND codigo = @codigo)
		RETURN -1 --Esto es, no existe ningun medicamento con ese codigo y ruc
	ELSE
		BEGIN TRAN
			UPDATE Medicamento
			SET nombre = @nombre, descripcion = @descripcion, precio = @precio
			WHERE ruc = @ruc AND codigo = @codigo
			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRAN
					RETURN -2 --Esto es, error SQL
				END
		COMMIT TRAN
		RETURN 1 --Esto es, transaccion exitosa
END
GO

CREATE PROCEDURE EliminarMedicamento
@ruc INT,
@codigo INT
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Medicamento WHERE ruc = @ruc AND codigo = @codigo)
		RETURN -1 --Esto es, no existe medicamento
	ELSE
		BEGIN TRAN
			DELETE Pedido WHERE rucMedicamento = @ruc AND codMedicamento = @codigo
			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRAN
					RETURN -2 --Esto es, error SQL
				END
			DELETE Medicamento WHERE ruc = @ruc AND codigo = @codigo
			IF @@ERROR <> 0
				BEGIN
					ROLLBACK TRAN
					RETURN -2 --Esto es, error SQL
				END
		COMMIT TRAN
		RETURN 1 --Esto es, transaccion exitosa
END
GO

CREATE PROCEDURE ListarMedicamento
AS
BEGIN
	SELECT * FROM Medicamento
END
GO

CREATE PROCEDURE BuscarMedicamento
@ruc INT,
@codigo INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Medicamento WHERE ruc = @ruc AND codigo = @codigo)
		RETURN -1 --Esto es, no existe medicamento con ese ruc y codigo
	ELSE
		SELECT * FROM Medicamento WHERE ruc = @ruc AND codigo = @codigo
END
GO

CREATE PROCEDURE AltaPedido
@cliente varchar(20),
@rucMedicamento int,
@codMedicamento int,
@cantidad int
AS
BEGIN
	INSERT Pedido VALUES(@cliente, @rucMedicamento, @codMedicamento, @cantidad, 0)
	IF @@ERROR <> 0
		RETURN -1 --Esto es, error SQL
	ELSE
		RETURN 1 --Esto es, transaccion exitosa
END
GO

CREATE PROCEDURE EliminarPedido
@numero INT
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Pedido WHERE numero = @numero)
		RETURN -1 --Esto es, no existe tal pedido
	ELSE
		BEGIN
			DELETE Pedido WHERE numero = @numero
			IF @@ERROR <> 0
				RETURN -1 --Esto es, error SQL
			ELSE
				RETURN 1 --Esto es, transaccion exitosa
		END
END
GO

CREATE PROCEDURE ListarTodo --PEDIDOS
AS
BEGIN
	SELECT * FROM Pedido
END
GO

CREATE PROCEDURE ListarGenerados
AS
BEGIN
	SELECT * FROM Pedido WHERE estado = 0
END
GO

CREATE PROCEDURE ListarEnviados
AS
BEGIN
	SELECT * FROM Pedido WHERE estado = 1
END
GO

CREATE PROCEDURE ListarEntregados
AS
BEGIN
	SELECT * FROM Pedido WHERE estado = 2
END
GO

CREATE PROCEDURE BuscarPedido
@numero INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Pedido WHERE numero = @numero)
		RETURN -1 --Esto es, no existe tal pedido
	ELSE
		SELECT * FROM Pedido WHERE numero = @numero
END
GO

CREATE PROCEDURE CambioEstadoPedido
@numero INT
AS
BEGIN
	UPDATE Pedido SET estado = estado + 1 WHERE Pedido.numero = @numero AND estado < 2
	IF @@ERROR <> 0
		RETURN -1 --Esto es, error SQL
	ELSE
		RETURN 1
END
GO

/*
----------------SP Necesarios----------------
EliminarUsuario // HECHO // TEST HECHO
Logueo (BuscarUsuario) // HECHO // NO NECESITA TEST
AltaEmpleado // HECHO // TEST HECHO
ModificarEmpleado // HECHO // TEST HECHO
EliminarEmpleado // HECHO // TEST HECHO
BuscarEmpleado // HECHO // TEST HECHO
AltaCliente // HECHO // TEST HECHO
AltaFarmaceutica // HECHO // TEST HECHO
ModificarFarmaceutica // HECHO // TEST HECHO
EliminarFarmaceutica // HECHO // TEST HECHO
{
	Para eliminar Farmaceutica, hay que eliminar todas las tablas y datos que generen dependencia a ella:
	- Si tiene pedidos asociados, no se podrá eliminar la farmacéutica.
	Si no los tiene, entonces:
	- Se deben eliminar medicamentos que tenga el ruc de la Farmaceutica
	- Se borra, ahora si, correctamente la farmaceutica.
}
BuscarFarmaceutica // HECHO // TEST HECHO
AltaMedicamento // HECHO // TEST HECHO
ModificarMedicamento // HECHO // TEST HECHO
EliminarMedicamento // HECHO // TEST HECHO
{
	Para eliminar Medicamento, hay que eliminar dependencias
	- Se eliminan pedidos con el medicamento asociado
	- Ahora si, se borra correctamente el medicamento
}
ListarMedicamento // HECHO // NO NECESITA TEST
BuscarMedicamento // HECHO // TEST HECHO
AltaPedido // HECHO // TEST HECHO
EliminarPedido // HECHO // TEST HECHO
ListarTodo (Todos los pedidos) // HECHO // NO NECESITA TEST
ListarGenerados (Pedidos) // HECHO // NO NECESITA TEST
ListarEnviados (Pedidos) // HECHO // NO NECESITA TEST
ListarEntregados (Pedidos) // HECHO // NO NECESITA TEST
BuscarPedido // HECHO //  TEST HECHO
CambioEstadoPedido // HECHO // TEST HECHO
*/
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
----------------------------------TESTEO DE PROCEDIMIENTOS ALMACENADOS----------------------------------
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------ELIMINAR USUARIO
--ESTE COMANDO ES EXITOSO
/*
DECLARE @RET INT
EXEC @RET = EliminarUsuario "admin"
PRINT @RET
GO

--ESTE COMANDO NO ES EXITOSO -- CLIENTE NO EXISTE

DECLARE @RET INT
EXEC @RET = EliminarUsuario "AdministradorPepe"
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------ALTA EMPLEADO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = AltaEmpleado "AdministradorX", '1111', 'Julio', 'Boca', '08:00:00', '16:00:00'
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------MODIFICAR EMPLEADO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = ModificarEmpleado 'Jose', '3333', 'Josefin', 'Sanz', '08:00:00', '16:00:00'
PRINT @RET
GO

--COMANDO CON ERROR - EMPLEADO INEXISTENTE
DECLARE @RET INT
EXEC @RET = ModificarEmpleado 'ADNROSE123', '3333', 'Josefin', 'Sanz', '08:00:00', '16:00:00'
PRINT @RET
GO


--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------ELIMINAR EMPLEADO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = EliminarEmpleado 'Edward'
PRINT @RET
GO

--COMANDO NO EXITOSO - EMPLEADO INEXISTENTE
DECLARE @RET INT
EXEC @RET = EliminarEmpleado 'ADNROSE123'
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------BUSCAR EMPLEADO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = BuscarEmpleado 'admin'
PRINT @RET
GO

--COMANDO NO EXITOSO - NO EXISTE EMPLEADO
DECLARE @RET INT
EXEC @RET = BuscarEmpleado 'ADNROSE123'
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------ALTA CLIENTE
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = AltaCliente 'Usuario1', '1234', 'Pepito', 'Sanchez', 'Calle Santana 123'
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------ALTA FARMACEUTICA
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = AltaFarmaceutica 121212121, 'UnaFarma', 'pedidos@unafarma.com', 'Calle', 1234, null
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------MODIFICAR FARMACEUTICA
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = ModificarFarmaceutica 111111111, 'FarmaCureS', 'pedidos@farmacures.com', 'Calle', 1234, null
PRINT @RET
GO

--COMANDO NO EXITOSO - Farmaceutica no existe
DECLARE @RET INT
EXEC @RET = ModificarFarmaceutica 312312312, 'FarmaCureS', 'pedidos@farmacures.com', 'Calle', 1234, null
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------ELIMINAR FARMACEUTICA
--COMANDO EXITOSO - Farmaceutica no tiene pedidos asociados
DECLARE @RET INT
EXEC @RET = EliminarFarmaceutica 222222222
PRINT @RET
GO

--COMANDO NO EXITOSO - Farmaceutica SI tiene pedidos asociados
DECLARE @RET INT
EXEC @RET = EliminarFarmaceutica 111111111
PRINT @RET
GO

--COMANDO NO EXITOSO - Farmaceutica no existe
DECLARE @RET INT
EXEC @RET = EliminarFarmaceutica 432432432
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------BUSCAR FARMACEUTICA
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = BuscarFarmaceutica 111111111
PRINT @RET
GO

--COMANDO NO EXITOSO - Farmaceutica no existe
DECLARE @RET INT
EXEC @RET = BuscarFarmaceutica 432432432
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------ALTA MEDICAMENTO

--COMANDO EXITOSO (NO HAY EXCEPCION DE CREAR UN MEDICAMENTO YA EXISTENTE, YA QUE EL codigo ES IDENTITY
DECLARE @RET INT
EXEC @RET = AltaMedicamento 111111111, 'MedicaMENTOS', 'Medicacion general', 200
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------MODIFICAR MEDICAMENTO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = ModificarMedicamento 111111111, 0005, 'Nuevo Nombre', 'Nueva Descripcion', 75
PRINT @RET
GO

--COMANDO NO EXITOSO - NO EXISTE MEDICAMENTO
DECLARE @RET INT
EXEC @RET = ModificarMedicamento 000000000, 0005, 'Nuevo Nombre', 'Nueva Descripcion', 75
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------ELIMINAR MEDICAMENTO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = EliminarMedicamento 111111111, 0007
PRINT @RET
GO

--COMANDO NO EXITOSO - NO EXISTE MEDICAMENTO
DECLARE @RET INT
EXEC @RET = EliminarMedicamento 000000000, 0005
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------BUSCAR MEDICAMENTO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = BuscarMedicamento 111111111, 0006
PRINT @RET
GO

--COMANDO NO EXITOSO - NO EXISTE MEDICAMENTO
DECLARE @RET INT
EXEC @RET = BuscarMedicamento 111111111, 1427
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------ALTA PEDIDO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = AltaPedido 'Felipe', 111111111, 0007, 3
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------ELIMINAR PEDIDO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = EliminarPedido 1
PRINT @RET
GO

--COMANDO NO EXITOSO - NO EXISTE PEDIDO
DECLARE @RET INT
EXEC @RET = EliminarPedido 173
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------BUSCAR PEDIDO
--COMANDO EXITOSO
DECLARE @RET INT
EXEC @RET = BuscarPedido 2
PRINT @RET
GO

--COMANDO NO EXITOSO - NO EXISTE EL PEDIDO
DECLARE @RET INT
EXEC @RET = BuscarPedido 173
PRINT @RET
GO

--------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------CAMBIO ESTADO PEDIDO
--NOTA: Como codigo defensivo, puse que no se pueda llevar el estado a mas de 2 (ya que los estados posibles
--son 0, 1 y 2; el SP se podrá seguir ejecutando, en caso de que estado ya tenga valor 2, pero no lo cambiará.)
DECLARE @RET INT
EXEC @RET = CambioEstadoPedido 4
PRINT @RET
GO
*/