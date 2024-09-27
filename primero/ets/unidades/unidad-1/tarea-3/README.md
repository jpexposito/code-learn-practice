# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Trabajar con una máquina virtual y trabajar con un repositorio en GitHub")

En este ejercicio vas a realizar una serie de pasos que te permitirán trabajar con **Git** y **GitHub**, además de utilizar una máquina virtual proporcionada. El objetivo es familiarizarse con la creación de repositorios, hacer *commits*, trabajar en remoto y local, así como sincronizar los cambios. Sigue las instrucciones paso a paso y asegúrate de completar cada uno de ellos para cumplir con todos los requisitos del ejercicio. ***Además asegurate de ir realizando capturas de pantallas o guardar los mensajes de salida para generar un informe con los pasos realizados***.

## Requisitos previos

- Tener instalada la máquina virtual **VirtualBox**.
- Tener instalado **Git** en tu sistema local.
- Tener una cuenta de **GitHub**.
- Asegúrate de tener configurada tu identidad de Git en tu terminal:
  
  ```bash
  git config --global user.name "TuNombre"
  git config --global user.email "TuEmail@example.com"
  ```
 
- Generar token de seguridad para utilziarlo como [contraseña](../tarea-1/README.md). 

## Paso 1: Importar la máquina virtual

Importa la máquina virtual cuyo enlace se encuentra dentro del **aula de la asignatura**.

Si usas VirtualBox, puedes importar la máquina de la siguiente manera:

- Abre VirtualBox.
- Haz clic en Archivo -> Importar servicio virtualizado....
- Selecciona el archivo de la máquina virtual descargada y sigue las instrucciones en pantalla para importarla.

## Paso 2: Crear un repositorio en GitHub

Crea un repositorio en **GitHub** con el nombre **repositorio-ejercicio-1**. Los pasos son los siguientes:

- Ve a **tu cuenta de GitHub**.
- Haz clic en **New repository**.
- Nombra el repositorio **repositorio-ejercicio-1** y marca la opción **Add a README** file para crear el archivo *README automáticamente*.

>_Has creado tu primer repositorio_.

## Paso 3: Clonar el repositorio en local

Clona el repositorio que acabas de crear a tu máquina local utilizando Git.

En la terminal, ejecuta el siguiente comando (reemplaza la URL por la de tu repositorio):

```bash
git clone https://github.com/TuUsuario/repositorio-ejercicio-1.git
```

> _Esto descargará el contenido del repositorio a una carpeta local_.

## Paso 4: Modificar el archivo README.md

Abre el archivo **README.md** en un editor de texto o desde la terminal, también puedes utilizar **vscode** y realiza los siguientes cambios:

- Añade un título y una breve descripción del repositorio al inicio del archivo. Un ejemplo podría ser:

```md
# Repositorio Ejercicio 1

Este repositorio contiene los pasos básicos para trabajar con Git y GitHub.
```

Guarda los cambios realizados y luego realiza un commit. Usa los siguientes comandos:

```bash
git add README.md
git commit -m "Añadir título y descripción al README"
git push origin main
```
> **git push origin main** realizará lo mismo en este caso que que **git fetch y git push**.

## Paso 5: Editar el README.md desde GitHub

Abre tu repositorio en GitHub desde el navegador y edita el archivo README.md desde la interfaz web.

- En GitHub, abre el archivo README.md.
- Haz clic en el **ícono de lápiz (editar)** y añade un nuevo cambio. Por ejemplo, añade otra línea describiendo lo que haces:

```md
Esta línea fue añadida directamente desde la interfaz web de GitHub.
```

Guarda los cambios haciendo un nuevo commit desde GitHub.

## Paso 6: Actualizar el repositorio local con los cambios remotos

Desde tu máquina local, actualiza el repositorio con los cambios que acabas de realizar en GitHub usando el siguiente comando:

```bash
git pull origin main
```

> Este comando será lo mismo que combinar **git fetch** y posteriormente **git pull**.

Esto descargará los cambios realizados desde GitHub y actualizará tu copia local.

## Paso 7: Añadir un nuevo cambio en local y subirlo a GitHub

Finalmente, realiza un último cambio en local añadiendo otra línea al archivo README.md. Por ejemplo:

```md
Esta línea fue añadida desde la consola local como parte del último paso.
```

Guarda el archivo y realiza los siguientes pasos para subir los cambios nuevamente a GitHub:

```bash
git add README.md
git commit -m "Añadir última línea al README desde local"
git push origin main
```

### Resumen de comandos útiles

#### Para clonar un repositorio

```bash
git clone <URL-del-repositorio>
```

#### Para agregar un archivo al área de preparación

```bash
git add <nombre-del-archivo>
```

#### Para hacer un commit de los cambios

```bash
git commit -m "Mensaje descriptivo"
```

#### Para subir los cambios al repositorio remoto

```bash
git push origin <rama>
```

#### Para actualizar tu repositorio local con los cambios desde GitHub

```bash
git pull origin <rama>
```

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
