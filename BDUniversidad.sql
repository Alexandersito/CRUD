-- Base de datos Ejemplo
-- Hugo Espetia
-- 8/8/2022

use master
go

if DB_ID('BDUniversidad') is not null
	drop database BDUniversidad
go
create database BDUniversidad
go

use BDUniversidad
go

-- crear tablas
if OBJECT_ID('TEscuela') is not null
	drop table TEscuela
go
create table TEscuela
(
	CodEscuela char(3) primary key,
	Escuela varchar(50),
	Facultad varchar(50)
)
go

if OBJECT_ID('TAlumno') is not null
	drop table TAlumno
go
create table TAlumno
(
	CodAlumno char(5) primary key,
	Apellidos varchar(50),
	Nombres varchar(50),
	LugarNac varchar(50),
	FechaNac datetime,
	CodEscuela char(3),
	foreign key (CodEscuela) references TEscuela
)

-- Inserción de datos TEscuela
insert into TEscuela values('E01','Sistemas','Ingenieria')
insert into TEscuela values('E02','Civil','Ingenieria')
insert into TEscuela values('E03','Industrial','Ingenieria')
insert into TEscuela values('E04','Ambiental','Ingenieria')
insert into TEscuela values('E05','Arquitectura','Ingenieria')
go

select * from TEscuela
go

-- Inserción de datos TAlumno
insert into TAlumno values('A0001','Saavedra Quillahuaman','Alexander','Cusco','4/5/1996','E01')
insert into TAlumno values('A0002','Rojas Delgado','Aldana','Cusco','4/5/1996','E01')
insert into TAlumno values('A0003','Pimentel Pinedo','Alia','Cusco','4/5/1996','E01')
insert into TAlumno values('A0004','Pillco Estrada','Nataly','Cusco','4/5/1996','E01')
insert into TAlumno values('A0005','Guillen Berrio','Flor de Maria','Cusco','4/5/1996','E01')
go

select * from TAlumno
go




