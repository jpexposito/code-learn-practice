# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Repaso de array´s y String en Java")

## Ejercicio 1: Suma de Elementos en un Array

Crea un método que tome un array de enteros y devuelva la suma de todos sus elementos.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio1 {
    public static void main(String[] args) {
        int[] array = {1, 2, 3, 4};
        int suma = 0;
        
        for (int i = 0; i < array.length; i++) {
            suma += array[i];
        }
        
        System.out.println("Suma del array: " + suma);
    }
}
```

</details>

## Ejercicio 2: Valor Mínimo y Máximo en un Array

Crea un método que tome un array de enteros y devuelva el valor mínimo y máximo en el array.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio2 {
    public static void main(String[] args) {
        int[] array = {3, 7, 2, 8};
        int min = array[0];
        int max = array[0];
        
        for (int i = 1; i < array.length; i++) {
            if (array[i] < min) {
                min = array[i];
            }
            if (array[i] > max) {
                max = array[i];
            }
        }
        
        System.out.println("Valor mínimo: " + min + ", Valor máximo: " + max);
    }
}
```

</details>

## Ejercicio 3: Media Aritmética

Implementa un método que calcule el promedio de los valores en un array de enteros.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio3 {
    public static void main(String[] args) {
        int[] array = {4, 8, 10};
        int suma = 0;
        
        for (int i = 0; i < array.length; i++) {
            suma += array[i];
        }
        
        double media = (double) suma / array.length;
        System.out.println("Media del array: " + media);
    }
}
```

</details>

## Ejercicio 4: Reverso de un Array

Escribe un método que reciba un array de enteros y devuelva otro array con los elementos en orden inverso.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio4 {
    public static void main(String[] args) {
        int[] array = {1, 2, 3, 4};
        int[] invertido = new int[array.length];
        
        for (int i = 0; i < array.length; i++) {
            invertido[i] = array[array.length - 1 - i];
        }
        
        System.out.print("Array invertido: ");
        for (int i = 0; i < invertido.length; i++) {
            System.out.print(invertido[i] + " ");
        }
    }
}
```

</details>

## Ejercicio 5: Búsqueda de un Elemento

Implementa un método que busque si un número específico está presente en un array.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio5 {
    public static void main(String[] args) {
        int[] array = {1, 2, 3, 4};
        int objetivo = 3;
        boolean encontrado = false;
        
        for (int i = 0; i < array.length; i++) {
            if (array[i] == objetivo) {
                encontrado = true;
                break;
            }
        }
        
        System.out.println("¿Contiene el número " + objetivo + "? " + encontrado);
    }
}
```

</details>

## Ejercicio 6: Duplicados en un Array

Crea un método que tome un array y devuelva `true` si hay duplicados en el array, `false` en caso contrario.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio6 {
    public static void main(String[] args) {
        int[] array = {1, 2, 3, 2};
        boolean duplicado = false;
        
        for (int i = 0; i < array.length; i++) {
            for (int j = i + 1; j < array.length; j++) {
                if (array[i] == array[j]) {
                    duplicado = true;
                    break;
                }
            }
            if (duplicado) break;
        }
        
        System.out.println("¿Contiene duplicados? " + duplicado);
    }
}
```

</details>

## Ejercicio 7: Ordenar un Array

Escribe un método que ordene un array de enteros de menor a mayor.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio7 {
    public static void main(String[] args) {
        int[] array = {3, 1, 4, 2};
        
        for (int i = 0; i < array.length - 1; i++) {
            for (int j = i + 1; j < array.length; j++) {
                if (array[i] > array[j]) {
                    int temp = array[i];
                    array[i] = array[j];
                    array[j] = temp;
                }
            }
        }
        
        System.out.print("Array ordenado: ");
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i] + " ");
        }
    }
}
```

</details>

## Ejercicio 8: Concatenar Arrays

Implementa un método que tome dos arrays y devuelva un array resultante que sea la concatenación de los dos.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio8 {
    public static void main(String[] args) {
        int[] array1 = {1, 2};
        int[] array2 = {3, 4};
        int[] concatenado = new int[array1.length + array2.length];
        
        for (int i = 0; i < array1.length; i++) {
            concatenado[i] = array1[i];
        }
        
        for (int i = 0; i < array2.length; i++) {
            concatenado[array1.length + i] = array2[i];
        }
        
        System.out.print("Array concatenado: ");
        for (int i = 0; i < concatenado.length; i++) {
            System.out.print(concatenado[i] + " ");
        }
    }
}
```

</details>

## Ejercicio 9: Frecuencia de Elementos

