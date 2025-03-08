<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Base de datos (Ejercicios de Normalización de Bases de Datos (1FN y 2FN)")

> **IMP**: Genera las claves necesarias para corregir las tablas resultantes.

## **Ejercicio 1: Lista de Productos**

### **Tabla Inicial: Productos**

| ID_Producto | Nombre_Producto | Proveedores      | Categoría   | Precio |
|------------|----------------|-----------------|------------|--------|
| 1          | Laptop         | Dell, HP        | Tecnología | 1000   |
| 2          | Mouse          | Logitech        | Accesorios | 25     |

### **Tareas:**

1. Aplicar **1FN**, eliminando los valores multivaluados en "Proveedores".
2. Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**  

- Los datos deben ser atómicos** (sin listas ni conjuntos dentro de una celda).  
- **Debe existir una clave primaria** (puede ser simple o compuesta).

| ID_Producto | Nombre_Producto | ID_Categoría | Categoría   | Precio | ID_Proveedor | Nombre_Proveedor |
|------------|----------------|-------------|------------|--------|-------------|-----------------|
| 1          | Laptop         | 1           | Tecnología | 1000   | 1           | Dell            |
| 1          | Laptop         | 1           | Tecnología | 1000   | 2           | HP              |
| 2          | Mouse          | 2           | Accesorios | 25     | 3           | Logitech        |

### **Reglas de 2FN**  

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).  
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.  

#### **Tabla Productos** (Cada producto tiene una categoría y un precio)

| ID_Producto | Nombre_Producto | ID_Categoria | Precio |
|------------|----------------|-------------|--------|
| 1          | Laptop         | 1           | 1000   |
| 2          | Mouse          | 2           | 25     |

---

#### **Tabla Categoría_Proveedor** (Combinación de categoría y proveedor, aún no separada)

| ID_Categoria_Proveedor | ID_Categoria | Nombre_Categoria | ID_Proveedor | Nombre_Proveedor |
|------------------------|-------------|-----------------|-------------|-----------------|
| 1                     | 1           | Tecnología      | 1           | Dell            |
| 2                     | 1           | Tecnología      | 2           | HP              |
| 3                     | 2           | Accesorios      | 3           | Logitech        |

---

#### **Tabla Producto_Proveedor** (Relaciona productos con proveedores, eliminando la dependencia parcial)

| ID_Producto | ID_Proveedor |
|------------|-------------|
| 1          | 1           |
| 1          | 2           |
| 2          | 3           |

> **Explicación**
> **Se eliminaron las dependencias parciales:**  
> `ID_Categoria` ahora es una clave en la tabla **Productos**.  
> `Nombre_Categoria` y `Nombre_Proveedor` todavía están juntas, pero esto se corregirá en **3FN**.  
>**Cumple con 2FN** porque todas las columnas dependen completamente de sus claves primarias.  

### **Reglas de 3FN**  

1. **Debe cumplir con 2FN** (sin dependencias parciales).  
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.  
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.
> Básicamente es ejecutar la **2FN** sobre las tablas generadas.

---

#### **Tablas normalizadas en 3FN**

##### **Tabla Productos** (Ahora solo tiene atributos que dependen de `ID_Producto`)

| ID_Producto | Nombre_Producto | ID_Categoria | Precio |
|-------------|-----------------|--------------|--------|
| 1           | Laptop          | 1            | 1000   |
| 2           | Mouse           | 2            | 25     |

---

##### **Tabla Categorías** (Separamos las categorías para eliminar dependencia transitiva)

| ID_Categoria | Nombre_Categoria |
|--------------|------------------|
| 1            | Tecnología       |
| 2            | Accesorios       |

---

##### **Tabla Proveedores** (Separamos los proveedores para eliminar dependencia transitiva)

| ID_Proveedor | Nombre_Proveedor |
|--------------|-----------------|
| 1            | Dell            |
| 2            | HP              |
| 3            | Logitech        |

---

##### **Tabla Producto_Proveedor** (Relaciona productos con proveedores)

| ID_Producto | ID_Proveedor |
|-------------|--------------|
| 1           | 1            |
| 1           | 2            |
| 2           | 3            |

---

> ## **Explicación**
> **Eliminamos dependencias transitivas**:
> `Nombre_Categoría` ahora está en la tabla **Categorías** y depende solo de `ID_Categoría`.  
> `Nombre_Proveedor` ahora está en la tabla **Proveedores** y depende solo de `ID_Proveedor`.  
> La tabla **Producto_Proveedor** mantiene la relación entre productos y proveedores, sin dependencias transitivas.
> **Cumple con 3FN** porque cada atributo **depende directamente de la clave primaria de su tabla** y no hay dependencias transitivas entre atributos no clave.  

<img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 2: Pedidos de Clientes**

### **Tabla Inicial: Pedidos**

| ID_Pedido | Cliente   | Dirección       | Producto     | Cantidad | Precio |
|----------|----------|---------------|-------------|----------|--------|
| 101      | Juan Pérez | Calle 123     | Laptop      | 1        | 1000   |
| 102      | Ana López | Av. Central   | Teclado     | 2        | 50     |

