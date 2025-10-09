# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Ejecución de procesos del sistema con Spring Boot")

## Objetivo

Construir una aplicación **Spring Boot (CLI)**  que **lanza procesos del sistema operativo** (Linux/Windows), captura **stdout/stderr** en tiempo real, aplica **timeout**, y **persiste** el historial de ejecuciones en **ficheros JSONL**, todo usando una **arquitectura por interfaces** con **@Component, @Service y @Repository**.

## ¿Qué puedes hacer?

- Ejecutar tareas y portables por SO:
  - `PING` — `ping -c/-n`
  - `LIST_DIR` — `ls -la` / `cmd /c dir`
  - `HASH_SHA256` — `sha256sum` / `certutil -hashfile ... SHA256`
- Ver la salida en **tiempo real** (con prefijos `[OUT]`/`[ERR]`).
- Definir **timeout** (ms); si expira, se marca `TIMEOUT` y se mata el proceso.
- Guardar **stdout/stderr** en ficheros (`app.logs-dir`), y **metadatos** en `data/jobs.jsonl`.
- Consultar el **resumen** (PID, exit code, estado) al finalizar cada ejecución.
- REPL que **permanece** corriendo hasta **Ctrl+C**.

## Arquitectura (puertos & adaptadores)

- **domain/**
  - `Job`, `JobStatus`, `JobType`.
- **interfaces**:
  - `ICommandFactory` (**@Component**) — traduce `JobType`+params a **List<String>** según SO.
  - `IProcessExecutor` (**@Service**) — ejecuta el proceso, captura streams y devuelve `Result`.
  - `ILogStorage` (**@Component**) — resuelve rutas de logs y utilidades (tail).
  - `IJobRepository` (**@Repository**) — persiste/lee `Job` en almacenamiento **fichero (JSON)**.
- **services/**
  - `JobService` (**@Service**) — orquesta: prepara logs, invoca `ProcessExecutor`, actualiza y persiste `Job`.
- **cli/**
  - `ConsoleRunner` (**@Component**, `CommandLineRunner`) — REPL (`run ...`) y gestión de Ctrl+C.

Diagrama resumido:

```console
ConsoleRunner --> JobService --> (CommandFactory + ProcessExecutor + LogStorage + JobRepository)
```

## Ejecutar

```bash
mvn clean spring-boot:run
```

Prompt:

```console
=== Lanzador de Procesos (CLI) Linux/Windows ===
Comandos:
  run PING host=8.8.8.8 count=4 timeoutMs=15000
  run LIST_DIR path=.
  run HASH_SHA256 file=README.md
  help | os | exit
```

### Ejemplos

```console
run PING host=8.8.8.8 count=4
run LIST_DIR path=.
run HASH_SHA256 file=README.md timeoutMs=5000
```

## Configuración

- `app.logs-dir` (por defecto `logs/`)
- `app.data-dir` (por defecto `data/`)
- `app.default-timeout-ms` (por defecto `10000`)

## Detalles de implementación

- `ProcessExecutor` usa `ProcessBuilder`, consume **stdout**/**stderr** con *gobblers* asíncronos y aplica `waitFor(timeout)`; si expira, `destroy()` + `destroyForcibly()`.
- `JobRepository` escribe `Job` como **JSONL** (`data/jobs.jsonl`), con un `id` UUID y marcas de tiempo ISO-8601.
- `LogStorage` organiza logs por día (`logs/yyyy-MM-dd/`) y ofrece `tail()` para mostrar las últimas N líneas en el resumen.

## Cerrar la app

Pulsa **Ctrl+C** o escribe `exit`.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
