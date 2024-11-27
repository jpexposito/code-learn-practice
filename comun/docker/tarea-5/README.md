# <img src=../../../images/computer.png width="40"> Code, Learn & Practice(Docker: Configuración de un Balanceador de Carga NGINX con Dos Servidores Tomcat)

## Objetivo

Configurar un balanceador de carga **[NGINX](https://kinsta.com/es/base-de-conocimiento/que-es-nginx/)** que distribuya el tráfico entre dos servidores **[Tomcat](https://es.wikipedia.org/wiki/Tomcat)** ejecutados en contenedores Docker.

Consulta los comandos de docker en el siguiente [enlace](https://github.com/jpexposito/code-learn/blob/main/comun/docker/COMANDOS.md), y las redes en docker en el siguiente [enlace](https://github.com/jpexposito/code-learn/tree/main/comun/docker/ud-5).

> Recuerda que debes de tener el contenedor docker corriendo

```bash
docker -version
docker ps
```
---

## Redes disponibles

Lista el conjunto de redes disponibles en este momento.

```bash
docker network ls
```

Deben de obtener una salida similar a la siguiente:

```bash
NETWORK ID     NAME                                          DRIVER    SCOPE
32b42ef89cbf   bridge                                        bridge    local
78d7ec322e53   docker-jenkins-sonarqube-master_jenkins-net   bridge    local
2eddcfb932c1   host                                          host      local
```

## Pasos a Seguir

### Crear una Red Docker

Docker necesita una red personalizada para que los contenedores puedan comunicarse entre sí. Ejecuta el siguiente comando:

```bash
docker network create tomcat-network
```

- `docker network create`: Crea una nueva red Docker.
- `tomcat-network`: Es el nombre de la red personalizada.

### Levanta los Servidores Tomcat

Levanta dos contenedores Tomcat y conéctalos a la red tomcat-network.

#### Servidor Tomcat 1

```bash
docker run -d --name tomcat1 --network tomcat-network -p 8081:8080 tomcat:latest
```

#### Servidor Tomcat 2

```bash
docker run -d --name tomcat2 --network tomcat-network -p 8081:8080 tomcat:latest
```

- `docker run`: Crea y ejecuta un contenedor.
- `-d`: Ejecuta el contenedor en segundo plano (modo "detached").
- `--name tomcat1 y --name tomcat2`: Asigna nombres a los contenedores para identificarlos.
- `--network tomcat-network`: Conecta los contenedores a la red personalizada.
- `-p 8081:8080 y -p 8082:8080`: Expone los puertos 8080 de los contenedores en los puertos 8081 y 8082 de la máquina anfitriona.
- `tomcat:latest`: Usa la última versión de la imagen oficial de Tomcat.

>**Importante**: Levanta los servidores tomcat asociando un **alias** como en las tareas anteriores. Para eso añade el `--name`.

### Muestra los contenedores dockers activos en ese momento

Muestra el listado de `contenedores` docker que tienes `activos` y `todos los que tienes disponibles`.

```bash
docker ...
```

Debes de obtener una salida similar a:

```bash
CONTAINER ID   IMAGE           COMMAND             CREATED          STATUS          PORTS                    NAMES
b91b827d637e   tomcat:latest   "catalina.sh run"   17 seconds ago   Up 17 seconds   0.0.0.0:8082->8080/tcp   tomcat2
dd141081f639   tomcat:latest   "catalina.sh run"   27 seconds ago   Up 27 seconds   0.0.0.0:8081->8080/tcp   tomcat1
```

### Fichero de Configuración del Balanceador NGINX

Crea el fichero de balance `nginx.conf` en el `mismo direcctorio` donde estes ejecutando la `consola de comandos`.

```bash
events {}

http {
    upstream tomcat_backend {
        server tomcat1:8080;
        server tomcat2:8080;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://tomcat_backend;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
}
```

Debes de obtener una salida similar a la siguiente:

```bash
docker run -d --name nginx --network tomcat-network -p 80:80 -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf nginx:latest
```

Obteniendo:

```bash
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
2d429b9e73a6: Already exists 
20c8b3871098: Pull complete 
06da587a7970: Pull complete 
f7895e95e2d4: Pull complete 
7b25f3e99685: Pull complete 
dffc1412b7c8: Pull complete 
d550bb6d1800: Pull complete 
Digest: sha256:0c86dddac19f2ce4fd716ac58c0fd87bf69bfd4edabfd6971fb885bafd12a00b
Status: Downloaded newer image for nginx:latest
973cd14bd95909fc9f3aedf6be9857e17afdcd1eececad26976b047c784b3412
```

### Verificar que todo esta funcionando correctamente

#### Servidor NGINX

Verifica el comportamiento en:

```bash
http://localhost:8081
```

```bash
http://localhost:8082
```

```bash
http://localhost
```

```bash
http://localhost:80
```

Describe lo que esta sucediendo.

Realiza el despliegue de la aplicación `sample` como se describe en el siguiente [enlace](../tarea-3/README.md).

Repite los pasos del apartado anterior comprobando los puertos `8081`,`8082` y `80` de `localhost`.


### **Detener y eliminar contenedores**

Cuando termines de trabajar con CloudBeaver/MariaBD, puedes detener y eliminar el contenedor con los siguientes comandos:

```bash
docker stop <nombre-contenedor>
```

> Para eliminar un contenedor
>
>```bash
>docker rm <nombre-contenedor>
>```


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
