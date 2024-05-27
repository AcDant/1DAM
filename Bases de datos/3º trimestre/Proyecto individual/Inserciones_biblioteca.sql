-- inserciones en editorial
insert into editoriales values (default,'jazmin',
	row('Calle keke',3,'Telde', 'Telde'),'{123123123,321321321}','www.jazmin.com');
insert into editoriales values (default,'jazmin',
	row('Calle puentin',2,'Las Remudas', 'Telde'),'{987987987,789789789}','www.jazmin.com');
insert into editoriales values (default,'jazmin',
	row('Calle sarajevo',1,'Arucas', 'Arucas'),'{123123123,321321321}','www.jazmin.com');

-- inserciones libros
  isbn VARCHAR(50) PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  genero VARCHAR(20) NOT NULL,
  fecha_publicacion DATE NOT NULL,
  idioma VARCHAR(30) NOT NULL,
  numero_paginas INTEGER NOT NULL,
  editorial integer NOT NULL