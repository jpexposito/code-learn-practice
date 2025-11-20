# <img src=../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Cazadores de Monstruos, que se pueden esconder en una cueva")

<img src="https://i.ytimg.com/vi/t-tfbMcZ8Hc/maxresdefault.jpg" width="300px">

## Descripción del juego

Dada la descripción del juego indicada en la tarea [anterior](../tarea-2/README.md), y teniendo incluidas las mejoras indicadas en la [tarea](../tarea-2/README.md) implementa las siguientes mejoras.

## Contexto

En este ejercicio, simularás un mundo donde varios **cazadores** intentan capturar **monstruos**. Los monstruos y cazadores actúan de manera concurrente, y comparten un recurso común, que es la **cueva** donde los monstruos se esconden. Utilizaremos **semáforos** para controlar el acceso a la cueva y un **ThreadPool** para gestionar la concurrencia de los cazadores y monstruos.

## Requisitos

1. **Cazadores y Monstruos:**
   - Habrá varios **cazadores** (hilos) que intentarán capturar monstruos (tareas 2 y 3).
   - Habrá varios **monstruos** (hilos) que intentarán entrar en una **cueva** para esconderse de los cazadores.

2. **Cueva:**
   - La cueva tiene una **capacidad limitada**. Solo un número determinado de monstruos pueden esconderse dentro de la cueva al mismo tiempo. ***El número siempre sera igual o menor a la mitad de los monstruos creados***.
   - Si la cueva está llena, los monstruos deben esperar a que haya espacio para entrar.
   - Los cazadores no pueden entrar en la cueva. Sin embargo, pueden intentar **capturar monstruos** y siguen interacuando por las posiciones del ***mapa**, fuera de la cueva mientras patrullan o **esperan fuera** a que un monstruo salga.
   - La cueva estará una posición del mapa.

3. **Simulación y Concurrencia:**
   - La simulación debe utilizar un **ThreadPool** para manejar la creación y ejecución de los hilos de cazadores y monstruos.
   - Los **semáforos** deben usarse para controlar el acceso a la cueva por parte de los monstruos y la coordinación con los cazadores, evitando condiciones de carrera o acceso no sincronizado.
   - Un monstruo sólo puede estar un determinado tiempo en la cueva para facilitar el acceso a la cueva a otros monstruos.

4. **Recompensa para los Cazadores:**
   - Cuando un monstruo sale de la cueva, un cazador que esté **patrullando fuera de la cueva** puede capturarlo, como sucedia hasta ahora.
   - Un monstruo capturado será **eliminado del sistema**, y el cazador que lo capture recibirá una **recompensa**.

### Detalles Técnicos

#### 1. **Semáforo para la Cueva**

- Usa un semáforo para limitar el número de monstruos que pueden estar dentro de la cueva al mismo tiempo.
- El semáforo se inicializa con la capacidad máxima de la cueva (**recuerda la mitad del número de monstruos creados en el inicio del juego**).

### 2. **Cazadores y Patrullaje**

- Los cazadores deben **esperar fuera de la cueva** si no hay monstruos disponibles para capturar. Solo pueden intentar capturar monstruos cuando estos salen de la cueva.
- Usa un semáforo o mecanismo para coordinar que los cazadores no intenten capturar monstruos si no hay ninguno fuera de la cueva.

### 3. **ThreadPool para la Concurrencia**

- Usa un **Fixed ThreadPool** para gestionar los hilos de los cazadores y monstruos.
- La cantidad de **cazadores** y **monstruos** debe ser mayor que el número de hilos disponibles en el pool, para que algunas tareas queden en espera de ser ejecutadas, simulando una situación de concurrencia realista.

### 4. **Interacciones**

- Cuando un monstruo quiere entrar en la cueva, primero debe adquirir un permiso del semáforo de la cueva.
- Cuando un monstruo sale de la cueva, el semáforo libera un permiso, permitiendo que otro monstruo entre.
- Los cazadores patrullan fuera de la cueva y, cuando un monstruo sale, intentan capturarlo (sin interferir con otros cazadores).

### 5. **Finalización de la Simulación**

- La simulación debe tener un número finito de monstruos y cazadores.
- La simulación termina cuando todos los monstruos han sido capturados o han salido de la cueva, y la cantidad de monstruos en el sistema es cero, o se haya superado un tiempo máximo de juego.

## Ejemplo de Flujo

1. Hay **5 monstruos** y **3 cazadores**.
2. La **cueva** tiene una capacidad para **2 monstruos**.
3. Se crea un **ThreadPool** con capacidad para 3 hilos (por ejemplo, 2 monstruos y 1 cazador ejecutándose simultáneamente).
4. Los monstruos intentan entrar en la cueva. Si la cueva está llena, los monstruos deben esperar a que uno de ellos salga.
5. Los cazadores patrullan fuera de la cueva. Si un monstruo sale, intentan capturarlo.
6. La simulación termina cuando todos los monstruos han sido capturados o han salido de la cueva.

## Consideraciones Adicionales

- **Sincronización**: Es importante evitar condiciones de carrera, donde varios cazadores intenten capturar el mismo monstruo o donde los monstruos intenten entrar a la cueva al mismo tiempo.
- **Deadlocks**: Asegúrate de que los semáforos y los hilos estén bien coordinados para evitar bloqueos donde tanto cazadores como monstruos queden esperando indefinidamente.

## Se pide

- Implementación del código y descrición en el README.md de las soluciones aportadas, asi como la descripción del código, salida de este derante la ejecución con 3 valores de salida.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
