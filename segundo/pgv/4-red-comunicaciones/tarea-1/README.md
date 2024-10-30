# <img src=../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Comenzando con Hilos en Java")

## 1. Servidor Simple

Crea un programa de `servidor` que escuche en un puerto específico y un `cliente` que se conecte a este servidor. El cliente enviará un mensaje al servidor, y el servidor le responderá con el mismo mensaje.

**Objetivo**: Familiarizarse con el uso básico de sockets y flujo de datos entre cliente y servidor.

**Ayuda**:

Sigue los pasos y la ayuda que esta en el siguiente [enlace](https://github.com/jpexposito/code-learn/blob/main/segundo/pgv/4-red-comunicaciones/RC-2.md).

---

## 2. Servidor con Conversación Continua

Extiende (`ServidorContinua extend Servidor`) el ejercicio anterior para que el cliente y el servidor puedan mantener una conversación continua. El cliente podrá enviar varios mensajes al servidor, y el servidor devolverá cada mensaje hasta que el cliente envíe el mensaje "salir", lo cual cerrará la conexión.

En este caso debenos de manejar conexiones continuas y gestionar la terminación de la comunicación.

Ten en cuenta que debes de:

- Usa un bucle `while` en el servidor para mantener la conexión abierta.
- Implementa una condición de parada para finalizar el chat.

Sigue los pasos y la ayuda que esta en el siguiente [enlace](https://github.com/jpexposito/code-learn/blob/main/segundo/pgv/4-red-comunicaciones/RC-3.md).

---

## 3. Servidor de Suma de Números

Diseña un servidor que reciba dos números enteros de un cliente, los sume y devuelva el resultado. El cliente deberá enviar los dos números separados por un espacio. Por ejemplo, si envía `5 7`, el servidor deberá responder `12`.

> Los números los puede generar el cliente de forma aleatoria.

---

## 4. Servidor Multicliente de Chat en Línea

Implementa un servidor de chat donde múltiples clientes puedan conectarse y chatear entre ellos. El servidor debe reenviar cada mensaje que reciba a todos los clientes conectados.

Gestionar múltiples conexiones simultáneas con `Thread` y enviar datos a varios clientes.

Sigue los pasos y la ayuda que esta en el siguiente [enlace](https://github.com/jpexposito/code-learn/blob/main/segundo/pgv/4-red-comunicaciones/RC-4.md).

---

## 5. Servidor de Archivos con Transferencia de Datos Binaria

Crea un servidor que permita a un cliente solicitar un archivo especificando su nombre. El servidor debe buscar el archivo en su directorio local y, si lo encuentra, enviarlo al cliente. El cliente debe guardar el archivo recibido en su sistema y mostrar un mensaje con el contenido del fichero y cuando lo ha recibido.

Vas a manejar la transferencia de datos binarios y practicar el manejo de archivos con sockets.

```code
Este es el contenido del archivo fichero1.txt
```

> Crea 10 ficheros de este tipo y que el cliente genere un random de 1-20 para simular la busqueda y transferencia del fichero.

> Realiza __TESTING__ para verificar el correcto funcionamiento con `JUnit` y `Mockito`.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
