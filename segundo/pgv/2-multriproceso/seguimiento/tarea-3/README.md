# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Ejecución de procesos del sistema con Spring Boot")

## Objetivo

Construir una aplicación **Spring Boot (CLI)**  que **lanza procesos del sistema operativo** (Linux), captura **stdout/stderr** en tiempo real, y **persiste** el historial de ejecuciones en **ficheros .txt**, todo usando una **arquitectura por interfaces** con **@Component, @Service y @Repository**.

## ¿Qué puedes hacer?

- Ejecutar tareas y portables por SO:
  - lsof -i
  - top
  - ps aux | head
- Ver la salida en **tiempo real** (con prefijos `[OUT]`/`[ERR]`).
- Guardar **stdout/stderr** en ficheros (`con extensión .txt`).

## Arquitectura

Para la arquitectura ten en cuenta:

- **domain/**: Elementos de dominio si se definen, por ejemplo la clase Job.
- **repositories/interfaces**: Definición de la interface del repositorio que almacena la información.
- **repositories**: Implementación del repositorio que realiza las operaciones necesarias de almacenamiento en el fichero.
- **services/interfaces**: Definión de las interfaces de los servicios de cada uno de los comandos que debe de soportar la aplicación.
- **services/**: Implementación de los servicios de cada uno de los comandos que debe de soportar la aplicación.
- **controlers/**: Controlador principal que lanza la aplicación.

## Ejecutar

```bash
mvn clean spring-boot:run
```

Prompt propuesto:

```console
=== Lanzador de Procesos (CLI) Linux ===
Comandos:
  lsof -i
  top
  ps aux | head 
```

## Cerrar la app

Pulsa **Ctrl+C**.

## Arquitectura de paquetes propuesta

```text
com.docencia.dam
├─ domain/
│  └─ Job.java
├─ repositories/
│  ├─ interfaces/
│  │  └─ JobRepository.java
│  └─ file/
│     └─ FileJobRepository.java
├─ services/
│  ├─ interfaces/
│  │  ├─ CommandService.java
│  │  ├─ LsofService.java
│  │  ├─ TopService.java
│  │  └─ PsHeadService.java
│  └─ impl/
│     ├─ LsofServiceImpl.java
│     ├─ TopServiceImpl.java
│     └─ PsHeadServiceImpl.java
├─ controllers/      (controlador CLI)
│  └─ CliController.java
└─ ProcCliApplication.java
```

- **ProcCliApplication.java**. Clase configurada en el arranque de **Spring-Boot**. Puede tener otro nombre, depende del momento de contrucción de la solución.
- **CliController.java**. Muestra el menú y lanza el programa.
- El resto del elemento descritos realiza el procesamiento, tratamiento y almacenamiento de la información del proceso que se pretende lanzar.

>**IMPORTANTE**: si un proceso no se ajusta a los parámetros de entrada o no esta la lista de procesos permitidos, debe de generar un error y lanzar a través de consola este, y almancenar la imformación. Por ejemplo, lanzar un **ls -la**.
>**Test de verificación: Genera al menos la verificación del 80% del código de la aplicación resultante. Para verificar el % conseguido integra dentro a [jacoco](https://www.baeldung.com/jacoco).
>**Documentación**. Recuerda documentar las clases que construyas de forma adecuada.

## Referencias y ayuda

- Ejercicio desarrollado en clase.
- [Lanzamiento de procesos en Java](https://github.com/jpexposito/code-learn/blob/main/segundo/pgv/2-multriproceso/PROCESOS-JAVA.md).
- [Manipulación de ficheros](https://github.com/jpexposito/code-learn/blob/main/segundo/aed/unidades/unidad-1/Manipulacion-ficheros-Files.md).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
