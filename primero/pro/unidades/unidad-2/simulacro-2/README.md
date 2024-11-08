# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Simulacro II-> Trabajo con clases)

## Ejercicio 1 Contador de dígitos

**Descripción**: El objetivo de este ejercicio es escribir un programa en que permita contar cuántos dígitos tiene un número entero positivo. El programa debe recibir un número entero positivo como entrada del usuario y luego determinar cuántos dígitos tiene dicho número.

**A tener en cuenta**:

- El número debe ser un número entero positivo (es decir, mayor que cero).
- El programa debe ser capaz de manejar números de cualquier longitud (desde un solo dígito hasta varios dígitos).
- El programa no debe aceptar números negativos o cero.

**Algorito**
- Verificar si el número ingresado es positivo.
- Dividir el número entre 10 repetidamente, incrementando un contador por cada división. Esto eliminará el último dígito del número en cada iteración.
- El número de iteraciones realizadas (o el valor del contador) será igual a la cantidad de dígitos en el número original.
- Mostrar el resultado, que es el número total de dígitos del número ingresado.

**Realiza una función llamada contadorDigitos**

```java
int contadorDigitos(int numero) {
    return tamanio;
}
```

**Ejemplo de salida**:

> Entrada: 12345
>
> Salida: El número de dígitos en 12345 es: 5
>
> Entrada: 7
>
> Salida: El número de dígitos en 7 es: 1

<details>
  <summary>SOLUCIÓN:</summary>
  
```java

```

</details>  

---

## Ejercicio 2: Verificar si un número es un "Número de la Fuerza"

**Descripción**: En el universo de **Star Wars**, un "**Número de la Fuerza**" es un número especial que solo puede ser usado por un **Jedi**. Un "**Número de la Fuerza**" es un número que cumple con la siguiente condición:*la suma de sus dígitos es divisible por el número de dígitos del mismo número. Si el número es un "Número de la Fuerza", significa que tiene el potencial de ser utilizado por un Jedi para acceder al poder de la Fuerza*.

Tu misión, **joven padawan**, es crear un programa en que verifique si un número es un "Número de la Fuerza". Si lo es, muestra un mensaje diciendo *"¡Este es un Número de la Fuerza!"* y si no lo es, muestra *"¡Este número no es digno de la Fuerza!"*.

**Requisitos**:

- El programa debe aceptar un número entero positivo.
- Debe calcular la suma de los dígitos del número.
- Debe dividir esa suma por la cantidad de dígitos del número.
- Si la suma de los dígitos es divisible por el número de dígitos, es un "Número de la Fuerza".

**Ejemplo de Entrada y Salida:**

>Entrada: 123
>Salida: ¡Este número es digno de la Fuerza!
>Entrada: 36
>Salida: ¡Este no es un Número de la Fuerza!


**Explicación:**

```code
1+2+3 = 6;
6/3 = 2 que es una división exacta.
```

<details>
  <summary>SOLUCIÓN:</summary>
  
```java

```

</details>  

---

## Ejercicio 3: Cuanta Bancaria

**Descripción**
Crea una clase llamada `CuentaBancaria` que represente una cuenta bancaria sencilla. La cuenta debe poder realizar depósitos, retiros y mostrar el saldo actual. Además, incluye un método que determine si la cuenta tiene fondos suficientes para realizar una operación de retiro.

**Atributos**:

- numeroCuenta (tipo String): El número único de la cuenta.
- titular (tipo String): El nombre del titular de la cuenta.
- saldo (tipo double): El saldo actual de la cuenta.

**Métodos**:

- depositar(double cantidad): Agrega la cantidad especificada al saldo.
- retirar(double cantidad): Verifica si hay suficiente saldo en la cuenta. Si es así, descuenta la cantidad del saldo, y retorna `true`; si no, retorna `false`.
- consultarSaldo(): Muestra el saldo actual de la cuenta.
- tieneFondosSuficientes(double cantidad): Devuelve true si el saldo es suficiente para realizar un retiro de esa cantidad; de lo contrario, devuelve false.

**Ejemplo de salida**:

<details>
  <summary>SOLUCIÓN:</summary>
  
```java

```

</details>  

---

## Ejercicio 4: El Mago

**Descripción**
Crea una clase llamada `Mago` que represente a un personaje en un juego. El mago tiene un `nivel` de poder mágico (`poderMagico`) y una cantidad de puntos de maná (`mana`). El mago puede lanzar hechizos si tiene suficiente maná, y su poder de hechizo dependerá de su nivel de poder mágico.

**Atributos**:

- nombre (tipo String): Nombre del mago.
- nivel (tipo int): Nivel de poder mágico del mago.
- mana (tipo int): Puntos de maná disponibles.

**Métodos**:

- `lanzarHechizo(int nivel)`: Lanza un hechizo si el mago tiene suficiente maná, *teniendo que ser siempre mayor > 0**. Cada hechizo cuesta una cantidad de maná. Si el mago tiene el maná necesario, reduce el maná y calcula el daño del hechizo.
- `calcularDanio()`: Calcula el daño del hechizo según el nivel de poderMagico. La fórmula del daño será daño = poderMagico * 10.
- `recargar(int cantidad)`: Recarga la cantidad de maná especificada.


<details>
  <summary>SOLUCIÓN:</summary>
  
```java

```

</details>  

---

## Ejercicio 5: Gestión de Energía Mágica

**Descripción**
El `Consejo de Magos de la Antigua Orden` te ha encomendado una importante misión: *desarrollar un sistema que permita gestionar y analizar la lista de magos del consejo según sus niveles de poder mágico y maná*. ¡Los magos de mayor energía serán seleccionados para la misión final de protección del reino!.

**Objetivo**
Crea una clase Mago que represente a cada miembro del consejo con sus atributos mágicos y que permita realizar las siguientes operaciones:

- Mostrar todos los magos del consejo, junto con sus nombres, niveles de poder mágico y niveles de maná.
- Encontrar al mago con el mayor maná: El consejo necesita saber quién puede lanzar la mayor cantidad de hechizos.
  
  ```java
  Mago mayorCantidadHechizos() {}
  ```

- Encontrar al mago con el mayor poder mágico: El mago de mayor poder será el líder de la misión de defensa.


  ```java
  Mago mayorPoderMagico() {}
  ```



<details>
  <summary>SOLUCIÓN:</summary>
  
```java

```

</details>  

---


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
