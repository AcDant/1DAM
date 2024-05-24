insert into equipos values(default, "España", "HRT", "2012-10-16"),
(default, "italia", "Ferrari", "2008-08-24"),
(default, "Alemania", "Mercedes", "1970-08-01"),
(default, "Reino Unido", "McLaren", "1966-05-10");

insert into trabajadores values(default, "Paco", "46526022E", "España", "1993-06-20", 1, 1),
(default, "Luis", "45682468B", "Brasil", "1980-02-10", 2, 1),
(default, "Ongongo","4854786N","Alemania","1981-01-15", 3, 1),
(default, "Wagyu", "46126382V", "Japon", "1991-06-20", 1, 2),
(default, "Daniel", "41687438M", "Croacia", "1970-02-10", 2, 2),
(default, "Ongongo","4484986F","Alemania","1961-01-15",3,2),
(default, "Abdullah", "46526022E", "España", "1973-06-20", 1,3),
(default, "Irene", "4879215G", "Noruega", "1989-01-10", 2, 3),
(default, "Chris Bumstead","47465697S","Alemania","1951-01-15",3,3),
(default, "Daikel", "4113654F", "China", "1999-06-20", 1, 4),
(default, "Jazael", "45696315H", "Canada", "1900-05-10", 2, 4),
(default, "LinYi","41236547D","Mexico","1981-01-15",3,4);

-- INSERCIONES A ULTIMA HORA
-- mecanicos
insert into mecanicos values(1, 1),
(4, 2),
(7, 1),
(10, 3);

-- ing_coche
insert into ing_coche values(2, 1),
(5, 2),
(8, 1),
(11, 3);

-- ing_estrategia
insert into ing_estrategia values(4, "paddock"),
(5, "sede"),
(10, "paddock"),
(11, "sede");
-- INSERCIONES A ULTIMA HORA

insert into pilotos values
(default, "España", 1,  24, "Antonio"),
(default, "Croacia", 1,  2, "Ismael"),
(default, "Alemania", 2,  36, "Salvador"),
(default, "Japon", 2,  7, "Guillermo"),
(default, "Eslovaquia", 3,  9, "Manuel"),
(default, "Noruega", 3,  30, "Jose"),
(default, "Africa", 4,  22, "Sun-Jiwoo"),
(default, "Korea", 4,  15, "Recio");

select * from equipos;
select * from pilotos;
select * from trabajadores;

use LinYinAstonMartinF1Team;
describe temporadas;
describe circuitos;
describe carreras;

-- temporadas
insert into temporadas values (default,2015),(default,2016);

-- circuitos
insert into circuitos values(default,5.7,'Italia','Monza',53),
(default,5.8,'Japon','Suzuka',53),
(default,5.4,'China','ShangHai',56),
(default,4.6,'España','Montmelo',66),
(default,7.0,'Belgica','SPA',44),
(default,4.3,'Brasil','Interlagos',71);
insert into circuitos values(default,5.4,'Bahrein','Bahrein',57);

-- carreras
insert into carreras values(default,'2015-05-19',1,1),(default,'2015-04-10',2,1),(default,'2015-05-04',3,1),
(default,'2016-06-20',4,2),(default,'2016-08-13',5,2),(default,'2016-09-27',6,2);

select * from temporadas;
select * from circuitos;
select * from carreras;

-- resultados

insert into resultados values(1, 1, 40, 1),
(2, 2, 37, 2),
(3, 3, 35, 3),
(4, 4, 32, 4),
(5, 5, 16, 5),
(6, 6, 10, 6),
(7, 1, 5, 7),
(8, 2, 2, 8),
(5, 3, 40, 1),
(2, 4, 37, 2),
(3, 5, 35, 3),
(1, 6, 32, 4),
(8, 1, 16, 5),
(6, 2, 10, 6),
(7, 3, 5, 7);
-- (4, 4, 2, 8);

select * from resultados;


-- 1. Crea dos o más transacciones dónde realices inserciones, actualizaciones y eliminación de datos. Una de dichas transacciones no debe comprometerse, el resto sí. Haz uso de savepoint.

-- LIN YI

start transaction;
insert into circuitos values(default,5.9,'España','Galleta',50);
update circuitos set longitud = 5.1 where id = 1;
savepoint volver; 
delete from circuitos where ubicacion = 'España' and longitud = 5.9;
rollback to volver;
insert into equipos values (default,'China','SomosMejores','2015-01-01');
commit;

start transaction;
insert into pilotos values(default,'China',1,5,'linyi');
savepoint vuelve; 
insert into pilotos values(default,'China',1,55,'linyi2');
update pilotos set nombre = 'linyiBEST' where id = 1;
delete from pilotos where  nacionalidad = 'China' and nombre = 'linyi2';
rollback to vuelve;
commit;

start transaction;
insert into circuitos values(default,5.9,'China','manoloRun',55);
insert into circuitos values(default,6.5,'China','Correeer',60);
update circuitos set nombre = 'Correer2' where longitud = 6.5;
delete from circuitos where  ubicacion = 'China' and longitud = 6.5;
rollback;


-- 2. Crea dos usuarios: uno será el admin y otro será un desarrollador
-- a. Establece los permisos que creas conveniente a cada uno de ellos. Explica el motivo de la asignación de dichos permisos.

use LinYinAstonMartinF1Team;
-- Crear el usuario administrador
Create user'admin'@'localhost' identified by 'contraseña_admin';

-- Dar permisos 
Grant all privileges on *.* to 'admin'@'localhost' with grant option;

