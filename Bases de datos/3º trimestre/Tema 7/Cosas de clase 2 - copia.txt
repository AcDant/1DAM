-- insertar usuario
drop procedure insertar_alumnos;
create or replace procedure insertar_alumnos(in inDni char (9), inNombre varchar(25), inDireccion direccion_type, inFecha_nac date, inNota double precision,
	inRepite boolean, tlf integer[]
	) language plpgsql as $$
	-- declare variables locales
begin
	
	insert into alumnos values($1,$2,inDireccion, 'rosa', inFecha_nac, inNota, inRepite);
end $$

call insertar_alumnos('12345678L', 'Dani', ROW('hrth',2,'Telde','LP'), '2000-10-13', '{123456123}',5,true,616363266);

-- para recoger variables de salida...
do $$
	declare variable int;
begin
	call insertar_alumnos('12345678L', 'Dani', ROW('hrth',2,'Telde','LP'), '2000-10-13', '{123456123}',5,true,616363266,);
-- con esto mostramos el valor de "variable"
raise notice 'La variable contiene %', variable;
end $$