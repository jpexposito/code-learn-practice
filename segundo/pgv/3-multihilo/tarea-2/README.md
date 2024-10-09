# <img src=../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Cazadores de Monstruos")

<img src="https://i.ytimg.com/vi/t-tfbMcZ8Hc/maxresdefault.jpg" width="300px">

Imagina un mundo lleno de monstruos y cazadores. El objetivo del juego es que cada cazador intente atrapar tantos monstruos como sea posible en un tiempo limitado. Cada cazador se moverá aleatoriamente por el mapa y tendrá una tasa de éxito para atrapar un monstruo cuando se encuentre en la misma ubicación que uno. Cada cazador también tendrá un tiempo de espera entre cada intento de captura, lo que simula la acción de cazar.

## Requisitos del Juego

1. **Clases Principales**:
   - `Cazador`: Representa a un cazador que se mueve por el mapa y puede intentar atrapar monstruos.
   - `Monstruo`: Representa a un monstruo que aparece en ubicaciones aleatorias en el mapa.
   - `Mapa`: Una clase que mantiene el estado del mapa, incluyendo la ubicación de los monstruos y los cazadores.

2. **Características**:
   - Cada cazador debe ser un hilo (`Thread`) que se mueve por el mapa en intervalos de tiempo aleatorios.
   - Los monstruos deben aparecer en el mapa en ubicaciones aleatorias y deben desaparecer después de un tiempo si no son atrapados.
   - Los cazadores intentan atrapar monstruos en su ubicación actual y tienen una tasa de éxito (por ejemplo, 70% de probabilidad de atrapar un monstruo).
   - El juego debe finalizar después de un tiempo determinado, y se debe mostrar la cantidad total de monstruos atrapados por cada cazador.

3. **Interacción**:
   - Los cazadores y los monstruos deben interactuar en el mapa: si un cazador y un monstruo se encuentran en la misma ubicación, el cazador intenta atrapar al monstruo.

## Implementación

La implementación puede seguir los siguientes pasos:

1. **Crear las Clases**:
   - Implementar las clases `Cazador`, `Monstruo`, y `Mapa`.
   - La clase `Cazador` debe extender `Thread` y contener la lógica de movimiento y captura de monstruos.
   - La clase `Monstruo` puede ser una clase simple que tenga propiedades como su ubicación y estado (atrapado o no).
   - La clase `Mapa` debe gestionar la posición de los cazadores y los monstruos.

2. **Lógica de Juego**:
   - En el método `run()` de la clase `Cazador`, implementar la lógica de movimiento aleatorio y captura de monstruos.
   - Usar `Thread.sleep()` para simular el tiempo de espera entre intentos de captura.
   - Generar monstruos en el mapa de forma aleatoria y permitir que los cazadores intenten atraparlos.

3. **Finalización del Juego**:
   - Implementar un temporizador para finalizar el juego después de un tiempo determinado y mostrar el resultado final.


## La Clase `Mapa`

Esta clase define un mapa bidimensional donde se ubican tanto cazadores como monstruos. Se utiliza un `ConcurrentHashMap` para mantener las posiciones de todos los personajes de forma segura en un entorno concurrente.

### Atributos

- **`size`**: Define el tamaño del mapa, que es cuadrado (ej: 10x10).
- **`ubicaciones`**: Un `ConcurrentHashMap` que almacena la posición de los cazadores y monstruos en el mapa. Las llaves son los nombres de los personajes y los valores son las coordenadas (`x,y`).

### Métodos

- **`generarUbicacion()`**: Este método genera una ubicación aleatoria en el mapa, con coordenadas en formato `x,y`.
- **`moverCazador(Cazador cazador, String nuevaUbicacion)`**: Permite mover a un cazador a una nueva ubicación.
- **`agregarMonstruo(Monstruo monstruo, String ubicacion)`**: Añade un monstruo en una ubicación específica del mapa.

> Será necesario crear otros métodos adicionales controlan la interacción entre los personajes y el mapa.

---

## 2. Concurrencia

El uso de `ConcurrentHashMap` permite que el mapa sea actualizado simultáneamente por múltiples hilos. Tanto los cazadores como los monstruos se mueven de forma concurrente, lo que añade realismo al juego, evitando bloqueos o condiciones de carrera.

---

## Representación del Mapa

Imaginemos un mapa de tamaño `5x5`, con un cazador y un monstruo ubicados en diferentes posiciones. El símbolo **"C"** representa un cazador y **"M"** un monstruo. Las coordenadas van desde `(0,0)` hasta `(4,4)`.

### Ejemplo Mapa (5x5)

```plaintext
.  .  .  .  M
.  C  .  .  .
.  .  .  .  .
.  .  .  .  .
.  .  .  .  .
```

### Leyenda

- `.`: Representa una casilla vacía.
- `C`: Representa a un cazador en una coordenada específica. Ubicado en la posición `(0,4)`.
- `M`: Representa a un monstruo en una coordenada específica. Ubicado en la posición `(1,1)`.

## Solución

Incluye código, y salida de tu solución, las consideraciones que hayas tomado, etc.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
