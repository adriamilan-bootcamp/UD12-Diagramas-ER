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
  nombre VARCHAR(35) ,
  codigo_aula VARCHAR(40),
  metros DOUBLE,
  PRIMARY KEY (numero_aula)
);

CREATE TABLE Asignatura_Asignatura(
  Id INT NOT NULL AUTO_INCREMENT,
  codigo_interno_asignatura1 INT,
  codigo_interno_asignatura2 INT,
  PRIMARY KEY (Id),
  CONSTRAINT codigo_interno_asignatura1 FOREIGN KEY (codigo_interno_asignatura1) REFERENCES Asignaturas (codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT codigo_interno_asignatura_requerida FOREIGN KEY (codigo_interno_asignatura2) REFERENCES Asignaturas (codigo_interno)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  );


CREATE TABLE Profesor_Asignatura (
  Id INT NOT NULL AUTO_INCREMENT,
  codigo_interno_profesor INT ,
  codigo_interno_asignatura INT ,
  fecha_inicio Date,
  fecha_fin Date,
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