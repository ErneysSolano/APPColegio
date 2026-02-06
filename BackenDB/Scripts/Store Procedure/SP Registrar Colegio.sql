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
*     FECHA: 5-02-2026          
*     AUTOR: Erneys Solano
*     ACCION: alterar  SP registrar colegio
*     
*     DESCRIPCION:
*     Se realiza actualizacion de sp registrar colegio
*     con el fin de que valide si ya esta registrado el
*     colegio
******************************************************
*/

use DBColegio
go

Alter procedure sp_registrar_colegio
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

     IF EXISTS (SELECT 1 FROM Tbl_Colegio WHERE nit = @nit)
     BEGIN
          RAISERROR('ya existe un registro con ese nit', 16, 1);
          RETURN
     END

     INSERT INTO Tbl_Colegio (nit, nombre,direccion,telefono,celular,correo,ciudad,fecha_registro,id_nivel_Academico,id_tipo,id_estado)
                       VALUES(@nit,@nombre,@direccion,@telefono,@celular,@correo,@ciudad,GETDATE(),@nivel_academico,@tipo_colegio,@estado)
END                  
