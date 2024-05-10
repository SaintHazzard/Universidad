

# 		Base de datos universitaria 

![](https://github.com/Michael-Chacon/ProyectoBaseDeDatosUniversidad/blob/main/img/DER.png?raw=true)



## Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre. 

   ```sql
   SELECT apellidoAlumno1, apellidoAlumno2, nombreAlumno
   FROM alumno 
   ORDER BY apellidoAlumno1 ASC, apellidoAlumno2 ASC, nombreAlumno ASC;
   +-----------------+-----------------+--------------+
   | apellidoAlumno1 | apellidoAlumno2 | nombreAlumno |
   +-----------------+-----------------+--------------+
   | Domínguez       | Guerrero        | Antonio      |
   | Gea             | Ruiz            | Sonia        |
   | Gutiérrez       | López           | Juan         |
   | Heller          | Pagac           | Pedro        |
   | Herman          | Pacocha         | Daniel       |
   | Hernández       | Martínez        | Irene        |
   | Herzog          | Tremblay        | Ramón        |
   | Koss            | Bayer           | José         |
   | Lakin           | Yundt           | Inma         |
   | Saez            | Vega            | Juan         |
   | Sánchez         | Pérez           | Salvador     |
   | Strosin         | Turcotte        | Ismael       |
   +-----------------+-----------------+--------------+
   ```

   

2. Averigua el nombre y los dos apellidos de los alumnos que **no** han dado de alta su número de teléfono en la base de datos.

   ```sql
   SELECT a.nombreAlumno, CONCAT_WS(' ', a.apellidoAlumno1, a.apellidoAlumno2)
   FROM alumno AS a
   LEFT JOIN telefonoAlumno as t ON a.idAlumno = t.idAlumnoTel
   WHERE T.idAlumnoTel IS NULL;
   +--------------+------------------------------------------------------+
   | nombreAlumno | CONCAT_WS(' ', a.apellidoAlumno1, a.apellidoAlumno2) |
   +--------------+------------------------------------------------------+
   | Daniel       | Herman Pacocha                                       |
   | Inma         | Lakin Yundt                                          |
   | Juan         | Gutiérrez López                                      |
   | Antonio      | Domínguez Guerrero                                   |
   | Irene        | Hernández Martínez                                   |
   | Sonia        | Gea Ruiz                                             |
   +--------------+------------------------------------------------------+
   ```

   

3. Devuelve el listado de los alumnos que nacieron en 1999. 

   ```sql
   SELECT nifAlu, nombreAlumno, apellidoAlumno1, apellidoAlumno2, fechaNacimientoAlu 
   FROM alumno
   WHERE YEAR(fechaNacimientoAlu) = 1999;
   +-----------+--------------+-----------------+-----------------+--------------------+
   | nifAlu    | nombreAlumno | apellidoAlumno1 | apellidoAlumno2 | fechaNacimientoAlu |
   +-----------+--------------+-----------------+-----------------+--------------------+
   | 97258166K | Ismael       | Strosin         | Turcotte        | 1999-05-24         |
   | 41491230N | Antonio      | Domínguez       | Guerrero        | 1999-02-11         |
   +-----------+--------------+-----------------+-----------------+--------------------+
   ```

   

4. Devuelve el listado de profesores que **no** han dado de alta su número de teléfono en la base de datos y además su nif termina en K. 

   ```sql
   SELECT p.nombreProfesor, CONCAT_WS(' ', p.apellidoProfesor1, p.apellidoProfesor2) AS 'apellidos', nifProf, fechaNacimiento
   FROM profesor AS p
   LEFT JOIN telefonoProfesor as t ON p.idProfesor = t.idProfesorTel
   WHERE t.idProfesorTel IS NULL AND nifProf LIKE '%K';
   +----------------+-----------------+-----------+-----------------+
   | nombreProfesor | apellidos       | nifProf   | fechaNacimiento |
   +----------------+-----------------+-----------+-----------------+
   | Antonio        | Fahey Considine | 10485008K | 1982-03-18      |
   | Guillermo      | Ruecker Upton   | 85869555K | 1973-05-05      |
   +----------------+-----------------+-----------+-----------------+
   ```

   

5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

   ```sql
   SELECT a.idAsignatura, a.nombreAsignatura, a.curso, a.cuatrimestre
   FROM asignatura AS a 
   INNER JOIN grado AS g ON g.idGrado = a.idGradoAsig
   WHERE g.idGrado = 7 AND a.cuatrimestre = 1 AND a.curso = 3;
   +--------------+-------------------------------------------+-------+--------------+
   | idAsignatura | nombreAsignatura                          | curso | cuatrimestre |
   +--------------+-------------------------------------------+-------+--------------+
   |           72 | Bases moleculares del desarrollo vegetal  |     3 |            1 |
   |           73 | Fisiología animal                         |     3 |            1 |
   |           74 | Metabolismo y biosíntesis de biomoléculas |     3 |            1 |
   |           75 | Operaciones de separación                 |     3 |            1 |
   |           76 | Patología molecular de plantas            |     3 |            1 |
   |           77 | Técnicas instrumentales básicas           |     3 |            1 |
   +--------------+-------------------------------------------+-------+--------------+
   ```

   

## Consultas multitabla (Composición interna)

1. Devuelve un listado con los datos de todas las **alumnas** que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

   ```sql
   SELECT a.nifAlu, a.nombreAlumno, a.apellidoAlumno1, a.apellidoAlumno2, a.fechaNacimientoAlu  
   FROM alumno AS a 
   INNER JOIN alumnoAsignatura AS aa ON a.idAlumno = aa.idAlumnoAs
   INNER JOIN asignatura AS asi ON aa.idAsigaturaAs = asi.idAsignatura
   INNER JOIN grado AS g ON g.idGrado = asi.idGradoAsig
   INNER JOIN genero AS ge ON ge.idGenero = a.idGeneroAlu
   WHERE g.nombreGrado = 'Grado en Ingeniería Informática (Plan 2015)' AND ge.idGenero = 2;
   +-----------+--------------+-----------------+-----------------+--------------------+
   | nifAlu    | nombreAlumno | apellidoAlumno1 | apellidoAlumno2 | fechaNacimientoAlu |
   +-----------+--------------+-----------------+-----------------+--------------------+
   | 64753215G | Irene        | Hernández       | Martínez        | 1996-03-12         |
   +-----------+--------------+-----------------+-----------------+--------------------+
   ```

   

2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).

   ```sql
   SELECT a.idAsignatura, a.nombreAsignatura AS 'asignatura', a.curso, a.cuatrimestre, a.creditos
   FROM grado AS g
   INNER JOIN asignatura as a on g.idGrado = a.idGradoAsig
   WHERE g.nombreGrado = 'Grado en Ingeniería Informática (Plan 2015)';
   +--------------+------------------------------------------------------------------------+-------+--------------+----------+
   | idAsignatura | asignatura                                                             | curso | cuatrimestre | creditos |
   +--------------+------------------------------------------------------------------------+-------+--------------+----------+
   |            1 | Álgegra lineal y matemática discreta                                   |     1 |            1 |        6 |
   |            2 | Cálculo                                                                |     1 |            1 |        6 |
   |            3 | Física para informática                                                |     1 |            1 |        6 |
   |            4 | Introducción a la programación                                         |     1 |            1 |        6 |
   |            5 | Organización y gestión de empresas                                     |     1 |            1 |        6 |
   |            6 | Estadística                                                            |     1 |            2 |        6 |
   |            7 | Estructura y tecnología de computadores                                |     1 |            2 |        6 |
   |            8 | Fundamentos de electrónica                                             |     1 |            2 |        6 |
   |            9 | Lógica y algorítmica                                                   |     1 |            2 |        6 |
   |           10 | Metodología de la programación                                         |     1 |            2 |        6 |
   |           11 | Arquitectura de Computadores                                           |     2 |            1 |        6 |
   |           12 | Estructura de Datos y Algoritmos I                                     |     2 |            1 |        6 |
   |           13 | Ingeniería del Software                                                |     2 |            1 |        6 |
   |           14 | Sistemas Inteligentes                                                  |     2 |            1 |        6 |
   |           15 | Sistemas Operativos                                                    |     2 |            1 |        6 |
   |           16 | Bases de Datos                                                         |     2 |            2 |        6 |
   |           17 | Estructura de Datos y Algoritmos II                                    |     2 |            2 |        6 |
   |           18 | Fundamentos de Redes de Computadores                                   |     2 |            2 |        6 |
   |           19 | Planificación y Gestión de Proyectos Informáticos                      |     2 |            2 |        6 |
   |           20 | Programación de Servicios Software                                     |     2 |            2 |        6 |
   |           21 | Desarrollo de interfaces de usuario                                    |     3 |            1 |        6 |
   |           22 | Ingeniería de Requisitos                                               |     3 |            1 |        6 |
   |           23 | Integración de las Tecnologías de la Información en las Organizaciones |     3 |            1 |        6 |
   |           24 | Modelado y Diseño del Software 1                                       |     3 |            1 |        6 |
   |           25 | Multiprocesadores                                                      |     3 |            1 |        6 |
   |           26 | Seguridad y cumplimiento normativo                                     |     3 |            1 |        6 |
   |           27 | Sistema de Información para las Organizaciones                         |     3 |            1 |        6 |
   |           28 | Tecnologías web                                                        |     3 |            1 |        6 |
   |           29 | Teoría de códigos y criptografía                                       |     3 |            1 |        6 |
   |           30 | Administración de bases de datos                                       |     3 |            2 |        6 |
   |           31 | Herramientas y Métodos de Ingeniería del Software                      |     3 |            2 |        6 |
   |           32 | Informática industrial y robótica                                      |     3 |            2 |        6 |
   |           33 | Ingeniería de Sistemas de Información                                  |     3 |            2 |        6 |
   |           34 | Modelado y Diseño del Software 2                                       |     3 |            2 |        6 |
   |           35 | Negocio Electrónico                                                    |     3 |            2 |        6 |
   |           36 | Periféricos e interfaces                                               |     3 |            2 |        6 |
   |           37 | Sistemas de tiempo real                                                |     3 |            2 |        6 |
   |           38 | Tecnologías de acceso a red                                            |     3 |            2 |        6 |
   |           39 | Tratamiento digital de imágenes                                        |     3 |            2 |        6 |
   |           40 | Administración de redes y sistemas operativos                          |     4 |            1 |        6 |
   |           41 | Almacenes de Datos                                                     |     4 |            1 |        6 |
   |           42 | Fiabilidad y Gestión de Riesgos                                        |     4 |            1 |        6 |
   |           43 | Líneas de Productos Software                                           |     4 |            1 |        6 |
   |           44 | Procesos de Ingeniería del Software 1                                  |     4 |            1 |        6 |
   |           45 | Tecnologías multimedia                                                 |     4 |            1 |        6 |
   |           46 | Análisis y planificación de las TI                                     |     4 |            2 |        6 |
   |           47 | Desarrollo Rápido de Aplicaciones                                      |     4 |            2 |        6 |
   |           48 | Gestión de la Calidad y de la Innovación Tecnológica                   |     4 |            2 |        6 |
   |           49 | Inteligencia del Negocio                                               |     4 |            2 |        6 |
   |           50 | Procesos de Ingeniería del Software 2                                  |     4 |            2 |        6 |
   |           51 | Seguridad Informática                                                  |     4 |            2 |        6 |
   +--------------+------------------------------------------------------------------------+-------+--------------+----------+
   ```

   

