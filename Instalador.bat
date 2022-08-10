echo Instalador de la Base de datos Universidad
echo Autor: Saavedra Alexander

sqlcmd -Slocalhost\SQLEXPRESS -E -i BDUniversidad.sql
sqlcmd -Slocalhost\SQLEXPRESS -E -i Alumno.sql
sqlcmd -Slocalhost\SQLEXPRESS -E -i Escuela.sql

echo Se ejecuto correctamente
pause