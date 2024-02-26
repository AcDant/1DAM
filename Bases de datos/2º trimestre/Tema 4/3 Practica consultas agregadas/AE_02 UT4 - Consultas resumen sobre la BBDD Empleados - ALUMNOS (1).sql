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

-- Utilizar un alias adecuado en todas las consultas
-- 1A Mostrar cuantos empleados están registrados en la BBDD con el alias: Nº de empleados.

-- 1B Mostrar el número de empleados que cobran comisión. Poner un alias.

-- 2 Mostrar la suma de todos los salarios

-- 3 Mostrar el salario más bajo

-- 4 Mostrar la comisión más alta

-- 5 Mostrar el salario medio de la empresa

-- 6 Mostrar el número de empleados que tiene cada departamento

-- 7 Mostrar el salario máximo por departamento

 -- 8 Mostrar los oficios con un media salarial por encima de 3100
 
-- 9 Mostrar los departamentos que solo tienen un trabajador con oficio de empleado

-- 10 Mostrar el salario mínimo de cada departamento de los trabajadores dados de alta en 1991.
--  Mostrar sólo los departamentos con un salario mínimo por debajo de 2000