### **Tareas:**

1. Aplicar **1FN**, separando valores repetidos y creando nuevas tablas si es necesario.
2. Aplicar **2FN**, asegurando que las dependencias parciales sean eliminadas.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).  
- **Debe existir una clave primaria** (puede ser simple o compuesta).

#### **Tabla original con Cliente separado en Nombre y Apellido:**

| ID_Pedido | Nombre  | Apellido | Calle     | Ciudad     | País      | Producto  | Cantidad | Precio |
|-----------|---------|----------|-----------|------------|-----------|-----------|----------|--------|
| 101       | Juan    | Pérez    | Calle 123 | Ciudad X   | País Y    | Laptop    | 1        | 1000   |
| 102       | Ana     | López    | Av. Central| Ciudad Y   | País Z    | Teclado   | 2        | 50     |

---

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).  
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

#### **Problema en 1FN:**
- La columna **Dirección** ya ha sido dividida en **Calle**, **Ciudad** y **País**, por lo que ahora estamos cumpliendo con la **1FN**.
- **Precio** depende de **Producto**, no de **ID_Pedido**.

#### **Solución en 2FN:**
- Crear una tabla separada para los **Clientes** y sus **Direcciones**.  
- Crear una tabla separada para los **Productos** y su **Precio**.

#### **Tablas después de 2FN**

##### **Tabla Pedidos** (Cada pedido tiene un cliente asociado)

| ID_Pedido | Nombre  | Apellido |
|-----------|---------|----------|
| 101       | Juan    | Pérez    |
| 102       | Ana     | López    |

---

##### **Tabla Clientes** (Clientes y sus direcciones)

| ID_Cliente | Nombre   | Apellido |
|------------|----------|----------|
| 1          | Juan     | Pérez    |
| 2          | Ana      | López    |

---

##### **Tabla Direcciones** (Direcciones asociadas a los Clientes)

| ID_Direccion | ID_Cliente | Calle     | Ciudad     | País      |
|--------------|------------|-----------|------------|-----------|
| 1            | 1          | Calle 123 | Ciudad X   | País Y    |
| 2            | 2          | Av. Central| Ciudad Y   | País Z    |

---

##### **Tabla Productos** (Productos y su precio)

| ID_Producto | Producto  | Precio |
|-------------|-----------|--------|
| 1           | Laptop    | 1000   |
| 2           | Teclado   | 50     |

---

##### **Tabla Productos_Pedidos** (Relación entre Pedido y Producto)

| ID_Pedido | ID_Producto | Cantidad |
|-----------|-------------|----------|
| 101       | 1           | 1        |
| 102       | 2           | 2        |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).  
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.  
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

> Básicamente es ejecutar la **2FN** sobre las tablas generadas.

---

#### **Tablas normalizadas en 3FN**

##### **Tabla Pedidos** (Ahora solo tiene atributos que dependen de `ID_Pedido`)

| ID_Pedido | ID_Cliente |
|-----------|------------|
| 101       | 1          |
| 102       | 2          |

---

##### **Tabla Clientes** (Ahora sólo tiene atributos que dependen de `ID_Cliente`)

| ID_Cliente | Nombre   | Apellido |
|------------|----------|----------|
| 1          | Juan     | Pérez    |
| 2          | Ana      | López    |

---

##### **Tabla Direcciones** (Ahora solo tiene atributos que dependen de `ID_Cliente`)

| ID_Direccion | ID_Cliente | Calle     | Ciudad     | País      |
|--------------|------------|-----------|------------|-----------|
| 1            | 1          | Calle 123 | Ciudad X   | País Y    |
| 2            | 2          | Av. Central| Ciudad Y   | País Z    |

---

##### **Tabla Productos** (Ahora solo tiene atributos que dependen de `ID_Producto`)

| ID_Producto | Producto  | Precio |
|-------------|-----------|--------|
| 1           | Laptop    | 1000   |
| 2           | Teclado   | 50     |

---

##### **Tabla Productos_Pedidos** (Relación entre productos y pedidos, sin cambios)

| ID_Pedido | ID_Producto | Cantidad |
|-----------|-------------|----------|
| 101       | 1           | 1        |
| 102       | 2           | 2        |

---

> ## **Explicación**
> **Eliminamos dependencias transitivas**:  
> - **Dirección** ahora está separada en su propia tabla y depende directamente de **ID_Cliente**.  
> - **Nombre** y **Apellido** dependen de **ID_Cliente**, y la relación entre **Cliente** y **Dirección** está representada en la tabla **Direcciones**.  
> - **Precio** depende de **Producto**, por lo que está en la tabla **Productos**.  
>  
> **Cumple con 3FN** porque cada atributo depende directamente de la clave primaria de su tabla y no existen dependencias transitivas entre atributos no clave.

---

### **Resumen:**

