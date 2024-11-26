# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con ArrayList: `Collection (Interfaz) -> List(Interfaz) -> ArrayList`

En los siguientes ejercicios vamos a trabajar con los métodos que proporciona la `Interfaz List que extiende de Collection` y que **implementa** `ArrayList`.

> La documentación oficial de los métodos la tienes en el siguiente [enlace](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/ArrayList.html).

> En cada uno de los ejercicios incluye al menos 5 elementos para trabajar, a través de las `funciones correspondientes (add,..)` o de la siguiente forma.

```java
        List<Integer> enteros = new ArrayList<>(Arrays.asList(1, 2, 3));
        List<String> diasDeLaSemana = new ArrayList<>(Arrays.asList(
            "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"
        ));
```

## **1. Creación y Añadido de Elementos**

**Métodos a utilizar:** `add`

- Crea un `ArrayList<String>` vacío.
- Añade cinco nombres al `ArrayList` usando el método `add`.
- Imprime la lista completa para verificar los elementos añadidos.

---

## **2. Acceso a Elementos**

**Métodos a utilizar:** `get`

- Usa el `ArrayList` creado en el ejercicio 1.
- Obtén el tercer elemento de la lista utilizando el método `get`.
- Imprime el elemento obtenido.

---

## **3. Modificación de Elementos**

**Métodos a utilizar:** `set`

- Cambia el segundo elemento del `ArrayList` por otro nombre utilizando el método `set`.
- Imprime la lista completa para verificar el cambio.

> Nota: Para ser eficiente y rápido crea la `lista de elementos` como se especifica al inicio del ejercicio.

---

## **4. Eliminación de Elementos**

**Métodos a utilizar:** `remove`

- Elimina el cuarto elemento del `ArrayList` utilizando el método `remove`.
- Imprime la lista para confirmar que el elemento fue eliminado correctamente.

> Nota: Para ser eficiente y rápido crea la `lista de elementos` como se especifica al inicio del ejercicio.

---

## **5. Comprobar si un Elemento Existe**

**Métodos a utilizar:** `contains`

- Verifica si el nombre `"Ana"` está presente en el `ArrayList`.
- Imprime un mensaje indicando si el elemento está o no en la lista.

> Nota: Para ser eficiente y rápido crea la `lista de elementos` como se especifica al inicio del ejercicio.

---

## **6. Tamaño de la Lista**

**Métodos a utilizar:** `size`

- Usa el método `size` para mostrar el número total de elementos en el `ArrayList`.

> Nota: Para ser eficiente y rápido crea la `lista de elementos` como se especifica al inicio del ejercicio.

---

## **7. Iteración sobre la Lista**

**Métodos a utilizar:** `size`, `get`

- Usa un bucle `for` para recorrer el `ArrayList`.
- Imprime cada elemento en una línea diferente accediendo a ellos con el método `get`.
- Realiza el mismo ejercicio utilizando el método `toString` de `lista`creada, y compara las diferencias.

> Nota: Para ser eficiente y rápido crea la `lista de elementos` como se especifica al inicio del ejercicio.

---

## **8. Uso de `forEach`**

**Métodos a utilizar:** `forEach`

- Usa el método `forEach` para recorrer y mostrar todos los elementos del `ArrayList`.

> Nota: Para ser eficiente y rápido crea la `lista de elementos` como se especifica al inicio del ejercicio.

---

## **9. Ordenar la Lista**

**Métodos a utilizar:** `Collections.sort`

- Ordena el `ArrayList` en orden alfabético utilizando el método `Collections.sort`.
- Imprime la lista ordenada.

