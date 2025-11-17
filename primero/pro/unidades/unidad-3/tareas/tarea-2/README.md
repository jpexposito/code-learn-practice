# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con ArrayList de forma avanzada: `Collection (Interfaz) -> List(Interfaz) -> ArrayList`

En los siguientes ejercicios vamos a trabajar con los métodos que proporciona la `Interfaz List que extiende de Collection` y que **implementa** `ArrayList`.

> La documentación oficial de los métodos la tienes en el siguiente [enlace](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/ArrayList.html).

> En cada uno de los ejercicios incluye al menos 5 elementos para trabajar, a través de las `funciones correspondientes (add,..)` o de la siguiente forma.

```java
List<Integer> enteros = new ArrayList<>(Arrays.asList(1, 2, 3));
List<String> diasDeLaSemana = new ArrayList<>(Arrays.asList(
    "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"
));
```

---
>**IMPORTANTE: GENERA FUNCIONES PARA RESOLVER CADA UNA DE LAS FUNCIONALIDADES (LÓGICAS DE NEGOCIO) QUE SE PROPONEN**
>
> Por ejemplo utiliza el método addAll()
>

>```java
>/**
> * Funcion que permite incluir >un lista en otra
> */
>List<TipoElemento> addAll>(List<TipoEjemento> listaIncial, List<TipoEjemento> lista){
>  //.... utilizamos la función >addAll() de java, pero antes verificamos si alguna de las listas es null o empty, etc
>}
>```

---

## **1. Verificar si una lista está vacía antes de agregar elementos**

Verifica si una lista está vacía utilizando `isEmpty()`. Si está vacía, rellénala con números del 1 al 10 . Si no está vacía, elimina todos los números menores que 5 usando `removeIf()`.

> Verifica el comportamiento con cada una de las opciones que pueden suceder.
  
>**Métodos a usar**:
>  - `isEmpty()` de `List`.
>  - `addAll()` de `ArrayList`.
>  - `removeIf()` de `List`.

---

## **2. Agregar elementos a una lista si no existen**

Agrega elementos a una lista `solo si no están presentes`, usando `contains()`. Luego, ordena la lista alfabéticamente con `Collections.sort()`.

> **Métodos a usar**: 
>  - `contains()` de `List`.
>  - `add()` de `ArrayList`.
>  - `sort()` de `Collections`.

> Crea inicialmente una lista, para después utilizar el contains, y el sort.

---

## **3. Eliminar elementos según un criterio y verificar después si existe aún en la lista**

