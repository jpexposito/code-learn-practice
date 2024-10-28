# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Repaso de Variables en Java")

## Ejercicio 1

Declara una variable entera para almacenar tu edad y muestra su valor por pantalla.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        int edad = 25;
        System.out.println("Edad: " + edad);
    }
}
```

</details>

## Ejercicio 2

Declara 1 variable de tipo `double` para almacenar el precio de un productos. Muestra su valor.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        double precio = 19.99;
        System.out.println("Precio: " + precio);
    }
}

```

</details>

## Ejercicio 3

Crea una variable `char` que almacene la primera letra de tu nombre y muéstrala por pantalla.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        char inicial = 'J';
        System.out.println("Inicial: " + inicial);
    }
}
```

</details>

## Ejercicio 4

Declara una variable de tipo `boolean` que indique si una persona es mayor de edad (`true` o `false`). Asigna un valor y muéstralo por pantalla.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        boolean esMayorDeEdad = true; // Cambia a false si es menor de edad
        System.out.println("¿Es mayor de edad? " + esMayorDeEdad);
    }
}
```

</details>

## Ejercicio 5

Declara una variable de tipo `String` que almacene tu nombre completo. Muestra por pantalla el nombre.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        String nombreCompleto = "Juan Pérez"; // Reemplaza con tu nombre completo
        System.out.println("Nombre completo: " + nombreCompleto);
    }
}
```

</details>

## Ejercicio 6

Declara tres variables enteras, asigna valores a cada una y calcula su promedio.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        int numero1 = 10;
        int numero2 = 20;
        int numero3 = 30;

        int suma = numero1 + numero2 + numero3;
        double promedio = suma / 3.0;

        System.out.println("El promedio es: " + promedio);
    }
}
```

</details>

## Ejercicio 7

Escribe un programa que convierta grados Celsius a Fahrenheit. Usa variables de tipo `double` para los cálculos.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        double gradosCelsius = 25.0; // Cambia este valor para probar con otros grados Celsius
        double gradosFahrenheit = (gradosCelsius * 9/5) + 32;

        System.out.println(gradosCelsius + " grados Celsius equivalen a " + gradosFahrenheit + " grados Fahrenheit.");
    }
}
```

</details>

## Ejercicio 8

Declara una variable de tipo `float` para almacenar el valor de pi (`3.1416`) y otra para el radio de un círculo. Calcula el área del círculo usando la fórmula `Área = pi * radio * radio`.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        float pi = 3.1416f; // Declaración y asignación del valor de pi
        float radio = 5.0f; // Asignación de un valor para el radio del círculo

        float area = pi * radio * radio;

        System.out.println("El área del círculo es: " + area);
    }
}
```

</details>

## Ejercicio 9

Declara una variable `int` que contenga tu año de nacimiento. Calcula y muestra tu edad actual utilizando otra variable para el año actual.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        int anioNacimiento = 1995; // Reemplaza este valor con tu año de nacimiento
        int anioActual = 2024; // Año actual

        int edad = anioActual - anioNacimiento;

        System.out.println("Tu edad actual es: " + edad);
    }
}
```

</details>

## Ejercicio 10

Crea una variable de tipo `byte` para almacenar un número del 0 al 127. Asigna un valor y muéstralo por pantalla.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        byte numero = 100; // Asigna un valor entre 0 y 127

        System.out.println("El número es: " + numero);
    }
}

```

</details>

## Ejercicio 11

Declara una variable de tipo `long` para almacenar un valor numérico grande, como la población mundial. Asigna un valor y muéstralo por pantalla.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        long poblacionMundial = 7800000000L; // Asigna un valor grande, agrega 'L' para indicar que es un long

        System.out.println("La población mundial es: " + poblacionMundial);
    }
}
```

</details>

## Ejercicio 12

Declara una variable de tipo `short` para almacenar la cantidad de días en un año (365). Asigna el valor y muéstralo por pantalla.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        short diasEnUnAno = 365; // Asigna el valor de los días en un año

        System.out.println("La cantidad de días en un año es: " + diasEnUnAno);
    }
}
```

</details>

## Ejercicio 13

Declara una variable de tipo `String` para almacenar una dirección de correo electrónico. Muéstrala en la consola.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        String correoElectronico = "tu.email@ejemplo.com"; // Reemplaza con tu dirección de correo electrónico

        System.out.println("La dirección de correo electrónico es: " + correoElectronico);
    }
}
```

</details>

## Ejercicio 14

Declara dos variables de tipo `boolean`: una que indique si una persona tiene licencia de conducir y otra si posee un vehículo. Muestra ambas variables.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        boolean tieneLicencia = true;  
        boolean poseeVehiculo = false;  

        System.out.println("¿Tiene licencia de conducir? " + tieneLicencia);
        System.out.println("¿Posee un vehículo? " + poseeVehiculo);
    }
}
```

</details>

## Ejercicio 15

Declara una variable de tipo `char` y asígnale un símbolo del teclado. Luego, muestra el código numérico ASCII de ese símbolo.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        char simbolo = '@'; 
        int codigoASCII = (int) simbolo;

        System.out.println("El símbolo es: " + simbolo);
        System.out.println("El código ASCII de '" + simbolo + "' es: " + codigoASCII);
    }
}
```

</details>

## Ejercicio 16

Declara dos variables de tipo `int` y realiza una división entre ambas. Muestra el resultado de la división entera y el residuo.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        int numero1 = 10;
        int numero2 = 3;  

        int divisionEntera = numero1 / numero2; 
        int residuo = numero1 % numero2;  

        System.out.println("La división entera de " + numero1 + " entre " + numero2 + " es: " + divisionEntera);
        System.out.println("El residuo de la división de " + numero1 + " entre " + numero2 + " es: " + residuo);
    }
}
```

</details>

## Ejercicio 17

Escribe un programa que calcule el área de un rectángulo. Usa dos variables de tipo `int` para la base y la altura.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        int base = 5;
        int altura = 10;
        int area = base * altura;
        System.out.println("El área del rectángulo es: " + area);
    }
}
```

</details>

## Ejercicio 18

Declara una variable de tipo `float` que almacene el resultado de dividir 5 entre 2. Muestra el resultado en la consola.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        float resultado = 5f / 2;
        System.out.println("El resultado de dividir 5 entre 2 es: " + resultado);
    }
}
```

</details>

## Ejercicio 19

Declara una variable `double` para almacenar la raíz cuadrada de 2. Usa la clase `Math` para calcular el valor y muéstralo por pantalla.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        double raizCuadradaDeDos = Math.sqrt(2); 
        System.out.println("La raíz cuadrada de 2 es: " + raizCuadradaDeDos);
    }
}
```

</details>

## Ejercicio 20

Crea un programa que intercambie los valores de dos variables enteras. Por ejemplo, si la variable `a` vale 5 y `b` vale 10, después del intercambio `a` debería valer 10 y `b` 5.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Main {
    public static void main(String[] args) {
        int a = 5; 
        int b = 10; 

        System.out.println("Antes del intercambio:");
        System.out.println("a = " + a);
        System.out.println("b = " + b);

        int temp = a; 
        a = b; 
        b = temp; 
        System.out.println("Después del intercambio:");
        System.out.println("a = " + a);
        System.out.println("b = " + b);
    }
}
```

</details>

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
