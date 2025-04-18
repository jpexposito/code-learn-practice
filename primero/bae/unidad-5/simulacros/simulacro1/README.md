<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice("Simulacro consultas bbdd")

<div align="center">
<img src="https://www.seguridadkimika.eus/wp-content/uploads/2017/10/sirenas-seguridad-kimika-simulacro.jpg" width="200px"/>
</div>

## Objetivo

Simulacro de examen se provee de los siguientes ficheros:
- [examen_multitabla.sql](files/simulacro_multitabla.sql). Fichero que contiene la especificación de la BBDD e inserts para la realización del examen.
- [XX_consultas_multitabla.sql](files/XX_consultas_multitabla_simulacro.sql). Conjunto de consultas a realizar por el alumno. Dentro se encuentra la rúbrica del examen.
Se debe de entregar el fichero XX_consultas_multitabla.sql con el nombre y apellidos correspondiente de cada alumno.

1. Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados

> por la fecha de realización, mostrando en primer lugar las compras más recientes.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

    ```sql
    SELECT * FROM compra ORDER BY fecha DESC;
    ```

</details>

2. Devuelve todos los datos de los dos compras de mayor valor.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM compra ORDER BY total DESC LIMIT 2;
```

</details>

3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.

> Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT DISTINCT id_consumidor FROM compra;
```

</details>

4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,cuya cantidad total sea superior a 500€.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM compra 
WHERE strftime('%Y', fecha) = '2020' AND total > 500;
-- Es otra forma diferente a las expresiones regulares
```

</details>

5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT nombre, apellido1, apellido2 FROM suministrador 
WHERE categoria BETWEEN 0.11 AND 0.15;
```

</details>

6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT MAX(categoria) FROM suministrador;
```

</details>

7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.

> El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT id, nombre, apellido1 FROM consumidor 
WHERE apellido2 IS NOT NULL 
ORDER BY apellido1, apellido2, nombre;
```

</details>

8. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.

> El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 
FROM consumidor c, compra co 
WHERE c.id = co.id_consumidor 
ORDER BY c.apellido1, c.apellido2, c.nombre;
```

</details>

9. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 

> El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.*, co.* 
FROM consumidor c, compra co 
WHERE c.id = co.id_consumidor 
ORDER BY c.apellido1, c.apellido2, c.nombre;
```

</details>

10. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.

> El resultado debe mostrar todos los datos de las compras y de los suministradores.
> El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT s.*, co.* 
FROM suministrador s, compra co 
WHERE s.id = co.id_suministrador 
ORDER BY s.apellido1, s.apellido2, s.nombre;
```

</details>

11. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado y con los datos de los suministradores asociados a cada compra.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.*, co.*, s.* 
FROM consumidor c, compra co, suministrador s 
WHERE c.id = co.id_consumidor AND s.id = co.id_suministrador;
```

</details>

12. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,

> cuya cantidad esté entre 300 € y 1000 €.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT DISTINCT c.* 
FROM consumidor c, compra co 
WHERE c.id = co.id_consumidor 
AND strftime('%Y', co.fecha) = '2020' 
AND co.total BETWEEN 300 AND 1000;
```

</details>

13. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT s.nombre, s.apellido1, s.apellido2 
FROM suministrador s, compra co, consumidor c 
WHERE s.id = co.id_suministrador 
AND c.id = co.id_consumidor 
AND c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';
```

</details>

14. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT DISTINCT c.nombre 
FROM consumidor c, compra co, suministrador s 
WHERE c.id = co.id_consumidor 
AND s.id = co.id_suministrador 
AND s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega';
```

</details>

15. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
> El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 
FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
ORDER BY c.apellido1, c.apellido2, c.nombre;
```

</details>

16. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 

> El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.*, co.* 
FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
ORDER BY c.apellido1, c.apellido2, c.nombre;
```

</details>

16. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT s.*, co.* 
FROM suministrador s JOIN compra co ON s.id = co.id_suministrador 
ORDER BY s.apellido1, s.apellido2, s.nombre;
```

</details>

17. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado y con los datos de los suministradores asociados a cada compra.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.*, co.*, s.* 
FROM consumidor c 
JOIN compra co ON c.id = co.id_consumidor 
JOIN suministrador s ON s.id = co.id_suministrador;
```

</details>

18. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT DISTINCT c.* 
FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
WHERE strftime('%Y', co.fecha) = '2020' 
AND co.total BETWEEN 300 AND 1000;
```

</details>

19. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT s.nombre, s.apellido1, s.apellido2 
FROM suministrador s 
JOIN compra co ON s.id = co.id_suministrador 
JOIN consumidor c ON c.id = co.id_consumidor 
WHERE c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';
```

</details>

20. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT DISTINCT c.nombre 
FROM consumidor c 
JOIN compra co ON c.id = co.id_consumidor 
JOIN suministrador s ON s.id = co.id_suministrador 
WHERE s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega';
```

</details>

20. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT AVG(total) FROM compra;
```

</details>

21. Calcula el número total de suministradores distintos que aparecen en la tabla compra.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT COUNT(DISTINCT id_suministrador) FROM compra;
```

</details>

22. Calcula el número total de consumidores que aparecen en la tabla consumidor.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT COUNT(*) FROM consumidor;
```

</details>

23. Calcula cuál es la mayor cantidad que aparece en la tabla compra.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT MAX(total) FROM compra;
```

</details>

24. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT ciudad, MAX(categoria) 
FROM consumidor 
GROUP BY ciudad;
```

</details>

25. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores. Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día. Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.

> Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total) 
FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
GROUP BY c.id, co.fecha;
```

</details>

26. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores, teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total) 
FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
GROUP BY c.id, co.fecha 
HAVING MAX(co.total) > 2000;
```

</details>

27. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17. Muestra el identificador del suministrador, nombre, apellidos y total.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT s.id, s.nombre, s.apellido1, s.apellido2, MAX(co.total) 
FROM suministrador s JOIN compra co ON s.id = co.id_suministrador 
WHERE co.fecha = '2020-08-17' 
GROUP BY s.id;
```

</details>

28. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores. Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra. Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id) 
FROM consumidor c LEFT JOIN compra co ON c.id = co.id_consumidor 
GROUP BY c.id;
```

</details>

29. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id) 
FROM consumidor c LEFT JOIN compra co ON c.id = co.id_consumidor AND strftime('%Y', co.fecha) = '2020' 
GROUP BY c.id;
```

</details>

30. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM compra 
WHERE id_consumidor = (SELECT id FROM consumidor 
                      WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Díaz');
```

</details>

31. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT fecha, MIN(total) FROM compra 
WHERE id_consumidor = (SELECT id FROM consumidor 
                      WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana');
```

</details>

32. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT COUNT(*) FROM compra 
WHERE id_suministrador = (SELECT id FROM suministrador 
                         WHERE nombre = 'Daniel' AND apellido1 = 'Sáez' AND apellido2 = 'Vega');
```

</details>

33. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM consumidor 
WHERE id = (SELECT id_consumidor FROM compra 
           WHERE strftime('%Y', fecha) = '2021' 
           ORDER BY total DESC LIMIT 1);
```

</details>

34. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT c.*, co.* 
FROM consumidor c, compra co 
WHERE c.id = co.id_consumidor 
AND strftime('%Y', co.fecha) = '2020' 
AND co.total >= (SELECT AVG(total) FROM compra WHERE strftime('%Y', fecha) = '2020');
```

</details>

35. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM consumidor 
WHERE id NOT IN (SELECT DISTINCT id_consumidor FROM compra);
```

</details>

36. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM consumidor c 
WHERE NOT EXISTS (SELECT 1 FROM compra co WHERE co.id_consumidor = c.id);
```

</details>

37. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM consumidor c 
WHERE NOT EXISTS (SELECT 1 FROM compra co WHERE co.id_consumidor = c.id);
```

</details>

38. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).

<details>
      <summary>PULSA PARA VER LA SOLUCIÓN</summary>

```sql
SELECT * FROM suministrador s 
WHERE NOT EXISTS (SELECT 1 FROM compra co WHERE co.id_suministrador = s.id);
```

</details>

</div>