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

<!--
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
-->

## 2. Suma de Puntos de Vida de un Equipo de Aventureros

Los héroes de un equipo de aventureros tienen diferentes cantidades de puntos de vida. Escribe un programa que calcule la suma total de puntos de vida de todos los aventureros en un array.

```java
int[] puntosDeVida = {100, 200, 150, 180, 90}; // Puntos de vida de cada aventurero
// Salida esperada: Total de puntos de vida = 720
```

## 3. Encuentra al Héroe más Fuerte y al más Débil

Un grupo de guerreros ha sido evaluado por su nivel de poder de ataque. Escribe un programa que determine quién es el héroe más fuerte y el más débil.

```java
int[] nivelesDeAtaque = {300, 150, 500, 200, 250}; // Niveles de ataque de los guerreros
// Salida esperada: Máximo = 500, Mínimo = 150
```

## 4.  Inversión del Inventario de un Cazador de Tesoros

Un cazador de tesoros ha recolectado una lista de objetos en el orden en que los encontró. Escribe un programa que invierta el orden de los objetos en su inventario para mostrar el último objeto primero.

```java
String[] inventario = {"Espada", "Escudo", "Poción", "Gema", "Mapa"}; // Objetos del inventario
// Salida esperada: {"Mapa", "Gema", "Poción", "Escudo", "Espada"}
```

## 5. Contar Aliados Jedi y Sith

En un campo de batalla galáctico, se están midiendo las fuerzas de los Jedi (números pares) y los Sith (números impares). Escribe un programa que cuente cuántos Jedi y cuántos Sith hay en un array de fuerzas.

```java
int[] fuerzas = {100, 45, 78, 13, 56, 91}; // Niveles de fuerza
// Salida esperada: Jedi = 3, Sith = 3
```

## 6 Búsqueda del Cristal Kyber Perdido

Un droide está buscando un cristal Kyber en una lista de recursos recolectados por el equipo rebelde. Escribe un programa que busque un valor específico en el array y verifique si el cristal Kyber está presente.

```java
String[] recursos = {"Bláster", "Cristal Kyber", "Sable de luz", "Pistola"}; // Recursos recolectados
String recursoBuscado = "Cristal Kyber"; // Valor a buscar
// Salida esperada: "Cristal Kyber se encuentra en el inventario."
```

## 7. Eliminar al Dragón Derrotado del Registro de Criaturas

Un equipo de aventureros ha derrotado a un dragón y ahora deben eliminarlo del registro de criaturas vivas. Escribe un programa que elimine a esta criatura específica del array.

```java
String[] criaturas = {"Goblin", "Dragón", "Orco", "Troll"}; // Criaturas en el registro
String criaturaAEliminar = "Dragón"; // Criatura derrotada
// Salida esperada: {"Goblin", "Orco", "Troll"}
```

## 8. Combinar el Botín de Dos Equipos de Héroes

Dos equipos de héroes han recolectado botines durante una misión conjunta. Escribe un programa que combine ambos inventarios de botines en uno solo.

```java
String[] botinEquipo1 = {"Espada mágica", "Escudo resistente"}; // Botín del equipo 1
String[] botinEquipo2 = {"Anillo de poder", "Armadura encantada"}; // Botín del equipo 2
// Salida esperada: {"Espada mágica", "Escudo resistente", "Anillo de poder", "Armadura encantada"}
```

## 9. Sumar la Fuerza de Dos Ejércitos

En una batalla épica, dos ejércitos se han unido. Escribe un programa que sume los puntos de fuerza de los guerreros de dos ejércitos y muestre un nuevo array con las fuerzas combinadas de ambos.

```java
int[] ejercito1 = {50, 60, 70}; // Fuerza de los guerreros del primer ejército
int[] ejercito2 = {40, 80, 60}; // Fuerza de los guerreros del segundo ejército
// Salida esperada: {90, 140, 130}
```

## 10. Ordenar los Rankings de Gladiadores

En la arena de gladiadores, se ha realizado una evaluación de las habilidades de combate. Escribe un programa que ordene las puntuaciones de los gladiadores de menor a mayor para ver quién es el mejor combatiente.

```java
int[] rankings = {300, 500, 200, 400, 100}; // Rankings de habilidad de los gladiadores
// Salida esperada: {100, 200, 300, 400, 500}
```

## 11.  Aumentar el Poder de Ataque de los Héroes con una Poción Mágica

Los héroes han bebido una poción mágica que multiplica su poder de ataque. Escribe un programa que multiplique cada valor de ataque en el array por un valor escalar (el poder de la poción).

```java
int[] poderesDeAtaque = {50, 70, 100}; // Poderes de ataque de los héroes
int pocion = 2; // Poder de la poción mágica
// Salida esperada: {100, 140, 200}
```

## 12. Inventario de Hechizos de un Mago

