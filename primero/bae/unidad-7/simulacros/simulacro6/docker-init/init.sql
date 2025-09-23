
DROP DATABASE IF EXISTS cine;
CREATE DATABASE cine;
USE cine;

-- Tabla de clientes
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(50)
);

-- Tabla de peliculas
CREATE TABLE Peliculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150),
    genero VARCHAR(50),
    duracion INT,
    anio_estreno INT
);

-- Tabla de actores
CREATE TABLE Actores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(50)
);

-- Tabla de sesiones
CREATE TABLE Sesiones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pelicula_id INT,
    fecha DATE,
    sala INT,
    FOREIGN KEY (pelicula_id) REFERENCES Peliculas(id)
);

-- Tabla de reservas
CREATE TABLE Reservas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    sesion_id INT,
    fecha_reserva DATE,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (sesion_id) REFERENCES Sesiones(id)
);

-- Tabla de reparto (relación muchos a muchos entre actores y películas)
CREATE TABLE Reparto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    actor_id INT,
    pelicula_id INT,
    FOREIGN KEY (actor_id) REFERENCES Actores(id),
    FOREIGN KEY (pelicula_id) REFERENCES Peliculas(id)
);

-- Datos ejemplo
INSERT INTO Clientes (nombre, telefono, ciudad) VALUES
('Carlos Ruiz', '678123456', 'Madrid'),
('Ana Pérez', '612345678', 'Barcelona'),
('Lucia Gómez', '634567890', 'Madrid');

INSERT INTO Peliculas (titulo, genero, duracion, anio_estreno) VALUES
('Inception', 'Ciencia ficción', 148, 2010),
('Titanic', 'Romance', 195, 1997),
('El Padrino', 'Drama', 175, 1972),
('Matrix', 'Acción', 136, 1999),
('Toy Story', 'Animación', 81, 1995);

INSERT INTO Actores (nombre, nacionalidad) VALUES
('Leonardo DiCaprio', 'Estadounidense'),
('Kate Winslet', 'Británica'),
('Marlon Brando', 'Estadounidense');

INSERT INTO Reparto (actor_id, pelicula_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

INSERT INTO Sesiones (pelicula_id, fecha, sala) VALUES
(1, '2024-06-01', 1),
(2, '2024-06-02', 2),
(3, '2024-06-03', 3),
(4, '2024-06-04', 1),
(5, '2024-06-05', 2);

INSERT INTO Reservas (cliente_id, sesion_id, fecha_reserva) VALUES
(1, 1, '2024-05-20'),
(1, 2, '2024-05-21'),
(2, 2, '2024-05-22'),
(2, 3, '2024-05-23'),
(3, 4, '2024-05-24'),
(3, 5, '2024-05-25');
