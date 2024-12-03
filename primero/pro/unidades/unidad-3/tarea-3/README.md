# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con ArrayList y funciones de de forma avanzada: `Collection (Interfaz) -> List(Interfaz) -> ArrayList`

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

### 1. Crear lista de números consecutivos

- **Función:** `List<Integer> crearListaConsecutiva(int inicio, int cantidad)`
- **Lista de entrada:** N/A
- **Descripción:** Crea una lista de `cantidad` números consecutivos comenzando desde `inicio` y la devuelve.

---

### 2. Obtener elemento por índice

- **Función:** `String obtenerElemento(List<String> lista, int indice)`
- **Lista de entrada:** `List<String> lista`  
  Ejemplo: `["Hola", "Mundo", "Java"]`
- **Descripción:** Devuelve el elemento en el índice especificado de la lista. Si el índice es inválido, lanza una excepción.

---

### 3. Actualizar elementos de la lista

- **Función:** `List<Integer> duplicarElementos(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3]`
- **Descripción:** Duplica todos los elementos de la lista original y devuelve la lista modificada.  
  Resultado esperado: `[2, 4, 6]`.

---

### 4. Eliminar un elemento por valor

- **Función:** `boolean eliminarElemento(List<Integer> lista, int valor)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3, 4]`
- **Descripción:** Elimina la primera aparición de `valor` de la lista y devuelve `true` si se eliminó correctamente, o `false` en caso contrario.  
  Resultado esperado con `valor=3`: `[1, 2, 4]`.

---

### 5. Verificar existencia de un valor

- **Función:** `boolean contieneValor(List<Integer> lista, int valor)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3, 4]`
- **Descripción:** Verifica si el valor dado está en la lista y devuelve `true` o `false`.  
  Resultado esperado con `valor=3`: `true`.

---


### 6. Ordenar una lista
- **Función:** `List<Integer> ordenarLista(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[4, 1, 3, 2]`
- **Descripción:** Ordena la lista en orden ascendente y la devuelve.  
  Resultado esperado: `[1, 2, 3, 4]`.

---

### 7. Obtener índice de un elemento

- **Función:** `int indiceDe(List<String> lista, String valor)`
- **Lista de entrada:** `List<String> lista`  
  Ejemplo: `["Java", "Python", "C++"]`
- **Descripción:** Devuelve el índice de la primera aparición de `valor` en la lista. Si no está presente, devuelve `-1`.  
  Resultado esperado con `valor="Python"`: `1`.

---

### 8. Invertir lista

- **Función:** `List<Integer> invertirLista(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3, 4]`
- **Descripción:** Invierte los elementos de la lista y la devuelve.  
  Resultado esperado: `[4, 3, 2, 1]`.

---

### 9. Eliminar elementos según condición

- **Función:** `List<Integer> eliminarSi(List<Integer> lista, int limite)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[10, 20, 30, 40]`
- **Descripción:** Elimina todos los elementos mayores que `limite` de la lista.  
  Resultado esperado con `limite=25`: `[10, 20]`.

---

### 10. Buscar máximo y mínimo

- **Función:** `int[] obtenerExtremos(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[5, 2, 8, 1, 9]`
- **Descripción:** Devuelve un arreglo de tamaño 2 donde el primer elemento es el mínimo y el segundo el máximo.  
  Resultado esperado: `[1, 9]`.

---

## Nivel Avanzado

### 11. Copiar contenido de una lista

- **Función:** `List<Integer> copiarLista(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3]`
- **Descripción:** Crea y devuelve una copia exacta de la lista original.  
  Resultado esperado: `[1, 2, 3]`.

---

### 12. Contar elementos mayores a un valor

- **Función:** `int contarMayores(List<Integer> lista, int limite)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[10, 20, 30, 40]`
- **Descripción:** Devuelve la cantidad de elementos en la lista que son mayores que `limite`.  
  Resultado esperado con `limite=25`: `2`.

---

### 13. Suma de elementos de la lista

- **Función:** `int sumarElementos(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3, 4]`
- **Descripción:** Devuelve la suma de todos los elementos en la lista.  
  Resultado esperado: `10`.

---

### 14. Encontrar elementos duplicados

- **Función:** `List<Integer> encontrarDuplicados(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 2, 3, 3, 4]`
- **Descripción:** Devuelve una nueva lista con los elementos que aparecen más de una vez.  
  Resultado esperado: `[2, 3]`.

---

### 15. Rotar lista

- **Función:** `List<Integer> rotarLista(List<Integer> lista, int posiciones)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3, 4]`
- **Descripción:** Rota la lista hacia la derecha `posiciones` veces y la devuelve.  
  Resultado esperado con `posiciones=1`: `[4, 1, 2, 3]`.

---


### 16. Intercambiar dos elementos

- **Función:** `List<Integer> intercambiar(List<Integer> lista, int indice1, int indice2)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3, 4]`
- **Descripción:** Intercambia los valores en los índices `indice1` e `indice2` y devuelve la lista modificada.  
  Resultado esperado con `indice1=0, indice2=2`: `[3, 2, 1, 4]`.

---

### 17. Eliminar duplicados

- **Función:** `List<Integer> eliminarDuplicados(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 2, 3, 3, 4]`
- **Descripción:** Devuelve la lista sin duplicados, manteniendo el orden original.  
  Resultado esperado: `[1, 2, 3, 4]`.

---

### 18. Intersección de listas

- **Función:** `List<Integer> interseccionListas(List<Integer> lista1, List<Integer> lista2)`
- **Lista de entrada:** `List<Integer> lista1`, `List<Integer> lista2`  
  Ejemplo: `lista1 = [1, 2, 3, 4]`, `lista2 = [3, 4, 5, 6]`
- **Descripción:** Devuelve una nueva lista con los elementos comunes entre `lista1` y `lista2`.  
  Resultado esperado: `[3, 4]`.

---

### 19. Buscar sublista dentro de una lista

- **Función:** `boolean esSublista(List<Integer> lista, List<Integer> sublista)`
- **Lista de entrada:** `List<Integer> lista`, `List<Integer> sublista`  
  Ejemplo: `lista = [1, 2, 3, 4, 5]`, `sublista = [3, 4]`
- **Descripción:** Devuelve `true` si `sublista` es una subsecuencia de `lista`.  
  Resultado esperado con `sublista=[3, 4]`: `true`.

---

### 20. Barajar elementos de la lista

- **Función:** `List<Integer> barajarLista(List<Integer> lista)`
- **Lista de entrada:** `List<Integer> lista`  
  Ejemplo: `[1, 2, 3, 4]`
- **Descripción:** Reorganiza los elementos de la lista en un orden aleatorio y la devuelve.  
  Resultado esperado: `[4, 3, 1, 2]` (El orden puede variar).

---


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
