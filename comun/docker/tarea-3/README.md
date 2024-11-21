# <img src=../../../images/computer.png width="40"> Code, Learn & Practice(Docker: Instalación de Apache Tomcat en Docker con un Puerto Específico)

## Objetivo

Configurar un contenedor Docker que ejecute Apache Tomcat y que esté accesible desde un puerto específico en la máquina anfitriona.

Consulta los comandos de docker en el siguiente [enlace](https://github.com/jpexposito/code-learn/blob/main/comun/docker/COMANDOS.md).

## Paso 1: Preparación del Entorno

1. Verifica que Docker está instalado y funcionando:

   ```bash
   docker --version
   ```

2. Asegúrate de que ningún servicio en tu máquina está utilizando el puerto 8080 (o el puerto que desees asignar).

---

## Paso 2: Descargar la Imagen de Tomcat

1. Descarga la imagen oficial de Apache Tomcat desde Docker Hub:

   ```bash
   docker pull tomcat
   ```

   Debes de obtener algo similar a lo siguiente:

   ```code
    Using default tag: latest
  latest: Pulling from library/tomcat
afad30e59d72:
   ```

2. Confirma que la imagen fue descargada correctamente:
  
   ```bash
   docker images
   ```

   Busca `tomcat` en la lista de imágenes disponibles.

   Debes de obtener algo similar a los siguiente:

   ```code
  tomcat                                 latest    f77539e7e45f   10 days ago     467MB
bitnami/wildfly                        latest    fd834e6b2436   11 days ago     851MB
tomcat                                 9.0       6dbc2b16532f   11 days ago     469MB
httpd                                  latest    dad6ca1caf78   4 months ago    148MB
mysql                                  latest    fcd86ff8ce8c   6 months ago    578MB
jpexposito/trabajo-docker-kubernetes   1.0       094928f853db   7 months ago    533MB
trabajo-docker-kubernetes              1.0       094928f853db   7 months ago    533MB
   ```

---

## Paso 3: Ejecutar el Contenedor de Tomcat

1. Inicia un contenedor basado en la imagen de Tomcat, asignando un puerto específico (por ejemplo, 9090 en la máquina anfitriona):

    ```bash
      docker run -d -p 9090:8080 --name tomcat-server tomcat
    ```

    Debes de obtener algo similar a los siguiente:

    ```code
    38f28b6a66eaa0c0682a9542439bdedc8f2ae1559cdaaa21b710f31186eda38c
    ```
  
- `-d`: Ejecuta el contenedor en segundo plano.
- `-p 9090:8080`: Mapea el puerto 8080 del contenedor al puerto 9090 de la máquina anfitriona.
- `--name tomcat-server`: Asigna un nombre personalizado al contenedor.

1. Verifica que el contenedor está en ejecución:
   
    ```bash
    docker ps
    ```

   Debes de obtener algo similar a lo siguiente:

   ```code
   CONTAINER ID   IMAGE     COMMAND             CREATED              STATUS              PORTS                    NAMES
   38f28b6a66ea   tomcat    "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:9090->8080/tcp   tomcat-server
  ``` 

---

## Paso 4: Probar la Configuración

1. Abre un navegador web y accede a la dirección:

`http://localhost:9090`

Deberías ver la página de bienvenida de `Apache Tomcat`.

2. Si utilizas Docker en un servidor remoto, reemplaza `localhost` con la dirección IP del servidor.

3. Tanto si accedes por el navegador como si no, accede a los `logs`del servidor para ver si el arranque ha sido correcto:

```bash
docker logs tomcat-server
````

Debes de obtener algo similar a lo siguiente:

```code
 org.apache.catalina.startup.Catalina.start Server startup in [74] milliseconds
```

Verifica además que no hubieran conflicto de puertos:

```bash
lsof -i :9090
````

Debes de obtener algo similar a lo siguiente

```code
com.docke 55811 user   91u  IPv6 0x9304e55e6b9ab60e      0t0  TCP *:websm (LISTEN)
```

---

## Paso 5: Detener y Eliminar el Contenedor

1. Detén el contenedor:

```bash
docker stop tomcat-server
```

1. Elimina el contenedor:

```bash
docker rm tomcat-server
```

1. Si deseas eliminar la imagen de Tomcat de tu sistema:

```bash
docker rmi tomcat
```

---

## Reto Adicional

- Arranca `apache tomcat` en `otro puerto`, y verifica realiza los pasos anteriores.
  
- Configura un volumen Docker para persistir los datos de configuración de Tomcat en tu máquina anfitriona. Explora cómo montar directorios locales con el parámetro `-v`.

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
