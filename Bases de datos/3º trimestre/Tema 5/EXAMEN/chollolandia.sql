DROP DATABASE IF EXISTS chollolandia;
CREATE DATABASE chollolandia;
USE chollolandia;

CREATE TABLE clientes (
    dniCliente char(9) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(200) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    passwd VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL default 'c/ Ana Luisa Benítez, 5',
    fecha_nacimiento DATE
);

CREATE TABLE vendedores (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL unique,
    calificacion DOUBLE NOT NULL,
    fecha_alta DATE
);


CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NOT NULL,
    precio double NOT NULL check(precio<=99999.99),
    categoria enum('Electronica', 'Motor', 'Accesorios', 'Deportes', 'Hogar', 'Papeleria'),
    stock INT NOT NULL,
    id_vendedor INT,
    FOREIGN KEY (id_vendedor) REFERENCES vendedores (id_vendedor)
);


CREATE TABLE carrito (
   dniCliente char(9) NOT NULL,
   id_producto INT NOT NULL,
   cantidadProducto INT,
   PRIMARY KEY (id_producto, dniCliente),
   FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
	on delete cascade
	on update cascade,
  FOREIGN KEY(dniCliente) REFERENCES clientes(dniCliente)
	on update cascade
	on delete restrict);
    

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
	dniCliente char(9) NOT NULL,
    fecha_pedido DATE NOT NULL,
    total double NOT NULL,
    estado enum('Entregado', 'En aduanas', 'En transito', 'Devuelto', 'Cancelado'),
    FOREIGN KEY(dniCliente) REFERENCES clientes(dniCliente)
);

INSERT INTO clientes (dniCliente, nombre, apellidos, email, passwd, direccion, fecha_nacimiento)
VALUES
  ('00000000A', 'Abundio', 'García', 'abundio.garcia@gmail.com', 'password123', 'C/ El Castillo, 1', '1980-01-01'),
  ('00000001B', 'Benita', 'López', 'benita.lopez@gmail.com', 'password456', 'C/ La Herrería, 2', '1981-02-02'),
  ('00000002C', 'Cayo', 'Martínez', 'cayo.martinez@gmail.com', 'password789', 'C/ La Plaza, 3', '1982-03-03'),
  ('00000003D', 'Dominga', 'Fernández', 'dominga.fernandez@gmail.com', 'password123', 'C/ El Río, 4', '1983-04-04'),
  ('00000004E', 'Emeterio', 'Pérez', 'emeterio.perez@gmail.com', 'password456', 'C/ La Iglesia, 5', '1984-05-05'),
  ('00000005F', 'Facundo', 'Rodríguez', 'facundo.rodriguez@gmail.com', 'password789', 'C/ El Molino, 6', '1985-06-06'),
  ('00000006G', 'Gervasia', 'Sánchez', 'gervasia.sanchez@gmail.com', 'password123', 'C/ La Montaña, 7', '1986-07-07'),
  ('00000007H', 'Hermenegildo', 'González', 'hermenegildo.gonzalez@gmail.com', 'password456', 'C/ El Bosque, 8', '1987-08-08'),
  ('00000008I', 'Inés', 'Díaz', 'ines.diaz@gmail.com', 'password789', 'C/ La Playa, 9', '1988-09-09'),
  ('00000009J', 'Jacinto', 'Romero', 'jacinto.romero@gmail.com', 'password123', 'C/ La Ciudad, 10', '1989-10-10'),
  ('00000010K', 'Liborio', 'Castro', 'liborio.castro@gmail.com', 'password456', 'C/ El Valle, 11', '1990-11-11'),
  ('00000011L', 'Manuela', 'Jiménez', 'manuela.jimenez@gmail.com', 'password789', 'C/ El Puerto, 12', '1991-12-12'),
  ('00000012M', 'Narciso', 'Navarro', 'narciso.navarro@gmail.com', 'password123', 'C/ La Granja, 13', '1992-01-01'),
  ('00000013N', 'Olegario', 'Gutiérrez', 'olegario.gutierrez@gmail.com', 'password456', 'C/ del Páramo, 14', '1993-02-02'),
  ('00000014Q', 'Petra', 'Blanco', 'petra.blanco@gmail.com', 'password789', 'C/ La Granja, 15', '1994-03-03'),
  ('00000015P', 'Quintín', 'Ramírez', 'quintin.ramirez@gmail.com', 'password123', 'C/ La Granja, 16', '1995-04-04');


INSERT INTO vendedores (nombre, calificacion, fecha_alta)
VALUES
  ('Ana López', 4.8, '2010-05-12'),
  ('Benito Fernández', 3.9, '2015-08-23'),
  ('Carmen García', 4.2, '2008-03-01'),
  ('Daniel Hernández', 2.7, '2022-11-14'),
  ('Elena Pérez', 5.0, '2024-01-05'),
  ('Felipe Martínez', 1.5, '2005-12-31'),
  ('Gloria Sánchez', 4.1, '2019-04-07'),
  ('Hugo Rodríguez', 3.5, '2011-07-16'),
  ('Irene Jiménez', 4.7, '2017-10-25'),
  ('Javier González', 2.9, '2020-02-09'),
  ('Karina Castro', 4.4, '2013-06-18'),
  ('Luis Gutiérrez', 3.3, '2016-09-27'),
  ('María Navarro', 4.0, '2009-01-04'),
  ('Omar Díaz', 2.1, '2012-03-11'),
  ('Patricia Romero', 4.6, '2014-05-20');


