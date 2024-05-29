-- 1º Funcion y 1º trigger
-- Cuando se elimine un registro de la tabla creaciones (autor asociado a su libro),
-- se procederá a eliminar todos los prestamos de ese libro y 
-- posteriormente se borrará el libro de la base de datos.
-- Todo esto atendiendo a que si un libro no ha sido creado, no puede existir.

create or replace function delete_libro() returns trigger as $$
begin
	delete from prestamos where isbn = old.libro_isbn;
	delete from libros where isbn = old.libro_isbn;
return new;
END $$ language plpgsql;

create or replace trigger creaciones_AD_trigger after delete on creaciones for each row
	execute procedure delete_libro();

-- BORRADO DE PRUEBA
delete from creaciones where libro_isbn ='123456';




-- 2º Funcion y 2º trigger
-- Cuando se añada un usuario nuevo, con motivo de una oferta,
-- se le hará un préstamo de 3 días del último libro publicado en la tabla libros.

create or replace function libro_oferta() returns trigger as $$
	declare isbnAux varchar(50) default (select isbn from libros order by fecha_publicacion desc limit 1);
	declare dateAux date default (current_date + 3);
begin
	insert into prestamos values(isbnAux, new.id_usuario, current_date, dateAux);
	return new;
END $$ language plpgsql;

create or replace trigger usuarios_AI_trigger after insert on usuarios for each row
execute procedure libro_oferta();

-- INSERCIÓN DE PRUEBA
insert into usuarios values(default, 'Cynthia','Alfonso',
	row('Calle Aruquitas',10,'Arbusto', 'Arucas'),'{666333222,019283650}','Profeloqui@gmail.com','1995-11-23');
