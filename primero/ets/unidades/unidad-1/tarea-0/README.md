# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Crear un usuario en linux")

# Crear un Usuario en Linux con Contraseña, Home y Permisos de Root

A continuación, se detalla cómo crear un usuario en Linux que tenga una contraseña asignada, su propio directorio home, y permisos de root (sudo).

## 1. Abrir la Terminal

Primero, abre la terminal en tu sistema Linux.

## 2. Crear el Usuario con el Comando `adduser`

Este comando creará el usuario, asignará su directorio home y pedirá una contraseña. Ejecuta el siguiente comando:

```bash
sudo adduser pro
```

Detalles del Proceso:

- Se te pedirá que ingreses una contraseña para el nuevo usuario.

- También te solicitará información adicional (nombre completo, número de teléfono, etc.).
   > Puedes omitir estos campos presionando Enter si no deseas completarlos.

- El comando creará automáticamente el directorio home en __/home/pro__.

## 3. Añadir el Usuario al Grupo sudo (para Permisos de Root)

Para otorgar permisos de root al nuevo usuario, añádelo al grupo sudo con el siguiente comando:

```bash
sudo usermod -aG sudo pro
```

## 4. Verificar que el Usuario Tiene Permisos de Root

Para asegurarte de que el usuario tiene permisos de root, inicia sesión con el usuario recién creado y prueba un comando con sudo. Por ejemplo:

```bash
su - pro
sudo whoami
```

> El comando sudo __whoami__ debería devolver __root__, lo que indica que el usuario tiene permisos de __superusuario__.

## Cómo Instalar Visual Studio Code en Linux

Visual Studio Code es un editor de código fuente popular que puedes instalar en casi cualquier distribución de Linux. A continuación, se detallan los pasos para instalarlo en distribuciones basadas en **Debian/Ubuntu** y **Fedora/Red Hat**.

### Opción 1: Instalar en Debian/Ubuntu (y derivados como Linux Mint)

#### 1. Actualizar la lista de paquetes

Primero, abre una terminal y actualiza la lista de paquetes:

```bash
sudo apt update
```

#### 2. Instalar las dependencias necesarias

Asegúrate de tener instaladas algunas herramientas que necesitas para descargar y configurar el repositorio de Microsoft:

```bash
sudo apt install software-properties-common apt-transport-https wget
```

#### 3. Descargar la clave GPG de Microsoft

Descarga la clave GPG de Microsoft para verificar la autenticidad de los paquetes:

```bash
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
```

#### 4. Habilitar el repositorio de Visual Studio Code

Añade el repositorio oficial de Visual Studio Code a tu lista de fuentes de software

```bash
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
```

#### 5. Instalar Visual Studio Code

Actualiza la lista de paquetes e instala code:

```bash
sudo apt update
sudo apt install code
```

### 6. Ejecutar Visual Studio Code

Una vez que la instalación esté completa, puedes abrir Visual Studio Code desde el menú de aplicaciones o usando la terminal:

```bash
code
```

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
