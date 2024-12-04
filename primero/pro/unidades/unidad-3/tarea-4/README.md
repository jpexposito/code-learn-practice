# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con Vectores y funciones de de forma avanzada: `Collection (Interfaz) -> List(Interfaz) -> Vector`

En los siguientes ejercicios vamos a trabajar con los métodos que proporciona la `Interfaz List que extiende de Collection` y que **implementa** `Vector`.

> La documentación oficial de los métodos de `Collections` la tienes en el siguiente [enlace](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Collections.html).
> Con muchos de sus funciones se simplifica el problema.
> En cada uno de los ejercicios incluye al menos 5 elementos para trabajar, a través de las `funciones correspondientes (add,..)` o de la siguiente forma.

```java
Vector<Integer> enteros = new Vector<>(Arrays.asList(1, 2, 3));
        
// Vector de días de la semana
Vector<String> diasDeLaSemana = new Vector<>(Arrays.asList(
    "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"
));
```

---

>**IMPORTANTE: GENERA FUNCIONES PARA RESOLVER CADA UNA DE LAS FUNCIONALIDADES (LÓGICAS DE NEGOCIO) QUE SE PROPONEN**

A continuación, se presentan ejercicios con la descripción de la función a crear, los métodos de `Vector` que deben utilizarse y el resultado esperado.

---

## Ejercicio 1: Crear un vector y agregar elementos

### Función: `crearVectorFrutas()`

- **Descripción**: Crear un vector de tipo `String` y agregar cinco nombres de frutas.
- **Métodos a utilizar**: `add()`, `toString()`.
- **Resultado esperado**: `[Manzana, Banana, Cereza, Mango, Uva]`.

---

## Ejercicio 2: Obtener y modificar elementos

### Función: `modificarElementoVector()`

- **Descripción**: Crear un vector de números enteros, mostrar el tercer elemento y cambiarlo.
- **Métodos a utilizar**: `add()`, `get()`, `set()`.
- **Resultado esperado**: Antes: `5`, Después: `[1, 2, 10, 4, 5]`.

---

## Ejercicio 3: Eliminar elementos por condición

### Función: `eliminarPorCondicion()`

- **Descripción**: Eliminar colores que comiencen con "A".
- **Métodos a utilizar**: `add()`, `remove()`, `startsWith()`.
- **Resultado esperado**: Vector antes: `[Azul, Amarillo, Verde, Anaranjado]`. Vector después: `[Verde]`.

---

## Ejercicio 4: Copiar elementos a otro vector

### Función: `copiarElementosPares()`

- **Descripción**: Copiar números pares de un vector a otro.
- **Métodos a utilizar**: `add()`, `get()`, `addAll()`.
- **Resultado esperado**: Vector original: `[1, 2, 3, 4, 5]`. Vector pares: `[2, 4]`.

---

## Ejercicio 5: Ordenar elementos

### Función: `ordenarVector()`

- **Descripción**: Ordenar un vector con números aleatorios en orden ascendente.
- **Métodos a utilizar**: `add()`, `sort()` (de `Collections`).
- **Resultado esperado**: Antes: `[4, 2, 5, 1, 3]`. Después: `[1, 2, 3, 4, 5]`.

---

## Ejercicio 6: Verificar si un elemento está presente

### Función: `verificarPresenciaElemento()`

- **Descripción**: Verificar si un país ingresado por el usuario está en el vector.
- **Métodos a utilizar**: `add()`, `contains()`.
- **Resultado esperado**: País: "España". Resultado: `true` o `false`.

---

## Ejercicio 7: Contar elementos con una propiedad específica

### Función: `contarNombresLargos()`

- **Descripción**: Contar cuántos nombres tienen más de cinco caracteres.
- **Métodos a utilizar**: `add()`, `size()`, `length()`.
- **Resultado esperado**: `[Ana, Francisco, María, Alejandro]`. Resultado: `2`.

---

## Ejercicio 8: Fusionar dos vectores

### Función: `fusionarVectores()`

- **Descripción**: Combinar dos vectores y eliminar duplicados.
- **Métodos a utilizar**: `add()`, `contains()`.
- **Resultado esperado**: Vector A: `[Perro, Gato]`. Vector B: `[Gato, Caballo]`. Combinado: `[Perro, Gato, Caballo]`.

---

## Ejercicio 9: Vector dinámico

### Función: `crearVectorDinamico()`

- **Descripción**: Crear un vector vacío y agregar números hasta que el usuario ingrese "0".
- **Métodos a utilizar**: `add()`, `toString()`.
- **Resultado esperado**: Entrada: `1, 2, 3, 0`. Vector: `[1, 2, 3]`.

---

## Ejercicio 10: Calcular el promedio de números

### Función: `calcularPromedio()`

- **Descripción**: Calcular el promedio de calificaciones almacenadas en un vector.
- **Métodos a utilizar**: `add()`, `size()`, `get()`.
- **Resultado esperado**: Calificaciones: `[80.0, 90.0, 70.0]`. Promedio: `80.0`.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
