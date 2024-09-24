/*Encontrando el nombrey apellido de los empleados junto con la cantidad total de ventas
que han realizado*/

select e.nombre, e.apellido, count(v.id) as total_ventas
from empleados e join ventas v on e.id = v.id group by e.nombre, e.apellido;

/*Calculando el monto total vendido a cada cliente mostrando el nombre del cliente, su direccion
y el monto total*/

select c.nombre, c.direccion, sum(v.monto_total) as monto_total_vendido from clientes c
join ventas v on c.id = v.id group by c.nombre, c.direccion;

/*Encontrando los productos vendidos por cada empleado en el departamento de ventas mostrando el nombre
del empleado junto con el nombre de los productos que han vendido*/

select e.nombre, p.nombre as producto
from empleados e join departamentos d on e.id = d.id join ventas v on e.id = v.id
join productos p on v.id = p.id
where d.nombre ='ventas';

/*Encontrando el nombre del cliente el nombre del producto y la cantidad comprada de 
productos con un precio superior a S/500*/

select c.nombre as cliete, p.nombre as producto, v.cantidad from clientes c
join ventas v on c.id = v.id
join productos p on v.id = p.id
where p.precio > 500;

/*Calculando la cantidad de ventas por departamento incluso si el departamento no tiene ventas*/

select d.nombre as departamento, count(v.id) as total_ventas
from departamentos d
left join empleados e on d.id = e.id
left join ventas v on e.id = v.id
group by d.nombre;

/*Encontrando el nombre y la direcion de los clientes que han comprado mas de 3 productos mostrnado asi la
cantidad de productos comprados*/

select c.nombre, c.direccion, sum(v.cantidad) as cantidad_productos_comprados
from clientes c
join ventas v on c.id = v.id
group by c.nombre, c.direccion
having sum(v.cantidad) > 3;

/*Calcular el monto total de ventas relaizadas por cada departamento mostrando el nombre del
departamento junto con el monto total de ventas*/

select d.nombre as departamentos, sum(v.monto_total) as monto_total_ventas
from departamentos d
left join empleados e on d.id = e.id
left join ventas v on e.id = v.id
group by d.nombre;