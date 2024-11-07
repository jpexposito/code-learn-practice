# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Simulacro I-> Trabajo con clases)

## Ejercicio 1: Algoritmo - Verificación de Fecha y Año Bisiesto

**Descripción**: Escribe un programa en Java implemente una función que recibe tres enteros `(dia,mes,anio)` y verifique:

La función devuelve `true` si la fecha es correcta, y `false` en cualquier otro caso.

**A tener en cuenta**:

- Una fecha es válida si el día se encuentra dentro del rango de días del mes correspondiente, y si es año bisiesto en el caso de febrero (29 días).
- Un año es bisiesto si es divisible por 4, pero no por 100, excepto cuando también es divisible por 400.

**Ejemplo de salida**:

- Entrada: `29/02/2020` → Salida: `Fecha válida, año bisiesto.`
- Entrada: `31/04/2023` → Salida: `Fecha no válida.`

> La función se llama isBisiesto(int dia, int mes, int anio), y retorna `true/false`.

> Un año es bisiesto si es divisible por 4 (anio % 4 == 0).
> Si el año es divisible por 100, también debe ser divisible por 400 para ser bisiesto.
> Esto se verifica con anio % 100 != 0 || anio % 400 == 0.

---

## Ejercicio 2: Algoritmo - Cálculo de Velocidad de un Cuerpo

**Descripción**: Crea un programa en Java que permita calcular la velocidad final de un cuerpo en movimiento uniformemente acelerado. Los datos de entrada son:
- Velocidad inicial \( v<sub>0</sub> \) (en metros por segundo).
- Aceleración \( a \) (en metros por segundo al cuadrado).
- Tiempo \( t \) (en segundos).

La fórmula de velocidad final es:
\[
v = v<sub>0</sub> + a \cdot t
\]

**A tener en cuenta**:

- Solicita al usuario los tres valores y calcula la velocidad final.
- Considera las restricciones de unidades y muestra la velocidad final en m/s.
- Ten en cuenta los tipos de datos para realizar los calculos.

**Ejemplo de salida**:
- Entrada: \( v<sub>0</sub> = 5 \), \( a = 3 \), \( t = 10 \) → Salida: `La velocidad final es: 35.0 m/s.`

---

## Ejercicio 3: Construcción de Clases - Clase `Persona`

**Descripción**: Crea una clase `Persona` con los siguientes atributos:

- `nombre` (String)
- `edad` (int)
- `dni` (String)

Define los métodos necesarios:

1. **Constructor** que permita inicializar todos los atributos.
2. **Método `esMayorDeEdad`** que devuelva `true` si la persona es mayor de edad (edad >= 18) y `false` en caso contrario.


**Ejemplo de uso**:

- Crear una instancia de `Persona`, por ejemplo `persona` y cuando hagamos un `sout de persona` debe de mostrar la información del objeto en memoria, que debería mostrar todos los datos ingresados.
- Crea una segunda instancia de `Persona`, llamada `otraPersona` con los mismos datos y verifica que son la misma persona. El resultado debería de ser `true`.
  
---

## Ejercicio 4: Construcción de Clases - Clase `Producto`

**Descripción**: Crea una clase `Producto` con los siguientes atributos:
- `codigo` (String)
- `nombre` (String)
- `precio` (float)
- `identificador` (String)

Define los métodos necesarios:

1. **Constructor** para inicializar todos los atributos, y para obteber los valores de estos en cualquier momento`(get/set)`.
2. **Método `aplicarDescuento(double porcentaje)`** que reduzca el precio del producto en el porcentaje indicado.

**Ejemplo de uso**:

- Crear un objeto de tipo `Producto`, aplicar un descuento y mostrar la información actualizada.

---

## Ejercicio 5: Gestión de Lista de Personas

**Descripción**: Usando la clase `Persona` creada anteriormente, implementa un programa que permita al usuario gestionar una lista de `5` personas como `máximo`, con las siguientes opciones.

1. **Crear**: Permite al usuario añadir una nueva persona a la lista.
2. **Leer**: Muestra la lista completa de personas almacenadas.
3. **Actualizar**: Permite al usuario modificar los datos de una persona en la lista.
4. **Eliminar**: Permite al usuario eliminar una persona de la lista.

**Requisitos**:

- Utiliza una estructura de datos como `array` para almacenar las personas.
- Implementa un menú en el programa para seleccionar las opciones de CRUD y manipular la lista de personas.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
