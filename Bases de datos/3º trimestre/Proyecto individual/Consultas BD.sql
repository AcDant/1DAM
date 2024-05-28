-- 1º muestra los libros de x autor (subconsulta)
select * from libros where isbn = (select libro_isbn from creaciones where id_autor  = 
	(select id_autor from autores where nombre = 'Myke'));
-- 2º muestra los libros de x editorial (subconsulta)
select * from libros where editorial in (select id_editorial from editoriales where nombre = 'jazmin');
-- 3º muestra el usuario y libro de x prestamo (join)
select * from 
-- 4º muestra editorial y autor de x libro (join)

-- 5º muestra las editoriales que tengan libro en prestamo

-- 6º muestra usuarios que tengan libro en prestamo