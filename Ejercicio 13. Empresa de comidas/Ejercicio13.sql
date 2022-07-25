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

CREATE TABLE `Estantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identificador` varchar(5) DEFAULT NULL,
  `id_almacen` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `esdtante_almacen_idx` (`id_almacen`),
  CONSTRAINT `esdtante_almacen` FOREIGN KEY (`id_almacen`) REFERENCES `Almacenes` (`numero`)
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

CREATE TABLE `Plato_Ingrediente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_plato` int DEFAULT NULL,
  `Id_ingrediente` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `id_plato_idx` (`id_plato`),
  KEY `id_ingrediente_idx` (`id_ingrediente`),
  CONSTRAINT `id_ingrediente` FOREIGN KEY (`id_ingrediente`) REFERENCES `Ingredientes` (`id`),
  CONSTRAINT `id_plato` FOREIGN KEY (`id_plato`) REFERENCES `Plato` (`id`)
);
