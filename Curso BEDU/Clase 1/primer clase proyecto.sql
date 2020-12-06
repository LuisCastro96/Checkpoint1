-- Dentro del mismo servidor de bases de datos, conéctate al esquema classicmodels.
show databases;
use classicmodels;	
-- Dentro de la tabla employees, obtén el apellido de todos los empleados.
show tables;
describe employees;
select lastName from employees;
-- Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados.
select firstName,lastName,jobTitle from employees;
-- Dentro de la tabla employees, obtén todos los datos de cada empleado.
select * from employees;
-- Dentro de la tabla employees, obtén el apellido, nombre y puesto de todos los empleados que tengan el puesto Sales Rep.
select firstName,lastName,jobTitle from employees where jobTitle = "Sales Rep";
-- Dentro de la tabla employees, obtén el apellido, nombre, puesto y código de oficina de todos los empleados que tengan el puesto Sales Rep y código de oficina 1.
select firstName,lastName,jobTitle,officeCode from employees where jobTitle = "Sales Rep" and officeCode = 1;
-- Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados que tenga código de oficina 1, 2 o 3.
select firstName,lastName,officeCode from employees where officeCode in (1,2,3);
-- Dentro de la tabla employees, obten el apellido, nombre y puesto de todos los empleados que tengan un puesto distinto a Sales Rep.
select firstName,lastName,jobTitle from employees where jobTitle != "Sales Rep"; 
-- Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados cuyo código de oficina sea mayor a 5.
select firstName,lastName,officeCode from employees where officeCode > 5;
-- Dentro de la tabla employees, obtén el apellido, nombre y código de oficina de todos los empleados cuyo cdigo de oficina sea menor o igual 4.
select firstName,lastName,officeCode from employees where officeCode <= 4;
-- Dentro de la tabla customers, obtén el nombre, país y estado de todos los clientes cuyo país sea USA y cuyo estado sea CA.
describe customers;
select customerName,country,state from customers where country = "USA" and state = "CA";
-- Dentro de la tabla customers, obtén el nombre, país, estado y límite de crédito de todos los clientes cuyo país sea, USA, cuyo estado sea CA y cuyo límite de crédito sea mayor a 100000.
select customerName,country,state,creditLimit from customers where country = "USA" and state = "CA" and creditLimit > 100000;
-- Dentro de la tabla customers, obtén el nombre y país de todos los clientes cuyo país sea USA o France.
select customerName,country from customers where country = "USA" or country = "France";
-- Dentro de la tabla customers, obtén el nombre, pais y límite de crédito de todos los clientes cuyo país sea USA o France y cuyo límite de crédito sea mayor a 100000. Para este ejercicio ten cuidado con los paréntesis.
select customerName,country,state,creditLimit from customers where (country = "USA" or country = "France") and creditLimit > 100000;
-- Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que se encuentren en USA o France.
select officeCode,city,phone,country from offices where country in ("USA","France");
-- Dentro de la tabla offices, obtén el código de la oficina, ciudad, teléfono y país de aquellas oficinas que no se encuentren en USA o France.
select officeCode,city,phone,country from offices where country != "USA" or country = "France";
-- Dentro de la tabla orders, obtén el número de orden, número de cliente, estado y fecha de envío de todas las órdenes con el número 10165, 10287 y 10310.
select orderNumber,customerNumber,shippedDate from orders where orderNumber in (10165,10287,10310);
-- Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma ascendente.
select 	contactLastName,contactFirstName from customers order by contactLastName;
-- Dentro de la tabla customers, obtén el apellido y nombre de cada cliente y ordena los resultados por apellido de forma descendente y luego por nombre de forma ascendente.
select 	contactLastName,contactFirstName from customers order by contactLastName desc,contactFirstName;
-- Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más alto (top 5).
select customerNumber,customerName,creditLimit from customers order by creditLimit desc limit 5;
-- Dentro de la tabla customers, obtén el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más bajo.
select customerNumber,customerName,creditLimit from customers order by creditLimit limit 5;