1. **1FN:** Se aseguraron datos atómicos, separando el nombre completo en **Nombre** y **Apellido**, y la dirección en **Calle**, **Ciudad**, y **País**.
2. **2FN:** Se eliminaron dependencias parciales, separando las tablas de **Clientes**, **Direcciones** y **Productos**.
3. **3FN:** Se eliminó cualquier dependencia transitiva, y cada tabla tiene solo atributos que dependen directamente de su clave primaria.

> **IMPORTANTE**: Se ha incluido en la tabla dirección más información (ciudad y país para que resulte más claro).

<img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 3: Registro de Empleados**

### **Tabla Inicial: Empleados**

| ID_Empleado | Nombre     | Teléfonos         | Departamento |
|------------|------------|------------------|--------------|
| 1          | Carlos R.  | 12345, 67890     | Ventas       |
| 2          | Laura M.   | 54321            | Finanzas     |

### **Tareas:**

1. Aplicar **1FN**, eliminando los valores multivaluados en "Teléfonos".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**
- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).  
- **Debe existir una clave primaria** (puede ser simple o compuesta).

La tabla original tiene una celda con múltiples valores (el campo **Teléfonos**), lo cual viola la **1FN**. Para cumplir con esta regla, debemos separar los valores de los teléfonos en filas diferentes.

#### **Tabla original:**

| ID_Empleado | Nombre    | Teléfonos        | Departamento |
|-------------|-----------|------------------|--------------|
| 1           | Carlos R. | 12345, 67890     | Ventas       |
| 2           | Laura M.  | 54321            | Finanzas     |

---

#### **Solución en 1FN:**

| ID_Empleado | Nombre    | Teléfono | Departamento |
|-------------|-----------|----------|--------------|
| 1           | Carlos R. | 12345    | Ventas       |
| 1           | Carlos R. | 67890    | Ventas       |
| 2           | Laura M.  | 54321    | Finanzas     |

---

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).  
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En este caso, la tabla está en **1FN**, pero tenemos una dependencia parcial: el **Nombre** y **Departamento** dependen solo de **ID_Empleado**, mientras que **Teléfono** depende solo de **ID_Empleado** y no de cada **Teléfono** individualmente.

#### **Solución en 2FN:**

##### **Tabla Empleados** (Datos del empleado)

| ID_Empleado | Nombre    | Departamento |
|-------------|-----------|--------------|
| 1           | Carlos R. | Ventas       |
| 2           | Laura M.  | Finanzas     |

---

##### **Tabla Teléfonos** (Relación entre empleados y teléfonos)

| ID_Empleado | Teléfono |
|-------------|----------|
| 1           | 12345    |
| 1           | 67890    |
| 2           | 54321    |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).  
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.  
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En este caso, no tenemos dependencias transitivas, ya que **Departamento** y **Nombre** dependen solo de **ID_Empleado**, y **Teléfono** depende de **ID_Empleado** sin ninguna dependencia adicional.

#### **Solución en 3FN:**

##### **Tabla Empleados** (Datos del empleado)

| ID_Empleado | Nombre    | Departamento |
|-------------|-----------|--------------|
| 1           | Carlos R. | Ventas       |
| 2           | Laura M.  | Finanzas     |

---

##### **Tabla Teléfonos** (Relación entre empleados y teléfonos)

| ID_Empleado | Teléfono |
|-------------|----------|
| 1           | 12345    |
| 1           | 67890    |
| 2           | 54321    |

---

> ## **Explicación**
>
> - **1FN:** Los datos atómicos se aseguran al separar los números de teléfono de la misma fila en varias filas.
> - **2FN:** Se ha eliminado la dependencia parcial al crear una tabla separada para los teléfonos, dejando **Nombre** y **Departamento** solo en la tabla **Empleados**.
> - **3FN:** No se han encontrado dependencias transitivas en las tablas, ya que cada columna depende únicamente de la clave primaria de su tabla.

<img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 4: Reservas de Hotel**

### **Tabla Inicial: Reservas**

| ID_Reserva | Cliente    | Habitación | Fechas              | Precio |
|------------|-----------|------------|---------------------|--------|
| 5001      | Pedro G.  | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002      | María T.  | 202        | 10/03, 11/03       | 200    |

### **Tareas:**

1. Aplicar **1FN**, eliminando los valores multivaluados en "Fechas".
2. Aplicar **2FN**, asegurando que las dependencias parciales sean eliminadas.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).  
- **Debe existir una clave primaria** (puede ser simple o compuesta).

En la tabla original, el campo **Fechas** contiene múltiples valores (varias fechas en una sola celda), lo que viola la **1FN**. Para cumplir con esta regla, debemos separar las fechas en filas diferentes.

#### **Tabla original:**

| ID_Reserva | Cliente   | Habitación | Fechas              | Precio |
|------------|-----------|------------|---------------------|--------|
| 5001       | Pedro G.  | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002       | María T.  | 202        | 10/03, 11/03        | 200    |

---

#### **Solución en 1FN:**

