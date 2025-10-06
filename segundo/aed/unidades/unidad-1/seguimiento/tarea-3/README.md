# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Acceso a Datos: "Trabajo con ficheros interfaz gráfica")

<img src="https://laruletagiratoria.com/wp-content/uploads/ahorcado.jpg" width="200">

## Preparación

- Descarga el fichero ahorcado.zip que se encuentra dentro de la carpeta recursos.
- Descarga, ejecuta y verifica el correcto funcionamiento. Coloca la carpeta `ahorcado` en el proyecto `docker-php-proyect`, en la carpeta `public`.

  > **Verifica el corrrecto funcionamiento** accediendo a `http:localhost:8080\ahorcado\index.php`.

- Crea un repositorio dentro de github (`https://github.com/tu-usuario/ahorcado`))

- Crea una rama llamada `v1`.
- Genera un README.md para la documentación de proyecto
  
- Diseña un `mock` con [drawio](https://www.drawio.com/), e integra en la carpeta `images`.

## Repositorio en GitHub

Crea un nuevo repo vacío en: <https://github.com/tu-usuario/ahorcado>  
En tu terminal:

```bash
git init
git add .
git commit -m "feat: bootstrap proyecto ahorcado"
git branch -M main
git remote add origin https://github.com/tu-usuario/ahorcado.git
git push -u origin main
```

### Crear rama `v1`

```bash
git checkout -b v1
git push -u origin v1
```

## Mock/UI con draw.io

- Diseña un mock sencillo (estructura de la vista: palabra enmascarada, input de letra, botones, dibujo).
- Guarda el fichero como `images/mock.drawio.png` y exporta un PNG/SVG como `images/mock.drawio.png`.
- Añade al repo:

```bash
git add images/mock.drawio.png
git commit -m "docs: añade mock de la interfaz de la solución"
```

---

## Estructura de la solución

```code
ahorcado/
├─ public/
│  └─ index.php
├─ src/
│  ├─ Game.php
│  ├─ WordProvider.php
│  ├─ Storage.php
│  └─ Renderer.php
├─ data/
│  └─ words.txt              # lista de palabras (una por línea)
├─ images/
│  ├─ mock.drawio.png
├─ tests/
├─ .gitignore
├─ README.md                 # este archivo
```

### gitignore

```code
/vendor
/.DS_Store
/.idea
/.vscode
```

## Juego

El juego debe de tener el siguiente diagrama de realaciones de clases

```code
WordProvider  ──►  Game  ◄── Storage
       │               │
       └──────────────►│
                       │
                   Renderer
```

- **WordProvider**: obtiene palabras desde ficheros u otras fuentes.
- **Game**: encapsula la lógica del juego (estado, intentos, victoria/derrota).
- **Storage**: maneja la persistencia del estado (sesiones).
- **Renderer**: dibuja el ahorcado en ASCII según intentos restantes.

---

### Clase: `Game`

**Responsabilidad:** Gestionar la partida.

### Estado interno

- `string $word` — palabra objetivo en MAYÚSCULAS.
- `int $maxAttempts` — número máximo de intentos.
- `int $attemptsLeft` — intentos restantes.
- `string[] $usedLetters` — letras jugadas.

#### Métodos

- `__construct(string $word, int $maxAttempts = 6, ?array $state = null)`  
  Inicializa o restaura estado.
- `guessLetter(string $letter): void`  
  Procesa una letra, resta intentos si falla.
- `getMaskedWord(): string`  
  Devuelve la palabra con guiones bajos y letras descubiertas.
- `getAttemptsLeft(): int`  
  Retorna intentos restantes.
- `getUsedLetters(): array`  
  Retorna letras ya jugadas.
- `isWon(): bool`  
  Verdadero si la palabra fue adivinada.
- `isLost(): bool`  
  Verdadero si no quedan intentos y no ganó.
- `getWord(): string`  
  Devuelve la palabra completa.
- `toState(): array`  
  Serializa estado (para guardar en sesión).

### Implementación de la clase

```php
/**
 * Clase Game
 * @autor jpexposito
 * Gestiona el estado y la logica del juego del Ahorcado.
 */
final class Game
{
    private array $usedLetters;

    private string $word;

    private int $maxAttempts;

    private int $attemptsLeft;

    /**
     * Constructor
     *
     * @param string               $word        Palabra objetivo en MAYUSCULAS
     * @param int                  $maxAttempts Numero maximo de intentos (por defecto 6)
     * @param array<string,mixed>|null $state   Estado serializado para restaurar partida
     */
    public function __construct(string $word, int $maxAttempts = 6, ?array $state = null)
    {
        /**
         * implementacion de codigo
         */ 
    }

    /**
     * Procesa un intento de letra
     *
     * - Normaliza a MAYUSCULA
     * - Ignora entradas invalidas o repetidas
     * - Resta intentos si la letra no pertenece a la palabra
     *
     * @param string $letter Letra propuesta
     * @return void
     */
    public function guessLetter(string $letter): void
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Devuelve la palabra enmascarada con guiones bajos y letras acertadas
     *
     * @return string Palabra enmascarada separada por espacios (p. ej., "C _ S A")
     */
    public function getMaskedWord(): string
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Obtiene el numero de intentos restantes
     *
     * @return int Intentos restantes
     */
    public function getAttemptsLeft(): int
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Devuelve las letras ya jugadas
     *
     * @return string[] Letras usadas en MAYUSCULAS
     */
    public function getUsedLetters(): array
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Indica si la partida esta ganada
     *
     * @return bool true si la palabra está completamente descubierta, false en caso contrario
     */
    public function isWon(): bool
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Indica si la partida esta perdida
     *
     * @return bool true si no quedan intentos y no se gano, false en caso contrario
     */
    public function isLost(): bool
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Devuelve la palabra objetivo completa
     *
     * @return string Palabra en MAYÚSCULAS
     */
    public function getWord(): string
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Serializa el estado relevante de la partida para persistir en sesión
     *
     * @return array{attemptsLeft:int, usedLetters: string[]}
     */
    public function toState(): array
    {
        /**
         * implementacion de codigo
         */
    }
```

---

### Clase: `WordProvider`

**Responsabilidad:** Proveer palabras para el juego.

#### Estado interno

- `string $filePath` — fichero de palabras.

#### Métodos

- `__construct(string $filePath)`  
  Configura la fuente de palabras.
- `randomWord(): string`  
  Retorna palabra aleatoria (mayúsculas, limpia de acentos).

### Implementación de la clase

```php
/**
 * Clase WordProvider
 * @jpexposito
 * Proporciona palabras desde un fichero (u otra fuente) en MAYUSCULAS y sin acentos.
 */
final class WordProvider
{

    private string $filePath;

    public function __construct(string $filePath)
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Obtiene una palabra aleatoria
     *
     * @return string Palabra en MAYUSCULAS y sin acentos/diacriticos
     * @throws \RuntimeException Si el fichero no es legible o esta vacio
     */
    public function randomWord(): string
    {
        /**
         * implementacion de codigo
         */
    }

    /**
     * Normaliza texto eliminando acentos y caracteres no alfabéticos A-Z
     *
     * @param string $text Texto de entrada
     * @return string Texto normalizado
     */
    private function normalize(string $text): string
    {
        /**
         * implementacion de codigo
         */
    }
}
```

---

### Clase: `Storage`

**Responsabilidad:** Persistir estado en la sesión.

#### Estado interno

- `string $key` — clave de namespacing en `$_SESSION`.

#### Métodos

- `__construct(string $key = 'ahorcado')`  
  Inicializa sesión y espacio de datos.
- `get(string $name, $default = null)`  
  Recupera valor o `$default`.
- `set(string $name, $value): void`  
  Guarda valor.
- `reset(): void`  
  Elimina estado almacenado.

### Implementación de la clase

```php
/**
 * Clase Storage
 * @jpexposito
 * Clase que persiste el estado en sesion.
 */
final class Storage
{
    public function __construct(private string $key = 'ahorcado')
    {
        /**
         * implementacion de codigo
         */
    }

    public function get(string $name, $default = null)
    {
        /**
         * implementacion de codigo
         */
    }

    public function set(string $name, $value): void
    {
        /**
         * implementacion de codigo
         */
    }

    public function reset(): void
    {
        /**
         * implementacion de codigo
         */
    }
}
```

---

### Clase: `Renderer`

**Responsabilidad:** Renderizar el dibujo ASCII del ahorcado.

#### Métodos

- `ascii(int $attemptsLeft): string`  
  Devuelve el dibujo `<pre>…</pre>` según intentos restantes.

### Implementación de la clase

```php
 * Clase Renderer
 *
 * Genera el dibujo ASCII del ahorcado según los intentos restantes.
 */
final class Renderer
{
    /**
     * Devuelve un bloque <pre> con el dibujo ASCII acorde a los intentos restantes
     *
     * @param int $attemptsLeft Intentos restantes (0..6)
     * @return string HTML con bloque <pre> del dibujo
     */
    public function ascii(int $attemptsLeft): string
    {
        /**
         * implementacion de codigo
         */
    }
}
```

---

## Flujo de uso

1. `Storage` carga estado de sesión.
2. `WordProvider` da la palabra inicial si no existe.
3. `Game` gestiona lógica de letras e intentos.
4. `Storage` guarda de nuevo el estado (`toState()`).
5. `Renderer` convierte intentos restantes en el dibujo ASCII.
6. `index.php` genera HTML con datos de `Game` + `Renderer`.

---

## Extensiones opcionales

- **Pistas:** método que revela una letra con coste de intento.
- **Historial:** registrar partidas en fichero.
- **Categorías/dificultad:** `WordProvider` avanzado.
- **Fichero Configuración**. Carga de inicio el número de intentos/nivel de arranque/etc del juego.

## Index.php

```php
<?php
declare(strict_types=1);

use {Game, WordProvider, Storage, Renderer};


$storage = new Storage();
$provider = new WordProvider(__DIR__ . '/../data/words.txt');
$renderer = new Renderer();

$state = $storage->get('state');
$word  = $storage->get('word');

if (!$word) {
    $word = $provider->randomWord();
    $storage->set('word', $word);
}

$maxAttempts = 6;
$game = new Game($word, $maxAttempts, $state);

  /**
   * implementacion de codigo
   */

```

## Referencias

- https://doc.php.net/archives/php5/php_manual_en.tar.gz

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.