3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

   ```sql
   SELECT p.apellidoProfesor1, p.apellidoProfesor2, p.nombreProfesor, d.nombreDepartamento AS 'departamento'
   FROM profesor AS p 
   INNER JOIN departamento AS d ON p.idDepartamentoProf = d.idDepartamento
   ORDER BY p.apellidoProfesor1 ASC, p.apellidoProfesor2 ASC, p.nombreProfesor ASC;
   +-------------------+-------------------+----------------+--------------------+
   | apellidoProfesor1 | apellidoProfesor2 | nombreProfesor | departamento       |
   +-------------------+-------------------+----------------+--------------------+
   | Domínguez         | Hernández         | María          | Matemáticas        |
   | Fahey             | Considine         | Antonio        | Economía y Empresa |
   | Guerrero          | Martínez          | Juan           | Informática        |
   | Hamill            | Kozey             | Manolo         | Informática        |
   | Kohler            | Schoen            | Alejandro      | Matemáticas        |
   | Lemke             | Rutherford        | Cristina       | Economía y Empresa |
   | Monahan           | Murray            | Micaela        | Agronomía          |
   | Ramirez           | Gea               | Zoe            | Informática        |
   | Ruecker           | Upton             | Guillermo      | Educación          |
   | Sánchez           | Ruiz              | Pepe           | Informática        |
   | Schmidt           | Fisher            | David          | Matemáticas        |
   | Schowalter        | Muller            | Francesca      | Química y Física   |
   | Spencer           | Lakin             | Esther         | Educación          |
   | Stiedemann        | Morissette        | Alfredo        | Química y Física   |
   | Streich           | Hirthe            | Carmen         | Educación          |
   +-------------------+-------------------+----------------+--------------------+
   ```

   