Un mago tiene una lista de hechizos en su libro mágico, pero quiere saber cuántos hechizos de ataque y cuántos de defensa tiene. Los hechizos de ataque son aquellos cuyo nombre contiene la palabra "Fuego", mientras que los de defensa contienen "Escudo". Escribe un programa que cuente los hechizos de ataque y de defensa.

```java
String[] hechizos = {"Fuego Ardiente", "Escudo Protector", "Rayo de Fuego", "Escudo Mágico", "Flecha Helada"}; // Hechizos del mago
// Salida esperada: Hechizos de ataque = 2, Hechizos de defensa = 2
```

## 13. Fusionar Dos Equipos de Superhéroes

Dos equipos de superhéroes han decidido fusionarse para enfrentar una amenaza mayor. Escribe un programa que combine ambos equipos en un solo array, sin que se repita ningún nombre.

```java
String[] equipo1 = {"Ironman", "Thor", "Hulk"}; // Miembros del primer equipo
String[] equipo2 = {"Capitán América", "Thor", "Hawkeye"}; // Miembros del segundo equipo
// Salida esperada: {"Ironman", "Thor", "Hulk", "Capitán América", "Hawkeye"}
```

## 14. Contador de Medallas en el Torneo de las Casas de Hogwarts

Se han registrado los puntajes de las casas de Hogwarts en el Torneo de Magia. Cada casa recibe una medalla (Oro, Plata o Bronce) según su puntuación. Escribe un programa que cuente cuántas medallas de cada tipo ha ganado una casa.

```java
String[] medallas = {"Oro", "Plata", "Bronce", "Oro", "Oro", "Plata"}; // Medallas ganadas por Gryffindor
// Salida esperada: Oro = 3, Plata = 2, Bronce = 1
```

## 15.  Búsqueda del Anillo Único

En la Tierra Media, varios objetos mágicos han sido encontrados, pero los héroes están buscando específicamente el "Anillo Único". Escribe un programa que determine si el Anillo Único está en el inventario.

```java
String[] objetosMagicos = {"Palantir", "Anillo Único", "Espada de Elendil", "Capa Élfica"}; // Objetos mágicos encontrados
String objetoBuscado = "Anillo Único"; // Objeto a buscar
// Salida esperada: "Anillo Único se encuentra en el inventario."
```

## 16.  Limpieza de Criaturas Hostiles en el Área 51

El equipo de científicos del Área 51 ha registrado una lista de criaturas hostiles, y tu misión es eliminar una criatura específica del registro. Escribe un programa que elimine la criatura que ya ha sido contenida.

```java
String[] criaturas = {"Alien", "Monstruo del Pantano", "Demonio", "Serpiente Gigante"}; // Criaturas hostiles registradas
String criaturaAEliminar = "Demonio"; // Criatura contenida
// Salida esperada: {"Alien", "Monstruo del Pantano", "Serpiente Gigante"}
```

## 17.  Subir de Nivel a los Personajes en un RPG

En un RPG, los personajes pueden subir de nivel incrementando su experiencia. Escribe un programa que multiplique la experiencia de cada personaje por 1.5 para simular su mejora tras una batalla.

```java
int[] experiencia = {100, 200, 150, 120}; // Niveles de experiencia actuales
double multiplicador = 1.5; // Multiplicador de la batalla
// Salida esperada: {150, 300, 225, 180}
```

## 17.  Organizar los Puntuajes de una Carrera de Starfighters

En una carrera de Starfighters, los pilotos han registrado sus tiempos en segundos. Escribe un programa que ordene los tiempos de menor a mayor para mostrar quién ha sido el más rápido.

```java
int[] tiempos = {350, 280, 420, 310}; // Tiempos de los pilotos en segundos
// Salida esperada: {280, 310, 350, 420}
```

## 18.  Almacén de Pociones de un Alquimista

Un alquimista ha creado varias pociones y desea organizar su almacén. Las pociones curativas contienen la palabra "Curación". Escribe un programa que separe las pociones curativas de las otras.

```java
String[] pociones = {"Poción de Curación", "Poción de Veneno", "Curación Mayor", "Poción de Invisibilidad"}; // Pociones en el almacén
// Salida esperada: {"Poción de Curación", "Curación Mayor"} y {"Poción de Veneno", "Poción de Invisibilidad"}
```

## 19.  Contar Gemas del Infinito Recolectadas

Thanos ha recolectado gemas del infinito, pero quiere saber cuántas tiene de cada tipo. Escribe un programa que cuente cuántas gemas de "Poder", "Tiempo" y "Espacio" ha recolectado.

```java
String[] gemas = {"Poder", "Tiempo", "Espacio", "Tiempo", "Poder", "Poder"}; // Gemas recolectadas por Thanos
// Salida esperada: Poder = 3, Tiempo = 2, Espacio = 1
```

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
