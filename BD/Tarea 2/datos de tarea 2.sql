-- Insertar datos en la tabla Pais
INSERT INTO olimpiadas2.Pais(nombrepais, NumParticipantes, NumMedallas)
VALUES ('Mexico', 1, 7),
       ('Estados Unidos', 1, 4),
       ('Canada', 1, 8),
       ('Belice', 1, 5),
       ('Guatemala', 1, 7),
       ('Ecuador', 1, 8),
       ('Venezuela', 1, 11),
       ('Peru', 2, 4),
       ('Colombia', 1, 7),
       ('Brazil', 2, 13),
       ('Paraguay', 2, 9),
       ('Uruguay', 1, 10),
       ('Chile', 1, 12),
       ('Argentina', 1, 5),
       ('Bolivia', 1, 8);

-- Insertar datos en la tabla Deportistas
INSERT INTO olimpiadas2.Deportistas(Nombre, Apellido, Sexo)
VALUES ('Juana', 'Perez', 'Femenino'),
       ('Laura', 'Martinez', 'Femenino'),
       ('Parcival', 'Grozo', 'Masculino'),
       ('Alan', 'Hernandez', 'Masculino'),
       ('Alejandra', 'Córdoba', 'Femenino'),
       ('Andres', 'Barron', 'Masculino'),
       ('John', 'Wick', 'Masculino'),
       ('Octavio', 'juarez', 'Masculino'),  
       ('Gil', 'Salas', 'Masculino'),
       ('Esteban', 'Gomez', 'Masculino'),
       ('Logan', 'Paul', 'Masculino'),
       ('Jake', 'Paul', 'Masculino'),
       ('Finn', 'Jakes', 'Masculino'),
       ('Larry', 'Freeman', 'Masculino'),
       ('Julia', 'Roberts', 'Femenino'),
       ('Steve', 'Stevenson', 'Masculino'),
       ('Alejandro', 'Fernandez', 'Masculino');
       
-- Inserta datos en la tabla Puntuaje acumulado
INSERT INTO olimpiadas2.puntuajeacumulado(IdMatricula,Puntuaje)
VALUES(1,50),
	(2,90),
    (3,80),
    (4,545),
    (5,80),
    (6,70),
    (7,60),
    (8,30),
    (9,20),
    (10,10),
    (11,70),
    (12,20),
    (13,25),
    (14,30),
    (15,35),
    (16,12),
    (17,40);
       
-- Insertar datos en la tabla Representar
INSERT INTO olimpiadas2.Representa(IdPais,IdMatricula)
VALUES(8,1),
	(9,2),
    (1,3),
    (2,4),
    (3,5),
    (4,6),
    (5,7),
    (6,8),
    (7,9),
    (8,10),
    (10,11),
    (10,12),
    (11,13),
    (12,14),
    (13,15),
    (14,16),
    (15,17);

-- Insertar datos en la tabla Disciplina
INSERT INTO olimpiadas2.Disciplina(TituloDisciplina, TipoDisciplina, PuntuajeMaximo)
VALUES ('400m nado libre', 'Natacion', 120),
       ('Boxeo', 'De contacto', 90),
       ('Ciclismo en pista', 'Ciclismo', 110),
       ('Taekwondo', 'De contacto', 80),
       ('Lucha libre', 'De precision', 100),
       ('Remo', 'Acuatico', 90),
       ('Tenis de mesa', 'De oposicion', 70),
       ('Esgrima', 'De combate', 85),
       ('Vela', 'Acuatico', 90),
       ('Tiro de jabalina' , 'De precision', 90);

-- Insertar datos en la tabla Prueba
INSERT INTO olimpiadas2.Prueba(Flecha, Lugar, Inscritos, FrasesPrueba)
VALUES ('2040-05-10', 'Berlin', 5, 'Eliminatoria'),
       ('2040-05-11', 'Berlin', 2, 'final'),
       ('2040-05-12', 'Berlin', 2, 'final'),
       ('2040-05-13', 'Berlin', 2, 'final'),
       ('2040-05-14', 'Berlin', 6, 'Eliminatoria'),
       ('2040-05-15', 'Berlin', 8, 'Eliminatoria'),
       ('2040-05-16', 'Berlin', 6, 'Eliminatoria'),
       ('2040-05-17', 'Berlin', 8, 'Eliminatoria'),
       ('2040-05-18', 'Berlin', 8, 'Eliminatoria'),
       ('2040-05-19', 'Berlin', 8, 'Eliminatoria'),
       ('2040-05-20', 'Berlin', 8, 'Eliminatoria');

-- Insertar datos en la tabla Participacion
INSERT INTO olimpiadas2.Participacion(IdDisciplina, IdPrueba)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10);
       
-- Insertar datos en la tabla Clasificacion
INSERT INTO olimpiadas2.Clasificacion(Rango)
VALUES(1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);
	
-- Insertar datos en la tabla Puesto
INSERT INTO olimpiadas2.Puesto(IdMatricula, IdClasificacion, IdPrueba)
VALUES (1, 4, 1),
       (2, 1, 2),
       (3, 2, 3),
       (4,3,1),
       (4,2,2),
       (4,1,3),
       (4,2,4),
       (4,4,5),
       (4,5,6),
       (4,7,7),
       (4,8,8),
       (4,4,9),
       (4,4,10),
       (5, 1, 4),
       (6, 1, 5),
       (7, 6, 6),
       (8, 6, 7),
       (9, 4, 8),
       (10, 5, 9),
       (11,3,10),
       (12,6,5),
       (13,7,6),
       (14,8,7),
       (15,3,8),
       (16,6,9),
       (17,7,9);	