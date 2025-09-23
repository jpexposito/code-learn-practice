# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice("Examen final de BBDD de librería 🧪)

## 📋 Contexto

Eres el responsable de bases de datos de una librería. Deberás demostrar tu habilidad para consultar, extender y optimizar la base de datos que contiene información sobre libros, autores, clientes, pedidos y empleados.

Si la base de datos no estuviera creada, utiliza el [init.sql](docker-init/init.sql).

## Base de datos en docker

Sigue estos pasos:

1. Crea una carpeta con el fichero **docker-compose.yml** y el directorio **docker-**

```bash
docker-compose up -d
```

3. Accede al contenedor:

```bash
docker exec -it simulacro5-db-1 mysql -u root -p
# Contraseña: bae
```

4. Usa la base de datos **libreria**:

```sql
USE libreria;
```

Adminer también está disponible en [http://localhost:8100](http://localhost:80100). Usa:

- Sistema: `MySQL`
- Servidor: `db`
- Usuario: `root`
- Contraseña: `bae`

---

> ***ES OBLIGATORIO AÑADIR EL RESULTADO DE LA OPERACIÓN QUE SE ESTA REALIZANDO. EN CASO CONTRARIO SERÁ PUESTA COMO ERRÓNEA***

## 📋 Parte 1: Consultas SQL

### 📒 A: Consultas simples

1. Mostrar todos los libros registrados.

```sql
```

2. Listar nombres y nacionalidad de los autores.

```sql
```

3. Ver todos los pedidos realizados.

```sql
```

4. Mostrar nombre y teléfono de los clientes.

```sql
```
5. Mostrar los libros con su título, género y precio.

```sql
```

### 📊 B: Consultas con WHERE (con Where obligatorio para mezclar dos o más tablas)

6. Pedidos realizados por clientes de "Barcelona".

```sql
```

7. Libros con precio superior a 30€.

```sql
```

8. Pedidos realizados después de 2023.

```sql
```

9. Libros de autores de nacionalidad "Argentina".

```sql
```

10. Título de libros junto con el nombre de su autor.

```sql
```

### 📊 C: Consultas con JOIN (para mezclar 2 o más tablas)

11. Pedidos realizados por empleados llamados "Marta".

```sql
```

12. Clientes que compraron libros de género "Fantasia".

```sql
```

13. Libros que no tienen autor asignado.

```sql
```

14. Libros con más de 300 páginas.

```sql
```

15. Pedidos realizados por clientes que compraron más de un libro.

```sql
```

### 📊 D: Subconsultas

16. Mostrar libros de autores que hayan escrito más de 3 libros.

```sql
```

17. Clientes que compraron el libro llamado "1984".

```sql
```

18. Libros que hayan sido pedidos al menos una vez.

```sql
```

19. Pedidos hechos por clientes con más de 2 compras.

```sql
```

20. Autores de libros que nunca han sido vendidos.

```sql
```

---

## 📂 Parte 2: Índices

1. Crear índice en columna ciudad de clientes.

```sql
```

2. Crear índice en columna género de libros.

```sql
```

3. Ver los índices existentes en ambas tablas.

```sql
```

4. Eliminar los índices creados.

```sql
```

---

## 🗐 Parte 3: Vistas

1. Crear vista `vista_pedidos_completos` con:

```sql
```

   - Nombre del cliente
   - Título del libro
   - Fecha del pedido
   - Nombre del empleado

2. Consultar pedidos de libros llamados "El Quijote".

```sql
```

3. Eliminar la vista.

```sql
```

---

## ⚙ Parte 4: Procedimiento almacenado

1. Crear procedimiento `libros_por_nacionalidad` que reciba una nacionalidad y devuelva los libros de autores de esa nacionalidad.

```sql
```

2. Ejecutar con nacionalidad "Española".

```sql
```

3. Eliminar el procedimiento.

```sql
```

---

## ⚖ Parte 5: Funciones

1. Crear función `numero_pedidos_cliente` que reciba el nombre de un cliente y devuelva la cantidad de pedidos que ha hecho.

```sql
```

2. Consultar función con cliente "Ana Pérez".

```sql
```

3. Eliminar la función.

```sql
```

---

## 🛡 Parte 6: Trigger de auditoría

1. Crear tabla `auditoria_pedidos` para registrar inserciones en pedidos.

```sql
```

2. Crear trigger `after_insert_pedidos` que registre en `auditoria_pedidos` al insertar en `pedidos`.

```sql
```

3. Insertar un pedido y consultar auditoría.

```sql
```

4. Eliminar trigger y tabla de auditoría.

```sql
```

---

# 🧱 Rúbrica de Evaluación – Examen SQL Librería

| Criterio                         | Descripción                             | Máx. Puntos |
| -------------------------------- | --------------------------------------- | ----------- |
| 🔍 Parte 1: Consultas SQL        |                                         | **30 pts**  |
| - Consultas simples              | SELECT, FROM, WHERE básico              | 5 pts       |
| - Consultas con WHERE            | JOINs con filtros correctos             | 7 pts       |
| - Consultas con JOIN             | JOIN múltiple bien estructurado         | 8 pts       |
| - Subconsultas                   | Subconsultas correlacionadas o anidadas | 10 pts      |
| 📈 Parte 2: Índices              |                                         | **10 pts**  |
| - Creación                       | INDEX bien formado                      | 5 pts       |
| - Eliminación y consulta         | SHOW INDEX, DROP INDEX                  | 5 pts       |
| 🔍 Parte 3: Vistas               |                                         | **15 pts**  |
| - Creación                       | SELECT con JOINs correctos              | 7 pts       |
| - Consulta                       | WHERE sobre vista                       | 5 pts       |
| - Eliminación                    | DROP VIEW                               | 3 pts       |
| ⚙ Parte 4: Procedimiento         |                                         | **15 pts**  |
| - Creación                       | PARÁMETROS, BEGIN, END correctos        | 7 pts       |
| - Ejecución                      | CALL correcto                           | 5 pts       |
| - Eliminación                    | DROP PROCEDURE                          | 3 pts       |
| 📊 Parte 5: Funciones            |                                         | **15 pts**  |
| - Definición                     | RETURNS, DECLARE correctos              | 7 pts       |
| - Ejecución                      | SELECT función()                        | 5 pts       |
| - Eliminación                    | DROP FUNCTION                           | 3 pts       |
| 🛡 Parte 6: Trigger de auditoría |                                         | **15 pts**  |
| - Tabla auditoría                | Campos relevantes                       | 5 pts       |
| - Trigger                        | AFTER INSERT funcional                  | 7 pts       |
| - Consulta/eliminación           | Registro y DROP correctos               | 3 pts       |
| **Total**                        |                                         | **100 pts** |