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
*     FECHA: 19-02-2026          
*     AUTOR: Erneys Solano
*     ACCION: se actualiza SP actualizar info colegio
*     
*     DESCRIPCION:
*     Se realiza actualizacion del SP
*     actualizar colegio
*
*/

use DBColegio
go


ALTER PROCEDURE sp_actualizar_colegio
@nit BIGINT,
@nombre VARCHAR (20) = null,
@direccion VARCHAR (50) = null,
@telefono VARCHAR (7) = null,
@celular VARCHAR (10) = null,
@correo VARCHAR (30) = null,
@nivel_academico INT = null,
@tipo_colegio INT = null,
@estado_colegio INT = null,

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
       SET     nombre =   ISNULL(@nombre, nombre),
               direccion = ISNULL(@direccion, direccion),
               telefono =  ISNULL(@telefono, telefono),
               celular =   ISNULL(@celular, celular),
               correo =    ISNULL(@correo,correo),
               id_nivel_Academico = ISNULL(@nivel_academico, id_nivel_Academico),
               id_tipo =   ISNULL(@tipo_colegio,id_tipo),
               id_estado = ISNULL(@estado_colegio, id_estado)
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
     
