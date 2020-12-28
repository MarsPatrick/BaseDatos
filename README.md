# **Trabajo Semestral - Entrega II**

## Base de Datos

### Profesora: Mónica Caniupán

2020

# 1. Enunciado

En esta entrega se debe generar la base de datos del enunciado del trabajo semestral, incluyendo
la generación de tuplas, así como también la especificación de un conjunto de consultas en lenguaje
SQL incluyendo resultados de la evaluaci+on de las consultas en la base de datos.
Se deben incluir en los siguientes archivos en formato sql, todos en un único archivo formato zip:

-creacion.sql: que contiene la creación de la base de datos en lenguaje SQL.

-insercion.sql: que contiene la inserción de tuplas (mínimo 5 tuplas por tabla).

-queries.sql: que contiene las especificación de las consultas en lenguaje SQL.

-respuestas.pdf: que contiene las respuestas a cada una de las consultas, si la consulta no da
respuesta, debe asegurarse de ingresar más tuplas en su base de datos para generar respuestas.

# 2. Consultas
Genere las siguientes consultas en lenguaje SQL:

Q1: Mostrar el rut, nombre, apellidos y dirección de los decoradores (incluyendo ciudad y región),
junto con la cantidad de proyectos que han dirigido por tipo y año (considere solo proyectos
finalizados).

Q2: Mostrar el rut, nombre, apellidos de los clientes que no han contratado nunca proyectos de
tipo “decoración completa” en el último año (considerar fecha de inicio del proyecto).

Q3: Muestre el código de los proyectos, nombre cliente (con apellido), nombre de decorador a cargo
(con apellido), junto con los trabajos requeridos (id y descripción), nombre del contratista (con
apellido) y costo estimado de cada uno de los trabajos.

Q4: Genere la vista costo proyectos que contiene el código de los proyectos y el total estimado por
los trabajos que incluye el proyecto y valor total real de los trabajos realizados.

Q5: Utilice la vista costo proyectos para mostrar el código de los proyectos cuyo valor real de
trabajos corresponde al máximo pagado por un cliente.

Q6: Muestre el identificador de los proyectos, rut de clientes, nombre de clientes y la cantidad de
materiales que fueron necesarios en los proyectos, además mostrar el valor final de cada trabajo
que se calcula de la siguiente manera: sumar valor unitario de cada material, sumar la cantidad
de metros estimados para el trabajo, y multiplicar ambos valores.

# 3. Regulaciones
El trabajo es individual.
Cualquier copia entre alumnos será sancionada con nota 1 y reportada a la correspondiente
Dirección de Escuela.
Incluir las respuestas de cada una de las consultas de la Sección 2 de acuerdo a su
base de datos (capture salidas de PostgreSQL con el código de la consulta arriba).
Fecha entrega: Lunes 28 de diciembre hasta las 24:00 horas a través de moodle.
