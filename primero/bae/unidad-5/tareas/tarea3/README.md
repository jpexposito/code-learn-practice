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

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
sqlite3 tarea3.db
.read empleados-dump.sql
```

</details>

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

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
-- 1. Mostrar el nombre de todos los empleados en mayúsculas
SELECT UPPER(nombre) FROM empleados;

-- 2. Calcular el valor absoluto del salario de todos los empleados
SELECT id, nombre, ABS(salario) FROM empleados;

-- 3. Mostrar la fecha actual
SELECT DATE('now');

-- 4. Calcular el promedio de salarios de todos los empleados
SELECT AVG(salario) FROM empleados;

-- 5. Convertir la cadena '123' a un valor entero
SELECT CAST('123' AS INTEGER);

-- 6. Concatenar el nombre y el departamento de cada empleado
SELECT nombre || ' - ' || departamento FROM empleados;

-- 7. Concatenar el nombre y el departamento con un guion como separador
SELECT nombre || '-' || departamento FROM empleados;

-- 8. Categorizar a los empleados según sus salarios
SELECT nombre, 
       salario,
       CASE 
           WHEN salario < 50000 THEN 'Bajo'
           WHEN salario BETWEEN 50000 AND 65000 THEN 'Medio'
           ELSE 'Alto'
       END AS categoria
FROM empleados;

-- 9. Calcular la suma total de salarios de todos los empleados
SELECT SUM(salario) FROM empleados;

-- 10. Redondear el salario de todos los empleados a dos decimales
SELECT id, nombre, ROUND(salario, 2) FROM empleados;

-- 11. Mostrar la longitud de cada nombre de empleado
SELECT nombre, LENGTH(nombre) FROM empleados;

-- 12. Contar el número total de empleados en cada departamento
SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento;

-- 13. Mostrar la hora actual
SELECT TIME('now');

-- 14. Convertir el salario a un valor de punto flotante
SELECT id, nombre, CAST(salario AS REAL) FROM empleados;

-- 15. Mostrar los primeros tres caracteres de cada nombre de empleado
SELECT nombre, SUBSTR(nombre, 1, 3) FROM empleados;

-- 16. Seleccionar empleados en el departamento de 'Ventas' con salarios superiores a 52000
SELECT * FROM empleados WHERE departamento = 'Ventas' AND salario > 52000;

-- 17. Seleccionar empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente
SELECT * FROM empleados WHERE nombre LIKE '%a%' ORDER BY salario ASC;

-- 18. Seleccionar empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000
SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND salario BETWEEN 45000 AND 55000;

-- 19. Seleccionar empleados con salarios en orden descendente, limitando a los primeros 5 resultados
SELECT * FROM empleados ORDER BY salario DESC LIMIT 5;

-- 20. Seleccionar empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000
SELECT * FROM empleados WHERE (nombre LIKE 'M%' OR nombre LIKE 'N%') AND salario > 50000;

-- 21. Seleccionar empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre
SELECT * FROM empleados WHERE departamento IN ('TI', 'Ventas') ORDER BY nombre ASC;

-- 22. Seleccionar empleados con salarios únicos (eliminando duplicados) en orden ascendente
SELECT DISTINCT salario FROM empleados ORDER BY salario ASC;

-- 23. Seleccionar empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'
SELECT * FROM empleados WHERE (nombre LIKE '%o' OR nombre LIKE '%a') AND departamento = 'Ventas';

-- 24. Seleccionar empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento
SELECT * FROM empleados WHERE salario NOT BETWEEN 55000 AND 70000 ORDER BY departamento;

-- 25. Seleccionar empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'
SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND nombre NOT LIKE '%e%';
```

</details>

</div>