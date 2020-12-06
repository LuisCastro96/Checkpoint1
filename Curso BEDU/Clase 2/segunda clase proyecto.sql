show databases;
use classicmodels;	
show tables;
describe employees;
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.
select firstName, lastName from employees where firstName like "a%";
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
select firstName, lastName from employees where lastName like "%on";
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
select firstName, lastName from employees where lastName like "%on%";
/* Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con
 T y finalizan con m*/
select firstName, lastName from employees where firstName like "t_m";
-- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B
select firstName, lastName from employees where firstName not like "b%"order by firstName;
-- Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
select productCode,productName from products where productCode like "%_20%";
-- Dentro de la tabla orderdetails, obten el total de cada orden.
select  orderNumber,sum(priceEach) from orderdetails group by orderNumber;
-- Dentro de la tabla orders obten el número de órdenes por año.
describe orders;
select count(orderNumber),year(orderDate) from orders group by year(orderDate);
-- Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
select firstName,LastName from employees where officeCode in (select officeCode from offices where country = "USA");
-- Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
select customerNumber,checkNumber,amount from payments order by amount desc limit 1;
-- Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
select customerNumber,checkNumber,amount from payments where ((select avg(amount) from payments)<amount);
-- Obten el nombre de aquellos clientes que no han hecho ninguna orden.
select customerName,customerNumber from customers where customerNumber not in(select customerNumber from orders);
-- Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
select orderNumber,max(quantityOrdered),min(quantityOrdered),avg(quantityOrdered) from orderdetails group by orderNumber;
-- Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
select status,count(orderNumber) from orders group by status;