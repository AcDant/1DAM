create sequence codSucur start with 6 increment by 2 maxvalue 1000 minvalue 6;
create sequence id_empleado_type start with 1 increment by 2 maxvalue 4001 minvalue 1;

create type categoria as enum(
	'educativo', 'creativo', 'electronico', 'peluche', 'juego de mesa', 'muñeco'
);

create type direccion as (
	num integer,
	calle varchar(50),
	municipio varchar(30)
);

create type categoriaJug as enum(
	'educativo', 'creativo', 'electronico', 'peluche','juego','juego de mesa','muñeco'
);

create type impuestoType as enum(
	'7','21'
);

create type nivelType as enum(
	'agarrado','amante de las ofertas','meticuloso','comprador compulsivo'
);

create type jornada_enum as enum(
	'40','30','20'
);

create type area_enum as enum(
	'marqueting','personal','atencion al cliente','i+d'
);






create table sucursales(
	cod int primary key default nextval('codSucur'),
	nombre varchar(30),
	tlf varchar[9],
	direccion direccion
);

create table juguetes(
	referencia serial,
	nombre varchar(30),
	precio double precision,
	categoria categoriaJug,
	edad_min int
);
alter table juguetes add primary key (referencia);

create table inventario(
	cod_sucursal int,
	referencia_juguete int,
	stock integer,
	impuesto impuestoType
);

alter table inventario add foreign key (cod_sucursal) references sucursales(cod);
alter table inventario add foreign key (referencia_juguete) references juguetes(referencia);

create table clientes(
	id char(9) primary key,
	nombre varchar(30),
	apellidos varchar(50),
	tlf varchar[9],
	nivel nivelType
);
alter table clientes add column direccion direccion;

create table pedidos(
	seguimiento varchar(20) primary key,
	fecha date,
	total int,
	id_cliente char(9),
	id_logistico int  default nextval('id_empleado_type')
);
-- Estas foreign key se ejecutan al final
alter table pedidos add foreign key (id_cliente) references clientes(id);
alter table pedidos add foreign key (id_logistico) references logistico(id);
-----------------------------
create table detalles_pedidos(
	seguimiento varchar(20),
	referencia int,
	cantidad int
);
alter table detalles_pedidos add primary key (seguimiento,referencia);
alter table detalles_pedidos add foreign key (seguimiento) references pedidos(seguimiento);
alter table detalles_pedidos add foreign key (referencia) references juguetes(referencia);

create table empleados(
	id int primary key default nextval('id_empleado_type'),
	nombre varchar(30),
	apellidos varchar(50),
	email varchar(100),
	sueldo int,
	fecha_alta date,
	cod_sucursal int
);
alter table empleados add foreign key (cod_sucursal) references sucursales(cod);

create table vendedores(
	comision int,
	jornada jornada_enum
) inherits (empleados);
alter table vendedores add primary key (id);
alter table vendedores add foreign key (cod_sucursal) references sucursales(cod);

create table gerentes(
	area area_enum[]
) inherits (empleados);
alter table gerentes add primary key (id);
alter table gerentes add foreign key (cod_sucursal) references sucursales(cod);

create table logistico(
	num_pedidos int
) inherits (empleados);
alter table logistico add primary key (id);
alter table logistico add foreign key (cod_sucursal) references sucursales(cod);
-- ACORDARSE DE FK PEDIDOS


