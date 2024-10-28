# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Repaso de Condicionales en Java")

1. **Mayor de dos números**: 
   Escribe un programa que tome dos números y determine cuál es el mayor.

<details>
  <summary>SOLUCIÓN:</summary>

```java
import java.util.Scanner;

public class MayorDeDosNumeros {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el primer número: ");
        int numero1 = scanner.nextInt();
        System.out.print("Ingrese el segundo número: ");
        int numero2 = scanner.nextInt();

        if (numero1 > numero2) {
            System.out.println("El mayor es: " + numero1);
        } else if (numero2 > numero1) {
            System.out.println("El mayor es: " + numero2);
        } else {
            System.out.println("Ambos números son iguales.");
        }
    }
}
```

</details>

2. **Número par o impar**: 
   Escribe un programa que solicite un número y determine si es par o impar.


<details>
  <summary>SOLUCIÓN:</summary>

```java
public class ParOImpar {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un número: ");
        int numero = scanner.nextInt();
        
        if (numero % 2 == 0) {
            System.out.println(numero + " es un número par.");
        } else {
            System.out.println(numero + " es un número impar.");
        }
    }
}
```

</details>

3. **Clasificación de edad**: 
   Escribe un programa que solicite la edad de una persona y determine si es un niño (0-12), adolescente (13-19), adulto (20-64) o anciano (65 o más).

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class ClasificacionEdad {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese su edad: ");
        int edad = scanner.nextInt();
        
        if (edad >= 0 && edad <= 12) {
            System.out.println("Eres un niño.");
        } else if (edad >= 13 && edad <= 19) {
            System.out.println("Eres un adolescente.");
        } else if (edad >= 20 && edad <= 64) {
            System.out.println("Eres un adulto.");
        } else {
            System.out.println("Eres un anciano.");
        }
    }
}
```

</details>

4. **Número positivo, negativo o cero**: 
   Escribe un programa que solicite un número y determine si es positivo, negativo o cero.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class PositivoNegativoCero {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un número: ");
        int numero = scanner.nextInt();
        
        if (numero > 0) {
            System.out.println(numero + " es positivo.");
        } else if (numero < 0) {
            System.out.println(numero + " es negativo.");
        } else {
            System.out.println("El número es cero.");
        }
    }
}
```

</details>

5. **Calificaciones**: 
   Escribe un programa que tome una calificación (0-100) y muestre la letra correspondiente: A (90-100), B (80-89), C (70-79), D (60-69), F (0-59).

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Calificaciones {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese su calificación (0-100): ");
        int calificacion = scanner.nextInt();
        
        if (calificacion >= 90 && calificacion <= 100) {
            System.out.println("Tu letra es: A");
        } else if (calificacion >= 80) {
            System.out.println("Tu letra es: B");
        } else if (calificacion >= 70) {
            System.out.println("Tu letra es: C");
        } else if (calificacion >= 60) {
            System.out.println("Tu letra es: D");
        } else {
            System.out.println("Tu letra es: F");
        }
    }
}
```

</details>

6. **Días de la semana**: 
   Escribe un programa que solicite un número del 1 al 7 y muestre el día de la semana correspondiente.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class DiasDeLaSemana {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un número del 1 al 7: ");
        int dia = scanner.nextInt();
        
        switch (dia) {
            case 1:
                System.out.println("Lunes");
                break;
            case 2:
                System.out.println("Martes");
                break;
            case 3:
                System.out.println("Miércoles");
                break;
            case 4:
                System.out.println("Jueves");
                break;
            case 5:
                System.out.println("Viernes");
                break;
            case 6:
                System.out.println("Sábado");
                break;
            case 7:
                System.out.println("Domingo");
                break;
            default:
                System.out.println("Número inválido.");
        }
    }
}
```

</details>

