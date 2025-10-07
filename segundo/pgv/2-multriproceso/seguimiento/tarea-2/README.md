# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Ejecución de procesos del sistema con Spring Boot")

## Objetivo

Construir una aplicación **Spring Boot (CLI)** que:

- Lea una lista de comandos desde un **fichero de texto** (`commands.txt`).
- Ejecute cada comando usando `ProcessBuilder`.
- Capture `stdout`, `stderr`, `exitCode` y duración (`durationMs`).
- Guarde los resultados en un fichero de log (`runs.log.jsonl`) en formato **JSON Lines**.
- Muestre en consola un resumen de cada ejecución.

## Pasos a seguir

1. Crear un proyecto **Spring Boot simple** (sin web ni DB).
2. Configurar un `ApplicationRunner` que se ejecute al arrancar la app.
3. Implementar:
   - **@Repository** → Leer comandos desde `commands.txt`.
   - **@Component** → Ejecutar procesos con `ProcessBuilder`.
   - **@Repository** → Escribir resultados en `runs.log.jsonl`.
   - **@Service** → Orquestar todo: leer, ejecutar, truncar, guardar y mostrar resumen.
4. Ejecutar la aplicación y comprobar:
   - Consola → resumen de cada ejecución.
   - Fichero `runs.log.jsonl` → resultados completos.

## ¿Qué hace?

- Lee comandos desde un fichero `commands.txt`.
- Ejecuta cada comando usando `ProcessBuilder`.
- Captura salida estándar (`stdout`), errores (`stderr`), código de salida (`exitCode`) y tiempo de ejecución (`durationMs`).
- Guarda los resultados en `runs.log.jsonl` en formato **JSON Lines**.
- Muestra en consola un **resumen** de cada ejecución.

---

## Pasos para probarlo

1. Crea un proyecto **Spring Boot simple** (starter básico, sin web).
2. Añade un fichero `commands.txt` en la raíz del proyecto con un comando por línea.
3. Ejecuta la aplicación con:

    ```bash
    mvn spring-boot:run
    ```

4. Comprueba:
   - Consola → muestra un resumen de cada comando.
   - Fichero `runs.log.jsonl` → contiene el log detallado en formato JSON.

## Ejemplo de `commands.txt` (Linux/macOS)

```bash
# Listado largo del directorio actual
ls -l
# Mostrar la fecha del sistema
date
# Crear un directorio temporal
mkdir -p temp_folder
# Listar procesos de Java (si hay)
ps aux | grep java
# Intentar listar un directorio inexistente (fallará)
ls carpeta_inexistente
```

---

## Ejemplo de `commands.txt` (Windows)

```bash
# Listar archivos en el directorio actual
cmd /c dir
# Mostrar fecha y hora
cmd /c echo %date% %time%
# Crear un directorio temporal
cmd /c mkdir temp_folder
# Ver procesos activos
tasklist
# Intentar mostrar un archivo que no existe (fallará)
cmd /c type archivo_inexistente.txt
```

---

## Ejemplo de salida en consola

```bash
=== Ejecutando comandos desde commands.txt ===
[OK   ] ls -l (exit=0, 12ms)
[OK   ] date (exit=0, 3ms)
[OK   ] mkdir -p temp_folder (exit=0, 2ms)
[OK   ] ps aux | grep java (exit=0, 40ms)
[FAIL ] ls carpeta_inexistente (exit=2, 4ms)
=== Fin de ejecuciones ===
```

---

## Ejemplo de línea en `runs.log.jsonl`

```json
{
  "timestamp":"2025-10-07T10:15:30Z",
  "command":"ls -l",
  "exitCode":0,
  "durationMs":15,
  "stdout":"total 4\n-rw-r--r--  1 user  staff   0 Oct  7 10:15 file.txt\n",
  "stderr":""
}
```

---

## Estructura de capas en Spring

- **@Repository**  
  - `FileCommandRepository` → lee los comandos de `commands.txt`.  
  - `FileRunLogRepository` → guarda resultados en `runs.log.jsonl`.  

- **@Component**  
  - `ProcessLauncher` → ejecuta los procesos con `ProcessBuilder`.  

- **@Service**  
  - `JobService` → orquesta la lógica: ejecuta, aplica timeout, trunca salida, guarda en log y devuelve resultados.  

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
