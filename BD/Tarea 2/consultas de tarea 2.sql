USE olimpiadas2;

-- Apellidos y nombre de los participantes de nacionalidad mexicana.
SELECT Deportistas.Nombre, Deportistas.Apellido
FROM Deportistas 
INNER JOIN olimpiadas2.Representa ON Deportistas.Matricula = Representa.IdMatricula
INNER JOIN olimpiadas2.Pais ON Representa.IdPais = Pais.idpais
WHERE Pais.nombrepais = 'Mexico'
ORDER BY Deportistas.Apellido;

-- Apellidos, nombre y puntos acumulados de los participantes de USA.
SELECT Deportistas.Apellido, Deportistas.Nombre, PuntuajeAcumulado.Puntuaje
FROM Deportistas
INNER JOIN olimpiadas2.PuntuajeAcumulado ON Deportistas.Matricula = PuntuajeAcumulado.IdMatricula
INNER JOIN olimpiadas2.Representa ON Deportistas.Matricula = Representa.IdMatricula
INNER JOIN olimpiadas2.Pais ON Representa.IdPais = Pais.idpais
WHERE Pais.nombrepais = 'Estados Unidos';

-- Apellidos y nombre de los participantes que se clasificaron en primer lugar en al menos una competencia.
SELECT Deportistas.Apellido, Deportistas.Nombre
FROM Deportistas
INNER JOIN olimpiadas2.Puesto ON Deportistas.Matricula = Puesto.IdMatricula
INNER JOIN olimpiadas2.Clasificacion ON Puesto.IdClasificacion = Clasificacion.IdClasificacion
WHERE Clasificacion.Rango = 1;

-- Nombre de las competencias en las que intervinieron los participantes mexicanos.
SELECT DISTINCT olimpiadas2.Disciplina.TituloDisciplina
FROM olimpiadas2.Prueba
INNER JOIN olimpiadas2.Participacion ON olimpiadas2.Prueba.IdPrueba = olimpiadas2.Participacion.IdPrueba
INNER JOIN olimpiadas2.Disciplina ON olimpiadas2.Participacion.IdDisciplina = olimpiadas2.Disciplina.IdDisciplina
INNER JOIN olimpiadas2.Puesto ON olimpiadas2.Prueba.IdPrueba = olimpiadas2.Puesto.IdPrueba
INNER JOIN olimpiadas2.Deportistas ON olimpiadas2.Puesto.IdMatricula = olimpiadas2.Deportistas.Matricula
INNER JOIN olimpiadas2.Representa ON olimpiadas2.Deportistas.Matricula = olimpiadas2.Representa.IdMatricula
INNER JOIN olimpiadas2.Pais ON olimpiadas2.Representa.IdPais = olimpiadas2.Pais.idpais
WHERE olimpiadas2.Pais.nombrepais = 'México';

-- Apellidos y nombre de los participantes que nunca se clasificaron en primer lugar en alguna competencia.
SELECT Deportistas.Apellido, Deportistas.Nombre
FROM olimpiadas2.Deportistas
WHERE Deportistas.Matricula NOT IN (
    SELECT Puesto.IdMatricula
    FROM olimpiadas2.Puesto
    INNER JOIN olimpiadas2.Clasificacion ON Puesto.IdClasificacion = Clasificacion.IdClasificacion
    WHERE Clasificacion.Rango = 1
);

-- Apellidos y nombre de los participantes que siempre se clasificaron en alguna competencia.
SELECT Deportistas.Apellido, Deportistas.Nombre
FROM olimpiadas2.Deportistas
WHERE Deportistas.Matricula IN (
    SELECT Puesto.IdMatricula
    FROM olimpiadas2.Puesto
);

-- Nombre de la competencia que aporta el máximo de puntos.
SELECT Disciplina.TituloDisciplina
FROM olimpiadas2.Disciplina
WHERE Disciplina.PuntuajeMaximo = (
    SELECT MAX(PuntuajeMaximo)
    FROM olimpiadas2.Disciplina
);

-- Países (nacionalidades) que participaron en todas las competencias.
SELECT olimpiadas2.Pais.nombrepais
FROM olimpiadas2.Pais
WHERE NOT EXISTS (
    SELECT olimpiadas2.Prueba.IdPrueba
    FROM olimpiadas2.Prueba
    WHERE NOT EXISTS (
        SELECT olimpiadas2.Representa.IdMatricula
        FROM olimpiadas2.Representa
        WHERE olimpiadas2.Representa.IdPais = olimpiadas2.Pais.idpais AND olimpiadas2.Representa.IdRespresenta = olimpiadas2.Prueba.IdPrueba
    )
);

-- Nombre del pais y participante que consiguio el minimo de puntos.
SELECT olimpiadas2.Pais.nombrepais , olimpiadas2.deportistas.Nombre
FROM olimpiadas2.Pais
INNER JOIN olimpiadas2.Representa ON olimpiadas2.Pais.idpais = olimpiadas2.Representa.IdPais
INNER JOIN olimpiadas2.Deportistas ON olimpiadas2.Representa.IdMatricula = olimpiadas2.Deportistas.Matricula
INNER JOIN olimpiadas2.PuntuajeAcumulado ON olimpiadas2.Deportistas.Matricula = olimpiadas2.PuntuajeAcumulado.IdMatricula
WHERE olimpiadas2.PuntuajeAcumulado.Puntuaje = (
    SELECT MIN(Puntuaje)
    FROM olimpiadas2.PuntuajeAcumulado
);

-- EL numero deportista segun el sexo
SELECT Deportistas.Sexo, COUNT(Representa.IdMatricula) AS Numero_Deportistas
FROM olimpiadas2.Deportistas
LEFT JOIN olimpiadas2.Representa ON Deportistas.Matricula = Representa.IdMatricula
GROUP BY Deportistas.Sexo;

-- Los cinco pais con el mayor de puntos acumulados 
SELECT olimpiadas2.pais.nombrepais, COUNT(olimpiadas2.representa.IdMatricula) AS NumeroDeportista, SUM(olimpiadas2.puntuajeacumulado.Puntuaje) AS PuntuajeTotal
FROM olimpiadas2.Pais
LEFT JOIN olimpiadas2.Representa ON olimpiadas2.pais.idpais = olimpiadas2.representa.IdPais
LEFT JOIN olimpiadas2.PuntuajeAcumulado ON olimpiadas2.representa.IdMatricula = olimpiadas2.PuntuajeAcumulado.IdMatricula
GROUP BY olimpiadas2.pais.idpais, olimpiadas2.pais.nombrepais
ORDER BY PuntuajeTotal DESC
LIMIT 5;

-- Titulo de la competencia, apellido y nombre, donde el nombre del deportista sea John
SELECT olimpiadas2.disciplina.TituloDisciplina, olimpiadas2.deportistas.Nombre, olimpiadas2.deportistas.Apellido
FROM olimpiadas2.deportistas
INNER JOIN olimpiadas2.puesto ON deportistas.Matricula = Puesto.IdMatricula
INNER JOIN olimpiadas2.participacion ON puesto.IdPrueba = participacion.IdPrueba
INNER JOIN olimpiadas2.disciplina ON participacion.IdDisciplina = disciplina.IdDisciplina
WHERE deportistas.Nombre like '%John%'
