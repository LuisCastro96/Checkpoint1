show databases;
use classicmodels;	
show tables;
-- Obten el código de producto, nombre de producto y descripción de todos los productos.
select productCode,productName,textDescription from products pro
right join productlines pl on pro.productLine=pl.productLine;

-- Obten el número de orden, estado y costo total de cada orden.
select ord.orderNumber,status,quantityOrdered,priceEach,(quantityOrdered*priceEach) from orders ord
right join orderdetails deta on ord.orderNumber=deta.orderNumber;
/* Obten el número de orden, fecha de orden, línea de orden, nombre del producto,
 cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden. */
 
select ord.orderNumber,orderDate,orderLineNumber,productName,quantityOrdered,priceEach 
from orders ord
right join orderdetails deta on ord.orderNumber = deta.orderNumber
right join products pro on deta.productCode = pro.productCode;
 
 /* Obtén el número de orden, nombre del producto, 
 el precio sugerido de fábrica (msrp) y precio de cada pieza.*/
 
 select ord.orderNumber, productName, MSRP ,priceEach from orderdetails ord
 right join products pro on ord.productCode = pro.productCode;
 
 /* Para estas consultas usa LEFT JOIN 
 Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.*/

SELECT ord.customerNumber, customerName, orderNumber,status from customers cus
left join orders ord on cus.customerNumber=ord.customerNumber;

-- Obtén los clientes que no tienen una orden asociada.

SELECT customerName status from customers cus
left join orders ord on  ord.customerNumber=cus.customerNumber 
where ord.customerNumber is Null;

/*Obtén el apellido de empleado, nombre de empleado, nombre de cliente, 
número de cheque y total, es decir, los clientes asociados a cada empleado.*/

select lastName,firstName,customerName,checkNumber,amount from employees emp
left join customers cus on emp.employeeNumber=cus.salesRepEmployeeNumber
left join payments pay on cus.customerNumber=pay.customerNumber;

/*Para estas consultas usa RIGHT JOIN

Repite los ejercicios 5 a 7 usando RIGHT JOIN.*/

/* Para estas consultas usa LEFT JOIN 
 Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.*/

SELECT ord.customerNumber, customerName, orderNumber,status from customers cus
right join orders ord on cus.customerNumber=ord.customerNumber;

/*Obtén el apellido de empleado, nombre de empleado, nombre de cliente, 
número de cheque y total, es decir, los clientes asociados a cada empleado.*/

select lastName,firstName,customerName,checkNumber,amount from employees emp
right join customers cus on emp.employeeNumber=cus.salesRepEmployeeNumber
right join payments pay on cus.customerNumber=pay.customerNumber;

/*Escoge 3 consultas de los ejercicios anteriores, 
crea una vista y escribe una consulta para cada una.*/

create  view LuisCastro1 as select lastName,firstName,customerName,checkNumber,amount from employees emp
left join customers cus on emp.employeeNumber=cus.salesRepEmployeeNumber
left join payments pay on cus.customerNumber=pay.customerNumber;

/* obten el top 10 de los empleados(nombre completo de empleado,cliente,total)
 con mayor total*/
select * from LuisCastro1 order by amount desc limit 10;


create  view LuisCastro2 as select ord.orderNumber,status,quantityOrdered,
priceEach,(quantityOrdered*priceEach) from orders ord
right join orderdetails deta on ord.orderNumber=deta.orderNumber;

/* obten los 3 primeros número de orden que tienen un mayor total*/

select orderNumber, sum(quantityOrdered*priceEach) from LuisCastro2 
group by orderNumber limit 3;

 create  view LuisCastro3 as select ord.orderNumber, productName, MSRP ,priceEach from orderdetails ord
 right join products pro on ord.productCode = pro.productCode;
 
 /*muesta todos los Númerosde orden,nombre msrp y precio de los productos que se vendieron
 un 20%=> más barato que el precio sugerido de fábrica*/
 
 select * from LuisCastro3 where (msrp*0.80>=priceEach);