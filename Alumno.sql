--Procedimientos almacenados
--Saavedra Alexander

--PA TAlumno
use BDUniversidad
go

--LISTAR
if OBJECT_ID('spListarAlumno') is not null
	drop proc spListarAlumno
go

create proc spListarAlumno
as
begin
	select * from TAlumno
end
go
exec spListarAlumno

--AGREGAR
if OBJECT_ID('spAgregarAlumno') is not null
	drop proc spAgregarAlumno
go

create proc spAgregarAlumno
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),@LugarNac varchar(50),@FechaNac datetime,@CodEscuela char(3)
as
begin
	--CodAlumno no puede ser duplicado
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		begin
			insert into TAlumno values(@CodAlumno,@Apellidos,@Nombres,@LugarNac,@FechaNac,@CodEscuela)
			select CodError = 0, Mensaje = 'Se inserto correctamente Alumno'
		end
	else select CodError = 1, Mensaje = 'Error: CodAlumno duplicada'
end
go
exec spAgregarAlumno 'A0006','Ramos Aguilar','Megan Jazmin','Cusco','4/5/2000','E01'
--ELIMINAR
if OBJECT_ID('spEliminarAlumno') is not null
	drop proc spEliminarAlumno
go

create proc spEliminarAlumno
@CodAlumno char(5)
as
begin
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = 'Error: No se encuentra el registro'
	else 
		begin
		DELETE FROM TAlumno  WHERE CodAlumno = @CodAlumno
		select CodError = 0, Mensaje = 'Se elimino correctamente'
		end
end
go
exec spEliminarAlumno 'A00'

--UPDATE
if OBJECT_ID('spActualizarAlumno') is not null
	drop proc spActualizarAlumno
go

create proc spActualizarAlumno
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),@LugarNac varchar(50),@FechaNac datetime,@CodEscuela char(3)
as
begin
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = 'Error: No se encuentra el registro'
	else 
		begin
		UPDATE TAlumno SET Apellidos=@Apellidos,Nombres=@Nombres,LugarNac=@LugarNac,FechaNac=@FechaNac,CodEscuela=@CodEscuela WHERE CodAlumno = @CodAlumno
		select CodError = 0, Mensaje = 'Se actualizado correctamente'
		end
end
go
exec spActualizarAlumno 'A0002','Rojas Delgado','Aldaba','Cusco','4/5/1996','E01'

--BUSCAR
if OBJECT_ID('spBuscarAlumno') is not null
	drop proc spBuscarAlumno
go

create proc spBuscarAlumno
@CodAlumno char(3)
as
begin
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = 'Error: No se encuentra el registro'
	else 
		begin
		select * from TAlumno where CodAlumno=@CodAlumno
		end
end
go
exec spBuscarAlumno 'A0001'