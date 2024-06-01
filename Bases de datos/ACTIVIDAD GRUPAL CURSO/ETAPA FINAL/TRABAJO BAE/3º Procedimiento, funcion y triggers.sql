-- Porcedimiento que dado el id de un piloto, muestra los puntos de su carrera deportiva
drop procedure puntosPilotoCarrera;
delimiter $$
create procedure puntosPilotoCarrera(in inIdPiloto int)
	begin
		select pilotos.nombre, sum(resultados.puntos_carrera) from pilotos join resultados on pilotos.id = resultados.id_piloto 
			where pilotos.id = inIdPiloto group by pilotos.id;
	end $$
delimiter ;



-- Funcion que devuelve las carreras de una temporada en especifico
drop function obtener_carreras_temporada;
delimiter $$
CREATE FUNCTION obtener_carreras_temporada (id_temporadaAux INT) RETURNS INT deterministic
BEGIN
	declare n_carreras int default(0);
    set n_carreras = (select count(carreras.id) from carreras where carreras.id_temporada = id_temporadaAux);
    return n_carreras;
END $$
delimiter ;



-- Trigger que inserta al trabajador en la tabla de su tipo correspondiente
-- En caso de ingeniero, todos irán por defecto al ingeniero de coche
drop trigger insertar_trabajadores_BI_trigger;
delimiter $$
CREATE TRIGGER insertar_trabajadores_BI_trigger before insert ON trabajadores FOR EACH ROW
BEGIN
    IF (NEW.tipo = 'mecanicos') THEN
        insert into mecanicos values (default, floor(rand()*(3-1)+1));
    ELSEIF (NEW.tipo = 'ingeniero') THEN
        insert into ing_coche values (default, floor(rand()*(3-1)+1));
    END IF;
END $$
delimiter ;





-- Trigger que no te deja insetar un trabajador cuando tiene 65 años o más
drop trigger if exists trabajadores_BI_trigger
delimiter $$
create trigger trabajadores_BI_trigger before
insert on trabajadores for each row
begin
declare edad int default (select year(now()) - year(new.fecha_nacimiento));
declare mensaje varchar(255);
if edad >= 65 then
	set mensaje = 'el trabajador introducido es demasiado viejo ';
signal sqlstate '45000'
	set message_text = mensaje ;
end if;
end $$ 
delimiter ;





-- Trigger que al borrar a un ingeniero de estrategia, lo borra también de la tabla trabajadores 
drop trigger if exists ing_estrategia_AD_trigger;
delimiter $$
create trigger ing_estrategia_AD_trigger after delete on ing_estrategia for each row
begin
	delete from trabajadores where id = old.id;
end $$ 
delimiter ;