drop database if exists LinYinAstonMartinF1Team;
create database LinYinAstonMartinF1Team;
use LinYinAstonMartinF1Team;
-- Dani
create table if not exists trabajadores(
	id int primary key auto_increment,
	nombre varchar(30) not null,
	dni char(9) not null,
	nacionalidad varchar(10),
	fecha_nacimiento date not null,
    tipo enum ('mecanico', 'ingeniero','limpiador') not null,
	id_equipo int not null
);
create table if not exists mecanicos(
	id int primary key auto_increment,
    tarea_pit_stop enum ('ruedas', 'frontal','trasero') not null
);
-- Jaza
CREATE TABLE IF NOT EXISTS equipos (
	id int primary key auto_increment,
    nacionalidad varchar(30) not null,
    nombre varchar(30) not null,
    año_fundacion date);
CREATE TABLE IF NOT EXISTS pilotos(
	id int primary key auto_increment,
    nacionalidad varchar(30) not null,
    id_equipo int not null,
    numero int,
    nombre varchar(30),
	index busquedaNombre(nombre)
    );
-- Lin
create table if not exists carreras(
id int primary key auto_increment,
fecha date,
id_circuito int,
id_temporada int
);
create table if not exists resultados(
id_piloto int not null,
id_carrera int not null,
puntos_carrera int not null,
posicion int not null,
primary key (id_piloto,id_carrera)
);
-- Daikel
create table ing_coche(
id int auto_increment primary key,
area_de_coche enum ('motor', 'aerodinamica','suspension') not null
);
create table ing_estrategia(
id int auto_increment primary key,
localizacion enum ('sede', 'paddock') not null
) comment 'Los estrategas son ingenieros que esta especializados en las estrategias de carrera';
-- Luis
create table if not exists circuitos (
	id int not null auto_increment primary key,
    longitud double not null,
    ubicacion varchar(40) not null,
    nombre varchar(100) not null,
    nvueltas int not null
    );
create table if not exists temporadas (
	id int not null primary key auto_increment,
    año int not null
    );


-- Dani
alter table trabajadores add foreign key (id_equipo) references equipos(id);
alter table mecanicos add foreign key (id) references trabajadores(id);
-- Jaza
alter table pilotos add foreign key (id_equipo) references equipos(id);
-- Lin
alter table carreras add foreign key (id_circuito) references circuitos(id);
alter table carreras add foreign key (id_temporada) references temporadas(id);
alter table resultados add foreign key resultados(id_piloto) references pilotos(id);
alter table resultados add foreign key resultados(id_carrera) references carreras(id);
-- Daikel
ALTER TABLE ing_coche ADD CONSTRAINT fk_ing_coche_trabajador FOREIGN KEY (id) REFERENCES trabajadores(id);
ALTER TABLE ing_estrategia ADD CONSTRAINT fk_ing_estrategia_trabajador FOREIGN KEY (id) REFERENCES trabajadores(id);
-- Luis no tiene claves foraneas



-- 2º Trimestre ACTIVIDAES

-- 3 Modifica las tablas añadiendo índices (incluido UNIQUE y FULLTEXT). Justifica tu elección.
-- Tabla Pilotos
alter table pilotos ADD UNIQUE INDEX (numero);
-- Los elegí por que tengo entendido que el numero de los Pilotos no se repiten

-- Tabla Circuitos
alter table circuitos ADD FULLTEXT INDEX (nombre);
-- El nombre de los circutos no se repiten

-- Tabla Equipos
alter table equipos ADD FULLTEXT INDEX (nombre);
-- El nombre de los equipos no se repiten

-- Tabla Temporada
alter table temporadas ADD UNIQUE INDEX (año);
-- Tengo entendido que no habra 2 temporadas el mismo año (creo)

-- 4º Elimina dichos índices.

-- Tabla Pilotos
alter table pilotos DROP INDEX numero;
-- Tabla Circuitos
alter table circuitos DROP INDEX nombre;
-- Tabla Equipos
alter table equipos DROP INDEX nombre;
-- Tabla Temporada
alter table temporadas DROP INDEX año;

-- 5 Crea tres vistas. Específica qué quieres mostrar en las vistas.
-- Hemos creado vistas que muestran todos los datos de determinadas tablas para poder mostrar sus resultados sin dar necesidad de dar permisos sobre esas tablas.

Create view pilot as select * from pilotos;
Create view carrer as select * from carreras;
Create view circuits as select * from circuitos;

-- 6 Elimina las vistas.

Drop view pilot; 
Drop view carrer;
Drop view circuits;