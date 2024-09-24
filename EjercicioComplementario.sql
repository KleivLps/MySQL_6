/*Mostrando el nombre y apellido de los empleados que pertenecen al departamento
de recursos humanos y que han realizado mas de 5 ventas*/

select e.nombre, e.apellido, count(v.id) as total_ventas
from empleados e
join departamentos d on e.id = d.id
join ventas v on e.id = v.id
where d.nombre ='Recursos Humanos'
group by e.nombre, e.apellido
having count(v.id) > 5;

/*Muestra el nombre y apellido de todos los empleados junto con la cantidad total de ventas que han realizado,
icluso si no han realizado ventas*/

select e.nombre, e.apellido, count(v.id) as total_ventas
from empleados e
left join ventas v on e.id = v.id
group by e.nombre, e.apellido;

/*Encuentra el empleado mas joven de cada departamento mostrando el nombre del departamento
junto con el nombre y la edad del empleado mas joven*/

SELECT d.nombre AS departamento, e.nombre, e.apellido, e.edad 
FROM empleados e
JOIN departamentos d ON e.id = d.id
join(
select id, min(edad) as edad_minima
from empleados
group by id
) e_min on e.id = e_min.id and e.edad = e_min.edad_minima;


/*Calcular el volumen de productos vendidos por cada producto(<5 bajo, 5=10 medio, +10 alto) y muestra la 
categoria de volumen junto con la cantidad y el nombre del producto*/

select p.nombre,
sum(v.cantidad) as total_vendido,
case
when sum(v.cantidad) < 5 then'bajo'
when sum(v.cantidad) between 5 and 10 then 'medio'
else 'alto'
end as categoria_volumen
from productos p
join ventas v on p.id = v.id
group by p.nombre;