<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice("Simulacro de bbdd 🧪: Consultas, Índices, Vistas, Funciones y Procedimientos")

<div align="center">
<img src="https://www.seguridadkimika.eus/wp-content/uploads/2017/10/sirenas-seguridad-kimika-simulacro.jpg" width="200px"/>
</div>

## 🧾 Contexto

Como analista de datos en una universidad, se te ha encargado la explotación de una base de datos que permita gestionar estudiantes, profesores, cursos y matrículas. Además, deberás demostrar habilidades en consultas SQL, índices, vistas, procedimientos y funciones. Si la base de datos no estuvira creada, a continuación tienes el [init.sql](docker-init/init.sql).

## Base de datos en docker

Crea una carpeta y añade el fichero **docker-compose.yml** y el directorio **docker-init**.

Ejecuta a continuación el siguiente comando:

```sql
docker compose up -d 
```

Obtendrar una salida similar a la siguiente:

```console
 docker compose up -d   
[+] Running 2/2
 ✔ Container adminer_container  Started                                                                                                             0.9s 
 ✔ Container mysql_container    Started    
```

A continuación ejecuta el siguiente comando:

```console
docker exec -it mysql_container mysql -u root -p
```

Indica el *password* que es **bae**.

A continuación debes de estar dentro de la consola:

```sql
....
....
....
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

> **IMPORTANTE**: *Para salir de la consola se debe de ejecutar* ***exit***.

Verifica las bases de datos que tienes cargadas: (*SHOW DATABASES;*)

```console
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bae                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| universidad        |
+--------------------+
6 rows in set (0.00 sec)
```

Usa la base de datos **universidad**: (*use universidad;*)

```console
use universidad;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
```

También podemos acceder a través del navegador. Para ello utilizaremos **Adminer** porque *simula la línea de comandos, y nos ayuda a aprender*. Una vez que accedas a [http://localhost:8099](http://localhost:8099), Adminer te pedirá los siguientes datos:

> Puedes consultar la documentación [aquí](https://www.adminer.org/en/).

- **Sistema**: `MySQL`
- **Servidor**: `db`  
  *Es el nombre del servicio del contenedor MySQL dentro del mismo `docker-compose` (Adminer y MySQL están en la misma red `db-network`).*
- **Usuario**: `root`
- **Contraseña**: `bae`

> ***Lee atentamente cada una de los puntos y cuestiones y realiza***.

## 📄 Parte 1: Consultas para Explorar la Estructura de las Tablas

1. Mostrar las columnas de la tabla `estudiantes`.

```sql
select * FROM estudiantes;
```

2. Mostrar las columnas de la tabla `cursos`.

```sql
select * FROM cursos;
```

3. Mostrar las columnas de la tabla `matriculas`.

```sql
select * FROM matriculas;
```

---

## 📊 Parte 2: Consultas Avanzadas sobre Datos

4. Mostrar cada estudiante con la cantidad de cursos en los que está matriculado.

```sql
SELECT e.nombre, COUNT(m.curso_id) AS total_cursos
FROM estudiantes e
LEFT JOIN matriculas m ON e.id = m.estudiante_id
GROUP BY e.id;
```

5. Mostrar cada estudiante con el total de créditos acumulados.

```sql
SELECT e.nombre, COALESCE(SUM(c.creditos), 0) AS total_creditos
FROM estudiantes e
LEFT JOIN matriculas m ON e.id = m.estudiante_id
LEFT JOIN cursos c ON m.curso_id = c.id
GROUP BY e.id;
```

6. Mostrar cursos con la cantidad de estudiantes matriculados, ordenados de mayor a menor.

```sql
SELECT c.nombre, COUNT(m.estudiante_id) AS total_estudiantes
FROM cursos c
LEFT JOIN matriculas m ON c.id = m.curso_id
GROUP BY c.id
ORDER BY total_estudiantes DESC;
```

7. Mostrar la media de créditos por curso.

```sql
SELECT AVG(creditos) AS media_creditos FROM cursos;
```

8. Listar los cursos que no tienen estudiantes matriculados.

```sql
SELECT c.nombre
FROM cursos c
LEFT JOIN matriculas m ON c.id = m.curso_id
WHERE m.id IS NULL;
```

9. Mostrar el nombre del profesor y cuántos cursos imparte.

```sql
SELECT p.nombre, COUNT(c.id) AS cursos_imparte
FROM profesores p
LEFT JOIN cursos c ON p.id = c.profesor_id
GROUP BY p.id;
```

10. Mostrar los profesores que no imparten ningún curso.

```sql
SELECT p.nombre
FROM profesores p
LEFT JOIN cursos c ON p.id = c.profesor_id
WHERE c.id IS NULL;
```

11. Mostrar la ciudad con mayor número de estudiantes registrados.

```sql
SELECT ciudad, COUNT(*) AS total
FROM estudiantes
GROUP BY ciudad
ORDER BY total DESC
LIMIT 1;
```

12. Mostrar estudiantes que están matriculados en más de 1 curso.

```sql
SELECT e.nombre, COUNT(m.id) AS total_matriculas
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
GROUP BY e.id
HAVING total_matriculas > 1;
```

13. Listar cursos junto a su clasificación según créditos:
    - 6 o más: "Alta carga"
    - Menos de 6: "Carga estándar"

```sql
SELECT nombre,
  IF(creditos >= 6, 'Alta carga', 'Carga estándar') AS clasificacion
