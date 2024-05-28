-- 1º muestra los libros de x autor (subconsulta)
select * from libros where isbn = (select libro_isbn from creaciones where id_autor  = 
	(select id_autor from autores where nombre = 'Myke'));
-- 2º muestra los libros de x editorial (subconsulta)
select * from libros where editorial in (select id_editorial from editoriales where nombre = 'jazmin');
-- 3º muestra el usuario y libro con prestamo de fecha x (join)
select usuarios.nombre, libros.titulo from usuarios join prestamos on usuarios.id_usuario = prestamos.id_usuario 
	join libros on prestamos.isbn = libros.isbn where prestamos.fecha_prestamo = '2024-05-23';
-- 4º muestra editorial y autor de x libro (join)
select editoriales.nombre, autores.nombre from editoriales join libros on editoriales.id_editorial = libros.editorial 
	join creaciones on libros.isbn = creaciones.libro_isbn join autores on autores.id_autor = creaciones.id_autor 
	where libros.titulo = 'Teletienda fantastica';
-- 5º muestra las editoriales que tengan libro en prestamo
select editoriales.nombre from editoriales where id_editorial in 
	(select id_editorial from libros where isbn in(select isbn from prestamos));
-- 6º muestra usuarios que tengan libro en prestamo
select usuarios.nombre from usuarios where id_usuario in (select id_usuario from prestamos);