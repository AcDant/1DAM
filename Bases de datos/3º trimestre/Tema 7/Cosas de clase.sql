
drop table alumnos;
	
create table alumnos(
	cod serial primary key,
	nombre char(5),
	direccion direccion_type,
	telefono int
);

-- crear un objeto
create type direccion_type as(
	calle varchar(50),
	numero integer,
	localidad varchar(50),
	municipio varchar(50)
);

-- crear un enum
create type colores_type as enum(
	'rosa', 'negro', 'verde', 'azul'
);


-- alter table alumnos alter column telefono type direccion_type;

insert into alumnos values(default, 'Lin', row('c/venezuela n 8',27,'Santidad','Arucas'), '{888777666}');

select * from alumnos;
alter table alumnos alter column nombre type varchar(10);
alter table alumnos drop column telefono;
alter table alumnos add column telefono varchar(9)[];

insert into alumnos values(default, 'luca', 'c/ pepe', '{111222333,444555666}');

select telefono[1] from alumnos where nombre = 'luca';
select nombre from alumnos where telefono = '{111222333,444555666}';
select nombre from alumnos where '111222333' = ANY(telefono);

update alumnos set telefono =array_append(telefono,'987654321') where nombre  = 'luca';
update alumnos set direccion = row( (direccion).calle, 46, (direccion).localidad, (direccion).municipio) where nombre = 'Lin';
select nombre, (direccion).calle, (direccion).numero from alumnos;

create table usuarios(
	dni char(9),
	nombre varchar(50),
	direccion direccion_type,
	fecha_nac date,
	telefono integer[],
	color_fav colores_type
);

drop table alumnos;
	
create table alumnos(
	nota_media double precision,
	repetidos boolean
)inherits (usuarios);
alter table alumnos add primary key (dni);

create table profesores(
	sueldo float,
	maldad int,
	numero_horas int
)inherits (usuarios);
alter table profesores add primary key (dni);

create table asignaturas(
	cod serial primary key,
	nombre varchar(30),
	abreviatura char(3)
);

create table asignacion_prof(
	dni char(9),
	cod integer,
	primary key(dni,cod),
	foreign key (dni) references profesores(dni),
	foreign key (cod) references asignaturas(cod)
);

create table notas_alumnos(
	cod_asignatura integer,
	dni char(9),
	calificacion int check(calificacion>=1),
	evaluacion int,
	primary key (cod_asignatura,dni,evaluacion),
	foreign key (dni) references alumnos(dni),
	foreign key (cod_asignatura) references asignaturas(cod)
);