use tienda;
show tables;
describe puesto;
-- ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
select * from puesto order by salario desc limit 5;