# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Comenzando con los diagramas de CU  (Casos de USO)")

El propósito de esta tarea es que el alumno defina y describa en detalle al menos 10 operaciones de la aplicación, así como los actores que interactúan con el sistema. Esta documentación debe incluirse en el archivo `README.md` del proyecto y servirá como base para el desarrollo futuro.

1. Crear una Nueva Rama

   Crea una nueva rama en tu repositorio de Git llamada version-v2 siguiendo estos pasos:

   ```code
   git fetch
   git pull origin main
   git checkout -b version-v2
   ```

2. Definir Actores y Operaciones

   Identifica `al menos 3 actores` que existan en la aplicación y describe sus roles en el sistema.
   > __Ejemplos de Actores__: Administrador, Usuario Registrado, Visitante, Moderador, etc.

3. Especificar Operaciones

   Para cada actor, describe al menos `5 operaciones` que puedan realizar en la aplicación. Estas operaciones deben incluir información suficiente para entender su propósito y requisitos.
   > __Ejemplos de Operaciones__: Crear cuenta, Iniciar sesión, Subir archivo, Modificar perfil, Aprobar comentarios, etc.

4. Actualizar el `README.md`

   Dentro del archivo README.md, crea una nueva sección titulada "Especificación de Actores y Operaciones".

   Añade una tabla o una lista estructurada donde se describan las operaciones de cada actor.
   >__Ejemplo__:
   >
   > ## Especificación de Actores y Operaciones

   ### Actores

   - **Administrador**
     - Descripción: Usuario con permisos completos para gestionar la aplicación y moderar contenidos.

   - **Usuario Registrado**
     - Descripción: Usuario que puede crear y modificar su perfil, así como interactuar con contenidos.

   - **Visitante**
     - Descripción: Usuario sin registro que puede visualizar algunos contenidos de la aplicación.

   ### Operaciones por Actor

   #### Administrador

     1. Crear usuarios nuevos.
     2. Aprobar o rechazar contenido.
     3. Modificar o eliminar cuentas de usuario.
     4. Acceder al panel de administración.
     5. Generar reportes de actividad.
     6. Modificar configuraciones de la aplicación.
     7. Revisar y responder a solicitudes de soporte.
     8. Suspender cuentas de usuario.
     9. Restaurar contenidos eliminados.
     10. Asignar roles a usuarios.

   #### Usuario Registrado

     1. Crear cuenta de usuario.
     2. Iniciar sesión en la aplicación.
     3. Editar su perfil.
     4. Subir archivos o contenidos.
     5. Comentar en contenidos de otros usuarios.
     6. Enviar mensajes a otros usuarios.
     7. Solicitar cambio de contraseña.
     8. Configurar preferencias de notificación.
     9. Eliminar su cuenta.
     10. Calificar contenidos.

   #### Visitante

     1. Visualizar contenidos públicos.
     2. Buscar en la aplicación.
     3. Filtrar contenidos por categoría.
     4. Leer comentarios.
     5. Visualizar estadísticas básicas de la aplicación.

5. Realiza la subida de la rama
   
   ```code
   git add .
   git commit -m "Se realiza la definición especifica del proyecto #5"
   git push
   git checkout main
   git merge version-v2
   git push
   ```

   >__IMPORTANTE__: `5`es el número del issu donde se especifica lo que hay que realizar.

6. Realiza el informe en el issu espefificado de lo que has realizado indicando la salida de los comandos aplicacios, y las espeplicaciones que consideres necesarias.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
