<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Base de datos (Repaso Subconsultas")

<div align="center">

<img src="https://gendigital.pe/wp-content/uploads/2022/08/Gen-Digital-Haz-crecer-tu-tienda-online-con-5-consejos-de-Marketing-Digital.jpg" width="500px"/>
</div>

## Objetivo

> Análisis de Datos de una Tienda en Línea usando Subconsultas SQL

Desarrollar habilidades en el uso de subconsultas SQL para resolver problemas complejos de análisis de datos en un contexto realista.

## Descripción

Trabajarás con una base de datos SQLite3 de una tienda en línea que contiene tres tablas:

- clientes: Información de los clientes (nombre, ciudad, gasto total, etc.).

- productos: Catálogo de productos (precio, categoría, stock, etc.).

- pedidos: Registro de transacciones (cliente, producto, fecha, estado, etc.).

> Cada consulta debe incluir al menos una subconsulta (en WHERE, FROM, SELECT, HAVING, etc.).

Usa distintos tipos de subconsultas: correlacionadas, con IN, EXISTS, ALL, ANY, comparativas, etc.

- Ejemplos de problemas a resolver:
 - "Clientes que gastaron más que el promedio de su ciudad."
 - "Productos con stock inferior al promedio de pedidos de su categoría."
 - "Pedidos realizados en las mismas fechas que los de un cliente específico."

```sql
-- Tabla Clientes
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    email TEXT UNIQUE,
    telefono TEXT,
    ciudad TEXT,
    fecha_registro DATE,
    total_compras REAL DEFAULT 0
);

-- Tabla Productos
CREATE TABLE productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    categoria TEXT,
    precio REAL NOT NULL,
    stock INTEGER DEFAULT 0,
    proveedor TEXT
);

-- Tabla Pedidos
CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    fecha_pedido DATE,
    estado TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);


-- Insertamos los clientes

INSERT INTO clientes (nombre, apellido, email, telefono, ciudad, fecha_registro, total_compras) VALUES 
('Juan', 'Pérez', 'juan@email.com', '555-1001', 'Madrid', '2023-01-15', 1250.50),
('María', 'Gómez', 'maria@email.com', '555-1002', 'Barcelona', '2023-02-20', 850.75),
('Carlos', 'López', 'carlos@email.com', '555-1003', 'Valencia', '2023-03-10', 3200.00),
('Ana', 'Martínez', 'ana@email.com', '555-1004', 'Sevilla', '2023-04-05', 540.30),
('Pedro', 'Sánchez', 'pedro@email.com', '555-1005', 'Bilbao', '2023-05-12', 2100.80);

-- Insertamos los productos

INSERT INTO productos (nombre, categoria, precio, stock, proveedor) VALUES 
('Laptop Pro', 'Electrónica', 999.99, 15, 'TechCorp'),
('Smartphone X', 'Electrónica', 699.99, 25, 'TechCorp'),
('Tablet Lite', 'Electrónica', 299.99, 30, 'GadgetWorld'),
('Auriculares BT', 'Accesorios', 89.99, 50, 'SoundSystems'),
('Teclado Mecánico', 'Accesorios', 59.99, 40, 'Peripherals Inc'),
('Ratón Inalámbrico', 'Accesorios', 29.99, 60, 'Peripherals Inc'),
('Monitor 24"', 'Electrónica', 199.99, 20, 'DisplayMasters'),
('Cargador USB-C', 'Accesorios', 19.99, 100, 'PowerTech');

-- Insertamos los pedidos

INSERT INTO pedidos (cliente_id, producto_id, cantidad, fecha_pedido, estado) VALUES 
(1, 1, 1, '2023-06-01', 'Entregado'),
(1, 4, 2, '2023-06-01', 'Entregado'),
(2, 2, 1, '2023-06-05', 'En proceso'),
(3, 1, 1, '2023-06-10', 'Entregado'),
(3, 3, 1, '2023-06-10', 'Entregado'),
(3, 5, 1, '2023-06-10', 'Entregado'),
(4, 6, 3, '2023-06-15', 'Cancelado'),
(5, 7, 2, '2023-06-20', 'En proceso'),
(5, 8, 5, '2023-06-20', 'En proceso'),
(2, 3, 1, '2023-06-25', 'Pendiente');
```
1.- Clientes que han realizado pedidos por encima del promedio de cantidad

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT nombre, apellido 
FROM clientes 
WHERE id IN (
    SELECT cliente_id 
    FROM pedidos 
    WHERE cantidad > (SELECT AVG(cantidad) FROM pedidos)
);
```

</details>

2.- Productos que nunca han sido pedidos

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT nombre 
FROM productos 
WHERE id NOT IN (
    SELECT DISTINCT producto_id 
    FROM pedidos 
    WHERE producto_id IS NOT NULL
);
```

</details>

3.- Clientes con total de compras mayor que el promedio

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT nombre, apellido, total_compras 
FROM clientes 
WHERE total_compras > (
    SELECT AVG(total_compras) 
    FROM clientes
);
```

</details>

4.- Productos con precio superior al promedio de su categoría

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT p1.nombre, p1.precio, p1.categoria 
FROM productos p1 
WHERE p1.precio > (
    SELECT AVG(p2.precio) 
    FROM productos p2 
    WHERE p2.categoria = p1.categoria
);
```

</details>

5.- Pedidos de clientes de Barcelona

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT p.* 
FROM pedidos p 
WHERE p.cliente_id IN (
    SELECT id 
    FROM clientes 
    WHERE ciudad = 'Barcelona'
);
```

</details>

6.- Productos con stock menor que el promedio de pedidos de ese producto

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT pr.nombre, pr.stock 
FROM productos pr 
WHERE pr.stock < (
    SELECT AVG(pe.cantidad) 
    FROM pedidos pe 
    WHERE pe.producto_id = pr.id
);
```

</details>

7.- Clientes que han comprado productos de la categoría 'Electrónica'

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.nombre, c.apellido 
FROM clientes c 
WHERE EXISTS (
    SELECT 1 
    FROM pedidos p 
    JOIN productos pr ON p.producto_id = pr.id 
    WHERE p.cliente_id = c.id AND pr.categoria = 'Electrónica'
);
```

</details>

8.- Productos más caros que todos los productos de la categoría 'Accesorios'

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT nombre, precio 
FROM productos 
WHERE precio > ALL (
    SELECT precio 
    FROM productos 
    WHERE categoria = 'Accesorios'
);
```

</details>

9.- Clientes que han realizado más pedidos que el cliente promedio

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.nombre, c.apellido 
FROM clientes c 
WHERE (
    SELECT COUNT(*) 
    FROM pedidos p 
    WHERE p.cliente_id = c.id
) > (
    SELECT AVG(pedidos_por_cliente) 
    FROM (
        SELECT COUNT(*) as pedidos_por_cliente 
        FROM pedidos 
        GROUP BY cliente_id
    )
);
```

</details>

10.- Productos con precio igual al máximo precio de su categoría

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT p1.nombre, p1.precio, p1.categoria 
FROM productos p1 
WHERE p1.precio = (
    SELECT MAX(p2.precio) 
    FROM productos p2 
    WHERE p2.categoria = p1.categoria
);
```

</details>

11.- Clientes que han gastado más que el promedio de gasto por cliente

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.nombre, c.apellido, c.total_compras 
FROM clientes c 
WHERE c.total_compras > (
    SELECT AVG(total_compras) 
    FROM clientes
);
```

</details>

12.- Pedidos realizados en la misma fecha que el pedido más reciente de Juan Pérez

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT p.* 
FROM pedidos p 
WHERE p.fecha_pedido = (
    SELECT MAX(p2.fecha_pedido) 
    FROM pedidos p2 
    JOIN clientes c ON p2.cliente_id = c.id 
    WHERE c.nombre = 'Juan' AND c.apellido = 'Pérez'
);
```

</details>

13.- Productos que han sido pedidos por todos los clientes de Madrid

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT pr.nombre 
FROM productos pr 
WHERE NOT EXISTS (
    SELECT c.id 
    FROM clientes c 
    WHERE c.ciudad = 'Madrid' 
    AND NOT EXISTS (
        SELECT 1 
        FROM pedidos p 
        WHERE p.cliente_id = c.id AND p.producto_id = pr.id
    )
);
```

</details>

14.- Clientes que han comprado todos los productos de la categoría 'Accesorios'

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.nombre, c.apellido 
FROM clientes c 
WHERE NOT EXISTS (
    SELECT p.id 
    FROM productos p 
    WHERE p.categoria = 'Accesorios' 
    AND NOT EXISTS (
        SELECT 1 
        FROM pedidos pe 
        WHERE pe.cliente_id = c.id AND pe.producto_id = p.id
    )
);
```

</details>

15.- Productos con precio mayor que el precio promedio de los productos pedidos por Carlos López

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT pr.nombre, pr.precio 
FROM productos pr 
WHERE pr.precio > (
    SELECT AVG(p.precio) 
    FROM productos p 
    JOIN pedidos pe ON p.id = pe.producto_id 
    JOIN clientes c ON pe.cliente_id = c.id 
    WHERE c.nombre = 'Carlos' AND c.apellido = 'López'
);
```

</details>

16.- Clientes que han realizado pedidos en todas las fechas en las que ha pedido María Gómez

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.nombre, c.apellido 
FROM clientes c 
WHERE NOT EXISTS (
    SELECT DISTINCT p.fecha_pedido 
    FROM pedidos p 
    JOIN clientes cl ON p.cliente_id = cl.id 
    WHERE cl.nombre = 'María' AND cl.apellido = 'Gómez' 
    AND NOT EXISTS (
        SELECT 1 
        FROM pedidos p2 
        WHERE p2.cliente_id = c.id AND p2.fecha_pedido = p.fecha_pedido
    )
);
```

</details>

17.- Productos que tienen un precio mayor que cualquier producto pedido por Ana Martínez

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT pr.nombre, pr.precio 
FROM productos pr 
WHERE pr.precio > ALL (
    SELECT p.precio 
    FROM productos p 
    JOIN pedidos pe ON p.id = pe.producto_id 
    JOIN clientes c ON pe.cliente_id = c.id 
    WHERE c.nombre = 'Ana' AND c.apellido = 'Martínez'
);
```

</details>

18.- Clientes cuyo total de compras es mayor que la suma de compras de todos los clientes de Sevilla

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.nombre, c.apellido, c.total_compras 
FROM clientes c 
WHERE c.total_compras > (
    SELECT SUM(c2.total_compras) 
    FROM clientes c2 
    WHERE c2.ciudad = 'Sevilla'
);
```

</details>

19.- Productos que han sido pedidos más veces que el producto promedio

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT pr.nombre, COUNT(*) as veces_pedido 
FROM productos pr 
JOIN pedidos pe ON pr.id = pe.producto_id 
GROUP BY pr.id, pr.nombre 
HAVING COUNT(*) > (
    SELECT AVG(conteo) 
    FROM (
        SELECT COUNT(*) as conteo 
        FROM pedidos 
        GROUP BY producto_id
    )
);
```

</details>

20.- Clientes que han comprado al menos un producto de cada categoría

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.nombre, c.apellido 
FROM clientes c 
WHERE NOT EXISTS (
    SELECT p.categoria 
    FROM productos p 
    WHERE NOT EXISTS (
        SELECT 1 
        FROM pedidos pe 
        WHERE pe.cliente_id = c.id AND pe.producto_id IN (
            SELECT p2.id 
            FROM productos p2 
            WHERE p2.categoria = p.categoria
        )
    )
);
```

</details>


</div>