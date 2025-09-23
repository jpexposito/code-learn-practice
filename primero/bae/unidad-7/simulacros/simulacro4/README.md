<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice("Examen final de bbdd 🧪)

<div align="center">
<img src="https://www.prensalibre.com/wp-content/uploads/2019/01/Nota-cuidados-1.jpg?quality=52" width="200px"/>
</div>

## 🧾 Contexto

Eres el analista de datos en una clínica veterinaria. Debes demostrar tu habilidad para consultar, optimizar, extender y auditar la base de datos mediante SQL. La BBDD gestiona clientes, mascotas, veterinarios y visitas.. Si la base de datos no estuvira creada, a continuación tienes el [init.sql](docker-init/init.sql).

## Base de datos en docker

Crea una carpeta y añade el fichero **docker-compose.yml** y el directorio **docker-init**.

Ejecuta a continuación el siguiente comando:

```sql
docker-compose up -d 
```

Obtendrar una salida similar a la siguiente:

```console
 docker-compose up -d   
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
| clinica            |
+--------------------+
6 rows in set (0.00 sec)
```

Usa la base de datos **clinica**: (*use clinica;*)

```console
use clinica;
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

## 🧾 Parte 1: Consultas SQL

### 📄 A: Consultas para explorar la Estructura de las Tablas

1. Mostrar todas las mascotas registradas.

```sql
| id | nombre | especie | raza      | edad | cliente_id |
|----|--------|---------|-----------|------|------------|
```

2. Ver los nombres y especialidades de los veterinarios.

```sql
| nombre           | especialidad     |
|------------------|------------------|
```

3. Listar todas las visitas.

```sql

```

4. Ver el nombre y teléfono de los clientes.

```sql

```

5. Ver las mascotas con su especie y edad.

```sql

```

---

### 📊 B. Consultas con WHERE (obligatorio combinar tablas)

6. Mostrar visitas realizadas por veterinarios especializados en “Cirugia”.

```sql

```

7. Obtener mascotas cuya edad sea mayor de 5 años.

```sql

```

8. Mostrar visitas después del año 2023.

```sql

```

9. Listar mascotas de clientes de “Madrid”.

```sql

```

10. Nombre de las mascotas con el nombre de sus dueños.

```sql

```

---

### 📊 C. Consultas con JOIN (obligatorio combinar tablas)

11. Mostrar visitas realizadas por veterinarios especializados en “Cirugia”.

```sql

```

12. Obtener mascotas cuya edad sea mayor de 5 años.

```sql

```

13. Mostrar visitas después del año 2023.

```sql

```

14. Listar mascotas de clientes de “Madrid”.

```sql

```

15. Mascotas atendidas por el “Dr. Pablo Torres”.

```sql

```

### 📊 D. Subconsultas

16. Mostrar las mascotas atendidas por veterinarios de “Dermatologia”.

```sql

```

17. Ver clientes que tienen mascotas llamadas “Milo”.

```sql

```

18. Mostrar mascotas que hayan tenido al menos una visita.

```sql

```

19. Mostrar visitas de mascotas con más de 6 años.

```sql

```

20. Ver nombres de veterinarios que han atendido mascotas de especie “Perro”.

```sql

```

## 📁 Parte 2: Índices

1. Crear un índice en la columna ciudad de la tabla clientes.

```sql

```

2. Crear un índice en la columna especialidad de veterinarios.

```sql

```

3. Ver los índices existentes en ambas tablas.

```sql

```

4. Eliminar ambos índices.

```sql

```

## 🪞 Parte 3: Vistas

1. Crear una vista llamada `vista_visitas_completas` que muestre:
 - nombre de la mascota
 - nombre del cliente
 - nombre del veterinario
 - fecha y motivo de la visita

```sql

```

2. Consultar la vista para ver visitas de mascotas llamadas “Rocky”.

```sql

```

3. Eliminar la vista.

```sql

```

---

## ⚙ Parte 4: Procedimiento Almacenado

1. Crea un procedimiento almacenado llamado **mascotas_por_especialidad** que reciba como parámetro el nombre de una especialidad veterinaria (por ejemplo, '**Dermatologia**') y devuelva todas las mascotas que hayan sido atendidas por veterinarios con dicha especialidad.

```sql

```

2. Ejecuta el procedimiento con la especialidad **Dermatologia**.

```sql
-- mascotas_por_especialidad('Dermatologia');
```

3. Eliminar el procedimiento.

```sql

```

## ⚙ Parte 5: Funciones

1. Crea una función llamada **visitas_por_especie** que reciba como parámetro el nombre de una especie de mascota (por ejemplo, 'Perro') y devuelva el número de visitas de esa especie en la base de datos.

```sql

```

2. Realiza la llamada a la función.

```sql
-- visitas_por_especie('Perro');
```

3. Realiza la eliminación de la función.

```sql

```

## 🧯 Parte 6: Trigger de Auditoría

1. Crear tabla `auditoria_visitas` para registrar inserciones:

```sql

```

2. Crear trigger `after_insert_visitas`, que realice inserciones de los datos introducidos en la tabla visitas en la tabla de **auditoria_visitas**.

```sql

```

3. Insertar una nueva visita y consultar la auditoría.

```sql
-- Insert into
-- select from
```

4. Eliminar el trigger y la tabla de auditoría.

```sql

```


# 🧮 Rúbrica de Evaluación – Examen SQL Clínica Veterinaria

| Criterio                                                  | Descripción                                                                                         | Máx. Puntos |
|-----------------------------------------------------------|-----------------------------------------------------------------------------------------------------|-------------|
| 🔍 **Parte 1: Consultas SQL**                             |                                                                                                     | **30 pts**  |
| - Consultas simples (estructura, filtrado básico)         | Uso correcto de SELECT, FROM, WHERE, columnas específicas                                           | 5 pts       |
| - Consultas con Where                                     | Where correctos con relaciones adecuadas entre tablas                                               | 7 pts       |
| - Consultas con JOIN                                      | JOIN correctos con relaciones adecuadas entre tablas                                                | 8 pts       |
| - Subconsultas                                            | Uso de subconsultas correlacionadas o anidadas                                                      | 10 pts      |
| 📈 **Parte 2: Índices**                                   |                                                                                                     | **10 pts**  |
| - Creación de índices (individuales y compuestos)         | Construcción de índices                                                                             | 5 pts       |
| - Eliminación y consulta de índices                       | Visualización y eliminación de índices                                                              | 5 pts       |
| 👁 **Parte 3: Vistas**                                    |                                                                                                     | **15 pts**  |
| - Creación de vista con múltiples tablas                  | Combinación adecuada de tablas y campos útiles                                                      | 7 pts       |
| - Consulta                                                |                                                                                                     | 5 pts       |
| - Eliminación                                             |                                                                                                     | 3 pts       |
| ⚙ **Parte 4: Procedimiento almacenado**                   |                                                                                                     | **15 pts**  |
| - Diseño lógico del procedimiento                         |                                                                                                     | 7 pts       |
| - Consulta                                                |                                                                                                     | 5 pts       |
| - Eliminación                                             |                                                                                                     | 3 pts       |
| 🔢 **Parte 5: Función definida por usuario**              |                                                                                                     | **15 pts**  |
| - Diseño lógico de la función                             |                                                                                                     | 7 pts       |
| - Consulta                                                |                                                                                                     | 5 pts       |
| - Eliminación                                             |                                                                                                     | 3 pts       |
| 🔐 **Parte 6: Trigger de auditoría**                      |                                                                                                     | **15 pts**  |
| - Creación de tabla de auditoría                          | Estructura lógica y relevante de los campos                                                         | 5 pts       |
| - Implementación del trigger                              | Registro correcto tras inserción, sin errores                                                       | 7 pts       |
| - Consulta y eliminación                                  | Comprobación y limpieza post-prueba                                                                 | 3 pts       |
| **Total**                                                 |                                                                                                     | **100 pts** |


<!-- 
## Referencias

- [Procedimientos en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/PROCEDIMIENTOS.md).
- [Funciones en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/FUNCIONES.md).
- [Vistas en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-6/Vistas.md).
- [Triggers en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/TRIGERS.md).
-->

</div>