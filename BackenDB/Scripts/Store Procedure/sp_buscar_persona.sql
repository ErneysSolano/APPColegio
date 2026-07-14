/******************************************************
*     FECHA: 25-01-2026          
*     AUTOR: Erneys Solano
*     ACCION: Crear SP buscar Colegio
*     
*     DESCRIPCION:
*     Se realiza procedimimeto alamcenado para 
*     consultar colegio
*
******************************************************
*/


USE DBColegio
GO

ALTER PROCEDURE sp_buscar_persona
@tipo_documento INT,
@numero_documento BIGINT
AS
BEGIN
     
     SET NOCOUNT ON;

     IF EXISTS(SELECT 1 FROM Tbl_Persona 
                        WHERE id_tipo_Documento = @tipo_documento
                        AND   numero_documento = @numero_documento)
     BEGIN
            SELECT p.id_tipo_Documento AS TipoDocumento,
                   p.numero_documento AS NumeroDocumento,
                   p.nombres AS Nombre,
                   p.apellidos AS Apellidos,
                   p.celular AS Celular,
                   p.correo AS Correo,
                   p.fecha_registro AS FechaRegistro,
                   gs.nombre AS GrupoSanguineo,
                   ru.nombre AS RolUser,
                   eu.nombre AS EstadoUser,
                   nu.nit AS NitSuscritoUser,
                   p.fecha_nacimiento AS FechaNaciomento,
                   p.edad AS Edad,
                   '[INFO][MENSAJE EXITOSO] Registro encontrado' AS Mensaje
                   FROM Tbl_Persona p
                   JOIN Tbl_Tipo_sanguineo gs ON p.id_tipo_sanguineo = gs.codigo
                   JOIN Tbl_Rol ru ON p.id_rol =ru.codigo
                   JOIN Tbl_Estado eu ON p.id_estado = eu.codigo
                   JOIN Tbl_Colegio nu ON p.nit_colegio = nu.nit
                   WHERE p.id_tipo_Documento = @tipo_documento AND P.numero_documento = @numero_documento
      END
      ELSE
      BEGIN
          SELECT '[WARNING][MENSAJE ALERTA] No existe registro con esos datos' AS Mensaje;
      END

END
