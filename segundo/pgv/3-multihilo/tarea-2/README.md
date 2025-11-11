# <img src=../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Hilos y Semáforos en Java")

> Los **10 ejercicios** están en este README en **pseudocódigo** con sus **tests** (también en pseudocódigo). Puedes crear sus clases Java bajo `src/main/java` y sus tests en `src/test/java` siguiendo el patrón del ejemplo.

---

Para resolver la carrera entre `Goku` y `Vegeta` usando **semáforos** (`java.util.concurrent.Semaphore`).  
Aprenderás a:

- Alternar turnos entre hilos con **semáforos binarios**.
- Evitar bloqueos tras declarar un ganador (liberación de permisos).
- Diseñar un test robusto con JUnit 5.

---

## 🎯 Objetivo didáctico

1. Modelar una carrera con dos hilos (`Goku`, `Vegeta`) que **se alternan por turnos**.
2. Declarar **un único ganador** de manera segura.
3. Asegurar que **ningún hilo quede bloqueado** cuando la carrera termina.

---

## 🧩 Conceptos clave de `Semaphore`

- Un **Semaphore** controla el número de **permisos** disponibles.
  - **Binario** (`new Semaphore(1)`) ≈ *mutex*: a la vez solo entra uno.
  - **Contador** (`new Semaphore(k)`) ≈ *k recursos*: a la vez pueden entrar k.
- `acquire()` **bloquea** si no hay permisos; `release()` **devuelve** un permiso.
- El semáforo **no guarda “de quién es el turno”**: lo define tu **protocolo**.  
  Para alternar Goku/Vegeta:
  - `turnGoku = new Semaphore(1)`  → Goku puede empezar.
  - `turnVegeta = new Semaphore(0)` → Vegeta espera a que Goku libere.

---

## Diseñando de la solución

- **Alternancia por turnos** con **dos semáforos** (Goku/Vegeta).
- **Ganador único** con `AtomicBoolean.compareAndSet(false, true)`.
- **Salida limpia**: si un hilo detecta que la carrera ya acabó, hace `release()` del semáforo del rival para que **no se quede bloqueado**.

---

## Código Java (Semáforos)

### `SaiyanRaceSemaphore.java`

```java
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;
import java.util.concurrent.atomic.AtomicBoolean;

public class SaiyanRaceSemaphore implements Runnable {
    private final String name;
    private int distance = 0;

    private static final int GOAL = 100;

    private static final Semaphore turnGoku = new Semaphore(1);  
    private static final Semaphore turnVegeta = new Semaphore(0); 

    private static final AtomicBoolean winnerDeclared = new AtomicBoolean(false);

    public SaiyanRaceSemaphore(String name) {
        this.name = name;
    }

    @Override
    public void run() {
        final boolean isGoku = "Goku".equals(name);
        final Semaphore myTurn = isGoku ? turnGoku : turnVegeta;
        final Semaphore otherTurn = isGoku ? turnVegeta : turnGoku;

        try {
            while (!winnerDeclared.get() && distance < GOAL) {
                myTurn.acquire();
                if (winnerDeclared.get()) {
                    otherTurn.release(); 
                    break;
                }
                int step = ThreadLocalRandom.current().nextInt(1, 11);
                distance += step;
                System.out.println(name + " avanzó " + step + " metros. Distancia total: " + distance + " metros.");

                if (distance >= GOAL) {
                    if (winnerDeclared.compareAndSet(false, true)) {
                        System.out.println(name + " ha ganado la carrera!");
                    }
                }
                otherTurn.release();

                try {
                    Thread.sleep(ThreadLocalRandom.current().nextInt(200, 401));
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    otherTurn.release();
                    break;
                }
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            (isGoku ? turnVegeta : turnGoku).release();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        Thread goku = new Thread(new SaiyanRaceSemaphore("Goku"));
        Thread vegeta = new Thread(new SaiyanRaceSemaphore("Vegeta"));

        goku.start();
        vegeta.start();

        goku.join();
        vegeta.join();
    }
}
```

---

## Test JUnit 5

### `SaiyanRaceSemaphoreTest.java`

```java
import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

public class SaiyanRaceSemaphoreTest {

    @Test
    public void testCarreraConSemaforos() throws InterruptedException {
        PrintStream originalOut = System.out;
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));

        try {
            Thread goku = new Thread(new SaiyanRaceSemaphore("Goku"));
            Thread vegeta = new Thread(new SaiyanRaceSemaphore("Vegeta"));

            goku.start();
            vegeta.start();
            goku.join(15_000);
            vegeta.join(15_000);

            if (goku.isAlive() || vegeta.isAlive()) {
                fail("La carrera no terminó dentro del tiempo esperado.");
            }

            String output = outContent.toString();
            boolean gokuWin = output.contains("Goku ha ganado la carrera!");
            boolean vegetaWin = output.contains("Vegeta ha ganado la carrera!");
            assertTrue(gokuWin ^ vegetaWin, "Debe haber un único ganador.");
        } finally {
            System.setOut(originalOut);
        }
    }
}
```

> **Nota:** Este test es deliberadamente laxo con la alternancia porque puede haber mensajes seguidos (por ejemplo, el anuncio de victoria). La **alternancia efectiva** se garantiza por el protocolo de semáforos.



## Licencia

Este proyecto está bajo **Apache 2.0** — consulta el archivo `LICENSE` del repositorio original:
- https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE

> Realiza __TESTING__ para verificar el correcto funcionamiento.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
