CREATE DATABASE IF NOT EXISTS libreria;
USE libreria;

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(100)
);

CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    genero VARCHAR(100),
    paginas INT,
    precio DECIMAL(6,2),
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(100)
);

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libro_id INT,
    cliente_id INT,
    empleado_id INT,
    fecha DATE,
    FOREIGN KEY (libro_id) REFERENCES libros(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

-- Datos de ejemplo (sin acentos)
INSERT INTO autores (nombre, nacionalidad) VALUES
('Gabriel Garcia Marquez', 'Colombiana'),
('J.K. Rowling', 'Britanica'),
('Jorge Luis Borges', 'Argentina'),
('Miguel de Cervantes', 'Espanola');

INSERT INTO libros (titulo, genero, paginas, precio, autor_id) VALUES
('Cien Anos de Soledad', 'Realismo Magico', 417, 25.50, 1),
('Harry Potter y la piedra filosofal', 'Fantasia', 320, 30.00, 2),
('Ficciones', 'Filosofia', 250, 22.00, 3),
('El Quijote', 'Clasico', 863, 35.00, 4),
('Libro sin autor', 'Drama', 200, 18.00, NULL);

INSERT INTO clientes (nombre, telefono, ciudad) VALUES
('Ana Perez', '123456789', 'Madrid'),
('Carlos Gomez', '987654321', 'Barcelona'),
('Lucia Torres', '456789123', 'Sevilla');

INSERT INTO empleados (nombre) VALUES
('Marta Ruiz'),
('Luis Ortega');

INSERT INTO pedidos (libro_id, cliente_id, empleado_id, fecha) VALUES
(1, 1, 1, '2023-06-15'),
(2, 2, 2, '2024-01-10'),
(3, 1, 2, '2024-03-05'),
(4, 3, 1, '2022-11-22'),
(2, 1, 1, '2024-05-12');