INSERT INTO productos (nombre, descripcion, precio, categoria, stock, id_vendedor)
VALUES
  ('Smartphone Xiaomi Redmi Note 11', 'Pantalla AMOLED de 6.6", 4GB RAM, 128GB almacenamiento, Qualcomm Snapdragon 680 de 8 núcleos', 250.00, 'Electronica', 10, 7),
  ('Auriculares Bluetooth Asus', 'Auriculares con cancelación de ruido activa', 90.00, 'Electronica', 20, 7),
  ('Seat Panda 1998', 'Coche utilitario de bajo consumo con motor de 1.2L. (Con tapacubos)', 500.00, 'Motor', 1, 8),
  ('Honda Shadow VT750C', 'Cruiser motocicleta con motor bicilíndrico en V de 750cc. Eje de transmisión final. Estilo clásico y cómodo.', 7500.00, 'Motor', 3, 8),
  ('Collar de plata', 'Collar de plata de ley 925 con circonita cúbica', 20.00, 'Accesorios', 40, 9),
  ('Nike Air Force', 'Zapatillas de running ligeras', 80.00, 'Accesorios', 25, 10),
  ('Bicicleta de montaña MTB', 'Bicicleta de montaña con cuadro de aluminio y suspensión delantera', 300.00, 'Deportes', 5, 10),
  ('Sofá cama IKEA', 'Sofá cama convertible en dos plazas', 200.00, 'Hogar', 15, 11),
  ('Mesa de comedor extensible', 'Mesa de comedor extensible de madera maciza', 150.00, 'Hogar', 10, 11),
  ('Barbacoa Weber', 'Barbacoa de carbón con tapa', 100.00, 'Hogar', 8, 12),
  ('Smartwatch Samsung Galaxy Watch 4', 'Smartwatch con pantalla AMOLED y GPS', 200.00, 'Electronica', 15, 7),
  ('Portátil Lenovo IdeaPad 3', 'Portátil con procesador Intel Core i3 y 8GB de RAM', 400.00, 'Electronica', 8, 7),
  ('Tablet Huawei MatePad 10.4', 'Tablet con pantalla Full HD de 10.4"', 300.00, 'Electronica', 12, 7),
  ('Cepillo de dientes eléctrico Oral-B Pro 3', 'Cepillo de dientes eléctrico con tecnología de limpieza 3D', 100.00, 'Electronica', 20, 8),
  ('Anillo de oro con diamantes', 'Anillo de oro de 18 quilates con tres diamantes', 50000.00, 'Accesorios', 25, 9),
  ('Bolígrafo Bic Cristal Azul', 'Bolígrafo de tinta azul con punta fina y cuerpo transparente. Ideal para escribir y tomar notas.', 1.00, 'Papeleria', 100, 5),
  ('Raqueta de tenis Wilson', 'Raqueta de tenis para jugadores principiantes', 50.00, 'Deportes', 15, 10),
  ('Balón de fútbol Adidas Brazuca', 'Balón de fútbol oficial de la Copa Mundial de la FIFA 2014', 25.00, 'Deportes', 20, 10),
  ('Juego de sábanas', 'Juego de sábanas de algodón de 100%', 50.00, 'Hogar', 25, 11),
  ('Unicornio Inflable Gigante', 'Unicornio inflable gigante de 3 metros de altura. Ideal para fiestas, eventos o simplemente para divertirse.', 100.00, 'Hogar', 10, 5);
  

INSERT INTO carrito (dniCliente, id_producto, cantidadProducto)
VALUES
  ('00000000A', 1, 1),
  ('00000000A', 2, 1),
  ('00000000A', 5, 2),
  ('00000002C', 5, 3),
  ('00000003D', 7, 1),
  ('00000004E', 9, 1),
  ('00000005F', 4, 1),
  ('00000007H', 15, 1),
  ('00000008I', 8, 3),
  ('00000008I', 9, 2),
  ('00000008I', 10, 1),
  ('00000012M', 20, 2),
  ('00000003D', 16, 50),
  ('00000015P', 1, 1),
  ('00000015P', 3, 3),
  ('00000015P', 5, 2),
  ('00000014Q', 7, 1),
  ('00000000A', 6, 1),
  ('00000012M', 19, 2),
  ('00000015P', 9, 3);
  

INSERT INTO pedidos (dniCliente, fecha_pedido, total, estado)
VALUES
  ('00000000A', '2023-12-01', 120.50, 'Entregado'),
  ('00000001B', '2023-11-15', 50.25, 'En aduanas'),
  ('00000002C', '2024-02-29', 87.90, 'En transito'),
  ('00000003D', '2003-09-20', 45.00, 'Entregado'),
  ('00000004E', '2023-08-15', 23.75, 'Devuelto'),
  ('00000005F', '2024-02-29', 150.10, 'En transito'),
  ('00000006G', '2023-06-20', 300.00, 'Cancelado'),
  ('00000007H', '2023-10-10', 75.50, 'Entregado'),
  ('00000008I', '2024-01-05', 110.25, 'En aduanas'),
  ('00000009J', '2024-03-20', 65.00, 'En transito'),
  ('00000010K', '2013-02-15', 20.50, 'Entregado'),
  ('00000011L', '2023-01-05', 130.75, 'En aduanas'),
  ('00000012M', '2002-12-20', 250.00, 'Cancelado'),
  ('00000013N', '2022-11-15', 85.25, 'Entregado'),
  ('00000014Q', '2022-11-29', 440.00, 'Devuelto'),
  ('00000000A', '2020-12-01', 220.50, 'Entregado'),
  ('00000000A', '2018-12-01', 2520.50, 'Entregado'),
  ('00000000A', '2010-12-31', 5.95, 'Entregado'),
  ('00000005F', '2023-02-28', 150.10, 'En transito');
  

