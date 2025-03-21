<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Base de datos (Trabajo con funciones en BBDD")

<div align="center">
<img src="https://i0.wp.com/hunna.org/wp-content/uploads/2014/06/huellas.jpg?resize=324%2C215" width="500px"/>
</div>

## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos

### Paso 1: Creación de la BBDD

Crea con el siguente contenido el fichero __empleados-dump.sql__.

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```
  
### Paso 2 Lectura del fichero sql

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 tarea3.db 
```

Haciendo un __.read__ del fichero __sql__, de nombre __empleados-db.sql__, realiza la creación e inserción de información de la __BBDD__.

### Paso 3: Realización de consultas

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Funciones UPPER y LOWER:
  - Muestra el nombre de todos los empleados en mayúsculas.
- Funciones Numéricas:
  - Calcula el valor absoluto del salario de todos los empleados.
- Funciones de Fecha y Hora:
  - Muestra la fecha actual.
- Funciones de Agregación:
  - Calcula el promedio de salarios de todos los empleados.
  - Convierte la cadena '123' a un valor entero.
- Funciones de Manipulación de Cadenas:
  - Concatena el nombre y el departamento de cada empleado.
- Funciones de Manipulación de Cadenas (CONCAT_WS):
  - Concatena el nombre y el departamento de cada empleado con un guion como separador.
- Funciones de Control de Flujo (CASE):
  - Categoriza a los empleados según sus salarios.
- Funciones de Agregación (SUM):
  - Calcula la suma total de salarios de todos los empleados.
- Funciones Numéricas (ROUND):
  - Redondea el salario de todos los empleados a dos decimales.
- Funciones de Manipulación de Cadenas (LENGTH):
  - Muestra la longitud de cada nombre de empleado.
- Funciones de Agregación (COUNT):
  - Cuenta el número total de empleados en cada departamento.
- Funciones de Fecha y Hora (CURRENT_TIME):
  - Muestra la hora actual.
- Funciones de Conversión (CAST):
  - Convierte el salario a un valor de punto flotante.
- Funciones de Manipulación de Cadenas (SUBSTR):
  - Muestra los primeros tres caracteres de cada nombre de empleado.

- __Order By__ and __Like__.
  - Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
  - Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
  - Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
  - Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
  - Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
  - Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
  - Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
  - Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
  - Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
  - Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.

### Generación Informe

Genera un informe con cada una de las consultas y los resuldos obtenidos tras su ejecución. El informe se debe de realizar en __markdown, y enviar el enlace__.

</div>