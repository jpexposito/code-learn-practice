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

```

2. Mostrar las columnas de la tabla `cursos`.

```sql

```

3. Mostrar las columnas de la tabla `matriculas`.

```sql

```

---

## 📊 Parte 2: Consultas Avanzadas sobre Datos

4. Mostrar cada estudiante con la cantidad de cursos en los que está matriculado.

```sql

```

5. Mostrar cada estudiante con el total de créditos acumulados.

```sql

```

6. Mostrar cursos con la cantidad de estudiantes matriculados, ordenados de mayor a menor.

```sql

```

7. Mostrar la media de créditos por curso.

```sql

```

8. Listar los cursos que no tienen estudiantes matriculados.

```sql

```

9. Mostrar el nombre del profesor y cuántos cursos imparte.

```sql

```

10. Mostrar los profesores que no imparten ningún curso.

```sql

```

11. Mostrar la ciudad con mayor número de estudiantes registrados.

```sql

```

12. Mostrar estudiantes que están matriculados en más de 1 curso.

```sql

```

13. Listar cursos junto a su clasificación según créditos:
    - 6 o más: "Alta carga"
    - Menos de 6: "Carga estándar"

```sql

```

14. Listar estudiantes y clasificar su carga académica:
    - Más de 12 créditos: "Carga Alta"
    - 6 a 12 créditos: "Carga Media"
    - Menos de 6 créditos: "Carga Baja"

```sql

```

15. Mostrar cursos en los que se haya matriculado al menos un estudiante de Sevilla.

```sql

```

16. Listar los cursos impartidos por profesores del departamento de Matemáticas.

```sql

```

17. Mostrar los cursos en los que se haya inscrito algún estudiante antes del año 2022.

```sql

```

18. Mostrar estudiantes que han cursado materias impartidas por el profesor “Dr. Luis Gómez”.

```sql

```

19. Mostrar los cursos más recientes (última matrícula por curso).

```sql

```

20. Mostrar el número total de estudiantes por departamento del profesor que imparte el curso.

```sql

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

```

2. Ejecutar el procedimiento para inscribir al estudiante con ID 1 en el curso con ID 2.

```sql

```

3. Eliminar el procedimiento.


```sql

```

---

## 🪞 Parte 4: Vistas

1. Crear una vista llamada `resumen_matriculas` que muestre:
   - Nombre del estudiante
   - Nombre del curso
   - Nombre del profesor
   - Fecha de matrícula

```sql

```

2. Consultar los datos desde la vista, mostrando nombre del estudiante y curso.

```sql

```

3. Eliminar la vista.

```sql

```

---

## 🧮 Parte 5: Función Definida por el Usuario

1. Crear una función llamada `promedio_creditos_por_anio` que reciba un año como parámetro y devuelva el promedio de créditos matriculados por estudiante ese año.

```sql

```

2. Ejecutar la función para el año 2023.

```sql

```

3. Eliminar la función.

```sql

```

---

## 📂 Parte 6: Índices

1. Crear un índice en la columna `fecha` de la tabla `matriculas`.

```sql

```

2. Crear un índice compuesto en la tabla `matriculas` sobre `estudiante_id` y `curso_id`.

```sql

```

3. Consultar los índices de la tabla `matriculas`.

```sql

```

4. Eliminar ambos índices.

```sql

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

```

2. Crear un trigger `AFTER INSERT` sobre `matriculas` que inserte un registro en `auditoria_matriculas` al realizar una matrícula.

```sql

```

3. Consultar los registros de la auditoría.

```sql

```

4. Eliminar el trigger y la tabla de auditoría.

```sql

```

## Referencias

- [Procedimientos en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/PROCEDIMIENTOS.md).
- [Funciones en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/FUNCIONES.md).
- [Vistas en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-6/Vistas.md).
- [Triggers en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/TRIGERS.md).

</div>