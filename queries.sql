--1
select d.rut_decorador as rut, d.primer_nombre, d.segundo_nombre, d.primer_apellido, d.segundo_apellido, d.direccion, 
c.nombre as ciudad, r.nombre as region, t.descripcion as tipo, extract (year from p.fecha_fin) as año,
count (*) as cantidad
from decorador d, ciudad c, region r, proyecto p, tipoproyecto t 
where d.id_ciudad = c.id_ciudad and c.id_region = r.id_region and d.rut_decorador = p.rut_decorador
and p.id_tipo_proyecto = t.id_tipo_proyecto and p.fecha_fin is not null
Group By (d.rut_decorador,c.nombre, r.nombre, t.descripcion, extract (year from p.fecha_fin))
Order By d.rut_decorador

--2
select c.rut_cliente as rut, c.primer_nombre, c.segundo_nombre, c.primer_apellido, c.segundo_apellido
from cliente c
where NOT EXISTS (select *
					from proyecto p, tipoproyecto t
					where p.id_tipo_proyecto = t.id_tipo_proyecto and t.descripcion='Decoracion Completa' and p.rut_cliente = c.rut_cliente 
					and (extract (year from p.fecha_inicio)=(select max(extract (year from p.fecha_inicio))from proyecto p)))
					
--3
select p.id_proyecto, c.primer_nombre, c.segundo_nombre, c.primer_apellido, c.segundo_apellido, d.primer_nombre, d.segundo_nombre, d.primer_apellido, d.segundo_apellido,
t.id_trabajo, t.descripcion, co.primer_nombre, co.segundo_nombre, co.primer_apellido, co.segundo_apellido, e.Costo_Estimado_Actividad
from cliente c, proyecto p, trabajo t, contratista co, estima e, decorador d
where p.rut_cliente=c.rut_cliente and p.rut_decorador=d.rut_decorador and p.id_proyecto=e.id_proyecto and e.id_trabajo=t.id_trabajo and e.rut_contratista=co.rut_contratista

--4
CREATE VIEW costo_proyectos(cod_proyecto, total_estimado,total_real)
as (select p.id_proyecto, e.costo_estimado_actividad, e.costo_real_actividad
	from proyecto p, estima e
	where p.id_proyecto=e.id_proyecto)

--5
select cod_proyecto
from costo_proyectos
where total_real=(select max(total_real) from costo_proyectos)

--6
select p.id_proyecto, c.rut_cliente, c.primer_nombre, c.segundo_nombre, e.cantidad_metros ,e.cantidad_metros*e.costo_material as valor_final
from proyecto p, cliente c, estima e
where p.rut_cliente=c.rut_cliente and e.id_proyecto=p.id_proyecto 
Order By p.id_proyecto
