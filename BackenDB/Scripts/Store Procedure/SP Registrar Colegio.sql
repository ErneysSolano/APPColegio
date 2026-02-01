/******************************************************
*     FECHA: 25-01-2026          
*     AUTOR: Erneys Solano
*     ACCION: crear SP registrar colegio
*     
*     DESCRIPCION:
*     Se realiza procedimimeto alamcenado para 
*     registar el colegio
*
******************************************************
*/

use DBColegio
go

create procedure sp_registrar_colegio
@nit bigint,
@nombre varchar (20),
@direccion varchar (50),
@telefono varchar (7),
@celular varchar (10),
@correo varchar (30),
@ciudad varchar (15),
@nivel_academico int,
@tipo_colegio int,
@estado int 
AS
BEGIN
     SET NOCOUNT ON;

     INSERT INTO Tbl_Colegio (nit, nombre,direccion,telefono,celular,correo,ciudad,fecha_registro,id_nivel_Academico,id_tipo,id_estado)
                       VALUES(@nit,@nombre,@direccion,@telefono,@celular,@correo,@ciudad,GETDATE(),@nivel_academico,@tipo_colegio,@estado)
end                  
