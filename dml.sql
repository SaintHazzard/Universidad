INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');

INSERT INTO ciudad VALUES ('68001', 'Bucaramanga'), ('54002', 'San Gil');


INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');

INSERT INTO cursoEscolar VALUES (1, 2014, 2015);
INSERT INTO cursoEscolar VALUES (2, 2015, 2016);
INSERT INTO cursoEscolar VALUES (3, 2016, 2017);
INSERT INTO cursoEscolar VALUES (4, 2017, 2018);

INSERT INTO tipoAsignatura VALUES (NULL, 'básica'), (NULL, 'obligatoria'), (NULL, 'optativa');

INSERT INTO genero VALUES (NULL, 'H'), (NULL, 'M');

INSERT INTO tipoTelefono VALUES (1, 'Celular'), (2, 'Fijo');

INSERT INTO alumno VALUES (1, '89542419S', 'Juan', 'Saez', 'Vega',  '1992/08/08', 1);
INSERT INTO alumno VALUES (2, '26902806M', 'Salvador', 'Sánchez', 'Pérez', '1991/03/28', 1);
INSERT INTO alumno VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', '2000/10/05', 1);
INSERT INTO alumno VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', '1998/01/28', 1);
INSERT INTO alumno VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', '1999/05/24', 1);
INSERT INTO alumno VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', '1996/11/21', 1);
INSERT INTO alumno VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha',  '1997/04/26', 1);
INSERT INTO alumno VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', '1998/09/01', 2);
INSERT INTO alumno VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', '1998/01/01', 1);
INSERT INTO alumno VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', '1999/02/11', 1);
INSERT INTO alumno VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', '1996/03/12', 2);
INSERT INTO alumno VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', '1995/04/13', 2);


INSERT INTO profesor VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', '1979/08/19', 2, 1);
INSERT INTO profesor VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', '1978/01/19', 1, 2);
INSERT INTO profesor VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', '1977/08/21', 2, 3);
INSERT INTO profesor VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', '1977/05/19', 2, 4);
INSERT INTO profesor VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', '1971-04-29', 2, 4);
INSERT INTO profesor VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', '1980/02/01', 1, 6);
INSERT INTO profesor VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', '1977/01/02', 1, 1);
INSERT INTO profesor VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', '1980/03/14', 1, 2);
INSERT INTO profesor VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', '1982/03/18', 1, 3);
INSERT INTO profesor VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', '1973/05/05', 1, 4);
INSERT INTO profesor VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', '1976/02/25', 1, 5);
INSERT INTO profesor VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', '1980/10/31', 1, 6);
INSERT INTO profesor VALUES (21, '13175769N', 'Pepe', 'Sánchez', 'Ruiz', '1980/10/16', 1, 1);
INSERT INTO profesor VALUES (22, '98816696W', 'Juan', 'Guerrero', 'Martínez', '1980/11/21', 1, 1);
INSERT INTO profesor VALUES (23, '77194445M', 'María', 'Domínguez', 'Hernández', '1980/12/13', 2, 2);