> Ejemplo de utilización de [Collections.sort](https://www.w3schools.com/java/java_sort_list.asp).
.
---

## **10. Conversión a un Array**

**Métodos a utilizar:** `toArray`

- Convierte el `ArrayList` a un array utilizando el método `toArray`.
- Imprime los elementos del array utilizando un bucle `for`.

---

## **11. Inversión de la Lista**

**Métodos a utilizar:** `Collections.reverse`

- Invierte el orden de los elementos del `ArrayList` utilizando el método `Collections.reverse`.
- Imprime la lista invertida.

> Ejemplo de utilización de [Collections.reverse](https://www.geeksforgeeks.org/collections-reverse-method-in-java-with-examples/).

---

## **12. Buscar un Índice**

**Métodos a utilizar:** `indexOf`

- Busca el índice de un elemento específico en el `ArrayList` utilizando el método `indexOf`.
- Imprime el elemento encontrado.

---

## **13. Remover Elementos por Condición**

**Métodos a utilizar:** `removeIf`

- Usa el método `removeIf` para eliminar todos los nombres del `ArrayList` que tengan más de 5 caracteres.
- Imprime la lista resultante.

> Ejemplo de utilización de [removeif](https://www.w3schools.com/java/ref_arraylist_removeif.asp).

---

## **14. Agregar Todos los Elementos de Otra Lista**

**Métodos a utilizar:** `addAll`

- Crea un segundo `ArrayList<String>` con cinco nombres diferentes.
- Usa el método `addAll` para agregar todos los elementos de esta lista al primer `ArrayList`.
- Imprime la lista combinada.

---

## **15. Clonación de la Lista**

**Métodos a utilizar:** `clone`

- Crea una copia exacta del `ArrayList` utilizando el método `clone`.
- Imprime la lista clonada.

> Ejemplo de utilización de [clone](https://www.w3schools.com/java/ref_arraylist_clone.asp).

---

## **16. Verificar si la Lista Está Vacía**

**Métodos a utilizar:** `isEmpty`

- Usa el método `isEmpty` para verificar si el `ArrayList` está vacío.
- Imprime un mensaje indicando si lo está o no.

---

## **17. Reemplazo de Todos los Elementos**

**Métodos a utilizar:** `replaceAll`

- Usa el método `replaceAll` para reemplazar todos los elementos del `ArrayList` con el valor `"Sin Nombre"`.
- Imprime la lista resultante.

> Ejemplo de utilización de [Collections](https://www.geeksforgeeks.org/replacing-all-occurrences-of-specified-element-of-java-arraylist/).

---

## **18. Uso del Método `subList`**

**Métodos a utilizar:** `subList`

- Usa el método `subList` para obtener una sublista con los tres primeros elementos del `ArrayList`.
- Imprime la sublista.

---

## **19. Uso de un Objeto Personalizado**

**Métodos a utilizar:** `add`

- Crea una clase `Persona` con atributos `nombre`, `edad` y `dni`.
- Crea una `List<Persona>` y añade cinco objetos `Persona` al `ArrayList` utilizando el método `add`.
- Usa un bucle para imprimir la información de todas las personas.
- Utiliza el if para encontrar a una persona especifica por su `dni`.

> Crea las funciones necesarias.

---

## **20. Eliminación Basada en Índice**

**Métodos a utilizar:** `remove`

- Usa el método `remove` para eliminar un elemento del `ArrayList` basado en su índice.
- Imprime la lista tras la eliminación.

---

## **21. Limpieza Completa de la Lista**

**Métodos a utilizar:** `clear`

- Vacía completamente el contenido del `ArrayList` utilizando el método `clear`.
- Verifica si está vacío con el método `isEmpty` e imprime un mensaje.

---

## **22. Comparación de Listas**

**Métodos a utilizar:** `equals`

- Crea dos `ArrayList<String>` con elementos iguales.
- Usa el método `equals` para verificar si ambas listas son iguales.
- Imprime el resultado de la comparación.

---

## **23. Obtener un HashCode**

**Métodos a utilizar:** `hashCode`

- Usa el método `hashCode` para obtener un código hash del `ArrayList`.
- Imprime el código hash obtenido.

---

## **24. Verificar Contenido con `retainAll`**

**Métodos a utilizar:** `retainAll`

- Crea dos `ArrayList<String>` con algunos elementos en común.
- Usa el método `retainAll` para conservar solo los elementos comunes en el primer `ArrayList`.
- Imprime la lista resultante.

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