Crea un método que calcule la frecuencia de cada número en un array.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio9 {
    public static void main(String[] args) {
        int[] array = {1, 2, 2, 3};
        
        for (int i = 0; i < array.length; i++) {
            int count = 1;
            boolean alreadyCounted = false;
            
            for (int j = 0; j < i; j++) {
                if (array[i] == array[j]) {
                    alreadyCounted = true;
                    break;
                }
            }
            
            if (!alreadyCounted) {
                for (int k = i + 1; k < array.length; k++) {
                    if (array[i] == array[k]) {
                        count++;
                    }
                }
                System.out.println(array[i] + ": " + count);
            }
        }
    }
}
```

</details>

## Ejercicio 10: Eliminar Duplicados

Escribe un método que tome un array y devuelva un nuevo array sin duplicados.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio10 {
    public static void main(String[] args) {
        int[] array = {1, 2, 2, 3};
        int[] tempArray = new int[array.length];
        int index = 0;
        
        for (int i = 0; i < array.length; i++) {
            boolean isDuplicate = false;
            
            for (int j = 0; j < index; j++) {
                if (array[i] == tempArray[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            
            if (!isDuplicate) {
                tempArray[index++] = array[i];
            }
        }
        
        System.out.print("Array sin duplicados: ");
        for (int i = 0; i < index; i++) {
            System.out.print(tempArray[i] + " ");
        }
    }
}
```

</details>

## Ejercicio 11: Contar Vocales y Consonantes

Crea un método que reciba una cadena de texto y cuente cuántas vocales y consonantes contiene.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio11 {
    public static void main(String[] args) {
        String cadena = "hello";
        int vocales = 0;
        int consonantes = 0;

        for (int i = 0; i < cadena.length(); i++) {
            char caracter = Character.toLowerCase(cadena.charAt(i));
            if ((caracter >= 'a' && caracter <= 'z')) {
                if (caracter == 'a' || caracter == 'e' || caracter == 'i' || caracter == 'o' || caracter == 'u') {
                    vocales++;
                } else {
                    consonantes++;
                }
            }
        }

        System.out.println("Vocales: " + vocales + ", Consonantes: " + consonantes);
    }
}
```

</details>

## Ejercicio 12: Palabra Más Larga

Escribe un método que encuentre la palabra más larga en una oración.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio12 {
    public static void main(String[] args) {
        String oracion = "El perro come";
        String palabraLarga = "";
        String palabraActual = "";

        for (int i = 0; i <= oracion.length(); i++) {
            if (i < oracion.length() && oracion.charAt(i) != ' ') {
                palabraActual += oracion.charAt(i);
            } else {
                if (palabraActual.length() > palabraLarga.length()) {
                    palabraLarga = palabraActual;
                }
                palabraActual = "";
            }
        }

        System.out.println("Palabra más larga: " + palabraLarga);
    }
}
```

</details>

## Ejercicio 13: Invertir una Cadena

Crea un método que invierta el contenido de una cadena.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio13 {
    public static void main(String[] args) {
        String cadena = "hola";
        String cadenaInvertida = "";

        for (int i = cadena.length() - 1; i >= 0; i--) {
            cadenaInvertida += cadena.charAt(i);
        }

        System.out.println("Cadena invertida: " + cadenaInvertida);
    }
}
```

</details>

## Ejercicio 14: Palíndromo

Implementa un método que determine si una cadena es un palíndromo (se lee igual al revés).

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio14 {
    public static void main(String[] args) {
        String cadena = "radar";
        boolean esPalindromo = true;

        for (int i = 0; i < cadena.length() / 2; i++) {
            if (cadena.charAt(i) != cadena.charAt(cadena.length() - 1 - i)) {
                esPalindromo = false;
                break;
            }
        }

        System.out.println("¿Es palíndromo? " + esPalindromo);
    }
}
```

</details>

## Ejercicio 15: Contar Palabras en una Cadena

Crea un método que cuente el número de palabras en una cadena.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio15 {
    public static void main(String[] args) {
        String cadena = "El gato duerme";
        int palabras = 0;
        boolean enPalabra = false;

        for (int i = 0; i < cadena.length(); i++) {
            if (cadena.charAt(i) != ' ') {
                if (!enPalabra) {
                    palabras++;
                    enPalabra = true;
                }
            } else {
                enPalabra = false;
            }
        }

        System.out.println("Número de palabras: " + palabras);
    }
}
```

</details>

## Ejercicio 16: Reemplazar Caracteres

Escribe un método que reemplace todas las ocurrencias de un carácter en una cadena con otro carácter.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio16 {
    public static void main(String[] args) {
        String cadena = "perro";
        char buscar = 'r';
        char reemplazar = 'l';
        String nuevaCadena = "";

        for (int i = 0; i < cadena.length(); i++) {
            if (cadena.charAt(i) == buscar) {
                nuevaCadena += reemplazar;
            } else {
                nuevaCadena += cadena.charAt(i);
            }
        }

        System.out.println("Cadena con reemplazo: " + nuevaCadena);
    }
}
```

</details>

## Ejercicio 17: Primera Letra en Mayúsculas

Crea un método que reciba una oración y devuelva la misma oración con la primera letra de cada palabra en mayúsculas.

<details>
  <summary>SOLUCIÓN:</summary>

```java
public class Ejercicio17 {
    public static void main(String[] args) {
        String oracion = "buenos dias";
        String resultado = "";
        boolean esInicioPalabra = true;

        for (int i = 0; i < oracion.length(); i++) {
            char caracter = oracion.charAt(i);
            if (esInicioPalabra && caracter != ' ') {
                resultado += Character.toUpperCase(caracter);
                esInicioPalabra = false;
            } else {
                resultado += caracter;
            }
            if (caracter == ' ') {
                esInicioPalabra = true;
            }
        }

        System.out.println("Oración capitalizada: " + resultado);
    }
}
```

</details>

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
