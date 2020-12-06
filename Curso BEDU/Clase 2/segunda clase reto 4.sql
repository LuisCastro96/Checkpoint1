show databases;
use tienda;
show tables;
describe puesto;
-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
select nombre,apellido_paterno from empleado where id_puesto in
(select id_puesto from puesto where salario>10000);
-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?--
select id_empleado, min(total_ventas),max(total_ventas)from
(select clave,id_empleado,count(*) total_ventas from venta group by clave,id_empleado) as sq group by id_empleado;
-- ¿Cuál es el nombre del puesto de cada empleado?--
select nombre,apellido_paterno,
(select nombre from puesto where id_puesto = e.id_puesto)
from empleado as e;