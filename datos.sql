CREATE TABLE REGION(
	id_region serial,
	Nombre varchar(355),
	PRIMARY KEY (id_region));
CREATE TABLE ESPECIALIDAD(
	id_especialidad serial,
	Descripcion varchar(255),
	PRIMARY KEY (id_especialidad));
CREATE TABLE TIPOPROYECTO(
	id_tipo_proyecto serial,
	Descripcion varchar(255),
	PRIMARY KEY (id_tipo_proyecto));
CREATE TABLE CONTRATISTA(
	Rut_Contratista varchar(12),
	Primer_Nombre varchar(255),
	Segundo_Nombre varchar(255),
	Primer_Apellido varchar(255),
	Segundo_Apellido varchar(255),
	Numero_Contacto varchar(12),
	PRIMARY KEY (Rut_Contratista));
CREATE TABLE TRABAJO(
	id_trabajo serial,
	Descripcion varchar(255),
	PRIMARY KEY (id_trabajo));
CREATE TABLE MATERIAL(
	id_material serial,
	Descripcion varchar(255),
	Valor_Unidad int,
	Unidad_Medicion varchar(255),
	PRIMARY KEY (id_material));
CREATE TABLE CIUDAD(
	id_ciudad serial,
	Nombre varchar(255),
	id_region serial,
	PRIMARY KEY (id_ciudad),
	FOREIGN KEY (id_region) REFERENCES REGION);
CREATE TABLE CLIENTE(
	Rut_Cliente varchar(12),
	Primer_Nombre varchar(255),
	Segundo_Nombre varchar(255),
	Primer_Apellido varchar(255),
	Segundo_Apellido varchar(255),
	Numero_Tel varchar(12),
	Direccion varchar(255),
	Fecha_Nac date,
	id_ciudad serial,
	PRIMARY KEY (Rut_Cliente),
	FOREIGN KEY (id_ciudad) REFERENCES CIUDAD);
CREATE TABLE DECORADOR(
	Rut_Decorador varchar(12),
	id_especialidad serial,
	Primer_Nombre varchar(255),
	Segundo_Nombre varchar(255),
	Primer_Apellido varchar(255),
	Segundo_Apellido varchar(255),
	Numero_Tel varchar(12),
	Direccion varchar(255),
	Fecha_Nac date,
	id_ciudad serial,
	PRIMARY KEY (Rut_Decorador),
	FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD,
	FOREIGN KEY (id_ciudad) REFERENCES CIUDAD);
CREATE TABLE PROYECTO(
	id_proyecto serial,
	id_tipo_proyecto serial,
	Fecha_Inicio date,
	Tiempo_Estimado int,
	Costo_Estimado int,
	Tiempo_Real_Proyecto int,
	Costo_Real int,
	Fecha_Fin date,
	Rut_Cliente varchar(12),
	Rut_Decorador varchar(12),
	Calificacion int,
	Observacion varchar(255),
	PRIMARY KEY (id_proyecto),
	FOREIGN KEY (Rut_Cliente) REFERENCES CLIENTE,
	FOREIGN KEY (Rut_Decorador) REFERENCES DECORADOR,
	FOREIGN KEY (id_tipo_proyecto) REFERENCES TIPOPROYECTO);
CREATE TABLE TIENEN(
	id_trabajo serial,
	id_material serial,
	PRIMARY KEY (id_trabajo,id_material),
	FOREIGN KEY (id_trabajo) REFERENCES TRABAJO,
	FOREIGN KEY (id_material) REFERENCES MATERIAL);
CREATE TABLE ESTIMA(
	id_trabajo serial,
	id_proyecto serial,
	Costo_Estimado_Actividad int,
	Costo_Real_Actividad int,
	Rut_Contratista varchar(12),
	Cantidad_Metros int,
	Tiempo_Estimado_Trabajo int,
	Tiempo_Real_Trabajo int,
	Costo_Material int,
	PRIMARY KEY (id_trabajo,id_proyecto,Rut_Contratista),
	FOREIGN KEY (id_trabajo) REFERENCES TRABAJO,
	FOREIGN KEY (id_proyecto) REFERENCES PROYECTO,
	FOREIGN KEY (Rut_Contratista) REFERENCES CONTRATISTA);
	
	//ARREGLAR INSERT (RUT y rellenar)
