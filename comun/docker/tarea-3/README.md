# <img src=../../../images/computer.png width="40"> Code, Learn & Practice(Docker: Instalación de Apache Tomcat en Docker con un Puerto Específico)

## Objetivo

Desplegar una aplicación en Apache Tomcat.

Consulta los comandos de docker en el siguiente [enlace](https://github.com/jpexposito/code-learn/blob/main/comun/docker/COMANDOS.md).

> Realiza los pasos de arranque de Tomcat descritos en la [tarea anterior](../tarea-2/).

---

## 1. **Prueba con una aplicación de ejemplo**

Como prueba, puedes descargar una aplicación `.war` de ejemplo y desplegarla en Tomcat. Sigue estos pasos:

1. **Descargar un archivo `.war` de ejemplo**  
   Puedes descargar una aplicación de ejemplo desde el sitio oficial de Apache Tomcat. Por ejemplo, la [Sample Web Application](https://tomcat.apache.org/tomcat-11.0-doc/appdev/sample/) de Tomcat.

2. **Copiar el archivo `.war` en el contenedor**  
   Una vez descargado el archivo `.war` (por ejemplo, `sample.war`), cópialo al directorio `webapps` de tu contenedor Tomcat. Si estás ejecutando Tomcat en Docker, puedes hacerlo con un comando como este:

   ```bash
   docker cp /ruta/a/sample.war <nombre_contenedor>:/usr/local/tomcat/webapps/
   ```

3. Acceder a la aplicación
Una vez copiado el archivo .war y desplegado en Tomcat, puedes acceder a la aplicación de ejemplo a través de la URL:

```bash
http://localhost:9090/sample
```

4. Verificar logs en caso de problemas

Si la aplicación de ejemplo tampoco funciona, revisa los logs de Tomcat para detectar posibles errores:

```bash
docker logs -f <nombre_contenedor>
```

Busca cualquier mensaje relacionado con el despliegue o errores en la configuración.


---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
