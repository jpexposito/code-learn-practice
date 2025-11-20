# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con clases, encapsulación, constructores, métodos, `static`, herencia, interfaces, colecciones y paquetes)`

Este proyecto contiene 10 ejercicios adicionales para practicar estructuras de control (condicionales y bucles) en Java.
Cada ejercicio tiene una clase con métodos puros (sin entrada por teclado) y sus correspondientes tests con JUnit 5.

## Cómo ejecutar los tests

```bash
mvn clean test
```

Maven descargará las dependencias necesarias y ejecutará todos los tests.

---

## Ejercicio 1 – Conversor de notas numéricas a texto

**Clase:** `Ejercicio01`  
**Método principal:** `calificar(int nota)`

Convierte una nota numérica entera de 0 a 10 en texto:

- 0–4 → `"Insuficiente"`
- 5 → `"Suficiente"`
- 6 → `"Bien"`
- 7–8 → `"Notable"`
- 9–10 → `"Sobresaliente"`

Si la nota está fuera del rango 0–10, se lanza una `IllegalArgumentException`.

---

## Ejercicio 2 – Calculadora sencilla con menú lógico

**Clase:** `Ejercicio02`  
**Método principal:** `operar(double a, double b, int opcion)`

Simula el comportamiento de una calculadora sencilla con el siguiente menú lógico:

1. Sumar  
2. Restar  
3. Multiplicar  
4. Dividir  

El método recibe dos operandos y una opción (1–4) y devuelve el resultado de la operación.

- Si la opción no es válida, lanza `IllegalArgumentException`.
- Si se intenta dividir entre 0 (opción 4 y `b == 0`), lanza `ArithmeticException`.

---

## Ejercicio 3 – Adivina el número (lógica de juego)

**Clase:** `Ejercicio03`  
**Métodos principales:**

- `evaluarIntento(int numeroSecreto, int intento)`  
  Devuelve:
  - `"Demasiado alto"`
  - `"Demasiado bajo"`
  - `"¡Correcto!"`

- `jugar(int numeroSecreto, int[] intentos)`  
  Simula una partida con un máximo de 7 intentos (se usarán como máximo los 7 primeros elementos del array).  
  Devuelve `true` si el número se adivina dentro de los intentos permitidos, `false` en caso contrario.

---

## Ejercicio 4 – Contador de positivos, negativos y ceros

**Clase:** `Ejercicio04`  
**Método principal:** `contarSignos(int[] numeros)`  
**Clase auxiliar interna:** `ContadorSignos`

Dado un conjunto de números enteros, cuenta cuántos son:

- Positivos  
- Negativos  
- Ceros  

Devuelve un objeto `ContadorSignos` con los tres contadores.

---

## Ejercicio 5 – Tabla de multiplicar y suma de la tabla

**Clase:** `Ejercicio05`  
**Métodos principales:**

- `tablaMultiplicar(int n)`  
  Devuelve un array de tamaño 10 con la tabla de multiplicar de `n` del 1 al 10:
  - `resultado[0] = n * 1`
  - ...
  - `resultado[9] = n * 10`

- `sumaTabla(int n)`  
  Devuelve la suma de todos los valores de la tabla de `n` de 1 a 10:  
  `n*1 + n*2 + ... + n*10`.

---

## Ejercicio 6 – Cálculo de factorial con control de entrada

**Clase:** `Ejercicio06`  
**Método principal:** `factorial(int n)`

Calcula el factorial de un número entero `n` (por ejemplo, se permite `0 <= n <= 20`):

- Si `n < 0`, lanza `IllegalArgumentException`.
- Si `n` es demasiado grande (mayor que 20, en esta implementación), también lanza `IllegalArgumentException`.
- Para `n` válido, devuelve `n!` usando un bucle.

---

## Ejercicio 7 – Números pares e impares en un rango

**Clase:** `Ejercicio07`  
**Método principal:** `calcularParesImpares(int a, int b)`  
**Clase auxiliar interna:** `ParesImpares`

Dado un rango entre `a` y `b` (ambos inclusive):

- Si `a > b`, intercambia los valores.
- Recorre el intervalo y separa los números en dos listas:
  - Lista de números pares.
  - Lista de números impares.

Devuelve un objeto `ParesImpares` con ambas listas.

---

## Ejercicio 8 – Comprobador de número primo

**Clase:** `Ejercicio08`  
**Método principal:** `esPrimo(int n)`

Determina si un número entero `n` mayor que 1 es primo:

- Si `n <= 1`, lanza `IllegalArgumentException`.
- Comprueba divisores desde 2 hasta `sqrt(n)`:
  - Si encuentra un divisor, devuelve `false`.
  - Si no encuentra ninguno, devuelve `true`.

---

## Ejercicio 9 – Estadísticas de una serie de números

**Clase:** `Ejercicio09`  
**Método principal:** `calcularEstadisticas(int[] numeros)`  
**Clase auxiliar interna:** `Estadisticas`

Dado un array de números enteros (sin incluir el centinela), calcula:

- Cantidad de números introducidos.
- Media aritmética.
- Máximo.
- Mínimo.

Devuelve un objeto `Estadisticas` con esos valores.  
Si el array está vacío, lanza `IllegalArgumentException`.

---

## Ejercicio 10 – Dibujar formas con asteriscos (bucles anidados)

**Clase:** `Ejercicio10`  
**Métodos principales:**

- `cuadrado(int n)`  
  Genera un `String` con un cuadrado de asteriscos de `n x n`.  
  Cada fila se separa con un salto de línea (`\n`).

- `triangulo(int n)`  
  Genera un `String` con un triángulo rectángulo de altura `n`, con este formato para `n = 4`:

  ```
  *
  **
  ***
  ****
  ```

Si `n <= 0` en cualquiera de los métodos, se lanza `IllegalArgumentException`.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