( Region 		id_region,nombre
INSERT INTO Region
Values 	(1,'Arica y Parinacota'),
		(2,'Tarapacá'),
        (3,'Antofagasta'),
        (4,'Atacama'),
        (5,'Coquimbo'),
        (6,'Valparaíso'),
		(7,'Región Metropolitana de Santiago'),
        (8,'Libertador General Bernardo O’Higgins'),
        (9,'Maule'),
		(10,'Ñuble'),
        (11,'Biobío'),
        (12,'La Araucanía'),
		(13,'Los Ríos'),
        (14,'Los Lagos'),
        (15,'Aysén del General Carlos Ibáñez del Campo'),
        (16,'Magallanes y Antártica Chilena');
)		
( Especialidad 	id_especialidad,descripcion
INSERT INTO Especialidad
VALUES 	(1,'Pintor'),
		(2,'Carpintero'),
		(3,'Tapicero'),
		(4,'Constructor'),
		(5,'Jardinero'),
		(6,'Gasfiter'),
		(7,'Albañil'),
		(8,'Electricista'),
		(9,'Instalador'),
		(10,'Maquetista'),
)		
( TipoProyecto 	id_tipo_proyecto,descripcion
INSERT INTO Tipoproyecto
Values	(1,'Pintado del hogar'),
		(2,'Creacion de muebles'),
		(3,'Instalacion de alfombras y cortinas'),
		(4,'Expansion de hogar'),
		(5,'Arreglo del jardin'),
		(6,'Rehacer el baño'),
		(7,'Arreglo de Muros'),
		(8,'Instalacion Red Electrica'),
		(9,'Instalacion General'),
		(10,'Creacion de maquetas'),
		(11,'Decoracion Completa');
)		
( Contratista	Rut_Contratista,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Numero_Contacto
INSERT INTO Contratista
Values 	('17.274.702-7','Erik','Cipriano','Catalan','Guevara',970921922),
		('14.174.355-4','Paula','Chloe','Feijoo','Murcia',9241742925),
		('17.824.958-4','Juan','Pablo','Jara','Quintana',9956874873),
		('16.794.360-8','Teodora','Dionisia','Maestre','Padilla',931158664),
		('5.330.971-2','Dylan','Yeray','Ramon','Fuentes',933368564),
		('18.277.221-6','Jose','Hipolito','Sabater','Ribera',991548000),
		('19.470.442-9','Sarai','Merce','Cifuentes','Campos',940237598),
		('22.667.479-9','Jesus','Cesar','Botella','Reyes',988963188),
		('6.065.613-4','Nayara','Myriam','Real','Soto',947548942),
		('24.715.288-1','Oscar','Iñigo','Marrero','Montiel',981332328);
)
( Trabajo 		id_trabajo,descripcion
INSERT INTO Trabajo
Values	(1,'Repintado Hogar'),
		(2,'Construir Mueble'),
		(3,'Instalar Alfombra'),
		(4,'Construir Extension'),
		(5,'Arreglo y plantacion de nuevas flores'),
		(6,'Instalacion de Baño Nuevo'),
		(7,'Reparacion de Muros'),
		(8,'Instalacion de Alumbrado y Red Electrica'),
		(9,'Instalacion a Peticion del Cliente'),
		(10,'Creado de Maqueta a Peticion del Cliente'),
		(11,'Decoracion del Hogar y Exteriores');
		
)
( Material		id_material,descripcion,Valor_Unidad,Unidad_Medicion
INSERT INTO Material
Values 	(1,'Pintura',1650,'Litros'),	
		(2,'Brocha',1200,'Unidad'),
		(3,'Rodillo',1800,'Unidad'),
		(4,'Bandeja',2200,'Unidad'),
		(5,'Madera',1500,'Metros'),
		(6,'Clavos',1000,'Kilogramos'),
		(7,'Alfombra',1700,'Metros'),
		(8,'Cemento',100,'Kilogramos'),
		(9,'Vigas',25000,'Unidad'),
		(10,'Flores',5000,'Unidad'),
		(11,'Fertilizante',2800,'Kilogramos')
		(12,'Ceramica',6300,'Caja'),
		(13,'WC',45000,'Unidad'),
		(14,'Ducha',5000,'Unidad'),
		(15,'Ampolletas',1000,'Unidad'),
		(16,'Cable',180,'Metros'),
		(17,'Madera Balsa',1700,'Unidad'),
		()
)
( CIUDAD		id_ciudad,nombre,id_region
INSERT INTO Ciudad
Values	(1,'Valdivia',1),
		(2,'Talca',2),
		(3,'Santiago',3),
		(4,'Concepcion',4),
		(5,'Coyhaique',5);
)
( Cliente		Rut_Cliente,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Numero_Tel,Direccion,Fecha_Nac,id_ciudad
INSERT INTO Cliente
Values 	(1,'Patricio','Andres','Labra','Medina',123456789,'Dr Sanhueza 494','19/07/1980',1),
		(2,'Francisco','Enrique','Medina','Labra',123456788,'Delfin Carvallo 498','20/02/1981',2),
		(3,'Jorge','Andres','Fica','Ramirez',123456787,'Collao 769','29/02/1984',3),
		(4,'Edelberto','Esteban','Fernandez','Mendez',123456786,'Los Bosques 3021','30/05/1982',4),
		(5,'Romualdo','Javier','Perez','Inostrosa',123456785,'Carrera 2067','15/11/1983',5);
)		
( Decorador 	Rut_Decorador,id_especialidad,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido
INSERT INTO Decorador
Values 	(1,1,'Ronaldo','Anibal','Fernandez','Vasquez',123456784,'Collao 731','20/11/1981',1),
		(2,2,'German','Cristobal','Kennedy','Putin',123456783,'Blanco Encalada 53901','25/10/1982',2),
		(3,3,'Matias','Andres','Trump','Castro',123456782,'Colo-Colo 362','10/09/1983',3),
		(4,4,'Benjamin','Ignacio','Obama','Bush',123456781,'Manuel Rodriguez 8923','30/08/1980',4),
		(5,5,'Federico','Desmond','Ruiz','Bachelet',123456780,'Las Flores 2872','05/07/1979',5);
)		
( Proyecto 		id_proyecto,id_tipo_proyecto,fecha_inicio,tiempo_estimado,costo_estimado,tiempo_real_proyecto,costo_Real,fecha_fin,rut_cliente,rut_decorador,calificacion,observacion
INSERT INTO Proyecto
Values	(1,1,'24/10/2020',7,130000,10,150000,'03/11/2020',1,1,7,'Pintado de calidad'),
		(2,2,'25/10/2020',5,300000,7,280000,'01/11/2020',2,2,3,'El mueble quedo disparejo'),
		(3,3,'26/10/2020',9,120000,7,130000,'02/11/2020',3,3,5,'Alfombra de mala calidad, pero trabajo excelente'),
		(4,4,'27/10/2020',11,350000,14,340000,'10/11/2020',4,4,6,'Muro estable pero con imperfecciones'),
		(5,5,'28/10/2020',3,100000,5,90000,'02/11/2020',5,5,4,'Algunas flores parecen muertas'),
		
		(6,1,'24/10/2019',7,130000,10,150000,'03/11/2019',1,1,7,'Pintado de calidad'),
		(7,2,'25/10/2019',5,300000,7,280000,'01/11/2019',2,2,3,'El mueble quedo disparejo'),
		(8,3,'26/10/2019',9,120000,7,130000,'02/11/2019',3,3,5,'Alfombra de mala calidad, pero trabajo excelente'),
		(9,4,'27/10/2019',11,350000,14,340000,'10/11/2019',4,4,6,'Muro estable pero con imperfecciones'),
		(10,5,'28/10/2019',3,100000,5,90000,'02/11/2019',5,5,4,'Algunas flores parecen muertas'),
		
		(11,5,'24/10/2020',7,130000,10,150000,'03/11/2020',1,1,7,'Pintado de calidad'),
		(12,4,'25/10/2020',5,300000,7,280000,'01/11/2020',2,2,3,'El mueble quedo disparejo'),
		(13,2,'26/10/2020',9,120000,7,130000,'02/11/2020',3,3,5,'Alfombra de mala calidad, pero trabajo excelente'),
		(14,3,'27/10/2020',11,350000,14,340000,'10/11/2020',4,4,6,'Muro estable pero con imperfecciones'),
		(15,1,'28/10/2020',3,100000,5,90000,'02/11/2020',5,5,4,'Algunas flores parecen muertas'),
		
		(16,5,'24/10/2020',7,130000,10,150000,'03/11/2020',1,1,7,'Pintado de calidad'),
		(17,4,'25/10/2020',5,300000,7,280000,'01/11/2020',2,2,3,'El mueble quedo disparejo'),
		(18,2,'26/10/2020',9,120000,7,130000,'02/11/2020',3,3,5,'Alfombra de mala calidad, pero trabajo excelente'),
		(19,3,'27/10/2020',11,350000,14,340000,'10/11/2020',4,4,6,'Muro estable pero con imperfecciones'),
		(20,1,'28/10/2020',3,100000,5,90000,'02/11/2020',5,5,4,'Algunas flores parecen muertas'),
		
		(21,5,'24/10/2020',7,130000,10,150000,'',1,1,7,'Pintado de calidad'),
		(22,6,'24/10/2020',7,130000,10,150000,'',1,1,7,'Pintado de calidad');
)		
( Tienen 		id_trabajo,id_material
INSERT INTO Tienen
Values	(1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5);
)
( Estima 		id_trabajo,id_proyecto,costo_estimado_actividad,costo_real_actividad,rut_contratista,cantidad_metros,total_estimado_trabajo,tiempo_real_trabajo,costo_material
INSERT INTO Estima
Values	(1,1,130000,150000,1,10,7,10),
		(2,2,300000,280000,2,20,5,7),
		(3,3,120000,130000,3,15,9,7),
		(4,4,350000,340000,4,25,11,14),
		(5,5,100000,90000,5,30,3,5);
)	
	