| ID_Reserva | Cliente   | Habitación | Fecha   | Precio |
|------------|-----------|------------|---------|--------|
| 5001       | Pedro G.  | 101        | 01/02   | 300    |
| 5001       | Pedro G.  | 101        | 02/02   | 300    |
| 5001       | Pedro G.  | 101        | 03/02   | 300    |
| 5002       | María T.  | 202        | 10/03   | 200    |
| 5002       | María T.  | 202        | 11/03   | 200    |

---

#### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).  
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En esta tabla, la clave primaria es **ID_Reserva + Fecha** (compuesta). Sin embargo, **Cliente** y **Precio** dependen solo de **ID_Reserva**, y no de la combinación completa de la clave primaria. Esto crea una dependencia parcial.

#### **Solución en 2FN:**

##### **Tabla Reservas** (Información general de la reserva)

| ID_Reserva | Cliente   | Precio |
|------------|-----------|--------|
| 5001       | Pedro G.  | 300    |
| 5002       | María T.  | 200    |

---

##### **Tabla Fechas** (Relación entre reserva y las fechas asociadas)

| ID_Reserva | Habitación | Fecha   |
|------------|------------|---------|
| 5001       | 101        | 01/02   |
| 5001       | 101        | 02/02   |
| 5001       | 101        | 03/02   |
| 5002       | 202        | 10/03   |
| 5002       | 202        | 11/03   |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).  
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.  
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En este caso, no existen dependencias transitivas entre atributos no clave. Sin embargo, para mejorar la normalización, podemos crear una tabla separada para los **Clientes** y vincularla a **ID_Reserva**.

#### **Solución en 3FN:**

##### **Tabla Reservas** (Datos de la reserva)

| ID_Reserva | Precio |
|------------|--------|
| 5001       | 300    |
| 5002       | 200    |

---

##### **Tabla Clientes** (Datos del cliente)

| ID_Reserva | Cliente   |
|------------|-----------|
| 5001       | Pedro G.  |
| 5002       | María T.  |

---

##### **Tabla Fechas** (Relación entre reserva y las fechas asociadas)

| ID_Reserva | Habitación | Fecha   |
|------------|------------|---------|
| 5001       | 101        | 01/02   |
| 5001       | 101        | 02/02   |
| 5001       | 101        | 03/02   |
| 5002       | 202        | 10/03   |
| 5002       | 202        | 11/03   |

---

> ## **Explicación**
> - **1FN:** Los datos atómicos se aseguran al separar las fechas en filas distintas.
> - **2FN:** Se ha eliminado la dependencia parcial separando los datos generales de la reserva en una tabla **Reservas**, y las fechas en una tabla **Fechas**.
> - **3FN:** Se ha creado una tabla separada para los **Clientes**, eliminando cualquier dependencia transitiva entre clientes y reservas.

<img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 5: Inscripciones a Cursos**

### **Tabla Inicial: Inscripciones**

| ID_Inscripción | Estudiante | Curso        | Profesor    | Horarios |
|---------------|------------|--------------|------------|----------|
| 3001         | Luis R.    | Matemáticas  | Prof. Pérez | Lunes 10AM, Miércoles 2PM |
| 3002         | Ana S.     | Física       | Prof. Gómez | Martes 3PM |

### **Tareas:**

1. Aplicar **1FN**, eliminando valores multivaluados en "Horarios".
2. Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).  
- **Debe existir una clave primaria** (puede ser simple o compuesta).

En la tabla original, el campo **Horarios** contiene múltiples valores (varios horarios en una sola celda), lo cual viola la **1FN**. Para cumplir con esta regla, debemos separar los horarios en filas diferentes.

#### **Tabla original:**

| ID_Inscripción | Estudiante | Curso        | Profesor    | Horarios                          |
|----------------|------------|--------------|-------------|-----------------------------------|
| 3001           | Luis R.    | Matemáticas  | Prof. Pérez | Lunes 10AM, Miércoles 2PM         |
| 3002           | Ana S.     | Física       | Prof. Gómez | Martes 3PM                        |

---

#### **Solución en 1FN:**

| ID_Inscripción | Estudiante | Curso        | Profesor    | Horario        |
|----------------|------------|--------------|-------------|----------------|
| 3001           | Luis R.    | Matemáticas  | Prof. Pérez | Lunes 10AM     |
| 3001           | Luis R.    | Matemáticas  | Prof. Pérez | Miércoles 2PM  |
| 3002           | Ana S.     | Física       | Prof. Gómez | Martes 3PM     |

---

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).  
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En este caso, la clave primaria es **ID_Inscripción + Horario** (compuesta). Sin embargo, **Estudiante**, **Curso** y **Profesor** dependen solo de **ID_Inscripción** y no de la combinación completa de la clave primaria. Esto crea una dependencia parcial.

#### **Solución en 2FN:**

##### **Tabla Inscripciones** (Información general de la inscripción)

| ID_Inscripción | Estudiante | Curso        | Profesor    |
|----------------|------------|--------------|-------------|
| 3001           | Luis R.    | Matemáticas  | Prof. Pérez |
| 3002           | Ana S.     | Física       | Prof. Gómez |

