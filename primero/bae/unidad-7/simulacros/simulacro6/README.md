
# 🧠 Examen final de BBDD de GESTIÓN CINE 🎬

## 📋 Contexto

Eres el responsable de la base de datos de un sistema de gestión de cine. Deberás demostrar tu habilidad para consultar, extender y optimizar una base de datos que gestiona información sobre películas, actores, sesiones, clientes y reservas.

Si la base de datos no estuviera creada, utiliza el script `init.sql`.

Si la base de datos no estuviera creada, utiliza el [init.sql](docker-init/init.sql).

## Base de datos en docker

Sigue estos pasos:

1. Crea una carpeta con el fichero **docker-compose.yml** y el directorio **docker-**

```bash
docker-compose up -d
```

3. Accede al contenedor:

```bash
docker exec -it simulacro6-db-1 mysql -u root -p
# Contraseña: bae
```

4. Usa la base de datos **libreria**:

```sql
USE cine;
```

Adminer también está disponible en [http://localhost:8101](http://localhost:80101). Usa:

- Sistema: `MySQL`
- Servidor: `db`
- Usuario: `root`
- Contraseña: `bae`

---

> ***ES OBLIGATORIO AÑADIR EL RESULTADO DE LA OPERACIÓN QUE SE ESTA REALIZANDO (PODRIAN EXISTIR SALIDAS VACIAS). EN CASO CONTRARIO SERÁ PUESTA COMO ERRÓNEA***

## 🎬 Parte 1: Consultas SQL

### 📒 A: Consultas simples

1. Mostrar todas las películas registradas.

```sql
```

2. Listar nombres y nacionalidades de los actores.

```sql
```

3. Ver todas las sesiones disponibles.

```sql
```

4. Mostrar nombre y teléfono de los clientes.

```sql
```

5. Mostrar las películas con su título, género y duración.

```sql
```

### 📊 B: Consultas con WHERE

6. Películas proyectadas después del año 2020.

```sql
```

7. Actores con nacionalidad "Española".

```sql
```

8. Reservas realizadas antes de la fecha actual.

```sql
```

9. Clientes que viven en "Madrid".

```sql
```

10. Títulos de películas junto con los nombres de sus actores.

```sql
```

### 🔀 C: Consultas con JOIN

11. Sesiones con películas de género "Ciencia ficción".

```sql
```

12. Clientes que han reservado entradas para películas de más de 2 horas.

```sql
```

13. Películas sin sesiones asignadas.

```sql
```

14. Películas con más de un actor principal.

```sql
```

15. Reservas hechas por clientes que han reservado al menos 3 veces.

```sql
```

### 🔁 D: Subconsultas

16. Mostrar películas que tienen más de 3 reservas.

```sql
```

17. Clientes que han reservado para ver la película "Inception".

```sql
```

18. Actores que participan en más de 2 películas.

```sql
```

19. Sesiones que se realizarán en cines de más de 100 butacas.

```sql
```

20. Películas que nunca han sido reservadas.

```sql
```

## 🧱 Parte 2: Índices 

1. Crear índice en columna género de películas.

```sql
```

1. Mostrar índices existentes.

```sql
```

2. Eliminar los índices creados.

```sql
```

## 🔍 Parte 3: Vistas

1. Crear vista `vista_reservas_completas` con:
   - Nombre del cliente
   - Título de la película
   - Fecha de la sesión
   - Sala asignada

```sql
```

2. Consultar las reservas de la película "Titanic".

```sql
```

3. Eliminar la vista.

```sql
```

## 🔧 Parte 4: Procedimiento almacenado

1. Crear procedimiento `peliculas_por_genero` que reciba un género y devuelva todas las películas de ese género.

```sql
```

2. Ejecutar con género "Comedia".

```sql
```

3. Eliminar el procedimiento.

```sql
```

## 🧮 Parte 5: Funciones

1. Crear función `numero_reservas_cliente` que reciba el nombre de un cliente y devuelva la cantidad de reservas realizadas.

```sql
```

2. Consultar función con cliente "Carlos Ruiz".

```sql
```

3. Eliminar la función.

```sql
```

## 🛑 Parte 6: Trigger de auditoría

1. Crear tabla `auditoria_reservas` para registrar inserciones en reservas.

```sql
```

2. Crear trigger `after_insert_reservas` que registre automáticamente cada nueva reserva.

```sql
```

3. Insertar una reserva y consultar auditoría.

```sql
```

4. Eliminar trigger y tabla de auditoría.

```sql
```

---

# 🧾 Rúbrica de Evaluación – Examen SQL Gestión Cine

| Criterio                         | Descripción                             | Máx. Puntos |
| -------------------------------- | --------------------------------------- | ----------- |
| 🔍 Parte 1: Consultas SQL        |                                         | **35 pts**  |
| - Consultas simples              | SELECT, FROM, WHERE básico              | 5 pts       |
| - Consultas con WHERE            | Combinación de tablas con Where         | 7 pts       |
| - Consultas con JOIN             | Combinación de tablas con Join          | 8 pts       |
| - Subconsultas                   | Subconsultas correlacionadas o anidadas | 15 pts      |
| 📈 Parte 2: Índices              |                                         | **5 pts**  |
| - Creación/visualizar/eliminar   | 3 Operaciones                           | 5 pts       |
| 🔍 Parte 3: Vistas               |                                         | **10 pts**  |
| - Creación                       | SELECT con JOINs correctos              | 7 pts       |
| - Consulta                       | WHERE sobre vista                       | 2 pts       |
| - Eliminación                    | DROP VIEW                               | 1 pts       |
| ⚙ Parte 4: Procedimiento         |                                         | **10 pts**  |
| - Creación                       | PARÁMETROS, BEGIN, END correctos        | 7 pts       |
| - Ejecución                      | CALL correcto                           | 2 pts       |
| - Eliminación                    | DROP PROCEDURE                          | 1 pts       |
| 📊 Parte 5: Funciones            |                                         | **10 pts**  |
| - Definición                     | RETURNS, DECLARE correctos              | 7 pts       |
| - Ejecución                      | SELECT función()                        | 2 pts       |
| - Eliminación                    | DROP FUNCTION                           | 1 pts       |
| 🛡 Parte 6: Trigger de auditoría |                                         | **15 pts**  |
| - Tabla auditoría                | Campos relevantes                       | 5 pts       |
| - Trigger                        | AFTER INSERT funcional                  | 7 pts       |
| - Consulta/eliminación           | Registro y DROP correctos               | 3 pts       |
| **Total**                        |                                         | **85 pts** |
