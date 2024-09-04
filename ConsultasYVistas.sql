select *
from abono

select *
from banco

select *
from deudor

select *
from prestamo


--1 DONE
create view prestamos_ano as 
select extract (year from fecha) "año", count (fecha) "numero de prestamos"
from prestamo 
group by extract (year from fecha)
order by "numero de prestamos" desc

--2 DONE
create view suma_prestamo_por_mes as 
select banco.nombre, extract (year from fecha) "año", extract (month from fecha) "mes", sum (valor_otorgado) "total prestamo x mes"
from prestamo join banco on banco.ID=prestamo.ID_banco
group by extract (month from fecha), banco.nombre, extract (year from fecha)
order by "total prestamo x mes" desc

--3 DONE 
create view saldo_por_prestamo as 
Select deudor.nombre, prestamo.valor_otorgado, abono.valor_abono, (prestamo.valor_otorgado - abono.valor_abono) saldo
From deudor, prestamo, abono
Where abono.ID_prestamo=prestamo.id and prestamo.ID_deudor=deudor.id

--4 DONE
create view lista_nombre_y_cedula as 
select deudor.nombre, deudor.numero_doc, banco.nombre, prestamo.fecha, prestamo.valor_otorgado
from banco, deudor, prestamo
where prestamo.id_deudor=deudor.id and prestamo.id_banco=banco.id
group by deudor.tipo_doc, deudor.nombre, deudor.numero_doc, banco.nombre, prestamo.fecha, prestamo.valor_otorgado
order by deudor.numero_doc DESC

--5 DONE
create view prestamo_por_deudor as 
select deudor.nombre, count(ID_deudor)"prestamosxdeudor", sum(valor_otorgado) "totalprestado"
from deudor full join prestamo on deudor.ID=prestamo.ID_deudor
group by deudor.nombre

--6 DONE --viewless 
select extract (year from fecha) "año", sum (valor_otorgado) "numero de prestamos" 
from prestamo 
group by extract (year from fecha)
order by "numero de prestamos" desc

select sum(valor_otorgado) as sumtotal
from prestamo 

create table tabla6 as 
select extract (year from fecha) "año", sum (valor_otorgado) "numero de prestamos" 
from prestamo 
group by extract (year from fecha)
order by "numero de prestamos" desc

insert into tabla6 values (default,sumtotal);

select * from tabla6 

--7 DONE
create view prestamos_todos_bancos as
select deudor.nombre
from deudor, (select ID_deudor, count (distinct ID_banco) as total_bancos
from prestamo
group by ID_deudor
having count (distinct ID_banco) = (select count (distinct ID_banco)
from prestamo)) R
where R.ID_deudor = deudor.ID;

--8 DONE
create view prom_prestamo_ano as 
with promedio_prestamos_año (promedio_general, año) as (select avg(valor_otorgado), extract (year from fecha)
from prestamo
group by extract (year from fecha)),
promedio_banco_año (nombre, promedio_banco, año) as (select nombre, avg(valor_otorgado), extract (year from fecha)
from prestamo, banco
where banco.ID = prestamo.ID_banco
group by extract (year from fecha), banco.nombre
order by (banco.nombre) asc)
select promedio_banco_año.nombre, promedio_prestamos_año.año, promedio_prestamos_año.promedio_general, promedio_banco_año.promedio_banco
from promedio_prestamos_año, promedio_banco_año
where promedio_prestamos_año.año = promedio_banco_año.año and promedio_prestamos_año.promedio_general < promedio_banco_año.promedio_banco
order by promedio_prestamos_año.año asc;

--9 DONE
create view actualizacion as 
select *
from prestamo 

update set "pagado" = 'si'
where(
select prestamo.ID, prestamo.valor_otorgado, sum(abono.valor_abono) as sumafinal_abono
from prestamo, abono
where prestamo.ID=abono.ID_prestamo
	from (select prestamo.valor_otorgado <= sum(sumafinal_abono)))
    
    
--10 mirar subconsultas

select extract (year from fecha) "año", extract (month from fecha) "mes",total ,femenino ,masculino
from 
(
select extract (year from fecha) "año", extract (month from fecha) "mes", count(genero) as total
from prestamo full join deudor on deudor.ID=prestamo.ID_deudor
group by extract (year from fecha) , extract (month from fecha) 

),

(
select extract (year from fecha) "año", extract (month from fecha) "mes", count(genero) as femenino
from prestamo full join deudor on deudor.ID=prestamo.ID_deudor
where deudor.genero='F'
group by extract (year from fecha) , extract (month from fecha)

),

(
select extract (year from fecha) "año", extract (month from fecha) "mes", count(genero) as masculino
from prestamo full join deudor on deudor.ID=prestamo.ID_deudor
where deudor.genero='M'
group by extract (year from fecha) , extract (month from fecha)
 
)
group by 
order by extract(year from fecha) 















