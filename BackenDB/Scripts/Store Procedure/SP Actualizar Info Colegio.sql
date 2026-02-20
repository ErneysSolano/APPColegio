/******************************************************
*     FECHA: 19-02-2026          
*     AUTOR: Erneys Solano
*     ACCION: Crear SP actualizar info colegio
*     
*     DESCRIPCION:
*     Se realiza procedimimeto alamcenado para 
*     actualizar colegio
*
******************************************************
*/

use DBColegio
go


CREATE PROCEDURE sp_actualizar_colegio
@nit BIGINT,
@nombre VARCHAR (20),
@direccion VARCHAR (50),
@telefono VARCHAR (7),
@celular VARCHAR (10),
@correo VARCHAR (30),
@nivel_academico INT,
@tipo_colegio INT,
@estado_colegio INT,

@resultCode INT OUTPUT,
@resultMsg NVARCHAR (200) OUTPUT

AS
BEGIN 
     SET NOCOUNT ON;

     BEGIN TRY
       IF NOT EXISTS (SELECT 1 FROM Tbl_Colegio WHERE nit = @nit)
       BEGIN 
           SET @resultCode = 404
           SET @resultMsg = 'No existe informacion de colegio con ese NIT'
           RETURN
       END

       UPDATE  Tbl_Colegio
       SET     nombre =    @nombre,
               direccion = @direccion,
               telefono =  @telefono,
               celular =   @celular,
               correo =    @correo,
               id_nivel_Academico = @nivel_academico,
               id_tipo =   @tipo_colegio,
               id_estado = @estado_colegio
       WHERE   nit = @nit

       IF @@ROWCOUNT = 0
       BEGIN 
           SET @resultCode = 500
           SET @resultMsg = 'No se pudo actualizar la informacion del colegio'
       END
     END TRY
     BEGIN CATCH
            SET @resultCode = ERROR_NUMBER()
            SET @resultMsg = ERROR_MESSAGE()
     END CATCH

END
     
