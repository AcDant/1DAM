insert into sucursales values(1,'Las Palmas', '{123456789,987654321}', row(10,'Wanabe','Las Palmas'));
insert into sucursales values(2,'Tenerife', '{111111111,222222222}', row(20,'Rotonda','Tenerife'));

select * from juguetes;
insert into juguetes values (default, 'papa1', 20.3, 'creativo', 3);
insert into juguetes values (default, 'papa2', 22.4, 'educativo', 3);
insert into juguetes values (default, 'papa3', 43.2, 'electronico', 3);
insert into juguetes values (default, 'papa4', 10.6, 'electronico', 3);
insert into juguetes values (default, 'papa5', 9.3, 'peluche', 3);
insert into juguetes values (default, 'papa6', 11.9, 'peluche', 3);
insert into juguetes values (default, 'papa7', 100.8, 'juego', 3);
insert into juguetes values (default, 'papa8', 58.2, 'juego', 3);
insert into juguetes values (default, 'papa9', 82.5, 'juego de mesa', 3);
insert into juguetes values (default, 'papa10', 2.6, 'muñeco', 3);

insert into inventario values(1,1,20,'7');
insert into inventario values(1,2,30,'7');
insert into inventario values(1,4,4,'7');
insert into inventario values(1,4,5,'7');
insert into inventario values(1,5,43,'7');
insert into inventario values(1,6,71,'7');
insert into inventario values(1,7,21,'7');
insert into inventario values(1,8,46,'7');
insert into inventario values(1,9,2,'7');
insert into inventario values(1,10,1,'7');

insert into vendedores values(default, 'Cynthia','Alfonsa','piji.com',200,'2020-02-10',1,0,'40');
insert into gerentes values(default, 'Luis','Santos','asanrey.com',1500,'2022-06-20',1,'{i+d}');
insert into logistico values(default, 'Popon','Reparton','reparto.com',2500,'2024-04-12',1,4);
select * from logistico;

insert into clientes values('12312312L', 'Lin', 'Yi', '{333222111,999888777}','comprador compulsivo');
insert into clientes values('43434343O', 'Eliecer', 'Ramos', '{333222111}','amante de las ofertas');
update clientes set direccion = row(77,'Casa','Lanzarote');
update clientes set direccion = row(77,'Casa','Lanzarote') where nombre = 'Eliecer';

select * from clientes;
insert into pedidos values('aduanas','2024-06-05', 32,'43434343O',5);
insert into detalles_pedidos values('aduanas',2,5);


create table pedidos(
	seguimiento varchar(20) primary key,
	fecha date,
	total int,
	id_cliente char(9),
	id_logistico int  default nextval('id_empleado_type')
);
	
create table detalles_pedidos(
	seguimiento varchar(20),
	referencia int,
	cantidad int
);
	
delete from juguetes where nombre = 'papa3';
-------------
update clientes set (direccion).calle = 'calle modificada' where nombre ='Lin';
--------------
update clientes set tlf[1] = '444555666' where nombre = 'Eliecer';
