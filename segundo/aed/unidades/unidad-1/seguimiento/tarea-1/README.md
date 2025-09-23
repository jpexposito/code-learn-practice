# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Acceso a Datos: "Ficheros")

> **Contexto:** Trabaja sin root en `~/dam/php-ficheros/`.  
> Para cada ejercicio se incluye: **Enunciado**, **Funciones/Comandos PHP sugeridos** y **Entrega esperada**.  
> Ejecuta desde terminal: `php ejercicioXX.php`.

---

## ✅ Preparación

```bash
mkdir -p ~/dam/php-ficheros
cd ~/dam/php-ficheros
php -v
```

Crea un fichero por ejercicio: `ejercicio01.php` … `ejercicio30.php`.

---

## 1) Hola fichero (crear y leer)

**Enunciado:** Crea un fichero `datos.txt` con el texto *"Hola Mundo desde PHP"* y, a continuación, léelo y muestra su contenido por pantalla.  
**Funciones/Comandos PHP sugeridos:** `file_put_contents`, `file_get_contents`  
**Entrega esperada:** Script que crea el archivo si no existe y muestra el contenido leído.

---

## 2) Escribir en modo *append*

**Enunciado:** Abre `datos.txt` en modo **append** y añade la línea *"Nueva entrada"*. Muestra después cuántos bytes se escribieron.  
**Funciones/Comandos PHP sugeridos:** `fopen("a")`, `fwrite`, `fclose`  
**Entrega esperada:** Salida con número de bytes añadidos y verificación de que el texto quedó al final.

---

## 3) Leer línea a línea

**Enunciado:** Lee `datos.txt` línea a línea numerando solo las líneas no vacías.  
**Funciones/Comandos PHP sugeridos:** `fopen`, `fgets`, `feof`, `trim`  
**Entrega esperada:** Listado numerado sin líneas en blanco.

---

## 4) Existencia y tamaño

**Enunciado:** Comprueba si `datos.txt` existe. Si no, créalo. Muestra su tamaño en bytes y vuelve a medir tras añadir una línea para verificar el cambio.  
**Funciones/Comandos PHP sugeridos:** `file_exists`, `filesize`, `clearstatcache`, `file_put_contents`  
**Entrega esperada:** Mensajes con los tamaños antes y después.

---

## 5) Copiar y renombrar

**Enunciado:** Copia `datos.txt` a `copia_datos.txt` y renómbralo a `respaldo.txt` sin sobreescribir si ya existen.  
**Funciones/Comandos PHP sugeridos:** `copy`, `rename`, `file_exists`  
**Entrega esperada:** Mensajes confirmando la copia y el renombrado (o aviso si ya existen).

---

## 6) Eliminar con seguridad

**Enunciado:** Mueve `respaldo.txt` a una carpeta `trash/` y elimínalo desde allí, si existe.  
**Funciones/Comandos PHP sugeridos:** `is_file`, `mkdir`, `rename`, `unlink`  
**Entrega esperada:** Confirmación de borrado desde `trash/` o aviso si no existía.

---

## 7) Listar ficheros de la carpeta

**Enunciado:** Lista el contenido del directorio actual separando **[DIR]** y **[FILE]**. Para archivos, muestra también el tamaño en bytes.  
**Funciones/Comandos PHP sugeridos:** `scandir`, `is_dir`, `is_file`, `filesize`  
**Entrega esperada:** Listado formateado de entradas.

---

## 8) Mini “notas.txt” (CLI)

**Enunciado:** Solicita una nota por consola (STDIN) y añádela a `notas.txt` con la fecha/hora ISO‑8601.  
**Funciones/Comandos PHP sugeridos:** `fgets(STDIN)`, `trim`, `fopen("a")`, `fwrite`, `date('c')`  
**Entrega esperada:** Línea añadida en `notas.txt` con sello temporal.

---

## 9) Leer todo con `file()`

**Enunciado:** Carga todas las líneas de `notas.txt` en un array, ordénalas alfabéticamente y muéstralas numeradas.  
**Funciones/Comandos PHP sugeridos:** `file`, `sort`, `foreach`  
**Entrega esperada:** Listado numerado y ordenado.

---

## 10) CSV simple (escritura)

**Enunciado:** Genera `usuarios.csv` con cabecera `id,nombre,email` y 3 filas de ejemplo. Valida que el email contenga `@` antes de escribir.  
**Funciones/Comandos PHP sugeridos:** `fopen("w")`, `fputcsv`, `strpos`  
**Entrega esperada:** Archivo CSV válido con 4 líneas (1 cabecera + 3 filas).

---

## 11) CSV simple (lectura)

