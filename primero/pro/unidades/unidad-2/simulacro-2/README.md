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

## Ejercicio 4

**Descripción**

**A tener en cuenta**:

**Ejemplo de salida**:

<details>
  <summary>SOLUCIÓN:</summary>
  
```java

```

</details>  

---

## Ejercicio 5

**Descripción**

**A tener en cuenta**:

**Ejemplo de salida**:

<details>
  <summary>SOLUCIÓN:</summary>
  
```java

```

</details>  

---


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
