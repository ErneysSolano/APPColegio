/******************************************************
*     FECHA: 13-07-2026          
*     AUTOR: Erneys Solano
*     ACCION: crear SP registrar persona
*     DESCRIPCION:
*     Se realiza procedimimeto alamcenado para 
*     registar las personas en el sistema
*
******************************************************
*     FECHA: 14-07-2026          
*     AUTOR: Erneys Solano
*     ACCION: actualizar  SP registrar persona
*     DESCRIPCION:
*     Se realiza cambio en el procedimimeto alamcenado para 
*     registar las personas para que devuelva datos
*
*/

USE DBColegio
GO

ALTER PROCEDURE sp_registrar_persona
@id_tipo_documento INT,
@numero_documento BIGINT,
@nombres VARCHAR(20),
@apellidos VARCHAR(20),
@celular VARCHAR(30),
@correo VARCHAR(30),
@id_tipo_sanguineo INT,
@id_rol INT,
@id_estado INT,
@nit_colegio BIGINT,
@fecha_nacimiento DATE
AS
BEGIN
      SET NOCOUNT ON;

      IF EXISTS (SELECT 1 FROM Tbl_Persona WHERE numero_documento =@numero_documento)
      BEGIN
           RAISERROR('[WARNING][MENSAJE ALERTA]YA EXISTE UN REGISTRO CON ESA CEDULA', 16,1);
           RETURN;
      END

      DECLARE @edad INT;
      SET @edad = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE())

      IF(MONTH(@fecha_nacimiento) > MONTH(GETDATE()))
        OR (MONTH(@fecha_nacimiento) = MONTH(GETDATE()) AND DAY(@fecha_nacimiento) > DAY(GETDATE()))
      BEGIN
         SET @edad = @edad - 1;
      END

      INSERT INTO Tbl_Persona(
                              id_tipo_Documento, numero_documento,nombres,apellidos,celular,correo,fecha_registro,id_tipo_sanguineo,
                              id_rol,id_estado, nit_colegio, fecha_nacimiento, edad)
                              VALUES(
                              @id_tipo_documento, @numero_documento,@nombres,@apellidos,@celular,@correo, GETDATE(),@id_tipo_sanguineo,
                              @id_rol,@id_estado,@nit_colegio, @fecha_nacimiento, @edad)


      ----------------------------------------------------------
      SELECT numero_documento AS id,
             nombres,
             apellidos,
             '[INFO][MENSAJE EXITOSO] Persona registrada correctamente' AS mensaje
             FROM Tbl_Persona
             WHERE numero_documento = @numero_documento

END
