# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Array´s y recorrido")

> ___Si no conoces una temática, investiga un poco___

> AYUDA. PARA RESOLVER LOS PROBLEMAS LEE EL SIGUIENTE [ENLACE](https://github.com/jpexposito/code-learn/blob/main/primero/pro/unidades/unidad-2/CLASE-STRING.md)

## 1. Contando midiclorianos

Crea un array que represente los midiclorianos de 10 Jedi. Calcula la media de midiclorianos en el array. ¿Quién tiene más y quién tiene menos?

```java
public class Ejercicio1 {
    public static void main(String[] args) {
        // Array que representa los niveles de midiclorianos de 10 Jedi
        int[] midiclorianos = {15000, 12000, 20000, 18000, 22000, 17000, 14000, 25000, 16000, 13000};
        
        // Variables para calcular la suma, el máximo y el mínimo
        int suma = 0;
        int max = midiclorianos[0];
        int min = midiclorianos[0];
        int jediMax = 0; // índice del Jedi con más midiclorianos
        int jediMin = 0; // índice del Jedi con menos midiclorianos

        // Recorremos el array para calcular la suma, el máximo y el mínimo
        for (int i = 0; i < midiclorianos.length; i++) {
            suma += midiclorianos[i];

            // Verificamos si el valor actual es el máximo
            if (midiclorianos[i] > max) {
                max = midiclorianos[i];
                jediMax = i;
            }

            // Verificamos si el valor actual es el mínimo
            if (midiclorianos[i] < min) {
                min = midiclorianos[i];
                jediMin = i;
            }
        }

        // Calculamos la media de los midiclorianos
        double media = (double) suma / midiclorianos.length;

        // Imprimimos los resultados
        System.out.println("Media de midiclorianos: " + media);
        System.out.println("Jedi con más midiclorianos: Jedi " + (jediMax + 1) + " con " + max);
        System.out.println("Jedi con menos midiclorianos: Jedi " + (jediMin + 1) + " con " + min);
    }
}
```

---

## 2. Espada de He-Man

Declara un array que contenga las palabras de la frase "Por el poder de Grayskull, yo tengo el poder". Luego, imprime la frase palabra por palabra desde el último elemento hasta el primero.

---

## 3. Pokémon favoritos

Crea un array que almacene los nombres de 6 Pokémon de Ash. Recorre el array para mostrar los nombres con las siguientes reglas:
- Si el nombre del Pokémon contiene una "a", imprime "Pikachu lo elige".
- Si contiene una "i", imprime "¡Es muy fuerte!".
- De lo contrario, imprime el nombre normalmente.

---

## 4. Cifrando mensajes Sith

Crea un array de caracteres que represente una frase. Luego, cifra el mensaje reemplazando cada carácter por el siguiente en el alfabeto (por ejemplo, 'a' se convierte en 'b', 'z' se convierte en 'a').

---

## 5. Matriz del inframundo

Crea una matriz de 5x5 (array bidimensional) que represente una ciudad del inframundo en la serie "Stranger Things". Llénala con el valor `0` para indicar zonas seguras y `1` para zonas con Demogorgons. Luego, recorre la matriz para imprimirla en formato de tablero.

---

## 6. Ranking de superhéroes

Crea un array que contenga los nombres de los 7 superhéroes más poderosos según tu criterio. Luego, usa un algoritmo de ordenación (por ejemplo, burbuja) para ordenarlos alfabéticamente.

---

## 7. Mejora de armadura de Tony Stark

Crea un array de enteros que represente la durabilidad de las partes de la armadura de Iron Man. Si un valor es menor a 50, imprímelo con el mensaje "¡Necesita reparación!". Luego, mejora todos los valores en un 10%.

---

## 8. Caza de dragones

Crea un array que represente la salud de 5 dragones. Cada vez que el usuario introduzca un número, resta esa cantidad de salud a un dragón al azar. El juego termina cuando la salud de todos los dragones es cero o menos.

---

## 9. Planeta Vegeta destruido

Declara un array que contenga los nombres de los guerreros saiyajin. Luego, elimina a cada guerrero uno por uno (cambia su valor en el array a `null`) como si el planeta estuviera siendo destruido.

---

## 10. Simulador de Batalla Pokémon

Crea dos arrays de enteros que representen la vida de dos equipos Pokémon. En cada turno, un Pokémon de cada equipo pierde una cantidad aleatoria de vida. El juego termina cuando todos los Pokémon de un equipo son derrotados.

---

## 11. Cifrado de "Hogwarts"

Declara un array de caracteres con la palabra "Hogwarts". Luego, mueve todas las letras dos posiciones a la derecha (la última letra pasa a ser la primera) e imprime el resultado.

---

## 12. Inventario del Batmóvil

Crea un array que contenga los objetos del inventario del Batmóvil (por ejemplo, batarangs, ganchos, bombas de humo). Agrega una opción para que el usuario pueda agregar o eliminar elementos del inventario.

---

## 13. Viaje en el Halcón Milenario

Crea un array de planetas que el Halcón Milenario debe visitar. Usa un bucle para imprimir los planetas en el orden de visita, pero si el planeta es "Tatooine", imprime "¡Cuidado con los Jawas!" antes de seguir con el siguiente planeta.

---

## 14. El hechizo del Doctor Strange

Crea un array de hechizos mágicos usados por Doctor Strange en un enfrentamiento. Si el hechizo es "Portal", imprime "Se abre un portal interdimensional". Si el hechizo es "Escudo", imprime "Se ha protegido". Repite esto hasta recorrer todos los hechizos.

---

## 15. Sistema de anillos de Green Lantern

Crea un array que contenga los niveles de energía de los anillos de 5 Lanterns. Si un anillo tiene menos de 20% de energía, imprime "Recarga necesaria en la batería central".

---

## 16. Puntos de experiencia de Goku

Crea un array de enteros que contenga los puntos de experiencia de Goku después de 10 batallas. Luego, calcula el total y la media de los puntos obtenidos.

---

## 17. Batalla épica Marvel vs DC

Crea dos arrays, uno con los héroes de Marvel y otro con los héroes de DC. Luego, simula una batalla imprimiendo héroes aleatorios de cada equipo que se enfrentan uno contra el otro.

---

## 18. Los anillos de poder

Crea un array que contenga los nombres de los poseedores de los 9 anillos de poder dados a los hombres. Si un nombre es "Sauron", imprime "Anillo Único detectado".

---

## 19. Simulador de Mazmorras y Dragones

Crea un array que contenga las estadísticas de ataque de 6 personajes de una campaña de "Dungeons & Dragons". Luego, simula un ataque de cada personaje sumando sus estadísticas y muestra qué personaje hizo más daño.

---

## 20. Colección de reliquias de Indiana Jones

Crea un array que contenga las reliquias que Indiana Jones ha encontrado (por ejemplo, el Santo Grial, la Calavera de Cristal). Luego, simula que pierde una reliquia cada vez que ingresa a una trampa (elimina un elemento del array).

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
