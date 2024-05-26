-- Tabla Editoriales

create type permisos();

CREATE TABLE editoriales (
  id_editorial SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  direccion VARCHAR(255),
  telefono VARCHAR(255),
  sitio_web VARCHAR(255)
);

-- Tabla Libros
CREATE TABLE libros (
  isbn VARCHAR(255) PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  genero VARCHAR(255) NOT NULL,
  fecha_publicacion DATE NOT NULL,
  idioma VARCHAR(255) NOT NULL,
  numero_paginas INTEGER NOT NULL,
  editorial VARCHAR(255) NOT NULL
);


-- Tabla Autores
CREATE TABLE autores (
  id_autor SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellidos VARCHAR(255) NOT NULL,
  nacionalidad VARCHAR(255) NOT NULL,
  fecha_nacimiento DATE,
  fecha_muerte DATE
);

-- Tabla creaciones (liro con autor)
CREATE TABLE creaciones(
	libro_isbn varchar(250),
	id_autor int
);

-- Tabla Usurios
CREATE TABLE usuarios (
  id_usuario SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellidos VARCHAR(255) NOT NULL,
  direccion VARCHAR(255),
  telefono VARCHAR(255),
  correo_electronico VARCHAR(255),
	fecha_nacimiento date
);

CREATE TABLE adminitrador(
	tipo_permiso
);


-- Tabla Préstamos
CREATE TABLE prestamos (
--  id_prestamo SERIAL PRIMARY KEY,
  isbn VARCHAR(255) NOT NULL REFERENCES libros(isbn),
  id_socio INTEGER NOT NULL REFERENCES socios(id_socio),
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE
);



-- Foreign keys
-- libros
alter table libros add foreign key editorial references editoriales(id_editorial);
-- creaciones
alter table editoriales add foreign key libro_isbn references libros(isbn);
alter table editoriales add foreign key id_autor references autores(id_autor);