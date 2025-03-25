<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Base de datos (Primeros pasos en SQL")

<div align="center">
<img src="https://i0.wp.com/hunna.org/wp-content/uploads/2014/06/huellas.jpg?resize=324%2C215" width="500px"/>
</div>

## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos

### Paso 1: Crear una tabla con un campo de cada tipo

1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada `tarea1.db`.
    
    <details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>
      
      ```code
      sqlite3 tarea1.db
      ```
    
    </details> 


2. Dentro de SQLite3, crea una tabla llamada `Ejemplo` con los siguientes campos:
    - `id` (tipo INTEGER, clave primaria)
    - `texto` (tipo TEXT)
    - `entero` (tipo INTEGER)
    - `decimal` (tipo REAL)
    - `fecha` (tipo DATE)
    - `booleano` (tipo BOOLEAN)

Asegúrate de cerrar SQLite3 al finalizar.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/01_crear_borrar_tabla.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>
      
```code
        CREATE TABLE Ejemplo (
            id INTEGER PRIMARY KEY,
            texto TEXT,
            entero INTEGER,
            decimal REAL,
            fecha DATE,
            booleano BOOLEAN
        )
```
</details> 

### Paso 2: Insertar 50 entradas

Dado el siguiente conjunto de información:

| id |   texto    | entero | decimal |    fecha    | booleano |
|----|------------|--------|---------|-------------|----------|
| 1  | Ejemplo1    | 25     | 10.5    | 2022-05-15  | 0        |
| 2  | Ejemplo2    | 63     | 45.7    | 2022-06-22  | 1        |
| 3  | Ejemplo3    | 12     | 30.0    | 2022-07-10  | 0        |
| 4  | Ejemplo4    | 78     | 75.2    | 2022-08-05  | 1        |
| 5  | Ejemplo5    | 42     | 18.9    | 2022-09-12  | 0        |
| 6  | Ejemplo6    | 55     | 60.3    | 2022-10-08  | 1        |
| 7  | Ejemplo7    | 10     | 40.1    | 2022-11-17  | 0        |
| 8  | Ejemplo8    | 87     | 22.6    | 2022-12-03  | 1        |
| 9  | Ejemplo9    | 31     | 55.0    | 2023-01-20  | 0        |
| 10 | Ejemplo10   | 68     | 90.4    | 2023-02-14  | 1        |
| 11 | Ejemplo11   | 15     | 12.8    | 2023-03-22  | 0        |
| 12 | Ejemplo12   | 72     | 48.6    | 2023-04-09  | 1        |
| 13 | Ejemplo13   | 22     | 33.7    | 2023-05-01  | 0        |
| 14 | Ejemplo14   | 93     | 70.2    | 2023-06-18  | 1        |
| 15 | Ejemplo15   | 37     | 15.4    | 2023-07-05  | 0        |
| 16 | Ejemplo16   | 81     | 82.9    | 2023-08-11  | 1        |
| 17 | Ejemplo17   | 45     | 28.3    | 2023-09-27  | 0        |
| 18 | Ejemplo18   | 60     | 50.6    | 2023-10-15  | 1        |
| 19 | Ejemplo19   | 5      | 8.7     | 2023-11-22  | 0        |
| 20 | Ejemplo20   | 76     | 65.1    | 2023-12-08  | 1        |
| 21 | Ejemplo21   | 33     | 20.3    | 2024-01-14  | 0        |
| 22 | Ejemplo22   | 70     | 55.8    | 2024-02-29  | 1        |
| 23 | Ejemplo23   | 13     | 42.7    | 2024-03-18  | 0        |
| 24 | Ejemplo24   | 89     | 78.4    | 2024-04-25  | 1        |
| 25 | Ejemplo25   | 49     | 15.9    | 2024-05-12  | 0        |
| 26 | Ejemplo26   | 62     | 60.7    | 2024-06-20  | 1        |
| 27 | Ejemplo27   | 8      | 35.2    | 2024-07-07  | 0        |
| 28 | Ejemplo28   | 95     | 25.6    | 2024-08-23  | 1        |
| 29 | Ejemplo29   | 27     | 50.0    | 2024-09-10  | 0        |
| 30 | Ejemplo30   | 74     | 85.3    | 2024-10-05  | 1        |
| 31 | Ejemplo31   | 18     | 11.8    | 2024-11-12  | 0        |
| 32 | Ejemplo32   | 83     | 47.6    | 2024-12-28  | 1        |
| 33 | Ejemplo33   | 38     | 32.7    | 2025-01-15  | 0        |
| 34 | Ejemplo34   | 101    | 70.2    | 2025-02-01  | 1        |
| 35 | Ejemplo35   | 52     | 18.4    | 2025-03-20  | 0        |
| 36 | Ejemplo36   | 67     | 83.9    | 2025-04-06  | 1        |
| 37 | Ejemplo37   | 43     | 28.3    | 2025-05-13  | 0        |
| 38 | Ejemplo38   | 58     | 50.6    | 2025-06-30  | 1        |
| 39 | Ejemplo39   | 9      | 8.7     | 2025-07-17  | 0        |
| 40 | Ejemplo40   | 82     | 65.1    | 2025-08-23  | 1        |
| 41 | Ejemplo41   | 26     | 20.3    | 2025-09-09  | 0        |
| 42 | Ejemplo42   | 73     | 55.8    | 2025-10-26  | 1        |
| 43 | Ejemplo43   | 14     | 42.7    | 2025-11-13  | 0        |
| 44 | Ejemplo44   | 90     | 78.4    | 2025-12-30  | 1        |
| 45 | Ejemplo45   | 50     | 15.9    | 2026-01-16  | 0        |
| 46 | Ejemplo46   | 63     | 60.7    | 2026-02-03  | 1        |
| 47 | Ejemplo47   | 7      | 35.2    | 2026-03-22  | 0        |
| 48 | Ejemplo48   | 96     | 25.6    | 2026-04-08  | 1        |
| 49 | Ejemplo49   | 28     | 50.0    | 2026-05-25  | 0        |
| 50 | Ejemplo50   | 75     | 85.3    | 2026-06-11  | 1        |

Realiza la inserción en la tabla `Ejemplo` de las __50 entradas__.

___Guarda algunas de las entradas para el informe___.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/02_insert_select.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
INSERT INTO Ejemplo VALUES (1, 'Ejemplo1', 25, 10.5, '2022-05-15', 0);
INSERT INTO Ejemplo VALUES (2, 'Ejemplo2', 63, 45.7, '2022-06-22', 1);
INSERT INTO Ejemplo VALUES (3, 'Ejemplo3', 12, 30.0, '2022-07-10', 0);
INSERT INTO Ejemplo VALUES (4, 'Ejemplo4', 78, 75.2, '2022-08-05', 1);
INSERT INTO Ejemplo VALUES (5, 'Ejemplo5', 42, 18.9, '2022-09-12', 0);
INSERT INTO Ejemplo VALUES (6, 'Ejemplo6', 55, 60.3, '2022-10-08', 1);
INSERT INTO Ejemplo VALUES (7, 'Ejemplo7', 10, 40.1, '2022-11-17', 0);
INSERT INTO Ejemplo VALUES (8, 'Ejemplo8', 87, 22.6, '2022-12-03', 1);
INSERT INTO Ejemplo VALUES (9, 'Ejemplo9', 31, 55.0, '2023-01-20', 0);
INSERT INTO Ejemplo VALUES (10, 'Ejemplo10', 68, 90.4, '2023-02-14', 1);
INSERT INTO Ejemplo VALUES (11, 'Ejemplo11', 15, 12.8, '2023-03-22', 0);
INSERT INTO Ejemplo VALUES (12, 'Ejemplo12', 72, 48.6, '2023-04-09', 1);
INSERT INTO Ejemplo VALUES (13, 'Ejemplo13', 22, 33.7, '2023-05-01', 0);
INSERT INTO Ejemplo VALUES (14, 'Ejemplo14', 93, 70.2, '2023-06-18', 1);
INSERT INTO Ejemplo VALUES (15, 'Ejemplo15', 37, 15.4, '2023-07-05', 0);
INSERT INTO Ejemplo VALUES (16, 'Ejemplo16', 81, 82.9, '2023-08-11', 1);
INSERT INTO Ejemplo VALUES (17, 'Ejemplo17', 45, 28.3, '2023-09-27', 0);
INSERT INTO Ejemplo VALUES (18, 'Ejemplo18', 60, 50.6, '2023-10-15', 1);
INSERT INTO Ejemplo VALUES (19, 'Ejemplo19', 5, 8.7, '2023-11-22', 0);
INSERT INTO Ejemplo VALUES (20, 'Ejemplo20', 76, 65.1, '2023-12-08', 1);
```

</details> 

### Paso 3: Realizar 5 consultas de datos

1. Obtén todas las entradas de la tabla `Ejemplo`.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/02_insert_select.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
SELECT * FROM Ejemplo;

1|Ejemplo1|25|10.5|2022-05-15|0
2|Ejemplo2|63|45.7|2022-06-22|1
3|Ejemplo3|12|30.0|2022-07-10|0
4|Ejemplo4|78|75.2|2022-08-05|1
5|Ejemplo5|42|18.9|2022-09-12|0
6|Ejemplo6|55|60.3|2022-10-08|1
7|Ejemplo7|10|40.1|2022-11-17|0
8|Ejemplo8|87|22.6|2022-12-03|1
9|Ejemplo9|31|55.0|2023-01-20|0
10|Ejemplo10|68|90.4|2023-02-14|1
11|Ejemplo11|15|12.8|2023-03-22|0
12|Ejemplo12|72|48.6|2023-04-09|1
13|Ejemplo13|22|33.7|2023-05-01|0
14|Ejemplo14|93|70.2|2023-06-18|1
15|Ejemplo15|37|15.4|2023-07-05|0
16|Ejemplo16|81|82.9|2023-08-11|1
17|Ejemplo17|45|28.3|2023-09-27|0
18|Ejemplo18|60|50.6|2023-10-15|1
19|Ejemplo19|5|8.7|2023-11-22|0
20|Ejemplo20|76|65.1|2023-12-08|1
sqlite> select count(*) from Ejemplo;
20

```
</details> 

2. Obtén las entradas con el campo `entero` mayor a 50.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/02_insert_select.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
SELECT * FROM Ejemplo WHERE entero > 50;
```

</details> 

### Paso 4: Realizar 3 eliminaciones y 3 modificaciones

1. Elimina las entradas donde el campo `booleano` es igual a `True`.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/05_delete.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
DELETE FROM Ejemplo WHERE booleano = 1;
```

</details> 

1. Modifica el campo `texto` de las entradas donde el campo `entero` es menor a 30 y establece el texto como "Modificado".

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/06_update.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
UPDATE Ejemplo SET texto = 'Modificado' WHERE entero < 30;
```

</details> 

2. Elimina las entradas donde el campo `entero` es igual a 50.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
DELETE FROM Ejemplo WHERE entero = 50;
```

</details> 

3. Incrementa en 10 el valor del campo `entero` para las entradas donde el campo `booleano` es igual a `False`.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/06_update.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
UPDATE Ejemplo SET entero = entero + 10 WHERE booleano = 0;
```
</details> 

4. Elimina las entradas donde el campo `decimal` es menor a 50.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
DELETE FROM Ejemplo WHERE decimal < 50;
```

</details> 

5. Actualiza el campo `fecha` de todas las entradas a la fecha actual.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```code
UPDATE Ejemplo SET fecha = DATE('now');
```

</details> 

</div>