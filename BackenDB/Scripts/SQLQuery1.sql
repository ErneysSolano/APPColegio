/******************************************************
*     FECHA: 27 de Diciembre 2025          
*     AUTOR: Erneys Solano
*     ACCION: Crear tablas
*     
*     DESCRIPCION:
*     Con la finalidad de llevar a cabo un proyecto 
*     personal sobre un aplicacion de gestion de 
*     nomtas academics, registro de estudiantes,
*     y otras acciones mas, el cual se iran agraga-
*     ndo con el tempo le iniciare
*
******************************************************
*/


use DBColegio
go

create table Tbl_Rol(
codigo int identity (1,1) primary key  ,
nombre varchar (10)
)

create table Tbl_Materia(
codigo int identity (1,1) primary key,
nombre varchar (20)
)

create table Tbl_Estado(
codigo int identity (1,1) primary key,
nombre varchar (10)
)

create table Tbl_Tipo(
codigo int identity (1,1) primary key,
nombre varchar (10)
)

create table Tbl_Tipo_Documento(
codigo int identity (1,1) primary key,
nombre varchar (10)
)

create table Tbl_Tipo_sanguineo(
codigo int identity (1,1) primary key,
nombre varchar (10)
)

create table Tbl_Nivel_Academico(
codigo int identity (1,1) primary key,
nombre varchar (10)
)

create table Tbl_Parentesco_Fam(
codigo int identity (1,1) primary key,
nombre varchar (10)
)
---------------------------------------- Tablas maestras

create table Tbl_Colegio(
nit bigint primary key,
nombre varchar (20),
direccion varchar (50),
telefono varchar (7),
celular varchar (10),
correo varchar (30),
ciudad varchar (15),
fecha_registro datetime,
id_nivel_Academico int,
id_tipo int,
id_estado int
)

create table Tbl_Persona(
id_tipo_Documento int,
numero_documento bigint primary key,
nombres varchar (20),
apellidos varchar (20),
celular varchar (10),
correo varchar (30),
fecha_registro datetime,
id_tipo_sanguineo int,
id_rol int,
id_estado int,
nit_colegio bigint
)

create table Tbl_Notas(
codigo int identity (1,1) primary key,
nota1 float,
nota2 float,
nota3 float,
nota4 float,
promedionotas float,
autoevaluacion float,
coevaluacion float,
nota_final float,
id_estudiante bigint,
id_profesor bigint,
id_materia int,
id_grado int
)

create table Tbl_Grado(
codigo int identity (1,1) primary key ,
nombre varchar (10),
nit_colegio bigint
)

create table Tbl_Asig_Profesor(
codigo int identity (1,1) primary key ,
id_profesor bigint,
id_materia int,
id_grado int,
id_coordinador bigint
)

create table Tbl_Asig_Estudiante(
codigo int identity (1,1) primary key,
id_estudiante bigint,
id_grado int,
id_director bigint
)

create table Tbl_Asig_Acudiente(
codigo int identity (1,1) primary key,
id_estudiante bigint,
id_acudiente bigint,
id_parentesco_fam int
)

create table Tbl_Usario(
codigo UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Usuario varchar (30),
contrasenna varchar (50),
id_persona bigint,
id_rol int,
id_estado int

)

