show databases;
use tienda;
show tables;
describe articulo;
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
select * from articulo where nombre like "%pasta%";
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select * from articulo where nombre like "%cannelloni%";
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select * from articulo where nombre like "%-%";