---

##### **Tabla Horarios** (Relación entre inscripción y horarios)

| ID_Inscripción | Horario        |
|----------------|----------------|
| 3001           | Lunes 10AM     |
| 3001           | Miércoles 2PM  |
| 3002           | Martes 3PM     |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).  
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.  
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En este caso, no hay dependencias transitivas entre los atributos no clave. La normalización ya está completa en **2FN**.

#### **Solución en 3FN:**

##### **Tabla Inscripciones** (Datos de la inscripción)

| ID_Inscripción | Estudiante | Curso        | Profesor    |
|----------------|------------|--------------|-------------|
| 3001           | Luis R.    | Matemáticas  | Prof. Pérez |
| 3002           | Ana S.     | Física       | Prof. Gómez |

---

##### **Tabla Horarios** (Relación entre inscripción y horarios)

| ID_Inscripción | Horario        |
|----------------|----------------|
| 3001           | Lunes 10AM     |
| 3001           | Miércoles 2PM  |
| 3002           | Martes 3PM     |

---

> ## **Explicación**
> - **1FN:** Los datos atómicos se aseguran al separar los horarios en filas distintas.
> - **2FN:** Se ha eliminado la dependencia parcial creando una tabla separada para los horarios.
> - **3FN:** No hay dependencias transitivas, por lo que la estructura ya está normalizada completamente hasta **3FN**.

<img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 6: Ventas de Tienda**

### **Tabla Inicial: Ventas**

| ID_Venta | Cliente    | Productos Comprados | Total |
|----------|------------|---------------------|-------|
| 8001     | Juan P.   | Celular, Funda      | 500   |
| 8002     | Andrea M. | Laptop              | 1000  |

### **Tareas:**

1. Aplicar **1FN**, separando valores multivaluados en "Productos Comprados".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).  
- **Debe existir una clave primaria** (puede ser simple o compuesta).

En la tabla original, el campo **Productos Comprados** contiene múltiples valores (varios productos en una sola celda), lo cual viola la **1FN**. Para cumplir con esta regla, debemos separar los productos en filas diferentes.

#### **Tabla original:**

| ID_Venta | Cliente    | Productos Comprados | Total |
|----------|------------|---------------------|-------|
| 8001     | Juan P.    | Celular, Funda      | 500   |
| 8002     | Andrea M.  | Laptop              | 1000  |

---

#### **Solución en 1FN:**

| ID_Venta | Cliente    | Producto    | Total |
|----------|------------|-------------|-------|
| 8001     | Juan P.    | Celular     | 500   |
| 8001     | Juan P.    | Funda       | 500   |
| 8002     | Andrea M.  | Laptop      | 1000  |

---

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).  
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En este caso, la clave primaria es **ID_Venta + Producto** (compuesta). Sin embargo, **Cliente** y **Total** dependen solo de **ID_Venta**, y no de la combinación completa de la clave primaria. Esto crea una dependencia parcial.

#### **Solución en 2FN:**

##### **Tabla Ventas** (Información general de la venta)

| ID_Venta | Cliente    | Total |
|----------|------------|-------|
| 8001     | Juan P.    | 500   |
| 8002     | Andrea M.  | 1000  |

---

##### **Tabla Productos_Vendidos** (Relación entre venta y productos)

| ID_Producto | ID_Venta | Producto    |
|-------------|----------|-------------|
| 1           | 8001     | Celular     |
| 2           | 8001     | Funda       |
| 3           | 8002     | Laptop      |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).  
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.  
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En este caso, no existen dependencias transitivas entre atributos no clave. La normalización ya está completa en **2FN**.

#### **Solución en 3FN:**

##### **Tabla Ventas** (Datos generales de la venta)

| ID_Venta | Cliente    | Total |
|----------|------------|-------|
| 8001     | Juan P.    | 500   |
| 8002     | Andrea M.  | 1000  |

---

##### **Tabla Productos_Vendidos** (Relación entre venta y productos con **ID_Producto**)

| ID_Producto | ID_Venta | Producto    |
|-------------|----------|-------------|
| 1           | 8001     | Celular     |
| 2           | 8001     | Funda       |
| 3           | 8002     | Laptop      |

---

> ## **Explicación**
> - **1FN:** Los datos atómicos se aseguran al separar los productos en filas distintas.
> - **2FN:** Se ha eliminado la dependencia parcial creando una tabla separada para los productos vendidos. La clave primaria compuesta ahora es solo para **Productos_Vendidos** (ID_Producto + ID_Venta).
> - **3FN:** No hay dependencias transitivas, por lo que la estructura ya está normalizada completamente hasta **3FN**.

---

>**IMPORTANTE:** En este caso la tabla Productos_Vendidos podría generar una nueva tabla, quedando la información del producto independiente.

<img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 7: Biblioteca de Libros**

### **Tabla Inicial: Libros**

