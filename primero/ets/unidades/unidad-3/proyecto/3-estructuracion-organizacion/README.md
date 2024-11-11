# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Estructuración y organización del proyecto software")

El propósito de la siguiente `tarea` es optimizar `el esquema de organización de un proyecto de software`, *incluyendo documentos, diagramas, y carpetas de código fuente para una buena gestión y documentación de todos los componentes del desarrollo*.

1. Crea una nuevo `issus` en el proyecto, y agregalo al proyecto.
2. Crear una Nueva Rama

   Crea una nueva rama en tu repositorio de Git llamada version-v4 siguiendo estos pasos:

   ```code
   git fetch
   git pull origin main
   git checkout -b version-v4
   ```

3. Reestructuración del proyecto

   Realiza las modificaciones oportunas para tener tu proyecto con la siguiente estructura:

   ```textplain
      
      ├── docs/
      │   ├── requisitos/
      │   │   ├── especificacion_requisitos.md
      │   │   ├── casos_uso.md
      │   │   └── backlog.md
      │   ├── diseno/
      │   │   ├── diagramas/
      │   │   │   ├── diagrama_clases.png
      │   │   │   ├── diagrama_secuencia.png
      │   │   │   ├── diagrama_actividades.png
      │   │   │   ├── diagrama_componentes.png
      │   │   │   └── diagrama_despliegue.png
      │   │   └── arquitectura.md
      │   ├── planificacion/
      │   │   ├── plan_proyecto.md
      │   │   ├── cronograma.md
      │   │   └── riesgos.md
      └── README.md
   ```

   >**Renombrado**: Realiza el renombrado de los documentos e imagenes que tengas aportado en tu proyecto.

4. Realiza la modificación del `README.md` para que contenga una descripción básica del proyecto, y un indice a cada uno de los apartados descritos.

5. Realiza la subida de la rama
  
   ```code
   git add .
   git commit -m "Se realiza el esquema general del proyecto" #3"
   git push
   git checkout main
   git merge version-v4
   git push
   ```

   >__IMPORTANTE__: `3`es el número del issu donde se especifica lo que hay que realizar.

6. **Realiza el informe en el issu espefificado de lo que has realizado indicando la salida de los comandos aplicacios, y las espeplicaciones que consideres necesarias**.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
