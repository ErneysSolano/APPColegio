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

create table Tbl_Tipo(----tipo de colegio
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

create table Tbl_Grado(
codigo int identity (1,1) primary key ,
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

create table Tbl_Asig_Profesor(
codigo int identity (1,1) primary key ,
id_profesor bigint,
id_materia int,
id_grado int
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
id_parentesco_fam int,
Descripcion varchar (20)
)

create table Tbl_Usario(
codigo UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
Usuario varchar (30), 
contrasenna varchar (50),
id_persona bigint,
id_rol int,
id_estado int
)

-------------Relaciones de tabla-------

alter table Tbl_Colegio 
add constraint FK_Colegio_Nivel_Academico
foreign key (id_nivel_Academico)
references Tbl_Nivel_Academico(codigo)
--------
alter table Tbl_Colegio
add constraint FK_tipo_colegio
foreign key (id_tipo)
references Tbl_Tipo(codigo)
--------
alter table Tbl_Colegio
add constraint FK_Estado_Colgeio
foreign key (id_estado)
references Tbl_Estado(codigo)
----============================-->
alter table Tbl_Persona
add constraint FK_tipo_Sanguineo
foreign key (id_tipo_sanguineo)
references Tbl_Tipo_sanguineo(codigo)
-------
alter table Tbl_Persona
add constraint FK_Rol_Persona
foreign key (id_rol)
references Tbl_Rol(codigo)
-------
alter table Tbl_Persona
add constraint FK_Estado_Colegio
foreign key (id_estado)
references Tbl_Estado(codigo)
-------
alter table Tbl_Persona
add constraint FK_Nit_Colegio
foreign key (nit_colegio)
references Tbl_Colegio(nit)
----============================-->
alter table Tbl_Notas
add constraint FK_Id_Estudiante
foreign key (id_estudiante)
references Tbl_Persona(numero_documento)
------
alter table Tbl_Notas
add constraint Fk_Id_Profesor
foreign key (id_profesor)
references Tbl_Persona(numero_documento)
------
alter table Tbl_Notas 
add constraint FK_Materia
foreign key (id_materia)
references Tbl_Materia(codigo)
------
alter table Tbl_Notas
add constraint FK_Grado_Acad
foreign key (id_grado)
references Tbl_Grado(codigo)
----============================-->
alter table Tbl_Asig_Profesor
add constraint FK_Profesor 
foreign key (id_profesor)
references Tbl_Persona(numero_documento)
------
alter table Tbl_Asig_Profesor
add constraint FK_Materia_AsgProf
foreign key (id_materia)
references Tbl_Materia(codigo)
------
alter table Tbl_Asig_Profesor
add constraint FK_Grado_Esclr
foreign key (id_grado)
references Tbl_Grado(codigo)
----============================-->
alter table Tbl_Asig_Estudiante
add constraint FK_Estudiante
foreign key (id_estudiante)
references Tbl_Persona(numero_documento)------
------
alter table Tbl_Asig_Estudiante
add constraint FK_Grado_Esclr_Alumn
foreign key (id_grado)
references Tbl_Grado(codigo)
------
alter table Tbl_Asig_Estudiante
add constraint FK_Director_Grupo
foreign key (id_director)
references Tbl_Persona(numero_documento)
----============================-->
alter table Tbl_Asig_Acudiente
add constraint FK_Estudiante_AsigAcu
foreign key (id_estudiante)
references Tbl_Persona(numero_documento)
-----
alter table Tbl_Asig_Acudiente
add constraint FK_Acudiente 
foreign key (id_acudiente)
references Tbl_Persona(numero_documento)
-----
alter table Tbl_Asig_Acudiente
add constraint FK_Parentesco
foreign key (id_parentesco_fam)
references Tbl_Parentesco_Fam(codigo)
----============================-->
alter table Tbl_Usario
add constraint FK_Persona
foreign key (id_persona)
references Tbl_Persona(numero_documento)
-----
alter table Tbl_Usario
add constraint FK_Rol_User
foreign key (id_rol)
references Tbl_Rol(codigo)
-----
alter table Tbl_Usario
add constraint FK_Estado_Usuario
foreign key (id_estado)
references Tbl_Estado(codigo)