| ID_Libro | Título | Autores          | Género  |
|----------|--------|-----------------|---------|
| 101      | El Quijote | Cervantes   | Novela  |
| 102      | 1984       | Orwell       | Ciencia Ficción |

### **Tareas:**

1. Aplicar **1FN**, eliminando valores multivaluados en "Autores".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).
- **Debe existir una clave primaria** (puede ser simple o compuesta).

En la tabla original, el campo **Autores** contiene múltiples valores (varios autores en una sola celda), lo cual viola la **1FN**. Para cumplir con esta regla, debemos separar los autores en filas diferentes.

#### **Tabla original:**

| ID_Libro | Título      | Autores          | Género  |
|----------|-------------|------------------|---------|
| 101      | El Quijote  | Cervantes        | Novela  |
| 102      | 1984        | Orwell           | Ciencia Ficción |

---

#### **Solución en 1FN:**

| ID_Libro | Título      | Autor      | Género           |
|----------|-------------|------------|------------------|
| 101      | El Quijote  | Cervantes  | Novela           |
| 102      | 1984        | Orwell     | Ciencia Ficción  |

---
> **Cumple la 1FN**.

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En este caso, la clave primaria es **ID_Libro**. **Género** y **Autor** dependen solo de **ID_Libro**, por lo que no hay dependencia parcial.

#### **Solución en 2FN:**

##### **Tabla Libros** (Contiene información general del libro)

| ID_Libro | Título      |
|----------|-------------|
| 101      | El Quijote  |
| 102      | 1984        |

---

##### **Tabla Autores** (Contiene información sobre los autores de los libros)

| ID_Autor | Autor      |
|----------|------------|
| 1        | Cervantes  |
| 2        | Orwell     |

---

##### **Tabla Géneros** (Contiene información sobre los géneros de los libros)

| ID_Género | Género          |
|-----------|-----------------|
| 1         | Novela          |
| 2         | Ciencia Ficción |

---

##### **Tabla Libro_Autor** (Relaciona libros con autores)

| ID_Libro | ID_Autor |
|----------|----------|
| 101      | 1        |
| 102      | 2        |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En la **Tabla Libros**, **Género** depende de **ID_Libro**, pero **Género** también depende de **ID_Género** (a través del valor de `ID_Libro`), lo cual crea una dependencia transitiva. Para resolver esto, separamos el **Género** de los libros en su propia tabla, eliminando la dependencia transitiva.

#### **Solución en 3FN:**

##### **Tabla Libros** (Datos generales del libro)

| ID_Libro | Título      |
|----------|-------------|
| 101      | El Quijote  |
| 102      | 1984        |

---

##### **Tabla Autores** (Datos sobre los autores)

| ID_Autor | Autor      |
|----------|------------|
| 1        | Cervantes  |
| 2        | Orwell     |

---

##### **Tabla Géneros** (Datos sobre los géneros)

| ID_Género | Género          |
|-----------|-----------------|
| 1         | Novela          |
| 2         | Ciencia Ficción |

---

##### **Tabla Libro_Autor** (Relación entre libros y autores)

| ID_Libro | ID_Autor |
|----------|----------|
| 101      | 1        |
| 102      | 2        |

---

##### **Tabla Libro_Género** (Relación entre libros y géneros)

| ID_Libro | ID_Género |
|----------|-----------|
| 101      | 1         |
| 102      | 2         |

---

### **Resumen:**

1. **1FN:** Se separaron los autores en filas diferentes para asegurar que los datos sean atómicos.
2. **2FN:** Se eliminaron las dependencias parciales creando tablas separadas para los **Libros**, **Autores**, y **Géneros**, con claves primarias para cada una.
3. **3FN:** Se eliminó la dependencia transitiva al separar el **Género** en una tabla distinta, asegurando que los atributos dependan solo de las claves primarias.

    <img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 8: Facturación de Servicios**

### **Tabla Inicial: Facturas**

| ID_Factura | Cliente   | Servicios Contratados | Costo Total |
|------------|-----------|----------------------|-------------|
| 9001       | Juan P.   | Internet, TV        | 50          |
| 9002       | Ana M.    | Teléfono            | 20          |

### **Tareas:**

1. Aplicar **1FN**, separando valores multivaluados en "Servicios Contratados".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).
- **Debe existir una clave primaria** (puede ser simple o compuesta).

En la tabla original, el campo **Servicios Contratados** contiene múltiples valores (varios servicios en una sola celda), lo cual viola la **1FN**. Para cumplir con esta regla, debemos separar los servicios contratados en filas diferentes.

#### **Tabla original:**

| ID_Factura | Cliente   | Servicios Contratados | Costo Total |
|------------|-----------|-----------------------|-------------|
| 9001       | Juan P.   | Internet, TV          | 50          |
| 9002       | Ana M.    | Teléfono              | 20          |

---

#### **Solución en 1FN:**

| ID_Factura | Cliente   | Servicio   | Costo Total |
|------------|-----------|------------|-------------|
| 9001       | Juan P.   | Internet   | 50          |
| 9001       | Juan P.   | TV         | 50          |
| 9002       | Ana M.    | Teléfono   | 20          |