FROM cursos;
```

14. Listar estudiantes y clasificar su carga académica:
    - Más de 12 créditos: "Carga Alta"
    - 6 a 12 créditos: "Carga Media"
    - Menos de 6 créditos: "Carga Baja"

```sql
SELECT e.nombre,
  SUM(c.creditos) AS total_creditos,
  IF(SUM(c.creditos) > 12, 'Carga Alta',
     IF(SUM(c.creditos) >= 6, 'Carga Media', 'Carga Baja')) AS clasificacion
FROM estudiantes e
LEFT JOIN matriculas m ON e.id = m.estudiante_id
LEFT JOIN cursos c ON m.curso_id = c.id
GROUP BY e.id;
```

15. Mostrar cursos en los que se haya matriculado al menos un estudiante de Sevilla.

```sql
SELECT DISTINCT c.nombre
FROM cursos c
JOIN matriculas m ON c.id = m.curso_id
JOIN estudiantes e ON m.estudiante_id = e.id
WHERE e.ciudad = 'Sevilla';
```

16. Listar los cursos impartidos por profesores del departamento de Matemáticas.

```sql
SELECT c.nombre
FROM cursos c
JOIN profesores p ON c.profesor_id = p.id
WHERE p.departamento = 'Matemáticas';
```

17. Mostrar los cursos en los que se haya inscrito algún estudiante antes del año 2022.

```sql
SELECT DISTINCT c.nombre
FROM cursos c
JOIN matriculas m ON c.id = m.curso_id
WHERE YEAR(m.fecha) < 2022;
```

18. Mostrar estudiantes que han cursado materias impartidas por el profesor “Dr. Luis Gómez”.

```sql
SELECT DISTINCT e.nombre
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.id
JOIN profesores p ON c.profesor_id = p.id
WHERE p.nombre = 'Dr. Luis Gómez';
```

19. Mostrar los cursos más recientes (última matrícula por curso).

```sql
SELECT c.nombre, MAX(m.fecha) AS ultima_matricula
FROM cursos c
JOIN matriculas m ON c.id = m.curso_id
GROUP BY c.id;
```

20. Mostrar el número total de estudiantes por departamento del profesor que imparte el curso.

```sql
SELECT p.departamento, COUNT(DISTINCT m.estudiante_id) AS total_estudiantes
FROM profesores p
JOIN cursos c ON p.id = c.profesor_id
JOIN matriculas m ON c.id = m.curso_id
GROUP BY p.departamento;
```

---

## ⚙ Parte 3: Procedimiento Almacenado

1. Crear un procedimiento llamado `inscribir_estudiante` que reciba:
   - ID del estudiante
   - ID del curso
   - Fecha de inscripción  
   El procedimiento debe:
   - Verificar que el estudiante no esté ya matriculado en ese curso.
   - Si no lo está, insertarlo en `matriculas`; si ya lo está, lanzar un error.

```sql
DELIMITER //
CREATE PROCEDURE inscribir_estudiante(IN est_id INT, IN curso_id INT, IN fecha DATE)
BEGIN
  DECLARE existe INT;
  SELECT COUNT(*) INTO existe FROM matriculas WHERE estudiante_id = est_id AND curso_id = curso_id;
  IF existe = 0 THEN
    INSERT INTO matriculas(estudiante_id, curso_id, fecha)
    VALUES (est_id, curso_id, fecha);
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estudiante ya está matriculado en este curso';
  END IF;
