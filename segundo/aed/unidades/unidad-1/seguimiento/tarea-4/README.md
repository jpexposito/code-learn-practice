# <img src="../../../../../../images/computer.png" width="40"> Code, Learn & Practice (Acceso a Datos: "Trabajo con namespaces e interfaces y HTML")

<img src="https://laruletagiratoria.com/wp-content/uploads/ahorcado.jpg" width="250" alt="Juego del ahorcado">

Este README te guía **paso a paso** para convertir el juego del ahorcado (`ahorcado.zip`) a **POO**, con **arquitectura en capas** y **namespaces estilo PSR‑4**, usando un **autoloader propio**.

---

## 🛠 Preparación

- Descarga el fichero `ahorcado.zip` que se encuentra dentro de la carpeta *recursos*.
- **Descomprime, coloca y verifica:** coloca la carpeta `ahorcado` dentro del proyecto **`docker-php-project`**, en la carpeta `public`.
- Verifica el correcto funcionamiento accediendo a: `http://localhost:8080/ahorcado/index.php`

> Nota: en el enunciado original aparecía `docker-php-proyect` y `http:localhost:8080\...`; aquí se corrige a **`docker-php-project`** y URL con **barras normales**.

- Crea una rama llamada `v2`.
- Actualiza este `README.md` con la documentación revisada y cualquier ajuste adicional.

---

## 🧭 Repositorio en GitHub

En tu terminal:

```bash
git checkout -b v2
git push -u origin v2
```

---

## 📁 Estructura de la solución

```text
ahorcado/
├── public/
│   └── index.php                  # Punto de entrada (DocumentRoot)
├── config/
│   └── config.php                 # Configuración (rutas, opciones de juego)
├── src/
│   ├── Application/
│   │   └── Services/              # Casos de uso
│   ├── Domain/
│   │   ├── Entity/                # Entidades de dominio
│   │   └── Repository/            # Interfaces de repositorios
│   ├── Infrastructure/
│   │   ├── Autoload/              # Autoloader
│   │   └── Persistence/           # Implementaciones (JSON, sesión, etc.)
│   └── Presentation/
│       ├── Controllers/           # Controladores web
│       └── Views/                 # Vistas (plantillas)
├── storage/
│   ├── words.json
│   └── games.json
├── images/
│   └── mock.drawio.png
├── .gitignore
└── README.md
```

> **Importante:** `public/index.php` es el **DocumentRoot**. `config/config.php` es **configuración**, no el punto de entrada.

---

## ⚙️ Configuración mínima

Crea **`config/config.php`**:

```php
<?php
declare(strict_types=1);

return [
    'storage' => [
        'words_file' => __DIR__ . '/../storage/words.json',
        'games_file' => __DIR__ . '/../storage/games.json',
    ],
    'game' => [
        'max_attempts' => 7,
    ],
];
```

Crea **`storage/words.json`** con palabras:

```json
{ "words": ["php", "json", "namespace", "patron", "clase", "objeto"] }
```

Crea **`storage/games.json`** con estructura vacía:

```json
{ "games": {} }
```

**Cómo se usa la configuración (desde `public/index.php`):**

```php
<?php
$config = require __DIR__ . '/../config/config.php';

$wordsPath   = $config['storage']['words_file'];
$gamesPath   = $config['storage']['games_file'];
$maxAttempts = (int)$config['game']['max_attempts'];
```

---

## 🧩 Namespaces y autoload

### Autoloader propio

Crea `src/Infrastructure/Autoload/Autoloader.php`:

```php
<?php
declare(strict_types=1);

namespace App\Infrastructure\Autoload;

final class Autoloader
{
    private array $prefixes = [];

    public static function register(string $prefix = 'App\', string $baseDir = __DIR__ . '/../../'): void
    {
        $loader = new self();
        $loader->addNamespace($prefix, $baseDir);
        spl_autoload_register([$loader, 'loadClass']);
    }

    public function addNamespace(string $prefix, string $baseDir): void
    {
        $prefix = trim($prefix, '\') . '\';
        $baseDir = rtrim($baseDir, DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR;
        $this->prefixes[$prefix] = $baseDir;
    }

    public function loadClass(string $class): void
    {
        foreach ($this->prefixes as $prefix => $baseDir) {
            $len = strlen($prefix);
            if (strncmp($prefix, $class, $len) !== 0) continue;
            $relativeClass = substr($class, $len);
            $file = $baseDir . str_replace('\', DIRECTORY_SEPARATOR, $relativeClass) . '.php';
            if (is_file($file)) require $file;
        }
    }
}
```

**Actívalo en `public/index.php`:**

