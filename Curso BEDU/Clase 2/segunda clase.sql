show databases;
use tienda;
show tables;
describe venta;
-- buscar con like
select * from empleado where nombre like "m%";
select * from empleado where nombre like "%a";
select * from empleado where nombre like "m%a";
select * from empleado where nombre like "%ti%";
select * from empleado where nombre like "m_losa";
-- promedio
select round((precio),2) from articulo;
-- contar
select count(precio) from articulo;
-- maximo
select max(precio) from articulo;
-- minimo
select min(precio) from articulo;
-- suma
select sum(precio) from articulo;

select nombre, sum(precio) as total from articulo group by nombre order by nombre;

select * from empleado where id_puesto in(select id_puesto from puesto where nombre like "Junior executive");

select id_articulo, min(cantidad),max(cantidad)
from(
	select clave, id_articulo,count(*) as cantidad
    from venta
    group by clave, id_articulo
    order by clave
) as temporal
group by id_articulo;