7. **Meses del año**: 
   Escribe un programa que tome un número del 1 al 12 y muestre el nombre del mes correspondiente.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class MesesDelAño {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un número del 1 al 12: ");
        int mes = scanner.nextInt();
        
        switch (mes) {
            case 1:
                System.out.println("Enero");
                break;
            case 2:
                System.out.println("Febrero");
                break;
            case 3:
                System.out.println("Marzo");
                break;
            case 4:
                System.out.println("Abril");
                break;
            case 5:
                System.out.println("Mayo");
                break;
            case 6:
                System.out.println("Junio");
                break;
            case 7:
                System.out.println("Julio");
                break;
            case 8:
                System.out.println("Agosto");
                break;
            case 9:
                System.out.println("Septiembre");
                break;
            case 10:
                System.out.println("Octubre");
                break;
            case 11:
                System.out.println("Noviembre");
                break;
            case 12:
                System.out.println("Diciembre");
                break;
            default:
                System.out.println("Número inválido.");
        }
    }
}
```

</details>

8. **Cálculo de impuestos**: 
   Escribe un programa que pida el ingreso anual de una persona y calcule el impuesto a pagar (10% si el ingreso es menor a 50,000, 20% si es mayor o igual a 50,000).

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class CalculoImpuestos {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese su ingreso anual: ");
        double ingreso = scanner.nextDouble();
        
        double impuesto;
        if (ingreso < 50000) {
            impuesto = ingreso * 0.10;
        } else {
            impuesto = ingreso * 0.20;
        }
        
        System.out.println("El impuesto a pagar es: " + impuesto);
    }
}
```

</details>

9. **Triángulo válido**: 
   Escribe un programa que tome tres lados de un triángulo y determine si forma un triángulo válido.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class TrianguloValido {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el lado 1: ");
        int lado1 = scanner.nextInt();
        System.out.print("Ingrese el lado 2: ");
        int lado2 = scanner.nextInt();
        System.out.print("Ingrese el lado 3: ");
        int lado3 = scanner.nextInt();
        
        if (lado1 + lado2 > lado3 && lado1 + lado3 > lado2 && lado2 + lado3 > lado1) {
            System.out.println("Los lados forman un triángulo válido.");
        } else {
            System.out.println("Los lados no forman un triángulo válido.");
        }
    }
}
```

</details>

10. **Es un cuadrado**: 
    Escribe un programa que tome dos números y determine si son iguales. Si son iguales, imprime "Es un cuadrado".

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class EsUnCuadrado {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el primer número: ");
        int num1 = scanner.nextInt();
        System.out.print("Ingrese el segundo número: ");
        int num2 = scanner.nextInt();
        
        if (num1 == num2) {
            System.out.println("Es un cuadrado.");
        } else {
            System.out.println("No es un cuadrado.");
        }
    }
}
```

</details>

11. **Número divisible**: 
    Escribe un programa que solicite un número y determine si es divisible por 3 y 5.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class NumeroDivisible {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un número: ");
        int numero = scanner.nextInt();
        
        if (numero % 3 == 0 && numero % 5 == 0) {
            System.out.println(numero + " es divisible por 3 y 5.");
        } else {
            System.out.println(numero + " no es divisible por 3 y 5.");
        }
    }
}
```

</details>

12. **Mayor de tres números**: 
    Escribe un programa que tome tres números y determine cuál es el mayor.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class MayorDeTresNumeros {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el primer número: ");
        int num1 = scanner.nextInt();
        System.out.print("Ingrese el segundo número: ");
        int num2 = scanner.nextInt();
        System.out.print("Ingrese el tercer número: ");
        int num3 = scanner.nextInt();
        
        int mayor = num1;
        
        if (num2 > mayor) {
            mayor = num2;
        }
        if (num3 > mayor) {
            mayor = num3;
        }
        
        System.out.println("El mayor es: " + mayor);
    }
}
```

</details>

13. **Año bisiesto**: 
    Escribe un programa que determine si un año dado es bisiesto.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class AnoBisiesto {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un año: ");
        int año = scanner.nextInt();
        
        if ((año % 4 == 0 && año % 100 != 0) || (año % 400 == 0)) {
            System.out.println(año + " es un año bisiesto.");
        } else {
            System.out.println(año + " no es un año bisiesto.");
        }
    }
