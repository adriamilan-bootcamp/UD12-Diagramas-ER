CREATE DATABASE Ejercicio13;

use Ejercicio13;

CREATE TABLE Empleados (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(35),
  apellido1 varchar(35),
  apellido2 varchar(35),
  numeroSS varchar(12),
  telefono_fijo int,
  telefono_movil int,
  PRIMARY KEY (id)
);

CREATE TABLE Cocineros (
  ID int NOT NULL AUTO_INCREMENT,
  años_servicio int,
  id_emplado int,
  PRIMARY KEY (ID),
  KEY id_emplado (id_emplado),
  CONSTRAINT id_emplado FOREIGN KEY (id_emplado) REFERENCES Empleados (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pinches (
  Id int NOT NULL AUTO_INCREMENT,
  fecha_nacimiento date,
  id_cocinero int,
  id_empleado int,
  PRIMARY KEY (Id),
  KEY id_empleado_idx (id_empleado),
  KEY id_cocinero_idx (id_cocinero),
  CONSTRAINT id_cocinero FOREIGN KEY (id_cocinero) REFERENCES Cocineros (ID),
  CONSTRAINT id_empleado FOREIGN KEY (id_empleado) REFERENCES Empleados (id)
);

CREATE TABLE Almacenes (
  numero int NOT NULL AUTO_INCREMENT,
  nombre varchar(255),
  descripcion varchar(255),
  PRIMARY KEY (numero)
);

CREATE TABLE Estantes (
  id int NOT NULL AUTO_INCREMENT,
  identificador varchar(5),
  id_almacen int,
  PRIMARY KEY (id),
  KEY esdtante_almacen_idx (id_almacen),
  CONSTRAINT esdtante_almacen FOREIGN KEY (id_almacen) REFERENCES Almacenes (numero)
);


CREATE TABLE Ingredientes (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(25),
  precio double,
  cantidad int,
  PRIMARY KEY (id)
);

CREATE TABLE Tipos (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(35),
  PRIMARY KEY (id)
);

CREATE TABLE Plato (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(35),
  precio int,
  id_tipo int,
  PRIMARY KEY (id),
  KEY id_tipo_idx (id_tipo),
  CONSTRAINT id_tipo FOREIGN KEY (id_tipo) REFERENCES Tipos (id)
);

CREATE TABLE Cociner_Plato_Saber (
  id int NOT NULL AUTO_INCREMENT,
  id_cocinero int NOT NULL,
  id_plato int NOT NULL,
  PRIMARY KEY (id),
  KEY Cocinero_Plato_idx (id_cocinero),
  KEY Plato_Cocinero_idx (id_plato),
  CONSTRAINT Cocinero_Plato FOREIGN KEY (id_cocinero) REFERENCES Cocineros (ID),
  CONSTRAINT Plato_Cocinero FOREIGN KEY (id_plato) REFERENCES Plato (id)
);

CREATE TABLE Cocinero_Plato_Hacer (
  Id int NOT NULL AUTO_INCREMENT,
  id_plato int,
  id_cocinero int,
  PRIMARY KEY (Id),
  KEY id_plato_idx (id_plato),
  KEY id_cocinero_idx (id_cocinero),
  CONSTRAINT id_cocinero_hacer FOREIGN KEY (id_cocinero) REFERENCES Cocineros (ID),
  CONSTRAINT id_plato_hacer FOREIGN KEY (id_plato) REFERENCES Plato (id)
);

CREATE TABLE Estantes_Ingredientes (
  id int NOT NULL AUTO_INCREMENT,
  id_estante int,
  id_ingrediente int,
  PRIMARY KEY (id),
  KEY estante_idx (id_estante),
  KEY ingrediente_idx (id_ingrediente),
  CONSTRAINT estante FOREIGN KEY (id_estante) REFERENCES Estantes (id),
  CONSTRAINT ingrediente FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes (id)
);

CREATE TABLE Plato_Ingrediente (
  Id int NOT NULL AUTO_INCREMENT,
  Id_plato int,
  Id_ingrediente int,
  PRIMARY KEY (Id),
  KEY id_plato_idx (id_plato),
  KEY id_ingrediente_idx (id_ingrediente),
  CONSTRAINT id_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes (id),
  CONSTRAINT id_plato FOREIGN KEY (id_plato) REFERENCES Plato (id)
);




INSERT INTO Almacenes VALUES (1,'Almacen Star','Almacen de 1000m2 ubicado en Pontevedra'),(2,'Almacen Freixneer','Almacen de 600m2 ubicado en Reus');

INSERT INTO Cociner_Plato_Saber VALUES (1,1,1),(2,1,4),(3,1,5);

INSERT INTO Cocinero_Plato_Hacer VALUES (3,4,1),(4,5,1);

INSERT INTO Cocineros VALUES (1,20,1);

INSERT INTO Empleados VALUES (1,'Clara','Ogalla','Moreno','999666999',666999666,666999666),(2,'Adria','Milan','Moreno','999666997',123213123,321231412),(3,'Pablo ','Motos','Burgos','999666994',123123123,321321321);

INSERT INTO Estantes VALUES (1,'421',1),(2,'543',2);

INSERT INTO Estantes_Ingredientes VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6);

INSERT INTO Ingredientes VALUES (1,'Solomillo de Wayu',18,20),(2,'Patata',0.06,80),(3,'Paquete Sal de Escamas',0.05,30),(4,'Aceite',0.5,20),(5,'Bistec',6.99,20),(6,'Longanizade VIC',16,32);

INSERT INTO Pinches VALUES (1,'2004-02-04',1,2);

INSERT INTO Plato VALUES (1,'Cacatua al horno',32,1),(4,'Bistec con patatas',21,2),(5,'Solomillo de Waygu',18,2),(6,'Capybara a la plancha',NULL,NULL);

INSERT INTO Plato_Ingrediente VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,5,6),(6,5,2),(7,5,3),(8,5,4);

INSERT INTO Tipos VALUES (1,'Postre'),(2,'Comida'),(3,'Cena');