---

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En este caso, la clave primaria es **ID_Factura + Servicio** (compuesta). **Cliente** y **Costo Total** dependen solo de **ID_Factura**, y no de la combinación completa de la clave primaria. Esto crea una dependencia parcial.

#### **Solución en 2FN:**

##### **Tabla Facturas** (Información general de la factura)

| ID_Factura | Cliente   | Costo Total |
|------------|-----------|-------------|
| 9001       | Juan P.   | 50          |
| 9002       | Ana M.    | 20          |

---

##### **Tabla Servicios** (Relación entre facturas y servicios contratados)

| ID_Servicio | Servicio  |
|-------------|-----------|
| 1           | Internet |
| 2           | TV       |
| 3           | Teléfono |

---

##### **Tabla Factura_Servicio** (Relación entre facturas y servicios)

| ID_Factura | ID_Servicio |
|------------|-------------|
| 9001       | 1           |
| 9001       | 2           |
| 9002       | 3           |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En este caso, no existen dependencias transitivas entre atributos no clave. La normalización ya está completa en **2FN**.

#### **Solución en 3FN:**

##### **Tabla Facturas** (Datos generales de la factura)

| ID_Factura | Cliente   | Costo Total |
|------------|-----------|-------------|
| 9001       | Juan P.   | 50          |
| 9002       | Ana M.    | 20          |

---

##### **Tabla Servicios** (Datos sobre los servicios disponibles)

| ID_Servicio | Servicio  |
|-------------|-----------|
| 1           | Internet |
| 2           | TV       |
| 3           | Teléfono |

---

##### **Tabla Factura_Servicio** (Relación entre facturas y servicios contratados)

| ID_Factura | ID_Servicio |
|------------|-------------|
| 9001       | 1           |
| 9001       | 2           |
| 9002       | 3           |

---

### **Resumen:**

1. **1FN:** Se separaron los servicios en filas diferentes para asegurar que los datos sean atómicos.
2. **2FN:** Se eliminaron las dependencias parciales creando una tabla separada para las **Facturas** y otra para los **Servicios**.
3. **3FN:** No existen dependencias transitivas, por lo que la normalización está completa hasta **3FN**.
    
    <img src="img/3/ejercicio1.drawio.png">
</details>

---

## **Ejercicio 9: Gestión de Vehículos**

### **Tabla Inicial: Vehículos**

| ID_Vehículo | Marca   | Modelos          | Año |
|------------|--------|----------------|-----|
| 5001       | Toyota  | Corolla, Yaris  | 2022 |
| 5002       | Honda   | Civic          | 2023 |

### **Tareas:**

1. Aplicar **1FN**, eliminando valores multivaluados en "Modelos".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

#### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).
- **Debe existir una clave primaria** (puede ser simple o compuesta).

En la tabla original, el campo **Modelos** contiene múltiples valores (varios modelos en una sola celda), lo cual viola la **1FN**. Para cumplir con esta regla, debemos separar los modelos en filas diferentes.

#### **Tabla original:**

| ID_Vehículo | Marca   | Modelos          | Año  |
|-------------|---------|------------------|------|
| 5001        | Toyota  | Corolla, Yaris   | 2022 |
| 5002        | Honda   | Civic            | 2023 |

---

#### **Solución en 1FN:**

| ID_Vehículo | Marca   | Modelo   | Año  |
|-------------|---------|----------|------|
| 5001        | Toyota  | Corolla  | 2022 |
| 5001        | Toyota  | Yaris    | 2022 |
| 5002        | Honda   | Civic    | 2023 |

---

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En este caso, la clave primaria es **ID_Vehículo + Modelo** (compuesta). **Marca** depende solo de **ID_Vehículo**, y no de la combinación completa de la clave primaria. Esto crea una dependencia parcial.

#### **Solución en 2FN:**

##### **Tabla Vehículos** (Información general del vehículo)

| ID_Vehículo | Año  |
|-------------|------|
| 5001        | 2022 |
| 5002        | 2023 |

---

##### **Tabla Modelos** (Relación entre vehículos y modelos)

| ID_Vehículo | Modelo   |
|-------------|----------|
| 5001        | Corolla  |
| 5001        | Yaris    |
| 5002        | Civic    |

---

##### **Tabla Marcas** (Relación entre vehículos y marcas)

| ID_Marca | Marca   |
|----------|---------|
| 1        | Toyota  |
| 2        | Honda   |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En este caso, **Marca** y **Año** dependen de **ID_Vehículo** y no de **Modelo**, lo que crea una dependencia transitiva. No es necesario modificar la estructura, ya que la normalización ya está completa hasta **2FN**.

#### **Solución en 3FN:**

##### **Tabla Vehículos** (Datos generales del vehículo)

| ID_Vehículo | Año  |
|-------------|------|
| 5001        | 2022 |
| 5002        | 2023 |

---

##### **Tabla Modelos** (Relación entre vehículos y modelos)