4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M. 

   ```sql
   SELECT a.nifAlu, asi.nombreAsignatura, c.inicioCurso AS 'inicio', c.finCurso AS 'fin'
   FROM alumno AS a
   INNER JOIN alumnoAsignatura AS als ON a.idAlumno = als.idAlumnoAs
   INNER JOIN asignatura AS asi ON asi.idAsignatura = als.idAsigaturaAs
   INNER JOIN cursoEscolar AS c ON c.idCursoEscolar = als.idCursoEscolarAS
   WHERE a.nifAlu = '26902806M';
   +-----------+--------------------------------------+--------+------+
   | nifAlu    | nombreAsignatura                     | inicio | fin  |
   +-----------+--------------------------------------+--------+------+
   | 26902806M | Álgegra lineal y matemática discreta |   2014 | 2015 |
   | 26902806M | Cálculo                              |   2014 | 2015 |
   | 26902806M | Física para informática              |   2014 | 2015 |
   +-----------+--------------------------------------+--------+------+
   ```

   

5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

   ```sql
   SELECT d.nombreDepartamento 
   FROM departamento AS d
   INNER JOIN profesor AS p ON p.idDepartamentoProf = d.idDepartamento
   INNER JOIN asignatura AS a ON a.idProfesorAs = p.idProfesor
   INNER JOIN grado AS g ON g.idGrado = a.idGradoAsig
   WHERE g.nombreGrado = 'Grado en Ingeniería Informática (Plan 2015)';
   +--------------------+----------------+---------------------------------------------------+
   | nombreDepartamento | nombreProfesor | nombreAsignatura                                  |
   +--------------------+----------------+---------------------------------------------------+
   | Informática        | Zoe            | Arquitectura de Computadores                      |
   | Informática        | Zoe            | Estructura de Datos y Algoritmos I                |
   | Informática        | Zoe            | Sistemas Inteligentes                             |
   | Informática        | Zoe            | Fundamentos de Redes de Computadores              |
   | Informática        | Zoe            | Planificación y Gestión de Proyectos Informáticos |
   | Informática        | Manolo         | Ingeniería del Software                           |
   | Informática        | Manolo         | Sistemas Operativos                               |
   | Informática        | Manolo         | Bases de Datos                                    |
   | Informática        | Manolo         | Estructura de Datos y Algoritmos II               |
   | Informática        | Manolo         | Programación de Servicios Software                |
   | Informática        | Manolo         | Desarrollo de interfaces de usuario               |
   +--------------------+----------------+---------------------------------------------------+
   ```

   

6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

   ```sql
   SELECT a.nombreAlumno, a.apellidoAlumno1 
   FROM alumno AS a 
   INNER JOIN alumnoAsignatura AS al ON a.idAlumno = al.idAlumnoAs
   INNER JOIN cursoEscolar AS c ON c.idCursoEscolar = al.idCursoEscolarAS
   WHERE c.inicioCurso = 2018 AND c.finCurso = 2019;
   Empty set (0.00 sec)
   ```

   

## Consultas multitabla (Composición externa)

##### Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre. 

   ```sql
   SELECT d.nombreDepartamento, p.apellidoProfesor1, p.apellidoProfesor2, p.nombreProfesor
   FROM profesor AS p
   LEFT JOIN departamento AS d ON d.idDepartamento = p.idDepartamentoProf
   ORDER BY d.nombreDepartamento ASC, p.apellidoProfesor1 ASC, p.nombreProfesor;
   +--------------------+-------------------+-------------------+----------------+
   | nombreDepartamento | apellidoProfesor1 | apellidoProfesor2 | nombreProfesor |
   +--------------------+-------------------+-------------------+----------------+
   | Agronomía          | Monahan           | Murray            | Micaela        |
   | Economía y Empresa | Fahey             | Considine         | Antonio        |
   | Economía y Empresa | Lemke             | Rutherford        | Cristina       |
   | Educación          | Ruecker           | Upton             | Guillermo      |
   | Educación          | Spencer           | Lakin             | Esther         |
   | Educación          | Streich           | Hirthe            | Carmen         |
   | Informática        | Guerrero          | Martínez          | Juan           |
   | Informática        | Hamill            | Kozey             | Manolo         |
   | Informática        | Ramirez           | Gea               | Zoe            |
   | Informática        | Sánchez           | Ruiz              | Pepe           |
   | Matemáticas        | Domínguez         | Hernández         | María          |
   | Matemáticas        | Kohler            | Schoen            | Alejandro      |
   | Matemáticas        | Schmidt           | Fisher            | David          |
   | Química y Física   | Schowalter        | Muller            | Francesca      |
   | Química y Física   | Stiedemann        | Morissette        | Alfredo        |
   +--------------------+-------------------+-------------------+----------------+
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un departamento. 

   ```sql
   SELECT p.nombreProfesor, p.apellidoProfesor1
   FROM profesor AS p
   LEFT JOIN departamento AS d ON d.idDepartamento = p.idDepartamentoProf
   WHERE d.idDepartamento IS NULL;
   Empty set (0.00 sec) 
   todos los profesores tienen un departamento asociado
   ```

   

3. Devuelve un listado con los departamentos que no tienen profesores asociados. 

   ```sql
   SELECT d.nombreDepartamento
   FROM profesor AS p
   RIGHT JOIN departamento AS d ON d.idDepartamento = p.idDepartamentoProf
   WHERE p.idDepartamentoProf IS NULL;
   +---------------------+
   | nombreDepartamento  |
   +---------------------+
   | Filología           |
   | Derecho             |
   | Biología y Geología |
   +---------------------+
   ```

   

4. Devuelve un listado con los profesores que no imparten ninguna asignatura. 

   ```sql
   SELECT p.nombreProfesor, p.apellidoProfesor1, p.apellidoProfesor2
   FROM profesor AS p
   LEFT JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
   WHERE idProfesorAs IS NULL;
   +----------------+-------------------+-------------------+
   | nombreProfesor | apellidoProfesor1 | apellidoProfesor2 |
   +----------------+-------------------+-------------------+
   | David          | Schmidt           | Fisher            |
   | Cristina       | Lemke             | Rutherford        |
   | Esther         | Spencer           | Lakin             |
   | Carmen         | Streich           | Hirthe            |
   | Alfredo        | Stiedemann        | Morissette        |
   | Alejandro      | Kohler            | Schoen            |
   | Antonio        | Fahey             | Considine         |
   | Guillermo      | Ruecker           | Upton             |
   | Micaela        | Monahan           | Murray            |
   | Francesca      | Schowalter        | Muller            |
   | Pepe           | Sánchez           | Ruiz              |
   | Juan           | Guerrero          | Martínez          |
   | María          | Domínguez         | Hernández         |
   +----------------+-------------------+-------------------+
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado. 

   ```sql
   SELECT a.nombreAsignatura
   FROM profesor AS p
   RIGHT JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
   WHERE idProfesorAs IS NULL;
   +------------------------------------------------------------------------+
   | nombreAsignatura                                                       |
   +------------------------------------------------------------------------+
   | Álgegra lineal y matemática discreta                                   |
   | Cálculo                                                                |
   | Física para informática                                                |
   | Introducción a la programación                                         |
   | Organización y gestión de empresas                                     |
   | Estadística                                                            |
   | Estructura y tecnología de computadores                                |
   | Fundamentos de electrónica                                             |
   | Lógica y algorítmica                                                   |
   | Metodología de la programación                                         |
   | Ingeniería de Requisitos                                               |
   | Integración de las Tecnologías de la Información en las Organizaciones |
   | Modelado y Diseño del Software 1                                       |
   | Multiprocesadores                                                      |
   | Seguridad y cumplimiento normativo                                     |
   | Sistema de Información para las Organizaciones                         |
   | Tecnologías web                                                        |
   | Teoría de códigos y criptografía                                       |
   | Administración de bases de datos                                       |
   | Herramientas y Métodos de Ingeniería del Software                      |
   | Informática industrial y robótica                                      |
   | Ingeniería de Sistemas de Información                                  |
   | Modelado y Diseño del Software 2                                       |
   | Negocio Electrónico                                                    |
   | Periféricos e interfaces                                               |
   | Sistemas de tiempo real                                                |
   | Tecnologías de acceso a red                                            |
   | Tratamiento digital de imágenes                                        |
   | Administración de redes y sistemas operativos                          |
   | Almacenes de Datos                                                     |
   | Fiabilidad y Gestión de Riesgos                                        |
   | Líneas de Productos Software                                           |
   | Procesos de Ingeniería del Software 1                                  |
   | Tecnologías multimedia                                                 |
   | Análisis y planificación de las TI                                     |
   | Desarrollo Rápido de Aplicaciones                                      |
   | Gestión de la Calidad y de la Innovación Tecnológica                   |
   | Inteligencia del Negocio                                               |
   | Procesos de Ingeniería del Software 2                                  |
   | Seguridad Informática                                                  |
   | Biologia celular                                                       |
   | Física                                                                 |
   | Matemáticas I                                                          |
   | Química general                                                        |
   | Química orgánica                                                       |
   | Biología vegetal y animal                                              |
   | Bioquímica                                                             |
   | Genética                                                               |
   | Matemáticas II                                                         |
   | Microbiología                                                          |
   | Botánica agrícola                                                      |
   | Fisiología vegetal                                                     |
   | Genética molecular                                                     |
   | Ingeniería bioquímica                                                  |
   | Termodinámica y cinética química aplicada                              |
   | Biorreactores                                                          |
   | Biotecnología microbiana                                               |
   | Ingeniería genética                                                    |
   | Inmunología                                                            |
   | Virología                                                              |
   | Bases moleculares del desarrollo vegetal                               |
   | Fisiología animal                                                      |
   | Metabolismo y biosíntesis de biomoléculas                              |
   | Operaciones de separación                                              |
   | Patología molecular de plantas                                         |
   | Técnicas instrumentales básicas                                        |
   | Bioinformática                                                         |
   | Biotecnología de los productos hortofrutículas                         |
   | Biotecnología vegetal                                                  |
   | Genómica y proteómica                                                  |
   | Procesos biotecnológicos                                               |
   | Técnicas instrumentales avanzadas                                      |
   +------------------------------------------------------------------------+
   ```

   

6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

   ```sql
   SELECT DISTINCT d.nombreDepartamento, a.nombreAsignatura
   FROM departamento AS d
   LEFT JOIN profesor AS p ON p.idDepartamentoProf = d.idDepartamento
   LEFT JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
   LEFT JOIN alumnoAsignatura AS aa ON a.idAsignatura = aa.idAsigaturaAs
   WHERE aa.idAsigaturaAs IS  NULL AND d.nombreDepartamento IS NOT NULL;
   +---------------------+---------------------------------------------------+
   | nombreDepartamento  | nombreAsignatura                                  |
   +---------------------+---------------------------------------------------+
   | Informática         | Arquitectura de Computadores                      |
   | Informática         | Estructura de Datos y Algoritmos I                |
   | Informática         | Sistemas Inteligentes                             |
   | Informática         | Fundamentos de Redes de Computadores              |
   | Informática         | Planificación y Gestión de Proyectos Informáticos |
   | Informática         | Ingeniería del Software                           |
   | Informática         | Sistemas Operativos                               |
   | Informática         | Bases de Datos                                    |
   | Informática         | Estructura de Datos y Algoritmos II               |
   | Informática         | Programación de Servicios Software                |
   | Informática         | Desarrollo de interfaces de usuario               |
   | Informática         | NULL                                              |
   | Matemáticas         | NULL                                              |
   | Economía y Empresa  | NULL                                              |
   | Educación           | NULL                                              |
   | Agronomía           | NULL                                              |
   | Química y Física    | NULL                                              |
   | Filología           | NULL                                              |
   | Derecho             | NULL                                              |
   | Biología y Geología | NULL                                              |
   +---------------------+---------------------------------------------------+
   ```

   

