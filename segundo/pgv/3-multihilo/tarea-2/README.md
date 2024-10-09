# <img src=../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Cazadores de Monstruos")

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
