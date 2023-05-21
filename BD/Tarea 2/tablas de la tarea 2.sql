SET NAMES utf8mb4;
DROP SCHEMA IF EXISTS olimpiadas2;
CREATE SCHEMA olimpiadas2;
USE olimpiadas2;
CREATE TABLE olimpiadas2.Pais
(
    idpais SMALLINT NOT NULL AUTO_INCREMENT,
    nombrepais VARCHAR(40) NOT NULL,
    NumParticipantes INT NOT NULL,
    NumMedallas INT NOT NULL,
    PRIMARY KEY (idpais)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.Deportistas
(
	Matricula SMALLINT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL,
    Apellido VARCHAR(40) NOT NULL,
    Sexo VARCHAR(12) NOT NULL,
	PRIMARY KEY (Matricula)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.Representa
(
	IdRespresenta SMALLINT NOT NULL AUTO_INCREMENT ,
    PRIMARY KEY(IdRespresenta),
	IdPais SMALLINT NOT NULL,
    IdMatricula SMALLINT NOT NULL,
	CONSTRAINT FK_Representa_IdPais FOREIGN KEY (IdPais) REFERENCES olimpiadas2.Pais(idpais),
	CONSTRAINT FK_Representa_IdMatricula FOREIGN KEY (IdMatricula) REFERENCES olimpiadas2.Deportistas(Matricula)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.PuntuajeAcumulado
(
	IdPutuajeAC SMALLINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(IdPutuajeAC),
	IdMatricula SMALLINT NOT NULL,
    Puntuaje SMALLINT NOT NULL,
	CONSTRAINT FK_PuntuajeAcumulado_IdMatricula FOREIGN KEY (IdMatricula) REFERENCES olimpiadas2.Deportistas(Matricula)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.Disciplina
(
	IdDisciplina SMALLINT NOT NULL AUTO_INCREMENT,
    TituloDisciplina VARCHAR(40) NOT NULL,
    TipoDisciplina VARCHAR(40) NOT NULL,
    PuntuajeMaximo INT NOT NULL,
    PRIMARY KEY (IdDisciplina)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.Prueba
(
	IdPrueba SMALLINT NOT NULL AUTO_INCREMENT,
    Flecha DATE NOT NULL,
    Lugar VARCHAR(40) NOT NULL,
    Inscritos INT NOT NULL,
    FrasesPrueba VARCHAR(15),
    PRIMARY KEY (IdPrueba)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.Clasificacion
(
	IdClasificacion SMALLINT NOT NULL AUTO_INCREMENT,
    Rango INT NOT NULL,
    PRIMARY KEY (IdClasificacion)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.Participacion
(
	IdParticipacion SMALLINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(IdParticipacion),
	IdDisciplina SMALLINT NOT NULL,
    IdPrueba SMALLINT NOT NULL,
	CONSTRAINT FK_Participacion_IdDisciplina FOREIGN KEY (IdDisciplina) REFERENCES olimpiadas2.Disciplina(IdDisciplina),
    CONSTRAINT FK_Participacion_IdPrueba FOREIGN KEY (IdPrueba) REFERENCES olimpiadas2.Prueba(IdPrueba)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE olimpiadas2.Puesto
(
	IdPuesto SMALLINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(IdPuesto),
	IdMatricula SMALLINT NOT NULL,
	IdClasificacion SMALLINT NOT NULL,
    IdPrueba SMALLINT NOT NULL,
    CONSTRAINT FK_Puesto_IdMatricula FOREIGN KEY (IdMatricula) REFERENCES olimpiadas2.Deportistas(Matricula),
	CONSTRAINT FK_Puesto_IdClasificacion FOREIGN KEY (IdClasificacion) REFERENCES olimpiadas2.Clasificacion(IdClasificacion),
    CONSTRAINT FK_Puesto_IdPrueba FOREIGN KEY (IdPrueba) REFERENCES olimpiadas2.Prueba(IdPrueba)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

