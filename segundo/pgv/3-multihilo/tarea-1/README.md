# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Comenzando con Hilos en Java")

## Ejemplo - Carrera entre Goku y Vegeta

Simula una carrera entre Goku y Vegeta, donde ambos personajes compiten para llegar a la meta. Cada uno avanza en pasos aleatorios y el primero en llegar a 100 gana.

```java
public class SaiyanRace implements Runnable {
    private String name;
    private int distance = 0;
    private static final int GOAL = 100;
    private static boolean winnerDeclared = false;

    public SaiyanRace(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        Random random = new Random();
        while (distance < GOAL && !winnerDeclared) {
            int step = random.nextInt(10) + 1; // Avance aleatorio de 1 a 10
            distance += step;
            System.out.println(name + " avanzó " + step + " metros. Distancia total: " + distance + " metros.");
            
            if (distance >= GOAL && !winnerDeclared) {
                winnerDeclared = true;
                System.out.println(name + " ha ganado la carrera!");
            }

            try {
                Thread.sleep(500); // Pausa entre pasos
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        Thread goku = new Thread(new SaiyanRace("Goku"));
        Thread vegeta = new Thread(new SaiyanRace("Vegeta"));

        goku.start();
        vegeta.start();
    }
}
```

> ___Test de verificación__
>
>Este test verificará si uno de los dos ha ganado la carrera, basándose en la salida del programa.

```java
import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class SaiyanRaceTest {

    @Test
    public void testSaiyanRace() throws InterruptedException {
        // Redirigir la salida estándar
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));

        // Ejecutar los hilos
        Thread goku = new Thread(new SaiyanRace("Goku"));
        Thread vegeta = new Thread(new SaiyanRace("Vegeta"));

        goku.start();
        vegeta.start();

        goku.join();  // Esperar a que termine Goku
        vegeta.join(); // Esperar a que termine Vegeta

        // Verificar si uno de ellos ganó
        String output = outContent.toString();
        assertTrue(output.contains("Goku ha ganado la carrera!") || output.contains("Vegeta ha ganado la carrera!"));
    }
}
```

## Ejercicio 1 Batalla Pokémon

Crea una simulación de batalla Pokémon en la que dos Pokémon (Pikachu y Charmander) luchan entre sí. Cada hilo representa a un Pokémon que alterna ataques y recibe daño hasta que uno de ellos se queda sin puntos de vida (HP). Deberás lanzar dos hilos y hacer que se detengan cuando uno de los Pokémon gane.

## Ejercicio 2 Caza de Horrocruxes (Harry Potter)

Imagina que Harry, Hermione y Ron están buscando Horrocruxes. Cada personaje está representado por un hilo que busca en una ubicación diferente del mundo. El primer hilo que encuentra un Horrocrux debe detener a los demás y terminar la búsqueda. Elige el tiempo de búsqueda de manera aleatoria para cada hilo.

## Ejercicio 3 Fábrica de Droids (Star Wars)

Simula una fábrica de droides en la que se están ensamblando droides de batalla. Un hilo se encarga de ensamblar los droides, mientras que otro hilo se encarga de activarlos. Asegúrate de que los droides no se activen antes de ser completamente ensamblados, usando mecanismos de sincronización entre hilos.

## Ejercicio 4 Competencia de Quidditch

Simula un partido de Quidditch, donde dos cazadores compiten para anotar más goles. Los cazadores son hilos que anotan puntos aleatoriamente. Adicionalmente, crea un tercer hilo que representa al buscador, que trata de atrapar la Snitch dorada. El partido termina cuando uno de los equipos atrapa la Snitch.

## Ejercicio 5 Exploradores Jedi (Star Wars)

Crea una simulación donde dos exploradores Jedi, representados por hilos, viajan por el espacio buscando pistas sobre el Lado Oscuro. Cada hilo busca en diferentes planetas, y el primer explorador que encuentre una pista debe detener al otro. Implementa tiempos de búsqueda aleatorios para cada Jedi.

## Ejercicio 6 Simulación de la TARDIS (Doctor Who)

Simula viajes en el tiempo de la TARDIS con varios hilos que representan diferentes épocas. Cada hilo debe intentar llegar al destino más rápido que los demás. La duración de cada viaje debe ser aleatoria y el destino final se alcanza cuando uno de los hilos termina su ejecución.

## Ejercicio 7 Superhéroes salvando la ciudad

Crea una simulación donde Superman y Batman intentan salvar diferentes zonas de la ciudad de una amenaza. Cada superhéroe es un hilo que representa el esfuerzo por salvar una serie de áreas. Si uno de los superhéroes salva todas sus áreas primero, la amenaza será neutralizada y el otro superhéroe deberá detenerse.

## Ejercicio 8 Thor vs Hulk - Competencia de fuerza

Simula una competencia de fuerza entre Thor y Hulk. Ambos héroes tienen que levantar pesas (representados por incrementos de peso levantado en cada iteración del hilo) durante un tiempo limitado. Al final, el hilo que haya levantado más peso gana la competencia.

## Ejercicio 9 Simulación del Millenium Falcon

Crea una simulación del Millenium Falcon, donde Han Solo y Chewbacca están controlando la nave en medio de una batalla espacial. Un hilo representa a Han Solo controlando la velocidad, mientras que otro hilo representa a Chewbacca manejando los escudos. Si alguno de los sistemas falla, la nave podría ser destruida.

## Ejercicio 10 Batalla entre magos (El Señor de los Anillos)

Simula una batalla mágica entre Gandalf y Saruman. Cada mago lanza hechizos que reducen la energía del otro mago, usando dos hilos. El primer mago que agote por completo la energía del otro gana la batalla. Los hechizos deben ser lanzados a intervalos de tiempo aleatorios.

> Realiza __TESTING__ para verificar el correcto funcionamiento.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