```
</details>

14. **Mensaje según la calificación**: 
    Escribe un programa que tome una calificación y muestre un mensaje personalizado: "Excelente", "Bien", "Regular", "Necesita mejorar".

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class MensajeCalificacion {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese su calificación: ");
        int calificacion = scanner.nextInt();
        
        if (calificacion >= 90) {
            System.out.println("Excelente");
        } else if (calificacion >= 75) {
            System.out.println("Bien");
        } else if (calificacion >= 60) {
            System.out.println("Regular");
        } else {
            System.out.println("Necesita mejorar");
        }
    }
}
```

</details>

15. **Vocal o consonante**: 
    Escribe un programa que solicite una letra y determine si es una vocal o una consonante.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class VocalOConsonante {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese una letra: ");
        char letra = scanner.next().charAt(0);
        
        if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u' ||
            letra == 'A' || letra == 'E' || letra == 'I' || letra == 'O' || letra == 'U') {
            System.out.println(letra + " es una vocal.");
        } else {
            System.out.println(letra + " es una consonante.");
        }
    }
}
```

> **¿Cómo podemos mejorar el código?**

</details>

16. **Rango de edad**

Escribe un programa que solicite la edad de una persona y determine si es apta para votar (18 años o más).

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class RangoEdad {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese su edad: ");
        int edad = scanner.nextInt();
        
        if (edad >= 18) {
            System.out.println("Eres apto para votar.");
        } else {
            System.out.println("No eres apto para votar.");
        }
    }
}
```
</details>

1.  **Número dentro de un rango**
  
Escribe un programa que solicite un número y determine si está dentro del rango de 1 a 100.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class NumeroDentroDeRango {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese un número: ");
        int numero = scanner.nextInt();
        
        if (numero >= 1 && numero <= 100) {
            System.out.println(numero + " está dentro del rango de 1 a 100.");
        } else {
            System.out.println(numero + " está fuera del rango de 1 a 100.");
        }
    }
}
```
</details>

18. **Cambio de moneda**

Escribe un programa que solicite una cantidad en dólares y determine cuántos euros son (suponiendo un cambio de 1 USD = 0.85 EUR).

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class CambioDeMoneda {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese una cantidad en dólares: ");
        double dolares = scanner.nextDouble();
        
        double euros = dolares * 0.85;
        System.out.println("La cantidad en euros es: " + euros);
    }
}
```
</details>

19. **Saludo personalizado**

Escribe un programa que solicite el nombre de una persona y la hora del día, y muestre un saludo personalizado (por ejemplo, "Buenos días", "Buenas tardes", "Buenas noches").

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class SaludoPersonalizado {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese su nombre: ");
        String nombre = scanner.nextLine();
        System.out.print("Ingrese la hora del día (en 24 horas): ");
        int hora = scanner.nextInt();
        
        if (hora < 12) {
            System.out.println("Buenos días, " + nombre + "!");
        } else if (hora < 18) {
            System.out.println("Buenas tardes, " + nombre + "!");
        } else {
            System.out.println("Buenas noches, " + nombre + "!");
        }
    }
}
```
</details>

1.  **Clasificación de IMC** 

Escribe un programa que calcule el Índice de Masa Corporal (IMC) de una persona y clasifique su estado (bajo peso, peso normal, sobrepeso, obesidad) según su IMC.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class ClasificacionIMC {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese su peso en kg: ");
        double peso = scanner.nextDouble();
        System.out.print("Ingrese su altura en metros: ");
        double altura = scanner.nextDouble();
        
        double imc = peso / (altura * altura);
        
        if (imc < 18.5) {
            System.out.println("Bajo peso");
        } else if (imc < 24.9) {
            System.out.println("Peso normal");
        } else if (imc < 29.9) {
            System.out.println("Sobrepeso");
        } else {
            System.out.println("Obesidad");
        }
    }
}
```

</details>

</details>

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