Llena una lista con números aleatorios (Utiliza [Math](https://www.w3schools.com/java/java_howto_random_number.asp)). Elimina todos los números mayores que 50 utilizando `removeIf()`. Después, verifica si la lista contiene números pares con `contains()` o recorriéndola con un bucle.

> - **Métodos a usar**: 
> > - `Math.random()`
>  - `removeIf()` de `List`.
>  - `contains()` de `List`.
>  - Uso de un bucle con `get()` de `ArrayList`.

---

## **4. Comparar listas y fusionar solo elementos únicos**

Crea dos listas de enteros, genera auna tercera lista solo los elementos que están en una de las dos listas pero no en ambas, usando `addAll()`, `retainAll()` y `removeAll()`.

>**Métodos a usar**:
>  - `addAll()` de `ArrayList`.
>  - `retainAll()` de `List`.
>  - `removeAll()` de `List`.

---

## **5. Contar elementos antes y después de realizar operaciones**

Llena una lista con números del 1 al 20 (`forEach y add`). Muestra el tamaño inicial con `size()`. Elimina los múltiplos de 3 utilizando `removeIf()`. Muestra el tamaño de la lista después de la operación.

> **Métodos a usar**:
>  - `add` de `ArrayList`.
>  - `removeIf()` de `List`.
>  - `size()` de `List`.

---

## **6. Validar y rellenar listas según un patrón**

Escribe un método que reciba dos listas de enteros. Si alguna está vacía (`isEmpty()`), rellénala con números impares del 1 al 10. Si ambas están llenas, crea una tercera lista con el `producto` de los elementos en las mismas posiciones.

>**Métodos a usar**:
>  - `isEmpty()` de `List`.
>  - `addAll()` de `ArrayList`.
>  - Recorre con un bucle usando `get()`.

---

## **7. Eliminar elementos duplicados manteniendo el orden**

Llena una lista con palabras repetidas. Usa una `List` temporal para identificar y eliminar duplicados, manteniendo el orden de aparición original.

>**Métodos a usar**:
> - `add()` de `ArrayList`.

---

## **8. Eliminar elementos según varias condiciones**

Llena una lista con números aleatorios entre 90 y 110, con [Math](https://www.w3schools.com/java/java_howto_random_number.asp). Escribe un método que elimine números negativos y mayores que 100 en una sola operación con `removeIf()`. Verifica si la lista resultante no está vacía antes de imprimirla.

>**Métodos a usar**:
> - `addAll()` de `ArrayList`.
> - `removeIf()` de `List`.
> - `isEmpty()` de `List`.

---

## **9. Verificar la igualdad de dos listas tras varias modificaciones**

Llena dos listas con números iguales. Realiza operaciones en ambas (por ejemplo, agrega elementos en posiciones específicas o elimina elementos pares) y verifica si las listas siguen siendo iguales usando `equals()`.
> **Métodos a usar**:
> - `add()` de `ArrayList`.
> - `removeIf()` de `List`.
> - `equals()` de `List`.

---

## **10. Reemplazar elementos según un criterio**

Llena una lista con nombres. Usa un bucle para reemplazar cualquier nombre con más de 5 caracteres por "GENÉRICO". Valida si los cambios fueron aplicados correctamente con `contains()`.
> **Métodos a usar**:
> - `add()` de `ArrayList`.
> - `set()` de `ArrayList`.
> - `contains()` de `List`.

---

## **11. Dividir una lista en sublistas de longitud fija**

>Llena una lista con números del 1 al 30. Divide la lista en sublistas de 5 elementos cada una usando un bucle y `subList()`.
> **Métodos a usar**:
>  - `addAll()` de `ArrayList`.
>  - `subList()` de `List`.

---

## **12. Buscar y operar en una sublista**

Llena una lista con palabras. Encuentra la sublista que comienza con "Inicio" y termina con "Fin". Invierte el orden de la sublista utilizando `Collections.reverse()` sin alterar el resto de la lista.
>**Métodos a usar**:
> - `add()` de `ArrayList`.
> - `subList()` de `List`.
> - `Collections.reverse()`.

---

## **13. Fusionar y reorganizar sublistas**

Llena una lista con números. Crea dos sublistas: una con números pares y otra con números impares. Fusiona ambas sublistas en la lista original, colocando los impares primero.
> **Métodos a usar**:
> - `addAll()` de `ArrayList`.
> - `removeIf()` de `List`.

---

## **14. Filtrar elementos dentro de una sublista y reemplazar**

Llena una lista con números. Toma una sublista del índice 5 al 10, elimina todos los números que no sean múltiplos de 3 y reemplázalos por el número 0 en la lista principal.
>**Métodos a usar**:
> - `subList()` de `List`.
> - `removeIf()` de `List`.
> - `set()` de `ArrayList`.

---

## **15. Crear listas jerárquicas**

Crea una lista de listas donde cada sublista representa una categoría de productos. Implementa métodos para agregar productos a una categoría, mover un producto entre categorías, y eliminar categorías vacías.

>**Métodos a usar**:
> - `add()` de `ArrayList`.
> - `isEmpty()` de `List`.
> - Operaciones anidadas con `get()`.

---

## **16. Generación y manipulación de reportes**

Llena una lista con resultados de exámenes (`ResultadoExamen` con `nombreAlumno` y `nota`). Genera listas separadas con los tres mejores estudiantes y los que están por debajo del promedio.
> **Métodos a usar**:
> - `add()` de `ArrayList`.
> - `sort()` de `Collections`.
> - Bucle para filtrar usando `get()`.

---

## **16. Operaciones complejas con múltiples listas**

Llena dos listas con números. Genera una tercera lista que contenga:

- Los números comunes entre ambas (`retainAll()`).
- Los números únicos de cada lista (`removeAll()`).

>**Métodos a usar**:
> - `addAll()` de `ArrayList`.
> - `retainAll()` y `removeAll()` de `List`.

---

## **17. Modificar una lista según otra**

Llena dos listas con nombres. Crea una tercera lista que contenga solo los nombres de la primera lista que no están en la segunda.

> **Métodos a usar**:
> - `addAll()` de `ArrayList`.
> - `removeAll()` de `List`.

---

## **18. Rotación de elementos**

Llena una lista con números. Implementa un método que tome un número `k` y rote la lista `k` posiciones hacia la izquierda.

>**Métodos a usar**:
> - `addAll()` de `ArrayList`.
> - `subList()` de `List`.
> - `add()` de `ArrayList`.

---

## **19. Actualizar elementos según un patrón**

Llena una lista con nombres. Usa `set()` para reemplazar todos los nombres que comienzan con una letra específica con un nuevo valor.

>**Métodos a usar**:
>- `add()` de `ArrayList`.
>- `set()` de `ArrayList`.

---

## **20. Operaciones anidadas en listas jerárquicas**

Crea una lista de listas. `Agrega elementos a sublistas específicas según su posición`. Permite mover elementos entre sublistas y elimina sublistas vacías.
> **Métodos a usar**:
> - `add()` de `ArrayList`.
> - `remove()` de `List`.
> - `isEmpty()` de `List`.


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
