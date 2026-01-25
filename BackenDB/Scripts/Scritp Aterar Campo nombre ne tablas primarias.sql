/******************************************************************
*     FECHA:  25-01-2025          
*     AUTOR:  Erneys Solano
*     ACCION: Alterar el tamaño del campo nombre el las tablas
*     
*     DESCRIPCION:
*     se cambia el tamaño del campo nombre de las tablas
*     primarias para que se les pueda ingresar toda la informacion
********************************************************************
*/

use DBColegio
go

/*delete from Tbl_Rol
delete from Tbl_Materia
delete from Tbl_Estado
delete from Tbl_Tipo
delete from Tbl_Tipo_Documento
delete from Tbl_Tipo_sanguineo
delete from Tbl_Nivel_Academico
delete from Tbl_Parentesco_Fam
delete from Tbl_Grado*/

alter table Tbl_Rol Alter Column nombre Varchar(35)
alter table Tbl_Materia Alter Column nombre Varchar(35)
alter table Tbl_Estado Alter Column nombre Varchar(35)
alter table Tbl_Tipo Alter Column nombre Varchar(35)
alter table Tbl_Tipo_Documento Alter Column nombre Varchar(35)
alter table Tbl_Tipo_sanguineo Alter Column nombre Varchar(35)
alter table Tbl_Nivel_Academico Alter Column nombre Varchar(35)
alter table Tbl_Parentesco_Fam Alter Column nombre Varchar(35)
alter table Tbl_Grado Alter Column nombre Varchar(35)



