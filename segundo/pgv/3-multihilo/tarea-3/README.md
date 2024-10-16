# <img src=../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Cazadores de Monstruos Mejorado")

<img src="https://i.ytimg.com/vi/t-tfbMcZ8Hc/maxresdefault.jpg" width="300px">

## Descripción del juego

Dada la descripción del juego indicada en la tarea [anterior](../tarea-2/README.md), implementa las siguientes mejoras.

### Movimiento Independiente de los Monstruos

`Descripción`: Actualmente, los monstruos permanecen fijos en sus ubicaciones una vez añadidos al mapa. Mejorar el sistema permitiendo que los monstruos se muevan aleatoriamente añadirá más dinamismo y desafío al juego.

### Captura de Monstruos por los Cazadores

`Descripción`: No está claro cómo se captura un monstruo actualmente. Se debe implementar una lógica que permita que un cazador capture a un monstruo cuando lleguen a la misma posición.

### Eventos Dinámicos en el Mapa

`Descripción`: Añadir eventos aleatorios (por ejemplo, trampas o bonificaciones) que aparezcan en el mapa y afecten tanto a cazadores como monstruos, enriquecería la jugabilidad.

#### **Pista**

```java
ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
```

### Colaboración entre Cazadores

`Descripción`: Actualmente, los cazadores actuan de forma individual. Una mejora interesante sería permitir que los cazadores puedan colaborar, compartiendo información sobre las posiciones de los monstruos.

Una solución es utilizar un sistema de mensajería concurrente donde los cazadores puedan enviar y recibir información sobre las posiciones de los monstruos, usando **BlockingQueue**. Los cazadores pueden agregar posiciones observadas en la cola, y otros cazadores pueden consultar esta cola para obtener pistas.

## Inteligencia Artificial para los Monstruos

`Descripción`: Para que los monstruos representen un verdadero desafío, podemos mejorar su comportamiento, añadiendo una lógica que les permita huir de los cazadores cuando estos se acerquen.

> **Recuerda**: Dos monstruos no pueden estas en la misma posición, ni dos cazados.

## Solución

Incluye código, y salida de tu solución, las consideraciones que hayas tomado, etc.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
