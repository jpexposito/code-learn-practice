<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Base de datos (Trabajo con expresiones regulares")

## Descripción

En la siguiente tarea se premia el uso de [expresiones regulares]([../../sqlite/21_regexp.md](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-5/sqlite/21_regexp.md)) en BBDD.

Realiza la lectura de la base de datos a través del fichero [base datos de libros](files/base-datos-libros.sql).

Realiza el listado de consultas que se encuentran en el fichero [consultas-bd-express](files/consultas-bb-expreg.sql).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
-- 1. Selección de libros cuyo título comienza con "H"
SELECT * FROM libro WHERE titulo LIKE 'H%';

-- 2. Libros escritos por autores cuyos nombres terminan con "ing"
SELECT libro.* FROM libro 
JOIN autor ON libro.autor_id = autor.id 
WHERE autor.nombre LIKE '%ing';

-- 3. Libros con títulos que contienen la palabra "and" en cualquier posición
SELECT * FROM libro WHERE titulo LIKE '%and%';

-- 4. Libros cuyo título comienza con una vocal
SELECT * FROM libro WHERE titulo REGEXP '^[AEIOUaeiou]';

-- 5. Libros cuyo autor tiene al menos una vocal repetida
SELECT libro.* FROM libro 
JOIN autor ON libro.autor_id = autor.id 
WHERE autor.nombre REGEXP '(.*[aeiouAEIOU])\\1';

-- 6. Libros con precios que tienen dos dígitos decimales exactos
SELECT * FROM libro WHERE precio = ROUND(precio, 2);

-- 7. Libros cuyos títulos tienen al menos tres palabras
SELECT * FROM libro WHERE titulo LIKE '% % %';

-- 8. Obtener todos los autores cuyo nombre empieza con la letra "A"
SELECT * FROM autor WHERE nombre LIKE 'A%';

-- 9. Seleccionar los libros cuyo título contiene la palabra "SQL"
SELECT * FROM libro WHERE titulo LIKE '%SQL%';

-- 10. Obtener todos los autores cuyo nombre termina con "ez"
SELECT * FROM autor WHERE nombre LIKE '%ez';

-- 11. Obtener todos los autores cuyo nombre tiene al menos 5 caracteres
SELECT * FROM autor WHERE LENGTH(nombre) >= 5;

-- 12. Seleccionar los libros cuya editorial es diferente de "EditorialX"
SELECT * FROM libro WHERE editorial != 'EditorialX';

-- 13. Obtener todos los autores cuyo nombre contiene al menos una vocal
SELECT * FROM autor WHERE nombre REGEXP '[aeiouAEIOU]';

-- 14. Seleccionar los libros cuyo título comienza con una letra mayúscula
SELECT * FROM libro WHERE titulo REGEXP '^[A-Z]';

-- 15. Obtener todos los autores cuyo nombre no contiene la letra "r"
SELECT * FROM autor WHERE nombre NOT LIKE '%r%';

-- 16. Seleccionar los libros cuya editorial empieza con la letra "P"
SELECT * FROM libro WHERE editorial LIKE 'P%';

-- 17. Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres
SELECT * FROM autor WHERE LENGTH(nombre) = 6;

-- 18. Seleccionar los libros cuyo título contiene al menos un número
SELECT * FROM libro WHERE titulo REGEXP '[0-9]';

-- 19. Obtener todos los autores cuyo nombre inicia con una vocal
SELECT * FROM autor WHERE nombre REGEXP '^[AEIOUaeiou]';

-- 20. Obtener todos los autores cuyo nombre no contiene espacios en blanco
SELECT * FROM autor WHERE nombre NOT LIKE '% %';

-- 21. Seleccionar los libros cuyo título termina con una vocal
SELECT * FROM libro WHERE titulo REGEXP '[aeiouAEIOU]$';

-- 22. Obtener todos los autores cuyo nombre contiene la secuencia "er"
SELECT * FROM autor WHERE nombre LIKE '%er%';

-- 23. Seleccionar los libros cuyo título empieza con la palabra "The"
SELECT * FROM libro WHERE titulo LIKE 'The %';

-- 24. Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula
SELECT * FROM autor WHERE nombre REGEXP '[A-Z]';

-- 25. Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales
SELECT * FROM libro WHERE precio = ROUND(precio, 2);

-- 26. Obtener todos los autores cuyo nombre no contiene números
SELECT * FROM autor WHERE nombre NOT REGEXP '[0-9]';

-- 27. Seleccionar los libros cuyo título contiene al menos tres vocales
SELECT * FROM libro WHERE titulo REGEXP '[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU]';

-- 28. Obtener todos los autores cuyo nombre inicia con una consonante
SELECT * FROM autor WHERE nombre REGEXP '^[^AEIOUaeiou]';

-- 29. Seleccionar los libros cuyo título no contiene la palabra "Science"
SELECT * FROM libro WHERE titulo NOT LIKE '%Science%';

-- 30. Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente
SELECT * FROM autor WHERE nombre REGEXP '(.)\\1';

-- 31. Obtener todos los autores cuyo nombre empieza con "M" o termina con "n"
SELECT * FROM autor WHERE nombre LIKE 'M%' OR nombre LIKE '%n';

-- 32. Obtener todos los autores cuyo nombre no contiene caracteres especiales
SELECT * FROM autor WHERE nombre NOT REGEXP '[^a-zA-Z ]';

```

</details>

</div>