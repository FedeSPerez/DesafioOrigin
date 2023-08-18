# Desafio-origin

## Stack

### Backend

.NET 6
EntityFrameworkCore 6

### Frontend (Sin finalizar)

Angular CLI: 16.1.1
Node: 18.16.1

### Base de datos

MS SQL SERVER

## Instrucciones para correr la app:

### Importar Base de Datos

Para importar la BD se puede utilizar tanto el archivo ScriptDB ejecutando el script que se encuentra dentro de este archivo en un nuevo query desde SQL Server Management Studio, esto generara tanto la BD como el contenido de sus tablas.
La otra opcion es utilizar el archivo BackUpDB desde la opcion "Restaurar base de datos" tambien desde SQL Server Management Studio, esto tambien generara la BD y el contenido de sus tablas. 

Al generar la BD se crearan dos entidades en la tabla Cards, las cuales pueden utilizarse para hacer pruebas y cuentan con los siguientes datos:
 
Nro: 1111222233334444   Pin: 1234
Nro: 2222333344445555   Pin: 1234

### Iniciar la API

Antes de iniciar la API se debe cambiar la cadena de conexion a la BD que corresponda en appsettings.json.
Luego se puede ejecutar la API desde Visual Studio. Al hacerlo se abrira un explorador y se podran probar los distintos endpoints desde Swagger.

### Iniciar frontend (Sin finalizar)

Lamentablemente no llegue a finalizar el frontend y este no puede utilizarse para probar contra la API, de todas maneras, este puede ejecutarse con los siguientes comandos:

npm install
npm start