END;
//
DELIMITER ;
```

> El **ERROR es opcional, dado que esta parte no la hemos trabajado pero el if si**.

2. Ejecutar el procedimiento para inscribir al estudiante con ID 1 en el curso con ID 2.

```sql
CALL inscribir_estudiante(1, 2, '2025-05-30');
```

> Debe de salir el **ERROR** y en caso de no tener el error no hacer **nada**.

3. Eliminar el procedimiento.


```sql
DROP PROCEDURE IF EXISTS inscribir_estudiante;
```

---

## 🪞 Parte 4: Vistas

1. Crear una vista llamada `resumen_matriculas` que muestre:
   - Nombre del estudiante
   - Nombre del curso
   - Nombre del profesor
   - Fecha de matrícula

```sql
CREATE VIEW resumen_matriculas AS
SELECT e.nombre AS estudiante, c.nombre AS curso, p.nombre AS profesor, m.fecha
FROM matriculas m
JOIN estudiantes e ON m.estudiante_id = e.id
JOIN cursos c ON m.curso_id = c.id
JOIN profesores p ON c.profesor_id = p.id;
```

2. Consultar los datos desde la vista, mostrando nombre del estudiante y curso.

```sql
SELECT estudiante, curso FROM resumen_matriculas;
```

3. Eliminar la vista.

```sql
DROP VIEW IF EXISTS resumen_matriculas;
```

---

## 🧮 Parte 5: Función Definida por el Usuario

1. Crear una función llamada `promedio_creditos_por_anio` que reciba un año como parámetro y devuelva el promedio de créditos matriculados por estudiante ese año.

```sql
DELIMITER //
CREATE FUNCTION promedio_creditos_por_anio(anio INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE promedio DECIMAL(5,2);
  SELECT AVG(c.creditos) INTO promedio
  FROM matriculas m
  JOIN cursos c ON m.curso_id = c.id
  WHERE YEAR(m.fecha) = anio;
  RETURN promedio;
END;
//
DELIMITER ;
```

2. Ejecutar la función para el año 2023.

```sql
SELECT promedio_creditos_por_anio(2023);
```

3. Eliminar la función.

```sql
DROP FUNCTION IF EXISTS promedio_creditos_por_anio;
```

---

## 📂 Parte 6: Índices

1. Crear un índice en la columna `fecha` de la tabla `matriculas`.

```sql
CREATE INDEX idx_fecha ON matriculas(fecha);
```

2. Crear un índice compuesto en la tabla `matriculas` sobre `estudiante_id` y `curso_id`.

```sql
CREATE INDEX idx_est_curso ON matriculas(estudiante_id, curso_id);
```

3. Consultar los índices de la tabla `matriculas`.

```sql
SHOW INDEX FROM matriculas;
```

4. Eliminar ambos índices.

```sql
DROP INDEX idx_fecha ON matriculas;
DROP INDEX idx_est_curso ON matriculas;
```

---

## 🕵️ Parte 7: Trigger de Auditoría

1. Crear una tabla llamada `auditoria_matriculas` que registre:
   - Tipo de operación (INSERT)
   - ID del estudiante
   - ID del curso
   - Fecha y hora de la operación
   - Usuario que realizó la acción

```sql
CREATE TABLE auditoria_matriculas (
  operacion VARCHAR(10),
  estudiante_id INT,
  curso_id INT,
  fecha_hora DATETIME,
  usuario VARCHAR(100)
);
```

2. Crear un trigger `AFTER INSERT` sobre `matriculas` que inserte un registro en `auditoria_matriculas` al realizar una matrícula.

```sql
DELIMITER //
CREATE TRIGGER after_insert_matricula
AFTER INSERT ON matriculas
FOR EACH ROW
BEGIN
  INSERT INTO auditoria_matriculas(operacion, estudiante_id, curso_id, fecha_hora, usuario)
  VALUES ('INSERT', NEW.estudiante_id, NEW.curso_id, NOW(), CURRENT_USER());
END;
//
DELIMITER ;
```

3. Consultar los registros de la auditoría.

```sql
SELECT * FROM auditoria_matriculas;
```

4. Eliminar el trigger y la tabla de auditoría.

```sql
DROP TRIGGER IF EXISTS after_insert_matricula;
DROP TABLE IF EXISTS auditoria_matriculas;
```

## Notas

> Siempre se utiliza:
>  - **CREATE ..**.
>  - **DROP ..**.
>  - **FUNCIONES/TRIGGERS/PROCEDIMIENTOS** utilizan **sentencias SQL**.

## Referencias

- [Procedimientos en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/PROCEDIMIENTOS.md).
- [Funciones en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/FUNCIONES.md).
- [Vistas en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-6/Vistas.md).
- [Triggers en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/TRIGERS.md).

</div>