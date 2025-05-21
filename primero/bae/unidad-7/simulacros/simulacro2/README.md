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
- **Usuario**: `bae`
- **Contraseña**: `bae`

> ***Lee atentamente cada una de los puntos y cuestiones y realiza***.

## 🔎 Parte 1: Consultas SQL

### A. Consultas Simples

1. Mostrar todos los cursos disponibles.

```sql

```

2. Mostrar el nombre de todos los profesores.

```sql
```

3. Listar todas las matrículas.

```sql
```

4. Ver los nombres y correos de los estudiantes.

```sql
```

5. Ver los cursos y su número de créditos.

```sql
```
---

### B. Consultas con `WHERE`. Obligatorio utilizar **WHERE** donde se **combine dos o más tablas**

1. Obtener los cursos impartidos por profesores del departamento de Informática.

```sql
```

2. Obtener los estudiantes que viven en Madrid.

```sql
```

3. Mostrar los cursos con más de 5 créditos.

```sql
```

4. Ver las matrículas realizadas después del año 2022.

```sql
```

5. Ver los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
```

---

### C. Consultas con `JOIN`.  Obligatorio utilizar **JOIN** donde se **combine dos o más tablas**

> (Devuelven el mismo resultado que las anteriores, pero usando combinaciones de tablas)

1. Mostrar cursos impartidos por profesores del departamento de Informática.

```sql
```

2. Obtener estudiantes que viven en Madrid.

```sql
```

3. Mostrar cursos con más de 5 créditos.

```sql
```

4. Listar matrículas realizadas después del año 2022.

```sql
```

5. Mostrar los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
```
---

### D. Consultas con Subconsultas

> (Devuelven el mismo resultado que las anteriores, pero usando subconsultas)

1. Cursos impartidos por profesores del departamento de Informática.

```sql
```

2. Estudiantes que viven en Madrid.

```sql
```

3. Cursos con más de 5 créditos.

```sql
```

4. Matrículas realizadas después del año 2022.

```sql
```

5. Cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
```

---

## 📂 Parte 2: Índices

1. Crear un índice en la columna `ciudad` de la tabla `estudiantes`.

```sql
```

2. Crear un índice en la columna `departamento` de la tabla `profesores`.

```sql
```

3. Consultar los índices creados.

```sql
```

4. Eliminar ambos índices.

```sql
```
---

## 🪞 Parte 3: Vistas

1. Crear una vista llamada `vista_matriculas_completas` que muestre:
   - nombre del estudiante,
   - nombre del curso,
   - fecha de la matrícula.

```sql
```

2. Consultar datos desde la vista, mostrando el nombre del estudiante y la fecha de matrícula.

```sql
```

3. Eliminar la vista.

```sql
```

---

## ⚙ Parte 4: Procedimiento Almacenado

1. Crear un procedimiento llamado `cursos_por_profesor` que reciba el nombre del profesor como parámetro y devuelva los cursos que imparte y su número de créditos.

```sql
```

2. Ejecutar el procedimiento con el nombre “Dr. Luis Gómez”.

```sql
```

3. Eliminar el procedimiento.

```sql
```

---

## 🔢 Parte 5: Función Definida por el Usuario

1. Crear una función llamada `total_creditos_estudiante` que reciba el ID de un estudiante y devuelva el total de créditos que ha matriculado.

```sql
```

2. Ejecutar la función para un estudiante específico.

```sql
```

3. Eliminar la función.

```sql
```

</div>