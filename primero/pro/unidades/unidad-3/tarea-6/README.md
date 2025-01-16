# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con Vectores y funciones de de forma avanzada: `Collection (Interfaz) -> Set(Interfaz) -> HashSet`

En los siguientes ejercicios vamos a trabajar con los métodos que proporciona la `Interfaz List\Set\Map` a través de las clases más comunes que la implementan que son: `ArrayList\HashSet\HashMap`.

> La documentación oficial de los métodos de `Collections` la tienes en el siguiente [enlace](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Collections.html).
> Con muchos de sus funciones se simplifica el problema.
> En cada uno de los ejercicios incluye al menos 5 elementos para trabajar, a través de las `funciones correspondientes (add,..)` o de la siguiente forma.
> La documentación en los apuntes se encuentra en el siguiente [enlace](https://github.com/jpexposito/code-learn/blob/main/primero/pro/unidades/unidad-3/collection/).

```java
    static List<Integer> enteros = new ArrayList<>(Arrays.asList(1, 2, 3));
    static Vector<Integer> vector = new Vector<>(enteros);    
```

---

> **CRUD (CREATE/READ/UPDATE/DELETE)**

## Ejercicio 1: **Gestión de Alumnos con `List`**

**Objetivo:** Implementar un CRUD básico utilizando una lista (`ArrayList`) para gestionar una colección de **alumnos** representados como `String`.

### Funciones a implementar:

1. **insertar(String alumno)**: Añadir un nuevo alumno a la lista.
2. **obtener(int indice)**: Obtener el alumno de la lista por su índice.
3. **buscarAlumno(String alumno)**: Verificar si un alumno existe en la lista.
4. **eliminar(int indice)**: Eliminar un alumno de la lista por su índice.
5. **actualizar(int indice, String nuevoAlumno)**: Actualizar el nombre de un alumno en la lista por su índice.

---

## Ejercicio 2: **Gestión de Productos con `Set`**

**Objetivo:** Implementar un CRUD utilizando un conjunto (`HashSet`) para gestionar una colección de **productos** representados como `String`. Recuerda que un `Set` no permite duplicados.

### Funciones a implementar:

1. **insertar(String producto)**: Añadir un nuevo producto al conjunto.
2. **buscar(String producto)**: Comprobar si un producto existe en el conjunto.
3. **eliminar(String producto)**: Eliminar un producto del conjunto.
4. **obtenerTamanio()**: Obtener el tamaño del conjunto de productos.
5. **vaciarConjunto()**: Eliminar todos los productos del conjunto.

---

## Ejercicio 3: **Gestión de Libros con `List`**

**Objetivo:** Implementar un CRUD utilizando una lista (`ArrayList`) para gestionar una colección de **libros**, donde cada libro está representado por su `título` como `String`.

### Funciones a implementar:

1. **insertar(String libro)**: Añadir un nuevo libro a la lista.
2. **obtener(int indice)**: Obtener un libro de la lista por su índice.
3. **buscar(String libro)**: Verificar si un libro existe en la lista.
4. **eliminar(String libro)**: Eliminar un libro de la lista por su título.
5. **actualizar(String viejoLibro, String nuevoLibro)**: Actualizar el título de un libro en la lista.

---

## Ejercicio 4: **Gestión de Cursos con `Set`**

**Objetivo:** Implementar un CRUD utilizando un conjunto (`HashSet`) para gestionar una colección de **cursos**. En este caso, se gestionan cursos por su nombre como `String`, y se deben implementar operaciones de **unión** e **intersección** entre dos conjuntos de cursos.

### Funciones a implementar:

1. **insertar(String curso)**: Añadir un nuevo curso al conjunto.
2. **eliminar(String curso)**: Eliminar un curso del conjunto.
3. **buscar(String curso)**: Verificar si un curso existe en el conjunto.
4. **unirCursos(Set<String> cursos1, Set<String> cursos2)**: Realizar la unión de dos conjuntos de cursos.
5. **intersecarCursos(Set<String> cursos1, Set<String> cursos2)**: Realizar la intersección de dos conjuntos de cursos.

---

## Ejercicio 5: **Gestión de Empleados con `Map`**

**Objetivo:** Implementar un CRUD utilizando un mapa (`HashMap`) para gestionar una colección de **empleados**, donde cada empleado tiene un `ID` como clave y un `nombre` como valor.

### Funciones a implementar:

1. **insertar(String id, String nombre)**: Añadir un nuevo empleado al mapa.
2. **obtener(String id)**: Obtener el nombre de un empleado a partir de su ID.
3. **buscar(String id)**: Verificar si un empleado con un ID específico existe en el mapa.
4. **eliminar(String id)**: Eliminar un empleado del mapa por su ID.
5. **actualizar(String id, String nuevoNombre)**: Actualizar el nombre de un empleado por su ID.

---


## Resumen de las funciones CRUD que debes implementar:

- **Insertar**: Añadir un nuevo elemento a la colección.
- **Obtener**: Acceder a un elemento por su índice (para listas) o por su clave (para mapas).
- **Buscar**: Verificar si un elemento o clave existe en la colección.
- **Eliminar**: Eliminar un elemento de la colección (por índice, valor o clave).
- **Actualizar**: Modificar un elemento ya existente en la colección.
- **Operaciones adicionales**: Unión e intersección de conjuntos, obtener tamaño, vaciar la colección.

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