INSERT INTO asignatura VALUES (1, 'Álgegra lineal y matemática discreta', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (2, 'Cálculo', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (3, 'Física para informática', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (4, 'Introducción a la programación', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (5, 'Organización y gestión de empresas', 6, 1, 1, NULL, 4, 1);
INSERT INTO asignatura VALUES (6, 'Estadística', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnología de computadores', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electrónica', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (9, 'Lógica y algorítmica', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (10, 'Metodología de la programación', 6, 1, 2, NULL, 4, 1);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 2, 1, 3, 4, 1);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 2, 1, 3, 4, 2);
INSERT INTO asignatura VALUES (13, 'Ingeniería del Software', 6, 2, 1, 14, 4, 2);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 2, 1, 3, 4, 2);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 2, 1, 14, 4, 2);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 2, 2, 14, 4, 1);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 2, 2, 14, 4, 2);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6, 2, 2, 3, 4, 2);
INSERT INTO asignatura VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 2, 2, 3, 4, 2);
INSERT INTO asignatura VALUES (20, 'Programación de Servicios Software', 6, 2, 2, 14, 4, 2);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 3, 1, 14, 4, 2);
INSERT INTO asignatura VALUES (22, 'Ingeniería de Requisitos', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (24, 'Modelado y Diseño del Software 1', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (27, 'Sistema de Información para las Organizaciones', 6, 3, 1, NULL, 4, 3); 
INSERT INTO asignatura VALUES (28, 'Tecnologías web', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (29, 'Teoría de códigos y criptografía', 6, 3, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (30, 'Administración de bases de datos', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (32, 'Informática industrial y robótica', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (33, 'Ingeniería de Sistemas de Información', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (34, 'Modelado y Diseño del Software 2', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (35, 'Negocio Electrónico', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (36, 'Periféricos e interfaces', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (38, 'Tecnologías de acceso a red', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de imágenes', 6, 3, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (40, 'Administración de redes y sistemas operativos', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (43, 'Líneas de Productos Software', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (45, 'Tecnologías multimedia', 6, 4, 1, NULL, 4, 3);
INSERT INTO asignatura VALUES (46, 'Análisis y planificación de las TI', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (51, 'Seguridad Informática', 6, 4, 2, NULL, 4, 3);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (53, 'Física', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (54, 'Matemáticas I', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (55, 'Química general', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (56, 'Química orgánica', 6, 1, 1, NULL, 7, 1);
INSERT INTO asignatura VALUES (57, 'Biología vegetal y animal', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (58, 'Bioquímica', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (59, 'Genética', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (60, 'Matemáticas II', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (61, 'Microbiología', 6, 1, 2, NULL, 7, 1);
INSERT INTO asignatura VALUES (62, 'Botánica agrícola', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (63, 'Fisiología vegetal', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (64, 'Genética molecular', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (65, 'Ingeniería bioquímica', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (66, 'Termodinámica y cinética química aplicada', 6, 2, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (68, 'Biotecnología microbiana', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (69, 'Ingeniería genética', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (70, 'Inmunología', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (71, 'Virología', 6, 2, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (73, 'Fisiología animal', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (75, 'Operaciones de separación', 6, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (76, 'Patología molecular de plantas', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (77, 'Técnicas instrumentales básicas', 4.5, 3, 1, NULL, 7, 2);
INSERT INTO asignatura VALUES (78, 'Bioinformática', 4.5, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (80, 'Biotecnología vegetal', 6, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (81, 'Genómica y proteómica', 4.5, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnológicos', 6, 3, 2, NULL, 7, 2);
INSERT INTO asignatura VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 3, 2, NULL, 7, 2);

INSERT INTO alumnoAsignatura VALUES (23, 2, 1);
INSERT INTO alumnoAsignatura VALUES (1, 1, 1);
INSERT INTO alumnoAsignatura VALUES (1, 2, 1);
INSERT INTO alumnoAsignatura VALUES (1, 3, 1);
INSERT INTO alumnoAsignatura VALUES (1, 4, 1);
INSERT INTO alumnoAsignatura VALUES (1, 5, 1);
INSERT INTO alumnoAsignatura VALUES (1, 6, 1);
INSERT INTO alumnoAsignatura VALUES (1, 7, 1);
INSERT INTO alumnoAsignatura VALUES (1, 8, 1);
INSERT INTO alumnoAsignatura VALUES (1, 9, 1);
INSERT INTO alumnoAsignatura VALUES (1, 10, 1);

INSERT INTO alumnoAsignatura VALUES (1, 1, 2);
INSERT INTO alumnoAsignatura VALUES (1, 2, 2);
INSERT INTO alumnoAsignatura VALUES (1, 3, 2);

INSERT INTO alumnoAsignatura VALUES (1, 1, 3);
INSERT INTO alumnoAsignatura VALUES (1, 2, 3);
INSERT INTO alumnoAsignatura VALUES (1, 3, 3);

INSERT INTO alumnoAsignatura VALUES (1, 1, 4);
INSERT INTO alumnoAsignatura VALUES (1, 2, 4);
INSERT INTO alumnoAsignatura VALUES (1, 3, 4);

INSERT INTO alumnoAsignatura VALUES (2, 1, 1);
INSERT INTO alumnoAsignatura VALUES (2, 2, 1);
INSERT INTO alumnoAsignatura VALUES (2, 3, 1);

INSERT INTO alumnoAsignatura VALUES (4, 1, 1);
INSERT INTO alumnoAsignatura VALUES (4, 2, 1);
INSERT INTO alumnoAsignatura VALUES (4, 3, 1);

INSERT INTO alumnoAsignatura VALUES (4, 1, 2);
INSERT INTO alumnoAsignatura VALUES (4, 2, 2);
INSERT INTO alumnoAsignatura VALUES (4, 3, 2);
INSERT INTO alumnoAsignatura VALUES (4, 4, 2);
INSERT INTO alumnoAsignatura VALUES (4, 5, 2);
INSERT INTO alumnoAsignatura VALUES (4, 6, 2);
INSERT INTO alumnoAsignatura VALUES (4, 7, 2);
INSERT INTO alumnoAsignatura VALUES (4, 8, 2);
INSERT INTO alumnoAsignatura VALUES (4, 9, 2);
INSERT INTO alumnoAsignatura VALUES (4, 10, 2);

INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('Centro', 'Calle 36', 'Carrera 15', '68001', 1);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('Cabecera', 'Calle 48', 'Carrera 27', '68001', 2);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('Floridablanca', 'Calle 200', 'Carrera 33', '68001', 4);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('Provenza', 'Calle 38', 'Carrera 29', '68001', 6);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('La Floresta', 'Calle 45', 'Carrera 20', '68001', 7);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('San Francisco', 'Calle 34', 'Carrera 18', '68001', 9);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('La Universidad', 'Calle 42', 'Carrera 27', '68001', 11);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('El Prado', 'Calle 38', 'Carrera 29', '68001', 21);
INSERT INTO direccionAlumno (sector, calle, carrera, idCiudadD, idAlumnoDir) VALUES ('Cañaveral', 'Calle 44', 'Carrera 20', '68001', 22);

INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('Centro', 'Calle 36', 'Carrera 15', '68001', 3);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('Cabecera', 'Calle 48', 'Carrera 27', '68001', 5);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('Floridablanca', 'Calle 200', 'Carrera 33', '68001', 8);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('Provenza', 'Calle 38', 'Carrera 29', '68001', 10);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('La Floresta', 'Calle 45', 'Carrera 20', '68001', 12);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('San Francisco', 'Calle 34', 'Carrera 18', '68001', 13);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('La Universidad', 'Calle 42', 'Carrera 27', '68001', 14);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('La Aurora', 'Calle 50', 'Carrera 15', '68001', 15);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('El Prado', 'Calle 38', 'Carrera 29', '68001', 16);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('Cañaveral', 'Calle 44', 'Carrera 20', '68001', 17);
-- San gil
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('Centro', 'Calle 11', 'Carrera 9', '54002', 18);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('La Libertad', 'Calle 7', 'Carrera 10', '54002', 19);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('El Puente', 'Calle 14', 'Carrera 8', '54002', 20);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('El Bosque', 'Calle 15', 'Carrera 6', '54002', 21);
INSERT INTO direccionProfesor (sector, calle, carrera, idCiudadD, idProfesorDir) VALUES ('La Floresta', 'Calle 17', 'Carrera 12', '54002', 22);

-- Teléfonos de ejemplo para distintos tipos
INSERT INTO telefonoProfesor VALUES (NULL, 1234567890, 1, 3),(NULL, 987654321, 2, 5),(NULL, 5555555555, 1, 8),(NULL, 4444444444, 1, 10),
(NULL, 7777777777, 2, 12),(NULL, 8888888888, 1, 13); 

INSERT INTO telefonoAlumno VALUES (NULL, 3333333333, 1, 1),(NULL, 2222222222, 2, 2),(NULL, 6666666666, 1, 4),(NULL, 9999999999, 1, 6),(NULL, 1111111111, 2, 7),(NULL, 1010101010, 1, 9); 