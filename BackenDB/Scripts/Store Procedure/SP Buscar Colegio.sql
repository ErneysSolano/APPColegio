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



use DBColegio
go


create procedure sp_buscar_colegio
@nit bigint
as begin
select c.nombre as Nombre,
       c.direccion as Direccion,
       c.telefono as Telefono,
       c.celular as Celular,
       c.correo as Correo,
       c.ciudad as Ciudad,
       c.fecha_registro as FechaRegistro,
       na.nombre as NivelAcademico,
       tc.nombre as TipoColegio,
       ec.nombre as EstadoColegio

  from Tbl_Colegio c 
  join Tbl_Nivel_Academico na on c.id_nivel_Academico = na.codigo
  join Tbl_Tipo tc on c.id_tipo = tc.codigo
  join Tbl_Estado ec on c.id_estado = ec.codigo
  where c.nit = @nit
  end