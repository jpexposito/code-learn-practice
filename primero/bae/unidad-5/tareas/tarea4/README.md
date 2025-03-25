<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Base de datos (Trabajo con funciones en BBDD")

<div align="center">
<img src="https://i0.wp.com/hunna.org/wp-content/uploads/2014/06/huellas.jpg?resize=324%2C215" width="500px"/>
</div>

## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos:

### Paso 1: Creación de la BBDD

Crea con el siguente contenido el fichero __supermercado-dump.sql__.

```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO productos (id, nombre, categoria, precio) VALUES 
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
```
  
### Paso 2 Lectura del fichero sql.

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 tarea4.db 
```

Haciendo un __.read__ del fichero __sql__, de nombre __supermercado-db.sql__, realiza la creación e inserción de información de la __BBDD__.

### Paso 3: Responde a las siguientes cuestiones

- Realiza el diagrama __ER__ de la __BBDD__ supermercado.
- Realiza el diagrama __MR__ de la __BBDD__ supermercado.
- Indica si la BBDD esta __normalizada__ hasta la 3ª forma normal, justificando la respuesta.

### Paso 4: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Mostrar todos los productos de la categoría "Bebidas".
- Listar los productos ordenados por precio de forma descendente.
- Calcular el precio total de todos los productos en la tabla "productos".
- Encontrar los productos con un nombre que contenga la letra 'a'.
- Obtener la cantidad total de productos vendidos en todas las fechas.
- Encontrar el producto más caro en cada categoría.
- Listar los productos que no han sido vendidos.
- Calcular el precio promedio de los productos en la categoría "Snacks".
- Encontrar los productos que han sido vendidos más de 5 veces.
- Mostrar la fecha y la cantidad de ventas para cada producto.
- Encontrar los productos que tienen un precio menor o igual a 2.
- Calcular la cantidad total de ventas para cada fecha.
- Listar los productos cuyo nombre comienza con la letra 'P'.
- Obtener el producto más vendido en términos de cantidad.
- Mostrar los productos que fueron vendidos en la fecha '__2024-01-18__'.
- Calcular el total de ventas para cada producto.
- Encontrar los productos con un precio entre 3 y 4.
- Listar los productos y sus categorías ordenados alfabéticamente por categoría.
- Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.
- Mostrar los productos que no pertenecen a la categoría "__Higiene__".
- Encontrar la cantidad total de productos en cada categoría.
- Listar los productos que tienen un precio igual a la media de precios.
- Calcular el precio total de los productos vendidos en cada fecha.
- Mostrar los productos con un nombre que termina con la letra 'o'.
- Encontrar los productos que han sido vendidos en más de una fecha.
- Listar los productos cuya categoría comienza con la letra 'L'.
- Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
- Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
- Encontrar los productos que tienen un precio superior al precio máximo en la tabla "__productos__".

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
-- 1. Mostrar todos los productos de la categoría "Bebidas"
SELECT * FROM productos WHERE categoria = 'Bebidas';

-- 2. Listar los productos ordenados por precio de forma descendente
SELECT * FROM productos ORDER BY precio DESC;

-- 3. Calcular el precio total de todos los productos en la tabla "productos"
SELECT SUM(precio) AS precio_total FROM productos;

-- 4. Encontrar los productos con un nombre que contenga la letra 'a'
SELECT * FROM productos WHERE nombre LIKE '%a%';

-- 5. Obtener la cantidad total de productos vendidos en todas las fechas
SELECT SUM(cantidad) AS total_vendido FROM ventas;

-- 6. Encontrar el producto más caro en cada categoría
SELECT categoria, MAX(precio) AS precio_maximo FROM productos GROUP BY categoria;

-- 7. Listar los productos que no han sido vendidos
SELECT * FROM productos WHERE id NOT IN (SELECT DISTINCT id_producto FROM ventas);

-- 8. Calcular el precio promedio de los productos en la categoría "Snacks"
SELECT AVG(precio) AS precio_promedio FROM productos WHERE categoria = 'Snacks';

-- 9. Encontrar los productos que han sido vendidos más de 5 veces
SELECT id_producto, SUM(cantidad) AS total_vendido 
FROM ventas 
GROUP BY id_producto 
HAVING total_vendido > 5;

-- 10. Mostrar la fecha y la cantidad de ventas para cada producto
SELECT productos.nombre, ventas.fecha, ventas.cantidad
FROM ventas 
JOIN productos ON ventas.id_producto = productos.id;

-- 11. Encontrar los productos que tienen un precio menor o igual a 2
SELECT * FROM productos WHERE precio <= 2;

-- 12. Calcular la cantidad total de ventas para cada fecha
SELECT fecha, SUM(cantidad) AS total_vendido FROM ventas GROUP BY fecha;

-- 13. Listar los productos cuyo nombre comienza con la letra 'P'
SELECT * FROM productos WHERE nombre LIKE 'P%';

-- 14. Obtener el producto más vendido en términos de cantidad
SELECT id_producto, SUM(cantidad) AS total_vendido
FROM ventas 
GROUP BY id_producto 
ORDER BY total_vendido DESC 
LIMIT 1;

-- 15. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'
SELECT productos.* 
FROM productos 
JOIN ventas ON productos.id = ventas.id_producto
WHERE ventas.fecha = '2024-01-18';

-- 16. Calcular el total de ventas para cada producto
SELECT productos.nombre, SUM(ventas.cantidad) AS total_vendido
FROM productos
JOIN ventas ON productos.id = ventas.id_producto
GROUP BY productos.nombre;

-- 17. Encontrar los productos con un precio entre 3 y 4
SELECT * FROM productos WHERE precio BETWEEN 3 AND 4;

-- 18. Listar los productos y sus categorías ordenados alfabéticamente por categoría
SELECT * FROM productos ORDER BY categoria ASC, nombre ASC;

-- 19. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'
SELECT SUM(productos.precio * ventas.cantidad) AS total_ventas
FROM productos 
JOIN ventas ON productos.id = ventas.id_producto
WHERE ventas.fecha = '2024-01-19';

-- 20. Mostrar los productos que no pertenecen a la categoría "Higiene"
SELECT * FROM productos WHERE categoria != 'Higiene';

-- 21. Encontrar la cantidad total de productos en cada categoría
SELECT categoria, COUNT(*) AS total_productos FROM productos GROUP BY categoria;

-- 22. Listar los productos que tienen un precio igual a la media de precios
SELECT * FROM productos WHERE precio = (SELECT AVG(precio) FROM productos);

-- 23. Calcular el precio total de los productos vendidos en cada fecha
SELECT ventas.fecha, SUM(productos.precio * ventas.cantidad) AS total_ventas
FROM productos 
JOIN ventas ON productos.id = ventas.id_producto
GROUP BY ventas.fecha;

-- 24. Mostrar los productos con un nombre que termina con la letra 'o'
SELECT * FROM productos WHERE nombre LIKE '%o';

-- 25. Encontrar los productos que han sido vendidos en más de una fecha
SELECT id_producto, COUNT(DISTINCT fecha) AS total_fechas
FROM ventas
GROUP BY id_producto
HAVING total_fechas > 1;

-- 26. Listar los productos cuya categoría comienza con la letra 'L'
SELECT * FROM productos WHERE categoria LIKE 'L%';

-- 27. Calcular el total de ventas para cada producto en la fecha '2024-01-17'
SELECT productos.nombre, SUM(ventas.cantidad) AS total_vendido
FROM productos
JOIN ventas ON productos.id = ventas.id_producto
WHERE ventas.fecha = '2024-01-17'
GROUP BY productos.nombre;

-- 28. Mostrar los productos cuyo nombre tiene al menos 5 caracteres
SELECT * FROM productos WHERE LENGTH(nombre) >= 5;

-- 29. Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos"
SELECT * FROM productos WHERE precio > (SELECT MAX(precio) FROM productos);
```

</details>

### Generación Informe

Genera un informe con cada una de las consultas y los resuldos obtenidos tras su ejecución. El informe se debe de realizar en __markdown, y enviar el enlace__.

</div>