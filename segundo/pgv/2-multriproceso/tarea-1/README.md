# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Comenzando con Procesos en Java")

## Ejercicio 1: Ejecutar un comando simple

Escribe un programa que use `ProcessBuilder` para ejecutar el comando `ping` a una dirección IP o un dominio (por ejemplo, `google.com`). El programa debe capturar y mostrar la salida del proceso en la consola.

**Objetivos:**

- Usar `ProcessBuilder` para ejecutar un comando del sistema.
- Capturar la salida estándar del proceso y mostrarla.

---

## Ejercicio 2: Ejecutar varios procesos secuenciales

Escribe un programa que ejecute tres comandos diferentes de forma secuencial (por ejemplo, `ping`, `ls` o `dir`, y `echo`). Cada proceso debe esperar a que el anterior termine antes de iniciarse.

**Objetivos:**

- Ejecutar procesos secuenciales.
- Manejar el método `waitFor()` para esperar que un proceso termine antes de iniciar el siguiente.

---

## Ejercicio 3: Redirigir la salida a un archivo

Escribe un programa que ejecute un comando del sistema (por ejemplo, `ls` o `dir`), capture su salida y la redirija a un archivo de texto.

**Objetivos:**

- Redirigir la salida de un proceso a un archivo.
- Usar `ProcessBuilder.redirectOutput()` o manejar flujos de salida manualmente.

---

## Ejercicio 4: Ejecutar un proceso con argumentos

Crea un programa que use `ProcessBuilder` para ejecutar otro programa Java, pasando diferentes argumentos. Por ejemplo, ejecuta un programa que toma como entrada el nombre de un archivo y escribe "Hola Mundo" en él.

**Objetivos:**

- Pasar argumentos a un proceso.
- Ejecutar otro programa Java desde el programa principal.

---

## Ejercicio 5: Capturar errores de un proceso

Escribe un programa que ejecute un comando que tenga una alta probabilidad de fallar (por ejemplo, un comando con un nombre incorrecto). Captura el error generado y muéstralo en la consola.

**Objetivos:**

- Capturar y mostrar la salida de error de un proceso.
- Usar `redirectErrorStream()` o `getErrorStream()` para manejar errores.

---

## Ejercicio 6: Lanzar múltiples instancias de una clase Java

Crea un programa que lance 5 instancias de una clase Java llamada `WorkerClass`. Cada instancia debe realizar una tarea sencilla, como escribir en un archivo o mostrar un mensaje en consola.

**Objetivos:**

- Lanzar múltiples instancias de un proceso Java desde otro proceso Java.
- Usar `ProcessBuilder` para ejecutar una clase Java.

---

## Ejercicio 7: Enviar y recibir datos entre procesos

Escribe un programa que inicie dos procesos: uno que genere datos y otro que los consuma. Usa un canal de entrada/salida para enviar datos desde un proceso a otro.

**Objetivos:**

- Enviar datos desde un proceso a otro.
- Usar `getOutputStream()` y `getInputStream()` para manejar la comunicación entre procesos.

---

## Ejercicio 8: Medir el tiempo de ejecución de un proceso

Escribe un programa que ejecute un proceso del sistema (por ejemplo, `ping`) y mida el tiempo que tarda en completarse. Muestra el tiempo de ejecución en la consola.

**Objetivos:**

- Medir el tiempo de ejecución de un proceso.
- Usar `System.currentTimeMillis()` o `System.nanoTime()` para medir tiempos.

---

## Ejercicio 9: Monitorizar y finalizar procesos largos

Escribe un programa que inicie un proceso largo (como `ping -t` en sistemas Windows o un bucle infinito en Linux) y permita que el usuario lo detenga manualmente después de un cierto tiempo (por ejemplo, 10 segundos).

**Objetivos:**

- Monitorizar la ejecución de un proceso.
- Terminar un proceso usando `Process.destroy()` después de un cierto tiempo o bajo una condición.

---

## Ejercicio 10: Encadenar la salida de un proceso a otro

Escribe un programa que encadene la salida de un proceso como entrada de otro. Por ejemplo, usa el comando `ls` (o `dir`) y pasa su salida a un comando `grep` (o `find`) para filtrar resultados.

**Objetivos:**

- Encadenar la salida de un proceso para que sea la entrada de otro.
- Usar `getOutputStream()` y `getInputStream()` para conectar dos procesos.

> Realiza __TESTING__ para verificar el correcto funcionamiento.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
