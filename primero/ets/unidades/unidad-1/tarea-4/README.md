# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Comenzando con Git "Trabajando con Branchs")

```plaintext
* main
|
| o---o---o---------------------- merge --> Ejercicio1 (main)
|              \
|               o---o---o-------- merge --> Ejercicio2 (main)
|                        \
|                         o---o---o--- merge --> Ejercicio3 (main)
|
```

## ¿Qué muestra el dibujo?

- `o` representa un commit en la rama.
- `|` es la línea vertical que representa la rama principal.
- `---` representa la conexión entre commits en una rama.
- `merge -->` indica el punto donde una rama es fusionada de nuevo a `main`.

## ¿Qué vamos a trabajar?

Este diagrama refleja cómo cada nueva tarea o(***ejercicio en este caso***) se puede desarrollar en una nueva rama, realizar varios commits, y luego fusionarse en la rama principal.

## ¿Qué debes de realizar?

Debes de realizar cada uno de los pasos que se indican a continuación generando un informe (`README.md`) dentro del repositorio creado para trabajar, guardando los comandos que se indican, los que utilizas y las salidas de esos comandos.

Recuerda utilizar en markdown esto:

\```java\code\console o bash

AQUÍ LAS CAPTURAS DE CÓDIGO

\```

### Pasos

1. Crear un ***nuevo repositorio en GitHub
Ve a GitHub y crea un nuevo repositorio con el nombre ejercicio-git-branch***.
Inicializa el repositorio con un archivo README.md básico con el título del proyecto.

2. Realiza una clonación del repositorio. Recuerda que debes utilizar `git clone`.
3. Crea un nuevo `branch`o `rama` para los nuevos cambios que vas a introducir.

   ```code
        git checkout -b ejercicio1-branch
    ```

   ó

    ```code
        git branch ejercicio1-branch
        git checkout  ejercicio1-branch
        ```
        
4. Añade la siguiente clase al repositorio:

   ```java
        public class Ejercicio1 {
        public static void main(String[] args) {
            System.out.println("Ejercicio 1 realizado.");
        }
    }    
   ```

5. Hacer commit de los cambios

Realiza un commit de los cambios que has realizado.

```code
git commit -m "Se incluye el Ejercicio1.java"
```

>_Importante_: ___¿Te ha faltado algo que hacer?. Si fuera así realizalo e indica los pasos.___

6. Sube los cambios a tu repositorio

Sube la rama nueva con los cambios realizados al repositorio remoto:

```code
git push origin ejercicio2-branch
```

7. Fusiona la rama en main

Accede a tu repositorio en GitHub y verifica que existe la rama (ejercicio1-branch).

Una vez que hayas revisado que todo esté correcto, realiza la fusión de la rama.

```code
git checkout main
git merge ejercicio1-branch
```
> Esto se trae los cambios de la rama `ejercicio1-branch` a `main`. Realiza la subida de los cambios al repositorio.

```code
git push
```

Añade los ejercicios `2` y `3`, creando nuevas ramas y realizando los pasos descritos anteriormente.

> La entrega del informe es el enlace del README.md de tu repositorio que muestra todos los cambios.


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
