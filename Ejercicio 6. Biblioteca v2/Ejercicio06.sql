CREATE database Ejercicio06;

use Ejercicio06;

CREATE TABLE Autores (
  Id int NOT NULL AUTO_INCREMENT,
  nombre varchar(35),
  pais varchar(25),
  PRIMARY KEY (Id)
);

CREATE TABLE Articulos(
  Id int NOT NULL AUTO_INCREMENT,
  nombre varchar(35),
  fecha Date,
  descripcion varchar(255),
  deteriorado boolean,
  comentarioDeteriorado varchar(255) NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE Libros(
  Id int NOT NULL AUTO_INCREMENT,
  paginas varchar(35),
  Id_artiuclo int,
  PRIMARY KEY (Id),
  CONSTRAINT Id_articulo_libro FOREIGN KEY (Id) REFERENCES Articulos( Id )
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


CREATE TABLE CDs(
  Id int NOT NULL AUTO_INCREMENT,
  canciones int,
  Id_artiuclo int,
  PRIMARY KEY (Id),
  CONSTRAINT Id_articulo_cd FOREIGN KEY (Id) REFERENCES Articulos( Id )
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


CREATE TABLE Peliculas(
  Id int NOT NULL AUTO_INCREMENT,
  mintuos_duracion int, 
  Id_artiuclo int,
  PRIMARY KEY (Id),
  CONSTRAINT Id_articulo_pelicula FOREIGN KEY (Id) REFERENCES Articulos( Id )
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


CREATE TABLE Socios(
  codigoS int NOT NULL AUTO_INCREMENT,
  DNI varchar(10),
  nombre varchar(35),
  apellidos varchar(75),
  descripcion varchar(40),
  PRIMARY KEY (codigoS)
);

CREATE TABLE Telefonos(
  numero varchar(12) NOT NULL,
  codigo_socio int,
  PRIMARY KEY (numero),
  CONSTRAINT codigo_socio_tel FOREIGN KEY (codigo_socio) REFERENCES Socios( codigoS )
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE Prestamos(
  Id int NOT NULL AUTO_INCREMENT,
  fecha Date,
  fecha_tope Date,
  fecha_devolucion Date NULL,
  codigo_socio int,
  PRIMARY KEY (Id),
  CONSTRAINT codigoS_prestamo FOREIGN KEY (codigo_socio) REFERENCES Socios ( codigoS )
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE Prestamo_Articulo(
  Id int NOT NULL AUTO_INCREMENT,
  Id_prestamo int,
  Id_articulo int,
  PRIMARY KEY (Id),
  CONSTRAINT Id_prestamo_act FOREIGN KEY (id_prestamo) REFERENCES Prestamos ( Id )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT Id_articulo_prestado FOREIGN KEY (id_articulo) REFERENCES Articulos( Id )
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE Autor_Articulo(
  Id int NOT NULL AUTO_INCREMENT,
  Id_autor int,
  Id_articulo int,
  PRIMARY KEY (Id),
  CONSTRAINT Id_autor FOREIGN KEY (Id_autor) REFERENCES Autores ( Id )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT Id_articulo_hecho FOREIGN KEY (id_articulo) REFERENCES Articulos( Id )
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

INSERT INTO `Articulos` VALUES (1,'Homo Deus','2015-01-01','Homo Deus es un libro',0,NULL),(2,'Doce monos','1995-01-01','Un presidiario del futuro',1,'caja rota'),(3,'Map of the Soul','2019-01-01','BTS DISCO',0,NULL);
INSERT INTO `Autor_Articulo` VALUES (1,3,1),(2,2,3),(3,1,2);
INSERT INTO `Autores` VALUES (1,'Terry Gilliam','Estados Unidos'),(2,'BTS','Corea del Sur'),(3,'Yuval Noah Harari','Israel');
INSERT INTO `CDs` VALUES (1,7,3);
INSERT INTO `Libros` VALUES (1,'456',1);
INSERT INTO `Peliculas` VALUES (1,135,2);
INSERT INTO `Socios` VALUES (1234,'12345678C','Antonio','Alvarez','Moroso'),(1235,'43215678C','Celes','Milan','Devuelve a tiempo'),(1236,'12348765C','Clara','Llantos','Da propina');
INSERT INTO `Prestamos` VALUES (5,'2022-07-24','2022-07-27','2022-07-26',1234),(6,'2022-07-22','2022-07-26','2022-07-28',1235),(7,'2022-07-24','2022-07-25',NULL,1236);
INSERT INTO `Prestamo_Articulo` VALUES (3,NULL,3),(4,NULL,1),(5,NULL,2);
INSERT INTO `Telefonos` VALUES ('123123123',1234),('321321321',1235);