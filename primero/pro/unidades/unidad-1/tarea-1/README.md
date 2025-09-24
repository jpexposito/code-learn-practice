# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Ejercicios de condicionales y recepción y muestra de información")

## 1. Juego del clima loco

**Descripción:** El usuario ingresa el clima y el programa responde con una ocurrencia.

```pseudocode
leer clima
si clima = "soleado" entonces
    mostrar "¡Ponte gafas de sol y a disfrutar!"
sino si clima = "lluvioso" entonces
    mostrar "¡Saca tu paraguas, hoy cantamos bajo la lluvia!"
sino si clima = "nevando" entonces
    mostrar "¡Hora de hacer un muñeco de nieve!"
sino
    mostrar "Clima misterioso... ¿acaso viene una tormenta intergaláctica?"
```

<details>
      <summary>SOLUCIÓN</summary>
      
```java

import java.util.Scanner;

public class ClimaLoco {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Ingresa el clima: ");
        String clima = sc.nextLine().toLowerCase().trim();

        if (clima.equals("soleado")) {
            System.out.println("¡Ponte gafas de sol y a disfrutar!");
        } else if (clima.equals("lluvioso")) {
            System.out.println("¡Saca tu paraguas, hoy cantamos bajo la lluvia!");
        } else if (clima.equals("nevando")) {
            System.out.println("¡Hora de hacer un muñeco de nieve!");
        } else {
            System.out.println("Clima misterioso... ¿acaso viene una tormenta intergaláctica?");
        }

        sc.close();
    }
}
```
</details>  


---

## 2. Detector de edad divertida

**Descripción:** Según la edad, el programa da un mensaje gracioso.

```pseudocode
leer edad
si edad < 5 entonces
    mostrar "Eres un bebé genio con teclado."
sino si edad < 13 entonces
    mostrar "¡Cuidado! Podrías estar en la fase gamer pro."
sino si edad < 20 entonces
    mostrar "Adolescente detectado: nivel experto en memes."
sino si edad < 60 entonces
    mostrar "Adulto en misión: sobrevivir al café diario."
sino
    mostrar "¡Leyenda viva! Sabes más que Google."
```

---

## 3. Semáforo interactivo

**Descripción:** El usuario ingresa un color de semáforo y el programa indica la acción.

```pseudocode
leer color
si color = "rojo" entonces
    mostrar "¡Alto! Ni se te ocurra moverte."
sino si color = "amarillo" entonces
    mostrar "Prepárate… ¡pero no corras!"
sino si color = "verde" entonces
    mostrar "¡Avanza como un rayo!"
sino
    mostrar "Ese color no existe en un semáforo… ¿arcoíris?"
```

---

## 4. Adivina el animal

**Descripción:** El usuario responde preguntas y el programa adivina un animal.

```pseudocode
leer tiene_alas (sí/no)
leer vive_en_el_agua (sí/no)

si tiene_alas = "sí" entonces
    mostrar "Podría ser un pájaro… ¡o un dragón!"
sino si vive_en_el_agua = "sí" entonces
    mostrar "Seguro que eres un pez, o una sirena secreta."
sino
    mostrar "Mmm... tal vez un perro travieso."
```

---

## 5. Máquina de la suerte

**Descripción:** El usuario ingresa un número y el programa da una predicción graciosa.

```pseudocode
leer numero
si numero = 1 entonces
    mostrar "Hoy encontrarás una galleta… ¡y será deliciosa!"
sino si numero = 2 entonces
    mostrar "Un pato te mirará raro en la calle."
sino si numero = 3 entonces
    mostrar "Tendrás suerte… si compartes tu comida."
sino
    mostrar "Número misterioso: ¡prepárate para lo inesperado!"
```


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
