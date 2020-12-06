#mostrar base de datos
show databases;
-- seleccionar base de datos
use tienda;
-- mostrar las tablas de base de datos
show tables;
-- estructura de una tabla
describe empleado;
-- Crear base de datos
-- Create schema "nombre del ente";
-- consultar datos de tabla
select * from empleado where apellido_paterno = "Risom";
select * from empleado where id_puesto >= 100 and id_puesto <= 200;
select * from empleado where id_puesto = 100 or id_puesto = 200;
select * from empleado where id_puesto in(100,200,300);
select @@version;