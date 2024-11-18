# <img src=../../../images/computer.png width="40"> Code, Learn & Practice(Docker: Hello Docker)

## Paso 1: Trabajar con imágenes de Docker

  Los contenedores de Docker se construyen con imágenes de Docker. Por defecto, Docker obtiene estas imágenes de Docker Hub, un registro de Docker gestionado por Docker, la empresa responsable del proyecto Docker. Cualquiera puede alojar sus imágenes en Docker Hub, de modo que la mayoría de las aplicaciones y las distribuciones de Linux que necesitará tendrán imágenes alojadas allí.

  Para verificar si puede acceder a imágenes y descargarlas de Docker Hub, escriba lo siguiente:

```console
  sudo docker run hello-world
```

  El resultado indicará que Docker funciona de forma correcta:

```console
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

```

## Paso 2: Administrar contenedores de Docker

  Después de usar Docker durante un tiempo, tendrá muchos contenedores activos (en ejecución) e inactivos en su computadora. Para ver los activos, utilice lo siguiente:

```console
  sudo docker ps
```

  Verá una salida similar a la siguiente:

```console
CONTAINER ID        IMAGE               COMMAND             CREATED   
```

  A través de este tutorial, inició dos contenedores: uno de la imagen hello-world y otro de la imagen ubuntu. Ambos contenedores ya no están en ejecución, pero aún existen en su sistema.

  Para ver todos los contenedores, activos e inactivos, ejecute docker ps con el conmutador -a:

```console
  docker ps -a
```

  Verás un resultado similar a esto:

  ```console
  sudo   docker ps -a
  CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
  b2c5683bc38f   hello-world   "/hello"   14 minutes ago   Exited (0) 14 minutes ago             kind_curran
  ```

  Para ver el último contenedor que creó, páselo al conmutador -l:

```console
  sudo docker ps -l
```

  ```console
  CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
  b2c5683bc38f   hello-world   "/hello"   24 minutes ago   Exited (0) 23 minutes ago             kind_curran
  ```

  Listar las imágenes de Docker de nuevo mostrará la nueva imagen, así como la anterior de la que se derivó:

  ```console
  sudo docker images
  ```

  con salida:

  ```console
  REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
hello-world   latest    feb5d9fea6a5   5 weeks ago   13.3kB
  ```

## Tarea:

Realiza un informe en markdown con los pasos indicados, y los resultados que hayas obtenido en tu máquima.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
