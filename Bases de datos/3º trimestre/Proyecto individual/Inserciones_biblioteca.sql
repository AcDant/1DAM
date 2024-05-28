select * from editoriales;
select * from autores;
select * from libros;
select * from usuarios;
select * from creaciones;
select * from prestamos;
select * from administradores;

-- editoriales
insert into editoriales values (default,'jazmin',
	row('Calle keke',3,'Telde', 'Telde'),'{123123123,321321321}','www.jazmin.com');
insert into editoriales values (default,'jazmin',
	row('Calle puentin',2,'Las Remudas', 'Telde'),'{987987987,789789789}','www.jazmin.com');
insert into editoriales values (default,'jazmin',
	row('Calle sarajevo',1,'Arucas', 'Arucas'),'{123123123,321321321}','www.jazmin.com');
insert into editoriales values (default,'jazmin',
	row('Calle rumbiente',5,'Telde', 'Telde'),'{123123123,321321321}','www.jazmin.com');

-- autores
insert into autores values(default,'Myke','Wasowsky', 'Americano', '1950-01-01', '2024-01-01');
insert into autores values(default,'Jonhy','Jones', 'Italiano', '1970-05-20', '2024-01-01');
insert into autores values(default,'Daniel','Felipez', 'Español', '1996-12-15', '2024-02-11');
insert into autores values(default,'Fofo','Furlen', 'Puertoriqueño', '1990-06-04', '2022-01-01');

-- libros
insert into libros values('020202', 'El señorito glotón','terror','2020-02-05','español',230,1);
insert into libros values('123456', 'Pepe el hambriento','comedia','2023-06-025','español',130,2);
insert into libros values('987654', 'Teletienda fantastica','accion','2023-12-14','español',50,3);
insert into libros values('321543', 'Harry Potter punto','fantasia','2000-08-01','español',500,4);

-- usuarios
insert into usuarios values(default, 'Lin','Yi',
	row('Calle arucas',5,'popo', 'Arucas'),'{123450987,777777777}','yilin123451@gmail.com','2000-08-12');
insert into usuarios values(default, 'Eliecer','Del Rosario',
	row('Calle jojo',6,'Las Palamas', 'Palmas'),'{555555555,111122223}','Eliecerin@gmail.com','2001-05-30');
insert into usuarios values(default, 'Jaza','Daikol',
	row('Al lado del insti',1,'Almatriche', 'Las Palmas'),'{55555444,098789043}','DaikolJaza@gmail.com','2003-02-10');
insert into usuarios values(default, 'Victor','Kuzki',
	row('Calle Rusia',34,'Skvtin', 'Skvtin'),'{884466220,113355779}','VicSpasiva1@gmail.com','1995-02-26');

-- creaciones
insert into creaciones values('020202',1);
insert into creaciones values('123456',2);
insert into creaciones values('987654',3);
insert into creaciones values('321543',4);

-- préstamos
insert into prestamos values('020202',2, '2024-05-24','2024-05-27');
insert into prestamos values('123456',4, '2024-05-23','2024-05-26');
insert into prestamos values('987654',6, '2024-05-27','2024-05-30');
insert into prestamos values('321543',8, '2024-05-28','2024-05-31');

-- administradores
insert into administradores values(default, 'El Admin','Master',
	row('Calle Edificio',21,'Las Remudas', 'Telde'),'{776655443,987234267}','administratorator@gmail.com','1995-02-26',row(true,true,true));

--	calle varchar(50),
--	numero integer,
--	localidad varchar(50),
--	municipio varchar(50)

