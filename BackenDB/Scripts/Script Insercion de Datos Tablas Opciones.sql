/******************************************************************
*     FECHA:  25-01-2025          
*     AUTOR:  Erneys Solano
*     ACCION: Insertar datos en las tablas de Opciones
*     
*     DESCRIPCION:
*     Insertar datos en las tablas que para que 
*     el usuario escoja que opcion le es viable
********************************************************************
*/

use DBColegio
go



insert into Tbl_Rol(nombre) values ('Colegio'),('Rector'),('Coordinador'),('Docente'),('Acudiente'),('Alumno') --- ya

insert into Tbl_Materia(nombre) values ('Español'),('Sociales'),('matematica'),('Edu. Fisica'),('Artisitica'),('C Naturales'),('Quimica')

insert into Tbl_Estado(nombre) values ('Activo'), ('Inactivo'),('Inhabilitado'),('Suspendido')

insert into Tbl_Tipo(nombre) values ('Publico Mixto'), ('Publico Masculino'), ('Publico Femenino'),('Privado Mixto'), ('Privado Masculino'), ('Privado Femenino')

insert into Tbl_Tipo_Documento(nombre) values ('T Identidad'),('C Ciudadania'),('Contraseña'),('C Extranjeria')

insert into Tbl_Tipo_sanguineo(nombre) values ('O+'),('O-'),('A+'),('A-'),('AB+'),('AB-')

insert into Tbl_Nivel_Academico(nombre) values ('Kinder'),('Primaria'),('Secundaria'),('Educacion Media')

insert into Tbl_Parentesco_Fam(nombre)values ('Padre'),('Madre'),('Herman@'),('Ti@'),('Abuel@')

insert into Tbl_Grado(nombre) values ('Kinder'),('Preescolar'),('Primero'),('Segundo'),('Tercero'),('Cuarto'),('Quinto'),('Sexto'),('Septimo'),('Octavo'),('Novemo'),('Decimo'),('Undecimo')