## Consultas resumen

1. Devuelve el número total de alumnas que hay. 

   ```sql
   SELECT COUNT(a.idAlumno) AS 'alumnas'
   FROM alumno AS a
   INNER JOIN genero AS g ON a.idGeneroAlu = g.idGenero
   WHERE g.idGenero = 2;
   +-----------------+
   |        alumnas |
   +-----------------+
   |              3 |
   +-----------------+
   ```

2. Calcula cuántos alumnos nacieron en 1999. 

   ```sql
   SELECT COUNT(idAlumno) 
   FROM alumno
   WHERE YEAR(fechaNacimientoAlu) = 1999;
   +-----------------+
   | COUNT(idAlumno) |
   +-----------------+
   |               2 |
   +-----------------+
   ```

3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores. 

   ```sql
   SELECT d.nombreDepartamento, COUNT(p.idProfesor) AS '# profesores'
   FROM departamento AS d
   INNER JOIN profesor AS p ON p.idDepartamentoProf = d.idDepartamento
   GROUP BY d.nombreDepartamento;
   +--------------------+--------------+
   | nombreDepartamento | # profesores |
   +--------------------+--------------+
   | Informática        |            4 |
   | Matemáticas        |            3 |
   | Economía y Empresa |            2 |
   | Educación          |            3 |
   | Agronomía          |            1 |
   | Química y Física   |            2 |
   +--------------------+--------------+
   ```

   

4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado. 

   ```sql
   SELECT d.nombreDepartamento, COUNT(p.idProfesor) AS '# profesores'
   FROM departamento AS d
   LEFT JOIN profesor AS p ON p.idDepartamentoProf = d.idDepartamento
   GROUP BY d.nombreDepartamento;
   +---------------------+--------------+
   | nombreDepartamento  | # profesores |
   +---------------------+--------------+
   | Informática         |            4 |
   | Matemáticas         |            3 |
   | Economía y Empresa  |            2 |
   | Educación           |            3 |
   | Agronomía           |            1 |
   | Química y Física    |            2 |
   | Filología           |            0 |
   | Derecho             |            0 |
   | Biología y Geología |            0 |
   +---------------------+--------------+
   ```

   

5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas. 

   ```sql
   SELECT g.nombreGrado, COUNT(a.idAsignatura) AS 'No. asignaturas'
   FROM grado AS g
   LEFT JOIN asignatura AS a ON g.idGrado = a.idGradoAsig
   GROUP BY g.nombreGrado;
   +--------------------------------------------------------+-----------------+
   | nombreGrado                                            | No. asignaturas |
   +--------------------------------------------------------+-----------------+
   | Grado en Ingeniería Agrícola (Plan 2015)               |               0 |
   | Grado en Ingeniería Eléctrica (Plan 2014)              |               0 |
   | Grado en Ingeniería Electrónica Industrial (Plan 2010) |               0 |
   | Grado en Ingeniería Informática (Plan 2015)            |              51 |
   | Grado en Ingeniería Mecánica (Plan 2010)               |               0 |
   | Grado en Ingeniería Química Industrial (Plan 2010)     |               0 |
   | Grado en Biotecnología (Plan 2015)                     |              32 |
   | Grado en Ciencias Ambientales (Plan 2009)              |               0 |
   | Grado en Matemáticas (Plan 2010)                       |               0 |
   | Grado en Química (Plan 2009)                           |               0 |
   +--------------------------------------------------------+-----------------+
   ```

   

6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas. 

   ```sql
   SELECT g.nombreGrado, COUNT(a.idAsignatura) AS 'No. asignaturas'
   FROM grado AS g
   LEFT JOIN asignatura AS a ON g.idGrado = a.idGradoAsig
   GROUP BY g.nombreGrado
   HAVING COUNT(a.idAsignatura) > 40;
   +---------------------------------------------+-----------------+
   | nombreGrado                                 | No. asignaturas |
   +---------------------------------------------+-----------------+
   | Grado en Ingeniería Informática (Plan 2015) |              51 |
   +---------------------------------------------+-----------------+
   ```

   

7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos. 

   ```sql
   SELECT g.nombreGrado, ta.nombrAsignatura AS tipo_asignatura, SUM(a.creditos) AS total_creditos
   FROM grado g
   INNER JOIN asignatura a ON g.idGrado = a.idGradoAsig
   INNER JOIN tipoAsignatura ta ON a.idTipoAsignaturaA = ta.idTipoAsignatura
   GROUP BY g.nombreGrado, ta.nombrAsignatura
   ORDER BY total_creditos DESC;
   +---------------------------------------------+-----------------+----------------+
   | nombreGrado                                 | tipo_asignatura | total_creditos |
   +---------------------------------------------+-----------------+----------------+
   | Grado en Ingeniería Informática (Plan 2015) | optativa        |            180 |
   | Grado en Biotecnología (Plan 2015)          | obligatoria     |            120 |
   | Grado en Ingeniería Informática (Plan 2015) | básica          |             72 |
   | Grado en Biotecnología (Plan 2015)          | básica          |             60 |
   | Grado en Ingeniería Informática (Plan 2015) | obligatoria     |             54 |
   +---------------------------------------------+-----------------+----------------+
   ```

   

8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados. 

   ```sql
   SELECT ce.inicioCurso, COUNT(aa.idAlumnoAs) AS '# alumnos'
   FROM cursoEscolar AS ce
   INNER JOIN alumnoAsignatura AS aa ON ce.idCursoEscolar = aa.idCursoEscolarAS
   GROUP BY ce.inicioCurso;
   +-------------+-----------+
   | inicioCurso | # alumnos |
   +-------------+-----------+
   |        2014 |        17 |
   |        2015 |        13 |
   |        2016 |         3 |
   |        2017 |         3 |
   +-------------+-----------+
   ```

   

