# <img src=../../../images/computer.png width="40"> Code, Learn & Practice(Docker: Construcción de una solución basada en servicios)

Siguiendo la solución realizada en la [tarea anterior](../tarea-7/). Se pide construir la solución propuesta en la siguiente imagen.

<img src="../images/solucion-servicios.png" width="800px">

---

## Objetivo

El objetivo de este ejercicio es crear un entorno con Docker que incluya dos servidores `Tomcat`, una base de datos `MariaDB` y una `bbdd no sql` y así como los clientes para acceder a ambas bases de datos. Para esto, configuraremos los contenedores con redes personalizadas y un `volumen común` para persistir datos.

## Docker Compose

**Docker Compose** es una herramienta que permite definir y ejecutar aplicaciones de Docker de múltiples contenedores. A través de un archivo YAML (generalmente llamado `docker-compose.yml`), puedes definir todos los servicios, redes y volúmenes que tu aplicación necesita. Docker Compose facilita la orquestación de contenedores, permitiendo gestionar proyectos más complejos que requieren la interacción de varios contenedores.

---

### ¿Por qué usar Docker Compose?

En muchos casos, las aplicaciones modernas consisten en varios componentes que se ejecutan en contenedores independientes. Esto puede incluir bases de datos, servidores web, aplicaciones backend, y más. Docker Compose facilita la gestión de estas aplicaciones multicontenedor de manera simple y eficiente. Algunas de las razones para usar Docker Compose son:

- **Orquestación de múltiples contenedores**: Puedes definir, ejecutar y administrar múltiples contenedores a la vez.
- **Automatización**: Facilita la configuración de servicios y redes entre contenedores, evitando tener que configurar manualmente cada uno de ellos.
- **Desarrollo local**: Permite a los desarrolladores crear entornos completos de desarrollo local con solo un comando.
- **Portabilidad**: Puedes definir entornos consistentes que se pueden compartir fácilmente entre diferentes máquinas o equipos de desarrollo.

---

### Componentes principales de Docker Compose

Docker Compose utiliza un archivo YAML donde se definen los siguientes componentes principales:

#### 1. **Version**:

Define la versión del archivo de configuración de Docker Compose. Asegura que se utilicen las características adecuadas de Docker y Docker Compose.

#### 2. **Services**:

Especifica los contenedores que formarán parte de la aplicación. Cada servicio corresponde a un contenedor y puede incluir configuraciones como:

- **Imagen** del contenedor.
- **Puertos** que deben exponerse.
- **Volúmenes** que deben montarse.
- **Variables de entorno** necesarias para la configuración del contenedor.

#### 3. **Volumes**:

Define los volúmenes persistentes que se utilizan para almacenar datos entre reinicios de contenedores. Esto es útil para bases de datos o cualquier servicio que necesite almacenar datos.

#### 4. **Networks**:

Configura redes personalizadas para que los contenedores puedan comunicarse entre sí. Esto es útil cuando se necesita aislar los contenedores de otros servicios externos.

---

### ¿Cómo funciona Docker Compose?

Docker Compose funciona con los siguientes pasos:

1. **Definir la configuración**: Crear un archivo `docker-compose.yml` que describa los contenedores, sus redes y volúmenes necesarios.
2. **Levantar los contenedores**: Usando el comando `docker-compose up`, Docker Compose descargará las imágenes necesarias, creará los contenedores y los levantará según la configuración especificada.
3. **Escalar y gestionar servicios**: Docker Compose permite escalar servicios (por ejemplo, ejecutar múltiples instancias de un contenedor) y gestionar su ciclo de vida, como detener, reiniciar o eliminar contenedores.
4. **Conexión entre servicios**: Los contenedores definidos en Docker Compose pueden interactuar entre sí fácilmente a través de redes configuradas en el archivo `docker-compose.yml`.

---

### Ejemplo básico de un archivo `docker-compose.yml`

```yaml
version: '3.9'

services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
```

---

En este ejemplo:

- Se definen dos servicios: un contenedor web que usa la imagen de `Nginx` y un contenedor db que usa la imagen de `MySQL`.
- web expone el puerto `8080` en la máquina anfitriona para acceder al servidor web.
- db configura una variable de entorno para establecer la contraseña del usuario root de la base de datos.

## Realiza

- Crear una solución Docker personalizada para los contenedores.
- Crear un conjunto de contenedores Tomcat para desplegar las aplicaciones web.
- Crear un contenedor MariaDB para gestionar la base de datos.
- Crear un contenedor Mongodb para gestionar la base de datos no sql.
- Utilizar un volumen común para persistir los datos de la base de datos.

---

## Pasos

### Paso 1: Crea la red personalizada

Primero, crea una red Docker personalizada para que los contenedores puedan comunicarse entre sí.

```bash
docker network create my_network
```

>***Importante***: *Sustituye my_network por otro nombre*.

### Paso 2: Crear un volumen común

Luego, crea un volumen Docker para persistir los datos.

```bash
docker volume create my_db_volume
```

>***Importante***: *Sustituye my_db_volume por otro nombre*.

### Paso 3: Crear el Dockerfile

A continuación, creamos un Dockerfile que instalará Tomcat, MariaDB y CloudBeaver.

```bash
# Usar una imagen base de Ubuntu para las instalaciones adicionales
FROM ubuntu:20.04

# Instalar dependencias necesarias (como wget y curl)
RUN apt-get update -y && \
    apt-get install -y \
    wget \
    curl \
    unzip \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*
...
```

### Paso 4: Construir y ejecutar la imagen

Para construir la imagen desde el Dockerfile, usa el siguiente comando:

```bash
docker build -t solucion-servicios .
```

Lista los contenedores que tienes en tu equipo:

```bash
docker ps -a 
```

Luego, para ejecutar el contenedor que contiene Tomcat, MariaDB,CloudBeaver, etc y usa:

```bash
docker run -d -p 8080:8080 -p ... solucion-servicios
```  

### **Detener y eliminar contenedores**

Cuando termines de trabajar, puedes detener y eliminar el contenedor con los siguientes comandos:

```bash
docker stop <nombre-contenedor>
```

> Para eliminar un contenedor
>
>```bash
>docker rm <nombre-contenedor>
>```

---

## Demuestra el funcionamiento

Demuestra el funcionamiento de los `tomcat` desplegando la aplicación `sample`. De la misma forma demuestra la conexión a las `bbdd` a conectando a través de los clientes. 

## Referencias

- [Tarea 7 (Construcción de Docker)](../tarea-7/).
- [Tarea 6 (BBDD No Relacionales)](../tarea-6/).
- [Tarea 5 (Balanceo de Carga)](../tarea-5/).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