```php
<?php
declare(strict_types=1);

use App\Presentation\Controllers\GameController;

require __DIR__ . '/../src/Infrastructure/Autoload/Autoloader.php';
\App\Infrastructure\Autoload\Autoloader::register('App\', __DIR__ . '/../src');

$config = require __DIR__ . '/../config/config.php';
$controller = new GameController($config);
$controller->handle();
```

> **Qué hace:** carga automáticamente clases con nombres `Namespace\Sub\Class` desde rutas `baseDir/Namespace/Sub/Class.php` (convención **PSR‑4**).

---

## 🧠 Dominio: Entidad `Game` (esqueleto)

Crea `src/Domain/Entity/Game.php`:

```php
<?php
declare(strict_types=1);

namespace App\Domain\Entity;

final class Game
{
    // TODO: id, word, guesses[], maxAttempts, status + métodos:
    // maskedWord(), guess($letter), remainingAttempts(), toArray(), fromArray()
}
```

---

## 🗂 Dominio: Interfaces de repositorios

`src/Domain/Repository/GameRepositoryInterface.php`

```php
<?php
declare(strict_types=1);

namespace App\Domain\Repository;

use App\Domain\Entity\Game;

interface GameRepositoryInterface
{
    public function save(Game $game): void;
    public function find(string $id): ?Game;
}
```

`src/Domain/Repository/WordRepositoryInterface.php`

```php
<?php
declare(strict_types=1);

namespace App\Domain\Repository;

interface WordRepositoryInterface
{
    public function randomWord(): string;
}
```

---

## 💾 Infraestructura: persistencia en JSON (ejemplo)

`src/Infrastructure/Persistence/JsonGameRepository.php`

```php
<?php
declare(strict_types=1);

namespace App\Infrastructure\Persistence;

use App\Domain\Entity\Game;
use App\Domain\Repository\GameRepositoryInterface;

final class JsonGameRepository implements GameRepositoryInterface
{
    public function __construct(private string $file)
    {
        if (!is_file($this->file)) {
            file_put_contents($this->file, json_encode(['games' => []], JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE));
        }
    }

    public function save(Game $game): void
    {
        $data = $this->readAll();
        $data['games'][$game->id] = $game->toArray();
        $this->writeAll($data);
    }

    public function find(string $id): ?Game
    {
        $data = $this->readAll();
        return isset($data['games'][$id]) ? Game::fromArray($data['games'][$id]) : null;
    }

    private function readAll(): array
    {
        $fh = fopen($this->file, 'c+');
        if ($fh === false) throw new \RuntimeException('No se pudo abrir el fichero de juegos');
        try {
            flock($fh, LOCK_SH);
            $content = stream_get_contents($fh);
            $json = $content ? json_decode($content, true) : ['games' => []];
            return is_array($json) ? $json : ['games' => []];
        } finally {
            flock($fh, LOCK_UN);
            fclose($fh);
        }
    }

    private function writeAll(array $data): void
    {
        $tmp = $this->file . '.tmp';
        $fh = fopen($tmp, 'w');
        if ($fh === false) throw new \RuntimeException('No se pudo escribir el fichero de juegos');
        try {
            flock($fh, LOCK_EX);
            fwrite($fh, json_encode($data, JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE));
            fflush($fh);
            flock($fh, LOCK_UN);
        } finally {
            fclose($fh);
        }
        rename($tmp, $this->file);
    }
}
```

`src/Infrastructure/Persistence/JsonWordRepository.php`

```php
<?php
declare(strict_types=1);

namespace App\Infrastructure\Persistence;

use App\Domain\Repository\WordRepositoryInterface;

final class JsonWordRepository implements WordRepositoryInterface
{
    public function __construct(private string $file) {}

    public function randomWord(): string
    {
        $content = file_get_contents($this->file);
        $data = $content ? json_decode($content, true) : ['words' => []];
        $words = $data['words'] ?? [];
        if (!$words) throw new \RuntimeException('No hay palabras en words.json');
        return (string)$words[array_rand($words)];
    }
}
```

---

## ▶️ Cómo ejecutar


Abre: <http://localhost:8080/ahorcado/index.php>

> Si usas Docker, define el **DocumentRoot** en `public/` y expón el puerto `8080`.

---

## ✅ Recuerda

- [ ] Autoloader funcionando (o Composer).
- [ ] Entidad `Game` con máscara, intentos y estado.
- [ ] Repositorios JSON leyendo/escribiendo correctamente.
- [ ] Servicio `GameService` encapsula casos de uso.
- [ ] Controlador y vistas separadas.
- [ ] `public/index.php` como único punto de entrada.

---

## 📚 Referencias

- Documentación oficial de PHP (archivos históricos): https://doc.php.net/archives/php5/php_manual_en.tar.gz

---

## 📄 Licencia

Este proyecto está bajo la licencia **Apache 2.0**. Consulta el archivo [`LICENSE`](LICENSE.md).
