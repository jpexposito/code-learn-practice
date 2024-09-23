# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Comenzando con Git (Asociando el usuario a GitHub)")

En este ejercicio, aprenderás a asociar tu usuario local de __Git con tu cuenta de GitHub__ configurando correctamente tu nombre de usuario y correo electrónico. Estos datos se usarán para que tus ___commits sean correctamente identificados y asociados a tu cuenta de GitHub__.

## **Requisitos previos**

1. Tener Git instalado en tu máquina local. Si no lo tienes, sigue las instrucciones [aquí](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

2. Tener una cuenta de GitHub. Si aún no la tienes, puedes crearla [aquí](https://github.com/join).

## __Paso 1: Configurar el nombre de usuario y el correo en Git local__

Abre tu terminal o línea de comandos y ejecuta los siguientes comandos para configurar tu nombre de usuario y tu correo electrónico en Git. __Asegúrate de usar el correo electrónico asociado a tu cuenta de GitHub.__

1. __Configurar el nombre de usuario globalmente__ (esto se aplicará a todos los proyectos en tu máquina):

```bash
git config --global user.name "Tu Nombre en GitHub"
```

Un ejemplo seria:

```bash
git config --global user.name "Juan Pérez"
```

1. __Configurar el correo electrónico globalmente (usa el correo con el que te registraste en GitHub)__

```bash
git config --global user.email "tu-correo@ejemplo.com"
```

Por ejemplo:

```bash
git config --global user.email "juan.perez@example.com"
```

## __Paso 2: Verificar la configuración

Para asegurarte de que la configuración ha sido aplicada correctamente, puedes usar los siguientes comandos para verificar los valores configurados:

1. __Verificar el nombre de usuario__:

```bash
git config --global user.name
```

> Este comando te debería devolver el nombre que configuraste previamente.

1. __Verificar el correo electrónico__:

```bash
git config --global user.email
```

> Este comando te debería devolver el correo electrónico que configuraste.

## __Paso 3: Asociar tu configuración con GitHub__

Git no almacena directamente tu autenticación de GitHub con estos datos. Para autenticarte en GitHub al realizar `push` o `pull`, necesitas autenticarte con un **token de acceso personal** o usar **SSH**. En este ejemplo, autenticaremos usando HTTPS con un **token de acceso personal (PAT)**.

### **3.1 Generar un token de acceso personal en GitHub**

1. Inicia sesión en [GitHub](https://github.com).
2. En la esquina superior derecha, haz clic en tu foto de perfil y selecciona **Settings**.
3. En el menú lateral, selecciona **Developer settings** > **Personal access tokens** > **Tokens (classic)**.
4. Haz clic en **Generate new token** y selecciona los permisos necesarios, como `repo`.
5. Copia tu token y guárdalo en un lugar seguro (no lo podrás ver de nuevo).

### **3.2 Autenticar con tu token de GitHub**

1. La próxima vez que intentes hacer un `git push` o cualquier operación que requiera acceso a tu repositorio de GitHub, Git te pedirá tus credenciales.
2. En lugar de tu contraseña de GitHub, ingresa el **token de acceso personal** que generaste en GitHub como contraseña.

## **Paso 4: Probar la configuración**

Para probar que todo está correctamente configurado:

1. Crea un nuevo repositorio en GitHub.
2. Clona el repositorio en tu máquina local:

   ```bash
   git clone https://github.com/tu-usuario/nombre-del-repositorio.git


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
