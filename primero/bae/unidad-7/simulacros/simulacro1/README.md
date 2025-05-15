<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice("Simulacro de bbdd 🧪:  Índices, Vistas, Funciones y Procedimientos")

<div align="center">
<img src="https://www.seguridadkimika.eus/wp-content/uploads/2017/10/sirenas-seguridad-kimika-simulacro.jpg" width="200px"/>
</div>

## 🎯 Objetivo

Consolidar el uso de los principales componentes de MySQL:

- Índices
- Vistas
- Funciones
- Procedimientos

---

## 🧱 Enunciado del ejercicio

La empresa "TecnoMarket" quiere analizar las ventas realizadas por sus clientes. Para ello, necesita organizar la información en su base de datos y optimizar el rendimiento de las consultas.

### Tu tarea consiste en

1. Crear las tablas necesarias.
2. Insertar índices que mejoren las búsquedas más frecuentes.
3. Crear una vista que resuma las ventas.
4. Definir una función para calcular totales.
5. Crear un procedimiento que devuelva el resumen de ventas de un cliente específico.
6. Ejecutar el procedimiento para validar el resultado.

---

## 📘 Parte 1: Creación de tablas

```sql
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);
INSERT INTO productos (id, nombre, precio) VALUES
(1, 'Laptop', 1200.00),
(2, 'Teclado', 50.00),
(3, 'Monitor', 300.00);

INSERT INTO ventas (id, cliente_id, producto_id, fecha, cantidad) VALUES
(1, 1, 1, '2024-05-01', 1),
(2, 1, 2, '2024-05-12', 2),
(3, 2, 3, '2024-05-13', 1),
(4, 3, 2, '2024-05-14', 1);
```

---

## 🔍 Parte 2: Creación de índices

Crea los siguientes clientes:

- **idx_ciudad** sobre la tabla clientes y el campo ciudad.
- **idx_fecha** sobre la tabla ventas, y el campo fecha.

### ¿Preguntas?

- Crea los indices, muestra su rendimiento, y explica si son óptimos y por qué?.

---

## 👁️ Parte 3: Crear una vista

- **Obtén, a través de una vista**, la siguiente información detallada de cada venta:

- ID de la venta
- Nombre del cliente
- Producto vendido
- Fecha de la venta
- Cantidad comprada
- Total gastado (precio × cantidad)

La vista **vista** que consolida los datos de las tablas `ventas`, `clientes` y `productos`, permitiendo consultar fácilmente el historial de ventas detallado.

> **RECUERDA**: Una vista es una **consulta sql** encapsulada en una tabla ficticia.

### 📊 Resultado esperado

| venta_id | cliente     | producto | fecha       | cantidad | total   |
|----------|-------------|----------|-------------|----------|---------|
| 1        | Ana Pérez   | Laptop   | 2024-05-01  | 1        | 1200.00 |
| 2        | Ana Pérez   | Teclado  | 2024-05-12  | 2        | 100.00  |
| 3        | Luis Gómez  | Monitor  | 2024-05-13  | 1        | 300.00  |
| 4        | Carla Ruiz  | Teclado  | 2024-05-14  | 1        | 50.00   |

---

## 🧮 Parte 4: Crear una función

Crea una **función almacenada** en MySQL llamada `calcular_total` que reciba los siguientes parámetros:

- `precio`: un valor decimal con dos decimales (precio del producto)
- `cantidad`: un número entero que representa las unidades compradas

La función debe devolver el resultado de multiplicar ambos valores, es decir, el **total a pagar** por esa línea de venta.

```sql
SELECT calcular_total(1200.00, 2);
```

| calcular_total(1200.00, 2) |
|----------------------------|
| 2400.00                    |


---

## ⚙️ Parte 5: Crear un procedimiento

Crea un procedimiento llamado `resumen_cliente` que reciba como parámetro el **ID de un cliente** (`cliente_id`), y que devuelva el **historial de ventas** de dicho cliente.  
El procedimiento debe mostrar los siguientes datos por cada venta realizada por ese cliente:

- El **nombre del cliente**
- La **fecha de la venta**
- El **nombre del producto**
- La **cantidad comprada**
- El **total de la línea de venta**, calculado como `precio * cantidad`

💡 **Sugerencia:** Puedes reutilizar una función existente (como `calcular_total`) o calcular el total directamente en la consulta.

```sql
CALL resumen_cliente(1);
```

Con el siguiente resultado: 

| nombre     | fecha       | producto   | cantidad | total   |
|------------|-------------|------------|----------|---------|
| Ana Pérez | 2024-05-01  | Laptop     | 1        | 1200.00 |
| Ana Pérez | 2024-05-12  | Teclado    | 2        | 100.00  |

> *Este resultado depende de los datos que se hayan insertado en la base de datos.*

---

## ❓ Preguntas teóricas

1. ¿Qué ventajas ofrece el uso de una vista en lugar de una consulta con múltiples `JOIN`?
2. ¿Por qué es importante declarar una función como `DETERMINISTIC`?
3. ¿Cuál es la diferencia entre una función y un procedimiento?
4. ¿Qué impacto tienen los índices sobre el rendimiento de una base de datos?
5. ¿Cuándo se recomienda usar un trigger en lugar de un procedimiento?

---

## 📝 Preguntas prácticas

1. Modifica el procedimiento para filtrar también por un rango de fechas.
2. Crea un índice sobre la columna `producto_id` en la tabla `ventas`.
3. ¿Qué ocurre si insertas una venta con un `cliente_id` inexistente?
4. Modifica la vista para incluir también el nombre de la ciudad del cliente.
5. Agrega una validación en el procedimiento para evitar resultados si el cliente no existe.

---

</div>