# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con Ficheros: `Interfaces gráficas y ficheros`

## Objetivo

Desarrollar una aplicación de registro y autenticación que implemente las pantallas mostradas en las imágenes proporcionadas. La aplicación deberá permitir a los usuarios registrarse, iniciar sesión, recuperar su contraseña y visualizar su información. Además, la información de los usuarios debe persistirse en un archivo para asegurar su almacenamiento.

## Requisitos

### Interfaces Gráficas

- La aplicación debe contener las cuatro pantallas mostradas en las imágenes.
- Utilizar una biblioteca gráfica de, **JavaFX** para la interfaz de usuario.

### Pantallas y Funcionalidades

#### Pantalla 1 (Login)

- **Campos**: Usuario y Contraseña.
- **Botones**:
  - "Aceptar" para autenticar al usuario.
  - "Registrar" que lleva a la pantalla de registro.
  - "Recuperar Contraseña" que lleva a la pantalla de recuperación de contraseña.

#### Pantalla 2 (Registro)

- **Campos**:
  - Usuario
  - Contraseña
  - Repetir Contraseña
  - Nombre
  - Email
  - Repetir Email
- **Mensaje** de confirmación o error tras el registro.
- **Botón**: "Aceptar" para registrar los datos.

#### Pantalla 3 (Recuperación de Contraseña)

- **Campo**: Email.
- **Botón**: "Aceptar" para enviar la recuperación de contraseña.
- **Mensaje** de éxito o error tras el envío.

#### Pantalla 4 (Perfil de Usuario)

- Muestra los datos del usuario registrado.
- **Botón**: "Volver Atrás" para regresar a la pantalla anterior.

### Persistencia de Datos

- Utilizar un archivo de texto, JSON o una base de datos SQLite para almacenar la información de los usuarios.
- La información del usuario debe incluir:
  - Usuario
  - Contraseña (cifrada)
  - Nombre
  - Email
- Al iniciar sesión, los datos deben ser validados contra los almacenados en el archivo.

### Validaciones

- Verificar que el usuario no exista previamente al registrarse.
- Asegurar que las contraseñas ingresadas coincidan.
- Validar que los emails ingresados sean correctos.
- En la pantalla de inicio de sesión, validar que el usuario y la contraseña sean correctos.

## Tecnologías Recomendadas

- **Lenguajes**: Java.
- **Interfaz gráfica**: JavaFX.
- **Almacenamiento de datos**: Archivos JSON, CSV, o XML.

## Diseño a implementar

<img src=images/mock-pantallas.drawio.png width="400">

## Nota

Utiliza los ejercicios realizados en clase y la [documentación de ficheros](https://github.com/jpexposito/code-learn/blob/main/primero/pro/unidades/unidad-4/MANEJO-FICHEROS-JAVA.md) e [interfaces gráficas](https://github.com/jpexposito/code-learn/tree/main/primero/pro/unidades/unidad-5) para resolver el ejercicio.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
