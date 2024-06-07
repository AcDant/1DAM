select * from juguetes where referencia in(select referencia_juguete from inventario where cod_sucursal =1);

select clientes.nombre, (clientes).direccion.num, tlf[1], detalles_pedidos.referencia, pedidos.total from clientes 
	join pedidos on clientes.id = pedidos.id_cliente 
	join detalles_pedidos on detalles_pedidos.seguimiento = pedidos.seguimiento 
	where clientes.nivel = 'amante de las ofertas';


select clientes.nombre, juguetes.nombre, juguetes.precio, detalles_pedidos.cantidad from clientes 
	join pedidos on clientes.id = pedidos.id_cliente 
	join detalles_pedidos on pedidos.seguimiento = detalles_pedidos.seguimiento
	join juguetes on juguetes.referencia = detalles_pedidos.referencia where clientes.nombre like '%e%';

select * from pedidos;
select * from detalles_pedidos;