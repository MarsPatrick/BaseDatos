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
( Region 		id_region,nombre
INSERT INTO Region
Values 	(1,'Arica y Parinacota'),
		(2,'Tarapaca'),
        (3,'Antofagasta'),
        (4,'Atacama'),
        (5,'Coquimbo'),
        (6,'Valparaiso'),
		(7,'Metropolitana de Santiago'),
        (8,'Libertador General Bernardo O’Higgins'),
        (9,'Maule'),
		(10,'Ñuble'),
        (11,'Biobio'),
        (12,'La Araucania'),
		(13,'Los Rios'),
        (14,'Los Lagos'),
        (15,'Aysén del General Carlos Ibañez del Campo'),
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
		(11,'General');
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
		(11,'Fertilizante',2800,'Kilogramos'),
		(12,'Ceramica',6300,'Caja'),
		(13,'WC',45000,'Unidad'),
		(14,'Ducha',5000,'Unidad'),
		(15,'Ampolletas',1000,'Unidad'),
		(16,'Cable',180,'Metros'),
		(17,'Madera Balsa',1700,'Unidad'),
		(18,'Florero',1000,'Unidad'),
		(19,'Cuadro',10000,'Unidad'),
		(20,'Candelabro',10000,'Unidad');
)
( CIUDAD		id_ciudad,nombre,id_region
INSERT INTO Ciudad
Values	(1,'Arica',1),
		(2,'Iquique',2),
		(3,'Antofagasta',3),
		(4,'Copiapo',4),
		(5,'La Serena',5),
		(6,'Valparaiso',6),
		(7,'Santiago',7),
		(8,'Rancagua',8),
		(9,'Talca',9),
		(10,'Chillan',10),
		(11,'Concepcion',11),
		(12,'Temuco',12),
		(13,'Valdivia',13),
		(14,'Puerto Montt',14),
		(15,'Coyhaique',15),
		(16,'Punta Arenas',16);
)
( Cliente		Rut_Cliente,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Numero_Tel,Direccion,Fecha_Nac,id_ciudad
INSERT INTO Cliente
Values 	('12.209.321-2','Gaspar','Said','Godoy','Muriel',997844223,'Abedul 1345','28/12/1972',1),
		('12.581.127-2','Abdelkader','Fabian','Acevedo','Marques',937161138,'Aconcagua 7823','20/03/1974',2),
		('20.050.945-5','Juan','Evaristo','Mañas','Zheng',901531376,'Augusto DHalmar 7639','28/02/1999',3),
		('12.200.994-7','Dario','Hicham','Patiño','Arribas',973433128,'Baldomero Lillo 3021','24/12/1972',4),
		('13.884.733-0','Eloi','Carles','Trillo','Leiva',940964770,'Calafate 2067','15/07/1978',5),
		('9.873.114-8','Teresa','Balbina','SanMartin','Ros',994774927,'Nueva de Julio 2340','16/03/1965',6),
		('19.544.656-3','Mercedes','Mireya','Galvan','Neira',965743187,'Manuel Montt 5238','02/06/1997',7),
		('20.160.580-6','Tania','Josefa','Bosch','Peña',909364461,'Avenida Einstein 6282','05/06/1999',8),
		('8.637.198-7','Angustias','Rosario','Escudero','Mohamed',939828306,'Panguipulli 8225','18/01/1961',9),
		('8.503.744-7','Lina','Elena','Navarro','Montoro',999505089,'Cerro Centinela 916','08/08/1960',10),
		('18.996.078-6','Alexandre','Miguel','Corrales','Roldan',928700368,'Collao 7239','01/08/1995',11),
		('17.610.809-6','Jose','Ramon','Bernal','Arnaiz',904722648,'Choapa 5419','24/01/1991',12),
		('19.974.759-2','Andres','Amador','Martin','Martinez',901691071,'Gil de Castro 2904','15/11/1998',13),
		('11.435.716-2','Felisa','Almudena','Berenger','Moro',961124004,'Palermo 9283','17/05/1970',14),
		('5.668.027-6','Valentina','Sonia','Fraile','Boix',931931414,'Linares 8782','14/03/1951',15);
)		
( Decorador 	Rut_Decorador,id_especialidad,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Numero_Tel,Direccion,Fecha_Nac,id_ciudad
INSERT INTO Decorador
Values 	('13.013.050-k',1,'Demetrio','Salvador','Dominguez','Bellido',956153889,'Cardenal Caro 8923','20/09/1975',1),
		('17.369.045-2',2,'Orlando','Alejandro','Segarra','Cañadas',965362345,'Madagascar 981','25/03/1990',2),
		('15.954.847-3',3,'Samir','Gonzalo','España','Cantos',928738809,'Purey 138','10/06/1985',3),
		('10.996.764-5',4,'Carlos','Julio','Mendoza','Ahmed',932638243,'Mozart 1892','31/12/1968',4),
		('18.195.306-3',5,'Jose','Denis','Marti','Palacios',932539075,'Osorno 1278','14/12/1992',5),
		('10.825.291-k',6,'Esmeralda','Sandra','Alegre','Barrientos',919822695,'Sandro Botticeli 672','17/05/1968',6),
		('19.220.388-0',7,'Maria','Patricia','Pascual','Pizarro',976599763,'Rauli 4561','03/05/1996',7),
		('16.567.946-6',8,'Izaskun','Filomena','Galvan','Vela',997841004,'Avenida Cachapoal 1042','08/07/1987',8),
		('18.062.883-5',9,'Gregoria','Paula','Caparros','Conesa',901533515,'Zamora 1290','19/07/1992',9),
		('8.589.485-4',10,'Estela','Erica','Santos','Iniesta',984342992,'La Campiña 320','13/11/1960',10),
		('13.882.131-5',11,'Toni','Cesar','Diez','SanJuan',945881831,'Colo-Colo 123','20/07/1978',11);
)	
( Proyecto 		id_proyecto,id_tipo_proyecto,fecha_inicio,tiempo_estimado,costo_estimado,tiempo_real_proyecto,costo_Real,fecha_fin,rut_cliente,rut_decorador,calificacion,observacion
INSERT INTO Proyecto
Values	(1,1,'05/01/2014',7,156700,6,153700,'11/01/2014','12.209.321-2','13.013.050-k',7,'Hermoso pintado'),
		(2,2,'02/05/2014',3,13500,4,14500,'06/05/2014','12.581.127-2','17.369.045-2',3,'Mueble inestable'),
		(3,3,'24/09/2014',5,17000,6,18700,'30/09/2014','20.050.945-5','15.954.847-3',2,'Parece que estuviera apurado, mala instalacion'),
		(4,4,'23/02/2015',11,77500,14,75000,'06/03/2015','12.200.994-7','10.996.764-5',4,'Se nota que es extension'),
		(5,5,'20/06/2015',4,86200,3,86200,'23/06/2015','13.884.733-0','18.195.306-3',2,'Fueron puestas al azar, sin ningun orden'),	
		(6,6,'24/10/2015',10,144500,9,138200,'03/11/2015','9.873.114-8','10.825.291-k',4,'Baño no alineado'),
		(7,7,'28/03/2016',5,30000,6,28000,'02/04/2016','19.544.656-3','19.220.388-0',1,'No quedo arreglado, salia mejor poner cinta adhesiva'),
		(8,8,'11/07/2016',9,84000,7,80000,'18/07/2016','20.160.580-6','16.567.946-6',4,'Algunas ampolletas quedaron sueltas'),
		(9,9,'30/11/2016',11,50000,14,40000,'14/12/2016','8.637.198-7','18.062.883-5',1,'Salia mejor instalarlo uno mismo para como quedo instalado'),
		(10,10,'27/04/2017',8,250000,10,230000,'07/04/2017','8.503.744-7','8.589.485-4',4,'No era lo que esperaba, pero es buena maqueta'),	
		(11,11,'06/08/2017',7,130000,10,150000,'16/08/2017','18.996.078-6','13.882.131-5',5,'buena decoracion, algunas algo feas pero combinan'),
		(12,10,'30/12/2017',10,300000,9,280000,'08/01/2018','17.610.809-6','8.589.485-4',7,'Hermosa maqueta, tal como la imagine'),
		(13,9,'17/05/2018',9,90000,7,60000,'24/05/2018','19.974.759-2','18.062.883-5',4,'Pudo ser mejor, pero quedo bien'),
		(14,8,'25/09/2018',11,230000,14,250000,'09/10/2018','11.435.716-2','16.567.946-6',1,'Cables expuestos'),
		(15,7,'16/01/2019',7,35000,6,36000,'22/01/2019','12.209.321-2','19.220.388-0',6,'Quedo casi perfecto'),	
		(16,6,'11/05/2019',12,29530,14,270100,'25/05/2019','12.581.127-2','10.825.291-k',4,'Ducha quedo floja'),
		(17,5,'29/09/2019',6,191800,7,184000,'06/10/2019','20.050.945-5','18.195.306-3',4,'Las flores estaban un poco marchitadas'),
		(18,4,'12/11/2019',20,255000,18,255000,'30/11/2019','13.884.733-0','10.996.764-5',5,'Quedo disparejo'),
		(19,3,'25/04/2020',6,10200,4,11900,'29/04/2020','12.200.994-7','15.954.847-3',6,'Bonita instalacion, cortina descosida'),
		(20,2,'01/07/2020',4,19000,3,17500,'04/07/2020','9.873.114-8','17.369.045-2',2,'Mueble flojo'),
		(21,1,'16/10/2020',7,252700,13,262600,'29/10/2020','19.544.656-3','13.013.050-k',6,'Pintado aceptable'),
		(22,1,'01/11/2020',8,252700,12,262600,'13/11/2020','9.873.114-8','13.013.050-k',7,'Me encanto el pintado'),
		(23,11,'02/12/2020',9,130000,8,150000,'10/12/2020','13.884.733-0','13.882.131-5',6,'buena decoracion');
)		
( Tienen 		id_trabajo,id_material
INSERT INTO Tienen
Values	(1,1),
		(1,2),
		(1,3),
		(1,4),
		(2,5),
		(2,6),
		(3,7),
		(4,8),
		(4,9),
		(5,10),
		(5,11),
		(6,12),
		(6,13),
		(6,14),
		(7,8),
		(8,15),
		(8,16),
		(10,17),
		(11,18),
		(11,19),
		(11,20),
		(11,10),
		(11,11);
)
( Estima 		id_trabajo,id_proyecto,costo_estimado_actividad,costo_real_actividad,rut_contratista,cantidad_metros,tiempo_estimado_trabajo,tiempo_real_trabajo,costo_material
INSERT INTO Estima
Values	(1,1,156700,153700,'17.274.702-7',90,7,6,148500),
		(2,2,13500,14000,'14.174.355-4',9,3,4,13500),
		(3,3,17000,18700,'17.824.958-4',11,5,6,18700),
		(4,4,77500,75000,'16.794.360-8',250,11,14,25000),
		(5,5,86200,86200,'5.330.971-2',15,4,3,75000),
		(6,6,144500,138200,'18.277.221-6',14,10,9,88200),
		(7,7,30000,28000,'19.470.442-9',280,5,6,28000),
		(8,8,84000,80000,'22.667.479-9',180,9,7,72000),
		(9,9,50000,40000,'6.065.613-4',null,11,14,null),
		(10,10,250000,230000,'24.715.288-1',100,8,10,170000),
		(11,11,130000,150000,'5.330.971-2',20,7,10,100000),
		(10,12,300000,280000,'24.715.288-1',150,10,9,255000),
		(9,13,90000,60000,'6.065.613-4',null,9,7,null),
		(8,14,230000,250000,'22.667.479-9',1000,11,14,180),
		(7,15,35000,36000,'19.470.442-9',360,7,6,36000),
		(6,16,295300,270100,'18.277.221-6',27,12,14,170100),
		(5,17,191800,184000,'5.330.971-2',34,6,7,170000),
		(4,18,255000,255000,'16.794.360-8',550,20,18,55000),
		(3,19,10200,11900,'17.824.958-4',7,6,4,11900),
		(2,20,19000,17500,'14.174.355-4',11,4,3,16500),
		(1,21,252700,262600,'17.274.702-7',150,7,13,247500),
		(1,22,252700,262600,'17.274.702-7',150,8,12,247500),
		(11,23,130000,150000,'5.330.971-2',20,9,8,100000);
)	
		
1(	
select d.rut_decorador as rut, d.primer_nombre, d.segundo_nombre, d.primer_apellido, d.segundo_apellido, d.direccion, 
c.nombre as ciudad, r.nombre as region, t.descripcion as tipo, extract (year from p.fecha_fin) as año,
count (*) as cantidad
from decorador d, ciudad c, region r, proyecto p, tipoproyecto t 
where d.id_ciudad = c.id_ciudad and c.id_region = r.id_region and d.rut_decorador = p.rut_decorador
and p.id_tipo_proyecto = t.id_tipo_proyecto and p.fecha_fin is not null
Group By (d.rut_decorador,c.nombre, r.nombre, t.descripcion, extract (year from p.fecha_fin))
Order By d.rut_decorador
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
select p.id_proyecto, c.rut_cliente, c.primer_nombre, c.segundo_nombre, e.cantidad_metros ,e.cantidad_metros*e.costo_material as valor_final
from proyecto p, cliente c, estima e
where p.rut_cliente=c.rut_cliente and e.id_proyecto=p.id_proyecto 
Order By p.id_proyecto
)