9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas

   ```sql
   SELECT p.idProfesor, p.nombreProfesor, p.apellidoProfesor1, p.apellidoProfesor2, COUNT(a.idAsignatura) AS 'NAsignaturas'
   FROM profesor AS p
   LEFT JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
   GROUP BY p.idProfesor
   ORDER BY NAsignaturas DESC;
   +------------+----------------+-------------------+-------------------+--------------+
   | idProfesor | nombreProfesor | apellidoProfesor1 | apellidoProfesor2 | NAsignaturas |
   +------------+----------------+-------------------+-------------------+--------------+
   |         14 | Manolo         | Hamill            | Kozey             |            6 |
   |          3 | Zoe            | Ramirez           | Gea               |            5 |
   |          5 | David          | Schmidt           | Fisher            |            0 |
   |          8 | Cristina       | Lemke             | Rutherford        |            0 |
   |         10 | Esther         | Spencer           | Lakin             |            0 |
   |         12 | Carmen         | Streich           | Hirthe            |            0 |
   |         13 | Alfredo        | Stiedemann        | Morissette        |            0 |
   |         15 | Alejandro      | Kohler            | Schoen            |            0 |
   |         16 | Antonio        | Fahey             | Considine         |            0 |
   |         17 | Guillermo      | Ruecker           | Upton             |            0 |
   |         18 | Micaela        | Monahan           | Murray            |            0 |
   |         20 | Francesca      | Schowalter        | Muller            |            0 |
   |         21 | Pepe           | Sánchez           | Ruiz              |            0 |
   |         22 | Juan           | Guerrero          | Martínez          |            0 |
   |         23 | María          | Domínguez         | Hernández         |            0 |
   +------------+----------------+-------------------+-------------------+--------------+
   ```

   

## Subconsultas 

1. Devuelve todos los datos del alumno más joven.

   ```sql
   SELECT nifAlu, nombreAlumno, apellidoAlumno1, apellidoAlumno2, fechaNacimientoAlu 
   FROM alumno
   WHERE fechaNacimientoAlu = (
       SELECT MAX(fechaNacimientoAlu)
       FROM alumno
   );
   +-----------+--------------+-----------------+-----------------+--------------------+
   | nifAlu    | nombreAlumno | apellidoAlumno1 | apellidoAlumno2 | fechaNacimientoAlu |
   +-----------+--------------+-----------------+-----------------+--------------------+
   | 17105885A | Pedro        | Heller          | Pagac           | 2000-10-05         |
   +-----------+--------------+-----------------+-----------------+--------------------+
   ```

   

2. Devuelve un listado con los profesores que no están asociados a un departamento. 

   ```sql
   SELECT idProfesor, nombreProfesor, apellidoProfesor1, apellidoProfesor2, fechaNacimiento
   FROM profesor 
   WHERE idDepartamentoProf IN (
       SELECT p.idProfesor
       FROM profesor AS p 
       LEFT JOIN departamento AS d ON p.idDepartamentoProf = d.idDepartamento
       WHERE p.idDepartamentoProf IS NULL
   );
   Empty set (0.05 sec)
   Todos los profesores tienen un departamento asociado 
   ```

   

3. Devuelve un listado con los departamentos que no tienen profesores asociados. 

   ```sql
   SELECT nombreDepartamento
   FROM departamento 
   WHERE idDepartamento IN (
       SELECT d.idDepartamento
       FROM profesor AS p 
       RIGHT JOIN departamento AS d ON p.idDepartamentoProf = d.idDepartamento
       WHERE p.idDepartamentoProf IS NULL
   );
   +---------------------+
   | nombreDepartamento  |
   +---------------------+
   | Filología           |
   | Derecho             |
   | Biología y Geología |
   +---------------------+
   ```

   