| ID_Vehículo | Modelo   |
|-------------|----------|
| 5001        | Corolla  |
| 5001        | Yaris    |
| 5002        | Civic    |

---

##### **Tabla Marcas** (Relación entre vehículos y marcas)

| ID_Marca | Marca   |
|----------|---------|
| 1        | Toyota  |
| 2        | Honda   |

---

### **Resumen:**

1. **1FN:** Se separaron los modelos en filas diferentes para asegurar que los datos sean atómicos.
2. **2FN:** Se eliminaron las dependencias parciales creando una tabla separada para los **Modelos** y otra para las **Marcas**.
3. **3FN:** No existen dependencias transitivas, por lo que la normalización está completa hasta **3FN**.
    
    <img src="img/3/ejercicio1.drawio.png">
</details>

## **Ejercicio 10: Gestión de Proyectos**

### **Tabla Inicial: Proyectos**

| ID_Proyecto | Nombre       | Miembros        | Presupuesto |
|------------|-------------|----------------|------------|
| 7001       | Web App     | Juan, Ana      | 5000       |
| 7002       | E-commerce  | Pedro, María   | 10000      |

### **Tareas:**

1. Aplicar **1FN**, eliminando valores multivaluados en "Miembros".
2. Aplicar **2FN**, asegurando que cada atributo dependa completamente de la clave primaria.

> Verifica generando el modelo Entidad/Relación
 
<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

### **Reglas de 1FN:**

- Los datos deben ser **atómicos** (sin listas ni conjuntos dentro de una celda).
- **Debe existir una clave primaria** (puede ser simple o compuesta).

En la tabla original, el campo **Miembros** contiene múltiples valores (varios miembros en una sola celda), lo cual viola la **1FN**. Para cumplir con esta regla, debemos separar los miembros en filas diferentes.

#### **Tabla original:**

| ID_Proyecto | Nombre       | Miembros         | Presupuesto |
|-------------|--------------|------------------|-------------|
| 7001        | Web App      | Juan, Ana        | 5000        |
| 7002        | E-commerce   | Pedro, María     | 10000       |

---

#### **Solución en 1FN:**

| ID_Proyecto | Nombre       | Miembro   | Presupuesto |
|-------------|--------------|-----------|-------------|
| 7001        | Web App      | Juan      | 5000        |
| 7001        | Web App      | Ana       | 5000        |
| 7002        | E-commerce   | Pedro     | 10000       |
| 7002        | E-commerce   | María     | 10000       |

---

### **Reglas de 2FN:**

- La base de datos debe cumplir con **1FN** (datos atómicos y clave primaria definida).
- Se eliminan **dependencias parciales**, asegurando que cada atributo dependa completamente de la clave primaria.

En este caso, la clave primaria es **ID_Proyecto + Miembro** (compuesta). **Nombre** y **Presupuesto** dependen solo de **ID_Proyecto**, y no de la combinación completa de la clave primaria. Esto crea una dependencia parcial.

#### **Solución en 2FN:**

##### **Tabla Proyectos** (Información general del proyecto)

| ID_Proyecto | Nombre       | Presupuesto |
|-------------|--------------|-------------|
| 7001        | Web App      | 5000        |
| 7002        | E-commerce   | 10000       |

---

##### **Tabla Miembros_Proyecto** (Relación entre proyectos y miembros)

| ID_Proyecto | Miembro   |
|-------------|-----------|
| 7001        | Juan      |
| 7001        | Ana       |
| 7002        | Pedro     |
| 7002        | María     |

---

### **Reglas de 3FN:**

1. **Debe cumplir con 2FN** (sin dependencias parciales).
2. **No debe haber dependencias transitivas**, es decir, los atributos no clave deben depender solo de la clave primaria y no de otros atributos no clave.
3. **Cada columna debe depender directamente de la clave primaria** de su tabla, y no de otros atributos dentro de la misma tabla.

En este caso, no existen dependencias transitivas entre atributos no clave. La normalización ya está completa en **2FN**.

#### **Solución en 3FN:**

##### **Tabla Proyectos** (Datos generales del proyecto)

| ID_Proyecto | Nombre       | Presupuesto |
|-------------|--------------|-------------|
| 7001        | Web App      | 5000        |
| 7002        | E-commerce   | 10000       |

---

##### **Tabla Miembros_Proyecto** (Relación entre proyectos y miembros)

| ID_Proyecto | Miembro   |
|-------------|-----------|
| 7001        | Juan      |
| 7001        | Ana       |
| 7002        | Pedro     |
| 7002        | María     |

---

### **Resumen:**

1. **1FN:** Se separaron los miembros en filas diferentes para asegurar que los datos sean atómicos.
2. **2FN:** Se eliminaron las dependencias parciales creando una tabla separada para los **Miembros_Proyecto**.
3. **3FN:** No existen dependencias transitivas, por lo que la normalización está completa hasta **3FN**.

      <img src="img/3/ejercicio1.drawio.png">
</details>


 </div>