Revisar las weas nulas
	
1(	
select d.rut_decorador as rut, d.primer_nombre, d.segundo_nombre, d.primer_apellido, d.segundo_apellido, d.direccion, 
c.nombre as ciudad, r.nombre as region, t.descripcion as tipo, extract (year from p.fecha_fin) as año,
count (*) as cantidad
from decorador d, ciudad c, region r, proyecto p, tipoproyecto t 
where d.id_ciudad = c.id_ciudad and c.id_region = r.id_region and d.rut_decorador = p.rut_decorador
and p.id_tipo_proyecto = t.id_tipo_proyecto and p.fecha_fin is not null
Group By ( d.rut_decorador,c.nombre, r.nombre, t.descripcion, p.fecha_fin)
order by (d.rut_decorador)
)
2(
select c.rut_cliente as rut, c.primer_nombre, c.segundo_nombre, c.primer_apellido, c.segundo_apellido
from cliente c
where NOT EXISTS (select *
					from proyecto p, tipoproyecto t
					where p.id_tipo_proyecto = t.id_tipo_proyecto and t.descripcion='Decoracion Completa' and p.rut_cliente = c.rut_cliente 
					and (extract (year from p.fecha_inicio)=(select max(extract (year from p.fecha_inicio))from proyecto p)))
)					
3(
select p.id_proyecto, c.primer_nombre, c.segundo_nombre, c.primer_apellido, c.segundo_apellido, d.primer_nombre, d.segundo_nombre, d.primer_apellido, d.segundo_apellido,
t.id_trabajo, t.descripcion, co.primer_nombre, co.segundo_nombre, co.primer_apellido, co.segundo_apellido, e.Costo_Estimado_Actividad
from cliente c, proyecto p, trabajo t, contratista co, estima e, decorador d
where p.rut_cliente=c.rut_cliente and p.rut_decorador=d.rut_decorador and p.id_proyecto=e.id_proyecto and e.id_trabajo=t.id_trabajo and e.rut_contratista=co.rut_contratista
)
4(
CREATE VIEW costo_proyectos(cod_proyecto, total_estimado,total_real)
as (select p.id_proyecto, e.costo_estimado_actividad, e.costo_real_actividad
	from proyecto p, estima e
	where p.id_proyecto=e.id_proyecto)
))
5(
select cod_proyecto
from costo_proyectos
where total_real=(select max(total_real) from costo_proyectos)
)
6(
select p.id_proyecto, c.rut_cliente, c.primer_nombre, c.segundo_nombre, m.descripcion, 
)