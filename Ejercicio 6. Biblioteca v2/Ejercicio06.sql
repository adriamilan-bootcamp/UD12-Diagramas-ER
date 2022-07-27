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