**Enunciado:** Lee `usuarios.csv` y renderiza su contenido en una tabla HTML `<table>`. Destaca en **negrita** los emails que acaban en `@mail.com`.  
**Funciones/Comandos PHP sugeridos:** `fopen`, `fgetcsv`, `htmlspecialchars`, `str_ends_with`  
**Entrega esperada:** HTML con tabla y estilos aplicados a las filas o celdas pertinentes.

---

## 12) Archivo INI de configuración

**Enunciado:** Si no existe `config.ini`, créalo con al menos dos claves (p. ej. `theme=dark` y `lang=es`). Lée el INI y muestra las opciones.  
**Funciones/Comandos PHP sugeridos:** `file_exists`, `file_put_contents`, `parse_ini_file`  
**Entrega esperada:** Mostrar el array resultante del INI.

---

## 13) JSON básico

**Enunciado:** Guarda un array asociativo en `data.json` (con `JSON_PRETTY_PRINT`) y recupéralo comprobando posibles errores de decodificación.  
**Funciones/Comandos PHP sugeridos:** `json_encode`, `file_put_contents`, `file_get_contents`, `json_decode`, `json_last_error_msg`  
**Entrega esperada:** Impresión legible del array recuperado o mensaje de error.

---

## 14) Contar palabras

**Enunciado:** Cuenta cuántas palabras hay en `datos.txt` (normaliza a minúsculas y elimina signos). Muestra el **top‑3** de palabras más frecuentes.  
**Funciones/Comandos PHP sugeridos:** `file_get_contents`, `preg_replace`, `str_word_count`, `array_count_values`, `arsort`  
**Entrega esperada:** Total de palabras y listado top‑3 con frecuencia.

---

## 15) Buscar y reemplazar

**Enunciado:** Reemplaza todas las ocurrencias de `PHP` por `php (actualizado)` en `datos.txt` e indica cuántas sustituciones se han hecho.  
**Funciones/Comandos PHP sugeridos:** `file_get_contents`, `str_replace`, `file_put_contents`  
**Entrega esperada:** Mensaje con el número de sustituciones y contenido actualizado.

---

## 16) Dividir en partes de N líneas

**Enunciado:** Divide `datos.txt` en ficheros `parte_1.txt`, `parte_2.txt`, … con **N** líneas cada uno (N por CLI, por defecto 10).  
**Funciones/Comandos PHP sugeridos:** `fopen`, `fgets`, `feof`, `$argv`  
**Entrega esperada:** Archivos `parte_X.txt` creados con el tamaño de bloque correcto.

---

## 17) *Logger* con rotación

**Enunciado:** Añade una línea a `log.txt` con fecha (`date('c')`) y nombre del script. Si el log supera **100 KB**, róta el archivo renombrándolo con un sufijo de fecha.  
**Funciones/Comandos PHP sugeridos:** `filesize`, `rename`, `file_put_contents(FILE_APPEND)`  
**Entrega esperada:** Línea añadida y rotación ejecutada cuando corresponda.

---

## 18) Descarga HTTP a fichero

**Enunciado:** Descarga el contenido de una URL (parámetro CLI) y guarda el HTML en `pagina.html`. Si falla, **reintenta 3 veces** con 1 segundo de espera.  
**Funciones/Comandos PHP sugeridos:** `file_get_contents`, control de errores con `@`, `sleep`, `file_put_contents`  
**Entrega esperada:** Archivo `pagina.html` con contenido o mensaje de error tras 3 intentos.

---

## 19) Buscador en texto (*grep*)

**Enunciado:** Busca en `notas.txt` las líneas que contengan una palabra (CLI). Ignora mayúsculas/minúsculas y muestra nº de línea y contenido.  
**Funciones/Comandos PHP sugeridos:** `file`, `preg_match`, `preg_quote`, `stripos`  
**Entrega esperada:** Listado de coincidencias con su índice de línea.

---

## 20) Carpeta de *snippets*

**Enunciado:** Crea un directorio `snippets/`, guarda dentro 3 ficheros `snip1.txt`…`snip3.txt` y lista su contenido.  
**Funciones/Comandos PHP sugeridos:** `mkdir`, `file_put_contents`, `scandir`  
**Entrega esperada:** Directorio creado, ficheros generados y listado por pantalla.

---

## 21) Limpiar nombres de fichero

**Enunciado:** Renombra todos los `.txt` del directorio reemplazando espacios por guiones y eliminando acentos/diacríticos. Muestra un informe “antes → después”.  
**Funciones/Comandos PHP sugeridos:** `iconv('ASCII//TRANSLIT')`, `preg_replace`, `rename`, `glob`  
**Entrega esperada:** Reporte de renombrados realizados.

