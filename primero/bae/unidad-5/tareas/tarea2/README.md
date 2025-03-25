<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Base de datos (Creación de la Base de Datos")

<div align="center">
<img src="https://i0.wp.com/hunna.org/wp-content/uploads/2014/06/huellas.jpg?resize=324%2C215" width="500px"/>
</div>

## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos

### Paso 1: Crear una tabla con un campo de cada tipo

1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada `tarea2.db`.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
sqlite3 tarea2.db
```

</details> 

1. Dentro de SQLite3, crea las siguientes tablas

- __Propietarios__: Almacena información de los propietarios.
  - __id__ INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - __nombre__ TEXT no nulo.
  - __apellido__ TEXT no nulo.
  - __dni__ TEXT Valor único. 
  - __Vehiculos__: Almacena información sobre los propietarios de los vehículos.
  - __id__ INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - __marca__ TEXT no nulo.
  - __modelo__ TEXT no nulo.
  - __anio__ INTEGER no nulo.
  - __id_propietario__ INTEGER, FK propietarios(id_propietario). 

>__Nota__: Un propietario puede tener varios vehículos, pero un vehículo pertenece a un único propietario.

Asegúrate de cerrar SQLite3 al finalizar.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/01_crear_borrar_tabla.md).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
CREATE TABLE Propietarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    dni TEXT UNIQUE NOT NULL
);

CREATE TABLE Vehiculos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    marca TEXT NOT NULL,
    modelo TEXT NOT NULL,
    anio INTEGER NOT NULL,
    id_propietario INTEGER,
    FOREIGN KEY (id_propietario) REFERENCES Propietarios(id)
);
```

</details> 

### Paso 2: Insertar 20 entradas

Dado el siguiente conjunto de información:

| id_propietario | nombre      | apellido    | dni       | marca      | modelo     | ano  |
|----------------|-------------|-------------|-----------|------------|------------|------|
| 1              | Juan        | Perez       | 12345678A | Ford       | Fiesta     | 2019 |
| 2              | Maria       | Lopez       | 87654321B | Toyota     | Corolla    | 2018 |
| 3              | Carlos      | Ruiz        | 11111111C | Nissan     | Sentra     | 2020 |
| 4              | Laura       | Gomez       | 22222222D | Chevrolet  | Spark      | 2017 |
| 5              | Pedro       | Martinez    | 33333333E | Honda      | Civic      | 2016 |
| 6              | Ana         | Fernandez   | 44444444F | Ford       | Mustang    | 2021 |
| 7              | Diego       | Sanchez     | 55555555G | Toyota     | RAV4       | 2019 |
| 8              | Sofia       | Torres      | 66666666H | Volkswagen | Golf       | 2020 |
| 9              | Javier      | Leon        | 77777777I | Honda      | CR-V       | 2018 |
| 10             | Lucia       | Castillo    | 88888888J | Nissan     | Altima     | 2017 |
| 11             | Luis        | Gonzalez    | 99999999K | Chevrolet  | Malibu     | 2019 |
| 12             | Marta       | Diaz        | 10101010L | Toyota     | Camry      | 2020 |
| 13             | Victor      | Vargas      | 11111112M | Honda      | Accord     | 2018 |
| 14             | Elena       | Castro      | 12121212N | Ford       | Explorer   | 2021 |
| 15             | Roberto     | Blanco      | 13131313O | Nissan     | Rogue      | 2017 |
| 16             | Natalia     | Paredes     | 14141414P | Volkswagen | Jetta      | 2019 |
| 17             | Fernando    | Herrera     | 15151515Q | Chevrolet  | Equinox    | 2018 |
| 18             | Clara       | Soto        | 16161616R | Toyota     | Highlander | 2020 |
| 19             | Sergio      | Mendoza     | 17171717S | Honda      | Odyssey    | 2016 |
| 20             | Patricia    | Navarro     | 18181818T | Nissan     | Murano     | 2019 |

Realiza la inserción en la tablas de modo que la información quede almacenada.

___Guarda algunas de las entradas para el informe___.

>__Nota__: Ayudate de los [apuntes](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/02_insert_select.md).


<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Juan', 'Perez', '12345678A');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Maria', 'Lopez', '87654321B');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Carlos', 'Ruiz', '11111111C');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Laura', 'Gomez', '22222222D');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Pedro', 'Martinez', '33333333E');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Ana', 'Fernandez', '44444444F');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Diego', 'Sanchez', '55555555G');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Sofia', 'Torres', '66666666H');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Javier', 'Leon', '77777777I');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Lucia', 'Castillo', '88888888J');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Luis', 'Gonzalez', '99999999K');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Marta', 'Diaz', '10101010L');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Victor', 'Vargas', '11111112M');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Elena', 'Castro', '12121212N');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Roberto', 'Blanco', '13131313O');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Natalia', 'Paredes', '14141414P');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Fernando', 'Herrera', '15151515Q');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Clara', 'Soto', '16161616R');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Sergio', 'Mendoza', '17171717S');
INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Patricia', 'Navarro', '18181818T');

INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Ford', 'Fiesta', 2019, 1);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Toyota', 'Corolla', 2018, 2);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Nissan', 'Sentra', 2020, 3);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Chevrolet', 'Spark', 2017, 4);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Honda', 'Civic', 2016, 5);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Ford', 'Mustang', 2021, 6);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Toyota', 'RAV4', 2019, 7);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Volkswagen', 'Golf', 2020, 8);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Honda', 'CR-V', 2018, 9);
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES ('Nissan', 'Altima', 2017, 10);

```

</details> 

### Paso 3: Realizar las siguientes 10 consultas de datos

- Seleccionar todos los propietarios
- Listar todos los vehículos.
- Seleccionar solo los nombres y apellidos de los propietarios.
- Listar todas las marcas y modelos de los vehículos.
- Seleccionar solo los propietarios con apellido "Perez".
- Listar todos los vehículos con año 2019.
- Seleccionar propietarios que tienen vehículos de la marca "Toyota".
- Listar vehículos con marca "Ford" y modelo "Fiesta".
- Seleccionar propietarios con DNI "12345678A".
- Listar vehículos que pertenecen al propietario con ID 5.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
-- . Seleccionar todos los propietarios
SELECT * FROM Propietarios;
-- . Listar todos los vehículos.
SELECT * FROM Vehiculos;
-- . Seleccionar solo los nombres y apellidos de los propietarios.
SELECT nombre, apellido FROM Propietarios;
-- . Listar todas las marcas y modelos de los vehículos.
SELECT marca, modelo FROM Vehiculos;
-- . Seleccionar solo los propietarios con apellido "Perez".
SELECT * FROM Propietarios WHERE apellido = 'Perez';
-- . Listar todos los vehículos con año 2019.
SELECT * FROM Vehiculos WHERE anio = 2019;
-- . Seleccionar propietarios que tienen vehículos de la marca "Toyota".
SELECT Propietarios.*
FROM Propietarios
JOIN Vehiculos ON Propietarios.id = Vehiculos.id_propietario
WHERE Vehiculos.marca = 'Toyota';
-- . Listar vehículos con marca "Ford" y modelo "Fiesta".
SELECT * FROM Vehiculos WHERE marca = 'Ford' AND modelo = 'Fiesta';
-- . Seleccionar propietarios con DNI "12345678A".
SELECT * FROM Propietarios WHERE dni = '12345678A';
# - Listar vehículos que pertenecen al propietario con ID 5. 
SELECT * FROM Vehiculos WHERE id_propietario = 5;

```

</details> 

### Paso 4: Realiza los siguientes updates

- Actualizar el nombre de un propietario con DNI "12345678A".
- Modificar el año de un vehículo con ID 3 a 2022.
- Cambiar el modelo de todos los vehículos Nissan a "Micra".
- Actualizar el apellido de un propietario con ID 7 a "Gomez".
- Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
-- . Actualizar el nombre de un propietario con DNI "12345678A" a "Juan Carlos"
UPDATE Propietarios 
SET nombre = 'Juan Carlos' 
WHERE dni = '12345678A';

-- . Modificar el año de un vehículo con ID 3 a 2022
UPDATE Vehiculos 
SET anio = 2022 
WHERE id = 3;

-- . Cambiar el modelo de todos los vehículos Nissan a "Micra"
UPDATE Vehiculos 
SET modelo = 'Micra' 
WHERE marca = 'Nissan';

-- . Actualizar el apellido de un propietario con ID 7 a "Gomez"
UPDATE Propietarios 
SET apellido = 'Gomez' 
WHERE id = 7;

-- . Modificar la marca de un vehículo con modelo "Fiesta" a "Renault"
UPDATE Vehiculos 
SET marca = 'Renault' 
WHERE modelo = 'Fiesta';

```

</details> 

</div>