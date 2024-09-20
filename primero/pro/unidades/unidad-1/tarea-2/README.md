# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Ejercicios para Practicar `Scanner` y Tipos Básicos en Java")

## Ejercicio 1: Ejemplo - Cálculo de Edad

**Enunciado**: Crea un programa que pida al usuario su año de nacimiento, luego calcule su edad y la muestre en la consola.
  
**Pasos**:

1. Usa `Scanner` para pedir el año de nacimiento al usuario.
2. Calcula la edad restando el año actual (por ejemplo, 2024).
3. Muestra el resultado.

**Código Ejemplo**:

```java
import java.util.Scanner;

public class Ejercicio1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Introduce tu año de nacimiento: ");
        int anoNacimiento = scanner.nextInt();
        
        int anoActual = 2024;
        int edad = anoActual - anoNacimiento;
        
        System.out.println("Tienes " + edad + " años.");
    }
}
```

## Ejercicio 2: Cálculo de Área de un Círculo

**Enunciado**: Crea un programa que pida al usuario el radio de un círculo y calcule su área.

- Fórmula del área: `Área = π * radio^2`.
- Usa `double` para el radio y el área.

---

## Ejercicio 3: Conversión de Temperatura

**Enunciado**: Escribe un programa que convierta una temperatura en grados Celsius a Fahrenheit.

- Fórmula: `Fahrenheit = Celsius * 9/5 + 32`.
- Pide al usuario que introduzca la temperatura en grados Celsius.

---

## Ejercicio 4: Calculadora de Suma y Resta

**Enunciado**: Crea un programa que solicite al usuario dos números enteros. El programa debe sumar y restar ambos números, y mostrar los resultados.

---

## Ejercicio 5: Promedio de Tres Números

**Enunciado**: Escribe un programa que pida al usuario tres números de tipo `float` y calcule el promedio de los tres.

---

## Ejercicio 6: Determinar si un Número es Par o Impar

**Enunciado**: Escribe un programa que reciba un número entero y determine si es par o impar.

---

## Ejercicio 7: Calculadora de Salario Semanal

**Enunciado**: Crea un programa que pida al usuario las horas trabajadas y el salario por hora, y luego calcule su salario semanal.

---

## Ejercicio 8: Convertir de Millas a Kilómetros

**Enunciado**: Crea un programa que convierta una distancia en millas a kilómetros.

- Fórmula: `1 milla = 1.60934 km`.
- Pide al usuario que introduzca la distancia en millas.

---

## Ejercicio 9: Comparación de Dos Números

**Enunciado**: Escribe un programa que pida dos números enteros al usuario y determine cuál de ellos es mayor, o si son iguales.

---

## Ejercicio 10: Calculadora de Índice de Masa Corporal (IMC)

**Enunciado**: Crea un programa que pida al usuario su peso (en kg) y su altura (en metros), y luego calcule su Índice de Masa Corporal (IMC).

- Fórmula: `IMC = peso / (altura * altura)`.

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