-- Crear el usuario desarrollador
Create user 'desarrollador'@'localhost' identified by 'contraseña_dess';

-- Dar permisos 
Grant select, insert, update on LinYinAstonMartinF1Team.* TO 'desarrollador'@'localhost';





-- 3. Realiza las consultas que te ha facilitado el docente.


-- PARTE 3 CONSULTAS DEL PROFESOR
use LinYinAstonMartinF1Team;

-- 1. Muestra todos los ingenieros, mostrando primero los más jóvenes.
select * from trabajadores where tipo = 'ingeniero';

-- 2. Mostrar el número de trabajadores por equipo.
select count(*), equipos.nombre from trabajadores join equipos on trabajadores.id_equipo = equipos.id
	group by equipos.id;

-- 3. Mostrar el nombre del equipo y el nombre del piloto
select equipos.nombre, pilotos.nombre from equipos join pilotos on equipos.id = pilotos.id_equipo;

-- 4. Mostrar todos (todos los campos) los pilotos y la fecha de la carrera de una temporada X (la eligen ustedes).
select pilotos.*, carreras.fecha from pilotos join resultados on pilotos.id = resultados.id_piloto
	join carreras on carreras.id = resultados.id_carrera;

-- 5. Mostrar el número de pilotos que han participado en una carrera este año.
-- Solo tenemos carreras de 2015 y 2016.
select count(*) from pilotos where pilotos.id in 
	(select id_piloto from resultados where id_carrera in 
		(select id from carreras where id_temporada = 
			(select id from temporadas where año = 2015)));

-- 6. Mostrar el nombre del equipo, el nombre del piloto, su número, la fecha y la temporada de la carrera,
-- así como el nombre del circuito , la ubicación, longitud y n vueltas.
select equipos.nombre as 'Equipo', pilotos.nombre as 'Piloto', pilotos.numero, carreras.fecha, temporadas.id as 'ID Temporada', 
	temporadas.año as 'Año', circuitos.nombre as 'Circuito', circuitos.ubicacion,
	circuitos.longitud, circuitos.nvueltas from equipos join pilotos on equipos.id = pilotos.id_equipo join resultados on pilotos.id = resultados.id_piloto
	join carreras on resultados.id_carrera = carreras.id
	join temporadas on carreras.id_temporada = temporadas.id
	join circuitos on carreras.id_circuito = circuitos.id;

-- 7. Mostrar el número de trabajadores, el nombre del piloto y el nombre del equipo por equipo,
-- ordenando por fecha de fundación (de más antiguo a más reciente).
select pilotos.nombre, equipos.nombre from  equipos 
	join pilotos on equipos.id = pilotos.id_equipo group by equipos.nombre order by equipos.año_fundacion;
    
select count(*), pilotos.nombre, equipos.nombre from trabajadores join equipos on trabajadores.id_equipo = equipos.id 
	join pilotos on equipos.id = pilotos.id_equipo group by equipos.nombre order by equipos.año_fundacion;


-- 8. Mostrar el nombre de todos los mecánicos que se encarguen del cambio de ruedas de un equipo X durante una temporada X (lo eligen ustedes).
select trabajadores.nombre from trabajadores where tipo = 'mecanico' and trabajadores.id in 
(select mecanicos.id from mecanicos where tarea_pit_stop = 'ruedas') 
    and trabajadores.id_equipo = (select equipos.id from equipos where equipos.nombre = 'HRT')
    and trabajadores.id_equipo in (select equipos.id from equipos where equipos.id in (select pilotos.id_equipo from pilotos where pilotos.id in 
    (select resultados.id_piloto from resultados where id_carrera in 
    (select carreras.id from carreras where carreras.id_temporada = 
    (select temporadas.id from temporadas where año = 2015)))));



-- 4. Añade consultas sobre la información de la BD que consideras que necesitarás añadir en una app/web. (Hasta 3 puntos de la práctica)


-- JAZAEL

-- Ver los equipos que existen

select nombre from equipos;

-- Ver los pilotos de algun equipo en concreto, por ejemplo McLaren
select equipos.nombre as Equipo, pilotos.nombre as Pilotos from pilotos
	inner join equipos on equipos.id = pilotos.id_equipo where equipos.nombre = "McLaren";
    
-- Ver las carreras que se han hecho en una temporada en especifico y en que circuito se hizo

select temporadas.año as Temporada, circuitos.nombre as Nombre_Circuito
	from temporadas inner join carreras on temporadas.id = carreras.id_temporada
		inner join circuitos on carreras.id_circuito = circuitos.id where temporadas.año = 2015 order by temporadas.año;

-- Circuitos con mayor longitud

select nombre, longitud from circuitos
	order by longitud desc limit 3;
    
-- informacion sobre un piloto en especifico
select pilotos.id, pilotos.nombre, pilotos.numero, pilotos.nacionalidad, equipos.nombre as equipo
	from pilotos inner join equipos on pilotos.id_equipo = equipos.id
		where pilotos.id = 3;
        
-- Resultado de un piloto en una carrera

select pilotos.nombre as Nombre_Piloto, resultados.puntos_carrera, resultados.posicion, temporadas.año, circuitos.nombre as Nombre_Circuito from pilotos 
	inner join resultados on pilotos.id = resultados.id_piloto
	inner join carreras on resultados.id_carrera = carreras.id 
    inner join temporadas on temporadas.id = carreras.id_temporada 
    inner join circuitos on circuitos.id = carreras.id_circuito where pilotos.id = 3 and temporadas.año = 2015;