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