4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura. 

   ```sql
   SELECT p.nombreProfesor, p.apellidoProfesor1
   FROM profesor AS p
   INNER JOIN departamento AS d ON p.idDepartamentoProf = d.idDepartamento
   WHERE p.idProfesor NOT IN (
       SELECT p.idProfesor
       FROM profesor AS p
       INNER JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
   );
   +----------------+-------------------+
   | nombreProfesor | apellidoProfesor1 |
   +----------------+-------------------+
   | David          | Schmidt           |
   | Cristina       | Lemke             |
   | Esther         | Spencer           |
   | Carmen         | Streich           |
   | Alfredo        | Stiedemann        |
   | Alejandro      | Kohler            |
   | Antonio        | Fahey             |
   | Guillermo      | Ruecker           |
   | Micaela        | Monahan           |
   | Francesca      | Schowalter        |
   | Pepe           | Sánchez           |
   | Juan           | Guerrero          |
   | María          | Domínguez         |
   +----------------+-------------------+
   ```

   

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado. 

   ```sql
   SELECT nombreAsignatura 
   FROM asignatura
   WHERE idAsignatura IN (
       SELECT a.idAsignatura
       FROM asignatura AS a
       LEFT JOIN profesor AS p ON a.idProfesorAs = p.idProfesor
       WHERE a.idProfesorAs IS NULL 
   );
   +------------------------------------------------------------------------+
   | nombreAsignatura                                                       |
   +------------------------------------------------------------------------+
   | Álgegra lineal y matemática discreta                                   |
   | Cálculo                                                                |
   | Física para informática                                                |
   | Introducción a la programación                                         |
   | Organización y gestión de empresas                                     |
   | Estadística                                                            |
   | Estructura y tecnología de computadores                                |
   | Fundamentos de electrónica                                             |
   | Lógica y algorítmica                                                   |
   | Metodología de la programación                                         |
   | Ingeniería de Requisitos                                               |
   | Integración de las Tecnologías de la Información en las Organizaciones |
   | Modelado y Diseño del Software 1                                       |
   | Multiprocesadores                                                      |
   | Seguridad y cumplimiento normativo                                     |
   | Sistema de Información para las Organizaciones                         |
   | Tecnologías web                                                        |
   | Teoría de códigos y criptografía                                       |
   | Administración de bases de datos                                       |
   | Herramientas y Métodos de Ingeniería del Software                      |
   | Informática industrial y robótica                                      |
   | Ingeniería de Sistemas de Información                                  |
   | Modelado y Diseño del Software 2                                       |
   | Negocio Electrónico                                                    |
   | Periféricos e interfaces                                               |
   | Sistemas de tiempo real                                                |
   | Tecnologías de acceso a red                                            |
   | Tratamiento digital de imágenes                                        |
   | Administración de redes y sistemas operativos                          |
   | Almacenes de Datos                                                     |
   | Fiabilidad y Gestión de Riesgos                                        |
   | Líneas de Productos Software                                           |
   | Procesos de Ingeniería del Software 1                                  |
   | Tecnologías multimedia                                                 |
   | Análisis y planificación de las TI                                     |
   | Desarrollo Rápido de Aplicaciones                                      |
   | Gestión de la Calidad y de la Innovación Tecnológica                   |
   | Inteligencia del Negocio                                               |
   | Procesos de Ingeniería del Software 2                                  |
   | Seguridad Informática                                                  |
   | Biologia celular                                                       |
   | Física                                                                 |
   | Matemáticas I                                                          |
   | Química general                                                        |
   | Química orgánica                                                       |
   | Biología vegetal y animal                                              |
   | Bioquímica                                                             |
   | Genética                                                               |
   | Matemáticas II                                                         |
   | Microbiología                                                          |
   | Botánica agrícola                                                      |
   | Fisiología vegetal                                                     |
   | Genética molecular                                                     |
   | Ingeniería bioquímica                                                  |
   | Termodinámica y cinética química aplicada                              |
   | Biorreactores                                                          |
   | Biotecnología microbiana                                               |
   | Ingeniería genética                                                    |
   | Inmunología                                                            |
   | Virología                                                              |
   | Bases moleculares del desarrollo vegetal                               |
   | Fisiología animal                                                      |
   | Metabolismo y biosíntesis de biomoléculas                              |
   | Operaciones de separación                                              |
   | Patología molecular de plantas                                         |
   | Técnicas instrumentales básicas                                        |
   | Bioinformática                                                         |
   | Biotecnología de los productos hortofrutículas                         |
   | Biotecnología vegetal                                                  |
   | Genómica y proteómica                                                  |
   | Procesos biotecnológicos                                               |
   | Técnicas instrumentales avanzadas                                      |
   +------------------------------------------------------------------------+
   ```

   

6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

```sql
SELECT nombreDepartamento
FROM departamento
WHERE idDepartamento NOT IN (
    SELECT DISTINCT d.idDepartamento
    FROM departamento d
    LEFT JOIN profesor p ON d.idDepartamento = p.idDepartamentoProf
    LEFT JOIN asignatura a ON p.idProfesor = a.idProfesorAs
    WHERE a.idAsignatura IS NOT NULL
);
+---------------------+
| nombreDepartamento  |
+---------------------+
| Matemáticas         |
| Economía y Empresa  |
| Educación           |
| Agronomía           |
| Química y Física    |
| Filología           |
| Derecho             |
| Biología y Geología |
+---------------------+
```

## Vistas 

##### Debe generar 10 vistas por cada Base de datos (Las vistas pueden ser tomadas de los comandos sql ya desarrollados)



1. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. 

1. ```sql
   CREATE VIEW profesorDepartamento AS 
   SELECT p.apellidoProfesor1, p.apellidoProfesor2, p.nombreProfesor, d.nombreDepartamento AS 'departamento'
   FROM profesor AS p 
   INNER JOIN departamento AS d ON p.idDepartamentoProf = d.idDepartamento
   ORDER BY p.apellidoProfesor1 ASC, p.apellidoProfesor2 ASC, p.nombreProfesor ASC;
   ```

2. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

   ```sql
   CREATE VIEW ProfesoresInformatica AS
   SELECT d.nombreDepartamento 
   FROM departamento AS d
   INNER JOIN profesor AS p ON p.idDepartamentoProf = d.idDepartamento
   INNER JOIN asignatura AS a ON a.idProfesorAs = p.idProfesor
   INNER JOIN grado AS g ON g.idGrado = a.idGradoAsig
   WHERE g.nombreGrado = 'Grado en Ingeniería Informática (Plan 2015)';
   ```

3. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados.

   ```sql
   CREATE VIEW departamentoProfesor AS 
   SELECT d.nombreDepartamento, p.apellidoProfesor1, p.apellidoProfesor2, p.nombreProfesor
   FROM profesor AS p
   LEFT JOIN departamento AS d ON d.idDepartamento = p.idDepartamentoProf
   ORDER BY d.nombreDepartamento ASC, p.apellidoProfesor1 ASC, p.nombreProfesor;
   ```

4. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.

   ```sql
   CREATE VIEW DepartamentosSincurso AS 
   SELECT DISTINCT d.nombreDepartamento, a.nombreAsignatura
   FROM departamento AS d
   LEFT JOIN profesor AS p ON p.idDepartamentoProf = d.idDepartamento
   LEFT JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
   LEFT JOIN alumnoAsignatura AS aa ON a.idAsignatura = aa.idAsigaturaAs
   WHERE aa.idAsigaturaAs IS  NULL AND d.nombreDepartamento IS NOT NULL;
   ```

5. Devuelve un listado con las asignaturas que no tienen un profesor asignado. 

```sql
CREATE VIEW asignaturasLibres AS 
SELECT a.nombreAsignatura
FROM profesor AS p
RIGHT JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
WHERE idProfesorAs IS NULL;
```

6. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos

   ```sql
   CREATE VIEW NoProfesoresXDpto AS 
   SELECT d.nombreDepartamento, COUNT(p.idProfesor) AS '# profesores'
   FROM departamento AS d
   LEFT JOIN profesor AS p ON p.idDepartamentoProf = d.idDepartamento
   GROUP BY d.nombreDepartamento;
   ```

