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
docker run -d --name tomcat2 --network tomcat-network -p 8082:8080 tomcat:latest
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
