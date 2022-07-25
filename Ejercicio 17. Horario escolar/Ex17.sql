CREATE DATABASE Ejercicio17;

use Ejercicio17;

CREATE TABLE Tipos (
  Id int NOT NULL AUTO_INCREMENT,
  nombre varchar(35),
  PRIMARY KEY (Id)
);
CREATE TABLE Dias(
  Id int NOT NULL AUTO_INCREMENT,
  nombre varchar(35),
  PRIMARY KEY (Id)
);

CREATE TABLE Ciclos (
  codigo_Interno INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(35),
  Id_Tipo INT,
  PRIMARY KEY (codigo_Interno),
  CONSTRAINT Id_Tipo FOREIGN KEY (Id_Tipo)  REFERENCES Tipos (Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE
);

CREATE TABLE Profesores (
  codigo_Interno INT NOT NULL AUTO_INCREMENT,
  direccion VARCHAR(35) ,
  telefono VARCHAR(11),
  email VARCHAR (40),
  DNI VARCHAR (10),
  numero_seguridad_social varchar(12),
  tutor_ciclo INT NULL,
  PRIMARY KEY (codigo_Interno),
  CONSTRAINT tutor_ciclo FOREIGN KEY (tutor_ciclo) REFERENCES Tipos (Id)
  ON DELETE SET NULL
  ON UPDATE CASCADE
  );

CREATE TABLE Asignaturas (
  codigo_Interno INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(35) ,
  codigo_europeo VARCHAR(40),
  PRIMARY KEY (codigo_Interno)
  );

CREATE TABLE Aulas(
  numero_aula INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(35) UNIQUE,
  codigo_aula VARCHAR(40) UNIQUE,
  metros DOUBLE,
  PRIMARY KEY (numero_aula)
);

CREATE TABLE Asignatura_Asignatura(
  Id INT NOT NULL AUTO_INCREMENT,
  asignatura1 INT,
  requiere_asignatura2 INT,
  PRIMARY KEY (Id),
  CONSTRAINT codigo_interno_asignatura1 FOREIGN KEY (asignatura1) REFERENCES Asignaturas (codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT codigo_interno_asignatura_requerida FOREIGN KEY (requiere_asignatura2) REFERENCES Asignaturas (codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  );


CREATE TABLE Profesor_Asignatura (
  Id INT NOT NULL AUTO_INCREMENT,
  codigo_interno_profesor INT ,
  codigo_interno_asignatura INT ,
  fecha_inicio Date,
  fecha_fin Date NULL,
  PRIMARY KEY (Id),
  CONSTRAINT codigo_interno_profesor FOREIGN KEY (codigo_interno_profesor) REFERENCES Profesores (codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE ,
  CONSTRAINT codigo_interno_asignatura FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_Interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE 
);

CREATE TABLE  Asignatura_Aula_Dia (
  Id INT NOT NULL AUTO_INCREMENT,
  codigo_interno_asignatura INT ,
  numero_aula INT,
  id_dia INT,
  hora INT,
  PRIMARY KEY (Id),
  CONSTRAINT aula_dia_asignatura_Id FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas (codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT asignatura_dia_aula_Id FOREIGN KEY (numero_aula  ) REFERENCES Aulas (numero_aula)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT asignatura_aula_dia_Id FOREIGN KEY (id_dia ) REFERENCES Dias (Id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);



CREATE TABLE  Asignatura_Ciclo_Dia (
  Id INT NOT NULL AUTO_INCREMENT,
  codigo_interno_asignatura INT ,
  codigo_Interno_ciclo INT,
  id_dia INT,
  hora INT,
  PRIMARY KEY (Id),
  CONSTRAINT ciclo_dia_asignatura_Id FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas (codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT dia_asignatura_ciclo_Id FOREIGN KEY (codigo_Interno_ciclo) REFERENCES Ciclos(codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT ciclo_asignatura_dia_Id FOREIGN KEY (id_dia ) REFERENCES Dias (Id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  );
  
  /* Inserts */

INSERT INTO Dias(nombre) VALUES ("Lunes");
INSERT INTO Dias(nombre) VALUES ("Martes");
INSERT INTO Dias(nombre) VALUES ("Miercoles");
INSERT INTO Dias(nombre) VALUES ("Jueves");
INSERT INTO Dias(nombre) VALUES ("Viernes");
INSERT INTO Dias(nombre) VALUES ("Sabado");
INSERT INTO Dias(nombre) VALUES ("Domingo");

INSERT INTO Aulas (nombre, codigo_aula, metros) VALUES ("Aula A", "AA1", 4);
INSERT INTO Aulas (nombre, codigo_aula, metros) VALUES ("Aula B", "AB1", 4.5);

INSERT INTO Tipos(nombre) VALUES ("CFGM");
INSERT INTO Tipos(nombre) VALUES ("CFGS");

INSERT INTO Ciclos(nombre , id_tipo) VALUES ("SMX", 1);
INSERT INTO Ciclos(nombre , id_tipo) VALUES ("ASIX", 2);
INSERT INTO Ciclos(nombre , id_tipo) VALUES ("DAW", 2);
INSERT INTO Ciclos(nombre , id_tipo) VALUES ("DAM", 2);

INSERT INTO Profesores (direccion , telefono , email, DNI, numero_seguridad_social, tutor_ciclo) VALUES ('C/ La Ramona','123123123','ramon@gmail.com','12345678C','123123123123',1);
INSERT INTO Profesores (direccion , telefono , email, DNI, numero_seguridad_social, tutor_ciclo)  VALUES('C/ La amargura','123321123','eduardo@gmail.com','87654321C','123321123321',2);
INSERT INTO Profesores (direccion , telefono , email, DNI, numero_seguridad_social)  VALUES ('C/ Roquefeler','321321321','manolito@gmail.com','43215678C','123123321321');

INSERT INTO Asignaturas(nombre , codigo_europeo) VALUES ("Programación 1º", "AAAA1");
INSERT INTO Asignaturas(nombre , codigo_europeo) VALUES ("Programación 2º", "AAAA2");
INSERT INTO Asignaturas(nombre , codigo_europeo) VALUES ("Servidores y mantenimiento", "AAAA3");
INSERT INTO Asignaturas(nombre , codigo_europeo) VALUES ("Servidores remotos", "AAAA4");

INSERT INTO Profesor_Asignatura(codigo_interno_profesor, codigo_interno_asignatura , fecha_inicio, fecha_fin) VALUES (1,1,'2014-04-06' ,'2020-11-06');
INSERT INTO Profesor_Asignatura(codigo_interno_profesor, codigo_interno_asignatura , fecha_inicio) VALUES (1,3,'2015-07-22');
INSERT INTO Profesor_Asignatura(codigo_interno_profesor, codigo_interno_asignatura , fecha_inicio) VALUES (2,1,'2020-11-15');
INSERT INTO Profesor_Asignatura(codigo_interno_profesor, codigo_interno_asignatura , fecha_inicio) VALUES (2,2,'2020-11-16');

INSERT INTO Asignatura_Asignatura(asignatura1,  requiere_asignatura2) VALUES (2,1);
INSERT INTO Asignatura_Asignatura(asignatura1,  requiere_asignatura2) VALUES (4,3);

INSERT INTO Asignatura_Ciclo_Dia(codigo_interno_asignatura, codigo_interno_ciclo , id_dia, hora) VALUES (2,4,1,4);
INSERT INTO Asignatura_Ciclo_Dia(codigo_interno_asignatura, codigo_interno_ciclo , id_dia, hora) VALUES (3,1,1,1);
INSERT INTO Asignatura_Ciclo_Dia(codigo_interno_asignatura, codigo_interno_ciclo , id_dia, hora) VALUES (3,1,1,2);

INSERT INTO Asignatura_Aula_Dia(codigo_interno_asignatura, numero_aula , id_dia, hora) VALUES (1,1,1,1);
INSERT INTO Asignatura_Aula_Dia(codigo_interno_asignatura, numero_aula , id_dia, hora) VALUES (3,2,1,1);
INSERT INTO Asignatura_Aula_Dia(codigo_interno_asignatura, numero_aula , id_dia, hora) VALUES (4,2,1,2);