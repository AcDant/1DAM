-- creacion de tipos

create type permisos_type as(
	ceder_libro boolean,
	admitir_usuario boolean,
	eliminar_usuario boolean
);
create type direccion_type as(
	calle varchar(50),
	numero integer,
	localidad varchar(50),
	municipio varchar(50)
);

--creacion de secuencia

create sequence secuencia_usuario start with 2 increment by 2 maxvalue 999998 minvalue 2;

-- Tabla Editoriales

CREATE TABLE editoriales (
  id_editorial SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  direccion direccion_type,
  telefono VARCHAR(9)[],
  sitio_web VARCHAR(255)
);

-- Tabla Libros
CREATE TABLE libros (
  isbn VARCHAR(50) PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  genero VARCHAR(20) NOT NULL,
  fecha_publicacion DATE NOT NULL,
  idioma VARCHAR(30) NOT NULL,
  numero_paginas INTEGER NOT NULL,
  editorial integer NOT NULL
);


-- Tabla Autores
CREATE TABLE autores (
  id_autor SERIAL PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  nacionalidad VARCHAR(20) NOT NULL,
  fecha_nacimiento DATE,
  fecha_muerte DATE
);

-- Tabla creaciones (liro con autor)
CREATE TABLE creaciones(
	libro_isbn varchar(50),
	id_autor int,
	primary key (libro_isbn,id_autor)
);

-- Tabla Usurios
CREATE TABLE usuarios (
  id_usuario integer PRIMARY KEY default nextval('secuencia_usuario'),
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  direccion direccion_type,
  telefono VARCHAR(9)[],
  correo_electronico VARCHAR(255),
  fecha_nacimiento date
);

CREATE TABLE administradores(
	tipo_permiso permisos_type
)inherits(usuarios);

-- Tabla Préstamos
CREATE TABLE prestamos (
  isbn VARCHAR(50),
  id_usuario INTEGER,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE,
	primary key (isbn,id_usuario,fecha_prestamo)
);



-- Foreign keys
-- libros
alter table libros add foreign key (editorial) references editoriales(id_editorial);
-- creaciones
alter table creaciones add foreign key (libro_isbn) references libros(isbn);
alter table creaciones add foreign key (id_autor) references autores(id_autor);
-- prestamos
alter table prestamos add foreign key (isbn) references libros(isbn);
alter table prestamos add foreign key (id_usuario) references usuarios(id_usuario);
-- administrador
alter table administrador add primary key (id_usuario);