---

## 22) Copia recursiva

**Enunciado:** Copia recursivamente el directorio `snippets/` a `backup/snippets/` conservando la estructura de carpetas. Cuenta cuántos archivos se copiaron.  
**Funciones/Comandos PHP sugeridos:** `RecursiveDirectoryIterator`, `RecursiveIteratorIterator`, `is_dir`, `mkdir`, `copy`  
**Entrega esperada:** Mensaje con el total de archivos copiados y verificación del destino.

---

## 23) Ficheros grandes

**Enunciado:** Busca en el directorio actual los ficheros mayores que **X bytes** (CLI) y muestra el **top‑5** más grandes con su ruta relativa.  
**Funciones/Comandos PHP sugeridos:** `RecursiveDirectoryIterator`, `filesize`, `arsort`  
**Entrega esperada:** Lista ordenada y filtrada por tamaño.

---

## 24) Editor mínimo por consola

**Enunciado:** Implementa un editor sencillo: abre/crea un fichero cuyo nombre llega por CLI; añade líneas desde STDIN hasta línea vacía; guarda y sale.  
**Funciones/Comandos PHP sugeridos:** `fopen("a+")`, `fgets(STDIN)`, `fwrite`  
**Entrega esperada:** Archivo editado/creado con el contenido tecleado.

---

## 25) Historial de comandos

**Enunciado:** Crea `hx.php` que registre en `hx.log` cada invocación: fecha/hora, usuario y la línea completa de comandos pasada a `hx.php`.  
**Funciones/Comandos PHP sugeridos:** `implode`, `array_slice`, `escapeshellarg`, `getenv`, `file_put_contents(FILE_APPEND)`  
**Entrega esperada:** Nuevas entradas en `hx.log` por cada ejecución.

---

## 26) Índice HTML de carpeta

**Enunciado:** Genera `index.html` con una tabla que liste **nombre**, **tamaño** y **fecha** de cada archivo del directorio; enlaza el nombre al propio archivo y ordena por fecha (desc).  
**Funciones/Comandos PHP sugeridos:** `scandir`, `htmlspecialchars`, `filesize`, `filemtime`, `usort`/`usort con <=>`  
**Entrega esperada:** Archivo `index.html` navegable y correctamente ordenado.

---

## 27) Mini‑CRUD con CSV

**Enunciado:** Implementa un CRUD de consola sobre `db.csv` con comandos `add <id> <nombre>`, `list`, `delete <id>`. Usa escritura segura (tmp + rename).  
**Funciones/Comandos PHP sugeridos:** `fopen`, `fputcsv`, `fgetcsv`, `rename`, manejo de `$argv`  
**Entrega esperada:** Operaciones funcionales y persistentes en `db.csv`.

---

## 28) Monitor de cambios

**Enunciado:** Vigila `datos.txt` y cada vez que cambie su `filemtime`, imprime “¡modificado!” y guarda un registro en `watch.log` con hora.  
**Funciones/Comandos PHP sugeridos:** `filemtime`, `clearstatcache`, `sleep`, bucle `while`  
**Entrega esperada:** Mensajes en consola y nuevas líneas en `watch.log` ante cambios.

---

## 29) Compactar a ZIP

**Enunciado:** Crea `backup.zip` que incluya todos los `.txt` del directorio, excluyendo `log.txt` y el propio `backup.zip`.  
**Funciones/Comandos PHP sugeridos:** `ZipArchive`, `RecursiveDirectoryIterator`, `RecursiveIteratorIterator`  
**Entrega esperada:** Archivo ZIP creado y verificable.

---

## 30) Proyecto final — Gestor de notas

**Enunciado:** Construye un CLI para **notas** con subcomandos:  

- `add "texto"` → agrega a `notas.txt` y añade entrada JSON en `notas.json`.  
- `list` → muestra notas numeradas.  
- `export csv` → genera `notas.csv` (idx, texto).  
- `find palabra` → busca coincidencias.  
- `stats` → muestra nº de notas, nº total de palabras y top‑3 de palabras.  
**Funciones/Comandos PHP sugeridos:** `file_put_contents`, `file_get_contents`, `fputcsv`, `scandir`, `json_encode/json_decode`, `array_count_values`, `arsort`  
**Entrega esperada:** Scripts que ejecuten cada subcomando y generen/usen los ficheros correspondientes.

---

## 📝 Consejos de evaluación
- Muestra mensajes claros de éxito/error.  
- Valida entradas del usuario (CLI/STDIN).  
- Controla errores de E/S y JSON.  
- Incluye comentarios breves explicando decisiones.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
