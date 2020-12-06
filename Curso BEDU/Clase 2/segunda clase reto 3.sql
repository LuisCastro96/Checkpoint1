show databases;
use tienda;
show tables;
describe venta;
-- ¿Cuántos registros hay por cada uno de los puestos?
select nombre, count(*) total from puesto group by nombre order by total desc;
-- ¿Cuánto dinero se paga en total por puesto?
select nombre, round(sum(salario),2) total from puesto group by nombre order by total desc;
-- ¿Cuál es el número total de ventas por vendedor?
select id_empleado, count(id_venta) total from venta group by id_empleado order by total desc;
-- ¿Cuál es el número total de ventas por artículo?
select id_articulo, count(id_venta) total from venta group by id_articulo order by total desc;