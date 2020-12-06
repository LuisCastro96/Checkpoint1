show databases;
use tienda;	
show tables;
# identificar llaves y sus llaves foraneas
show keys from venta;
# left join
select * from empleado as e 
left join puesto p on e.id_puesto = p.id_puesto;
#otro ejemplo
select * from puesto as p
left join empleado e on e.id_puesto = p.id_puesto;
# right join
select * from empleado as e 
right join puesto p on e.id_puesto = p.id_puesto;
# otro ejemplo
select e.nombre as empleado ,p.nombre as puesto from empleado e 
right join puesto p on e.id_puesto = p.id_puesto;
-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
select nombre,apellido_paterno,apellido_materno from empleado as emp 
join venta ven on emp.id_empleado=ven.id_empleado order by clave;
-- ¿Cuál es el nombre de los artículos que se han vendido?
select nombre from articulo as art 
join venta ven on art.id_articulo=ven.id_articulo order by clave;
-- ¿Cuál es el total de cada venta?
SELECT clave, round(sum(precio),2) AS total FROM venta AS v
JOIN articulo AS a ON v.id_articulo = a.id_articulo GROUP BY clave ORDER BY clave;
#ejemplo complejo
SELECT v.clave,v.fecha,a.nombre AS producto,a.precio, 
concat(e.nombre," ",e.apellido_paterno) as empleado
FROM venta AS v
JOIN empleado e ON v.id_empleado = e.id_empleado
JOIN articulo a ON v.id_articulo= a.id_articulo;
# vista 
CREATE VIEW LuisCastro as(
SELECT v.clave,v.fecha,a.nombre AS producto,a.precio, 
concat(e.nombre," ",e.apellido_paterno) as empleado
FROM venta AS v
JOIN empleado e ON v.id_empleado = e.id_empleado
JOIN articulo a ON v.id_articulo= a.id_articulo);

#consultar vist
SELECT * FROM LuisCastro;
SELECT clave , ROUND(SUM(precio),2) as total
FROM LuisCastro GROUP BY clave;
-- Obtener el puesto de un empleado.
CREATE VIEW LuisCastro1 AS(
SELECT CONCAT(emp.nombre," ",emp.apellido_materno," ",emp.apellido_paterno),
pue.nombre FROM empleado  emp
JOIN puesto pue ON emp.id_puesto = pue.id_puesto);
SELECT * FROM LuisCastro1;
# otra opcion
select e.nombre from empleado e 
join puesto p
on e.id_puesto = p.id_puesto; 
-- Saber qué artículos ha vendido cada empleado.

-- Saber qué puesto ha tenido más ventas.