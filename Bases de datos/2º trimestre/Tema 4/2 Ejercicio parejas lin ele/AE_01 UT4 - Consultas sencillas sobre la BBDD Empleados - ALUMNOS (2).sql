DROP database if exists empresa;
CREATE DATABASE if not exists empresa;
USE empresa;
-- Tabla departamentos
CREATE TABLE depart (
dept_no INT NOT NULL,
dnombre VARCHAR(30),
loc VARCHAR(30),
CONSTRAINT PK_DEPART_1 PRIMARY KEY (dept_no)
);
-- Tabla empleados
CREATE TABLE emple (
emp_no INTEGER NOT NULL,
apellido VARCHAR(50) NOT NULL,
oficio VARCHAR(30),
dir INTEGER,
fecha_alt DATE,
salario INTEGER,
comision INTEGER,
dept_no INT,
PRIMARY KEY (emp_no)
);
ALTER TABLE emple ADD CONSTRAINT fk_emple_1 FOREIGN KEY (dept_no) REFERENCES
depart (dept_no) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE emple ADD CONSTRAINT fk_emple_2 FOREIGN KEY (dir) REFERENCES emple
(emp_no) ON UPDATE CASCADE ON DELETE RESTRICT;
#Datos:
INSERT INTO depart VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO depart VALUES (20,'INVESTIGACIÓN','MADRID');
INSERT INTO depart VALUES (30,'VENTAS','BARCELONA');
INSERT INTO depart VALUES (40,'PRODUCCIÓN','BILBAO');
INSERT INTO depart VALUES (50,'INFORMATICA','BARCELONA');
INSERT INTO emple VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17', 4100,NULL,10);
INSERT INTO emple VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01', 3005,NULL,30);
INSERT INTO emple VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09', 2885,NULL,10);
INSERT INTO emple VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',3867,NULL,20);
INSERT INTO emple VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09', 3000,NULL,20);
INSERT INTO emple VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03', 3000,NULL,20);
INSERT INTO emple VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17', 1040,NULL,20);
INSERT INTO emple VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20', 1500,390,30);
INSERT INTO emple VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22', 1625,650,30);
INSERT INTO emple VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29', 1600,1020,30);
INSERT INTO emple VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08', 1350,0,30);
INSERT INTO emple VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23', 1430,NULL,20);
INSERT INTO emple VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03', 12350,NULL,30);
INSERT INTO emple VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23', 1690,NULL,10);
INSERT INTO emple VALUES (7935,'GATES','EMPLEADO',7782,'1992/01/23', 1690,NULL,50);


#1 Mostrar el apellido, oficio y número de departamento de cada empleado.

#2 Mostrar el número, nombre y localización de cada departamento.

#3 Mostrar todos los datos de todos los empleados.

#4 Datos de los empleados ordenados por apellidos.

#5 Datos de los empleados ordenados por número de departamento descendentemente.

#6 Datos de los empleados ordenados por número de departamento descendentemente 
#y dentro de cada departamento ordenados por apellido ascendentemente.

#8 Mostrar los datos de los empleados cuyo salario sea mayor que 2000.

#9 Mostrar los datos de los empleados cuyo oficio sea ʻANALISTAʼ.

#10 Seleccionar el apellido y oficio de los empleados del departamento número 20.

#11 Mostrar todos los datos de los empleados ordenados por apellido.

#12 Seleccionar los empleados cuyo oficio sea ʻVENDEDORʼ. Mostrar los datos ordenados por apellido.

#13 Mostrar los empleados cuyo departamento sea 20 y cuyo oficio sea ʻANALISTAʼ.
# Ordenar el resultado por apellido.

#14 Mostrar los empleados que tengan un salario mayor que 2.000 o que pertenezcan al departamento número 20.

#15 Ordenar los empleados por oficio, y dentro de oficio por apellido.

#16 Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por ʻAʼ.

#17 Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por ʻZʼ.

#18 Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por
#ʻAʼ y el OFICIO tenga una ʻEʼ en cualquier posición.

#19 Seleccionar los empleados cuyo salario esté entre 1.000 y 2.000.
# Utilizar el operador BETWEEN.

#20 Obtener los empleados cuyo oficio sea ʻVENDEDORʼ y tengan una comisión superior a 1.000.

#21 Seleccionar los datos de los empleados ordenados por número de departamento,
# y dentro de cada departamento ordenados por apellido.

#22 Número y apellidos de los empleados cuyo apellido termine por ʻZʼ y tengan un salario superior a 3000.

#23. Datos de los departamentos cuya localización empiece por ʻBʼ.

#24. Datos de los empleados cuyo oficio sea ʻEMPLEADOʼ, tengan un salario
#superior a 1.000 y pertenezcan al departamento número 10.

#25. Mostrar los apellidos de los empleados que no tengan comisión.

#26. Mostrar los apellidos de los empleados que no tengan comisión y cuyo apellido empiece por ʻJʼ.

#27. Mostrar los apellidos de los empleados cuyo oficio sea ʻVENDEDORʼ, ʻANALISTAʼ o ʻEMPLEADOʼ.

#28. Mostrar los apellidos de los empleados cuyo oficio no sea ni ʻANALISTAʼ ni
#ʻEMPLEADOʼ, y además tengan un salario mayor de 2.000.

#29 Seleccionar de la tabla EMPLE los empleados cuyo salario esté entre
#2.000 y 3.000 (utilizar BETWEEN).

#30 Seleccionar el apellido, salario y número de departamento de los empleados
# cuyo salario sea mayor que 2.000 en los departamentos 10 ó 30.


#31. Mostrar el apellido y número de los empleados cuyo salario no esté entre
#  1.000 y 2.000 (utilizar BETWEEN).

#32.Obtener el apellidos de todos los empleados en minúscula.

#33.En una consulta concatena el apellido de cada empleado con su oficio.

#34. Mostrar el apellido y la longitud del apellido (función LENGTH) de todos
# los empleados, ordenados por la longitud de los apellidos de los empleados descendentemente.

#35.Obtener el año de contratación de todos los empleados (función YEAR).

#36. Mostrar los datos de los empleados que hayan sido contratados en el año 1992.

#37. Mostrar los datos de los empleados que hayan sido contratados en el 
# mes de febrero de cualquier año (función MONTHNAME).

#38. Para cada empleado mostrar el apellido y el mayor valor del salario y la
# comisión que tienen.

#39. Mostrar los datos de los empleados cuyo apellido empiece por 'A' y
#hayan sido contratados en el año 1990.

#40. Mostrar los datos de los empleados del departamento 10 que no tengan comisión.