7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.

   ```sql
   CREATE VIEW gradosYCreditos AS
   SELECT g.nombreGrado, ta.nombrAsignatura AS tipo_asignatura, SUM(a.creditos) AS total_creditos
   FROM grado g
   INNER JOIN asignatura a ON g.idGrado = a.idGradoAsig
   INNER JOIN tipoAsignatura ta ON a.idTipoAsignaturaA = ta.idTipoAsignatura
   GROUP BY g.nombreGrado, ta.nombrAsignatura
   ORDER BY total_creditos DESC;
   ```

8. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas.

   ```sql
   CREATE VIEW asignaturasProfesor AS 
   SELECT p.idProfesor, p.nombreProfesor, p.apellidoProfesor1, p.apellidoProfesor2, COUNT(a.idAsignatura) AS 'NAsignaturas'
   FROM profesor AS p
   LEFT JOIN asignatura AS a ON p.idProfesor = a.idProfesorAs
   GROUP BY p.idProfesor
   ORDER BY NAsignaturas DESC;
   ```

9. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos.

   ```sql
   CREATE VIEW DatosEstudiantes AS 
   SELECT apellidoAlumno1, apellidoAlumno2, nombreAlumno
   FROM alumno 
   ORDER BY apellidoAlumno1 ASC, apellidoAlumno2 ASC, nombreAlumno ASC;
   ```

10. Devuelve el listado de profesores que **no** han dado de alta su número de teléfono en la base de datos

    ```sql
    CREATE VIEW profesoreSinTelefono AS 
    SELECT p.nombreProfesor, CONCAT_WS(' ', p.apellidoProfesor1, p.apellidoProfesor2) AS 'apellidos', nifProf, fechaNacimiento
    FROM profesor AS p
    LEFT JOIN telefonoProfesor as t ON p.idProfesor = t.idProfesorTel
    WHERE t.idProfesorTel IS NULL
    ```

    

## Procedimientos almacenados

##### Debe generar 10 procedimientos almacenados por cada base de datos. Los procedimientos deben incluir procesos de Crear, Actualizar, eliminar o buscar.

```sql
-- 1 Insertar departamento
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_departamento $$
CREATE PROCEDURE insert_departamento(
    IN nombreDepartamento VARCHAR(50)
)
BEGIN 
    INSERT INTO departamento (idDepartamento, nombreDepartamento) VALUES (NULL, nombreDepartamento);
END $$
DELIMITER ;

CALL insert_departamento('Agronomia');


-- 2 Insertar ciudad
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_ciudad $$
CREATE PROCEDURE insert_ciudad(
    IN id VARCHAR(5),
    IN nombre VARCHAR(20)
)
BEGIN 
   INSERT INTO ciudad (idCiudad, nombreCiudad) VALUES (id, nombre);
END $$
DELIMITER ;

CALL insert_ciudad('00007', 'Ocamonte');


-- 3 Insertar grado
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_grado $$
CREATE PROCEDURE insert_grado(
    IN id VARCHAR(10),
    IN nombre VARCHAR(100)
)
BEGIN 
   INSERT INTO grado (idGrado, nombreGrado) VALUES (id, nombre);
END $$
DELIMITER ;

CALL insert_grado('005', 'Grado de veterinaria');


-- 4 Mostrar tipos de asignatura 
DELIMITER $$
DROP PROCEDURE IF EXISTS mostrar_tipo_asignatura $$
CREATE PROCEDURE mostrar_tipo_asignatura()
BEGIN
    SELECT idTipoAsignatura, nombrAsignatura FROM tipoAsignatura;
END $$
DELIMITER ;

CALL mostrar_tipo_asignatura();


-- 5 Listar todos los alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS mostrar_alumnos $$
CREATE PROCEDURE mostrar_alumnos()
BEGIN 
    SELECT nifAlu, nombreAlumno, apellidoAlumno1, apellidoAlumno2, fechaNacimientoAlu 
    FROM alumno;
END $$
DELIMITER ;

CALL mostrar_alumnos();


-- 6 Eliminar grado
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminar_departamento $$
CREATE PROCEDURE eliminar_departamento (
    IN id INT(10)
)
BEGIN 
    DELETE FROM departamento WHERE idDepartamento = id;
END $$ 
DELIMITER ;

CALL eliminar_departamento(10);


-- 7 Eliminar ciudad
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminar_ciudad $$
CREATE PROCEDURE eliminar_ciudad (
    IN id VARCHAR(5)
)
BEGIN 
    DELETE FROM ciudad WHERE idCiudad = id;
END $$ 
DELIMITER ;

CALL eliminar_ciudad('00001');


-- 8  Total de alumnos
DELIMITER $$
DROP PROCEDURE IF EXISTS total_alumnos $$
CREATE PROCEDURE total_alumnos(
    OUT total INT
)
BEGIN
    SET total = (
        SELECT COUNT(idAlumno) FROM alumno
    );
END $$
DELIMITER ;

CALL total_alumnos(@total);
SELECT @total;


-- 9 Actualizar dirección
DELIMITER $$ 
DROP PROCEDURE IF EXISTS actualizar_direccion $$
CREATE PROCEDURE actualizar_direccion(
    IN idAlumno INT(11),
    IN sector VARCHAR(25),
    IN calle VARCHAR(25),
    IN carrera VARCHAR(25)
)
BEGIN
    UPDATE direccionAlumno SET sector = sector, calle = calle, carrera = carrera
    WHERE idAlumnoDir = idAlumno;
END $$
DELIMITER ;

CALL actualizar_direccion(1, 'aaa', 'bbb', 'ccc');


-- 10 Datos de los creditos de las asignaturas 
DELIMITER $$
DROP PROCEDURE IF EXISTS min_max_avg_creditos $$
CREATE PROCEDURE min_max_avg_creditos(
    OUT minimo INT,
    OUT maximo INT,
    OUT promedio INT
)
BEGIN 
    SET minimo = (
        SELECT MIN(creditos)
        FROM asignatura
        LIMIT 1
    );

    SET maximo = (
        SELECT MAX(creditos)
        FROM asignatura
        LIMIT 1
    );

    SET promedio = (
        SELECT AVG(creditos)
        FROM asignatura
        LIMIT 1
    );
END $$ 
DELIMITER ;

CALL min_max_avg_creditos(@minimo, @maximo, @promedio);
SELECT @minimo, @maximo, @promedio;
```

