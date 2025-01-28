# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con Ficheros: `Interfaces y Clases Abstractas sobre ficheros`

<img src=images/empleado.png width="400">

## Descripción

En el ejercicio, se debe de implementar un sistema `CRUD (create/read/update/delete)` genérico utilizando una interfaz que definirá los métodos necesarios para trabajar con ficheros.

### Objetivos

- Implementar una interfaz `CRUD (create/read/update/delete)` para gestionar objetos.
- Trabajar con ficheros.
- Utilizar clases abstractas para la gestión de la persistencia de los objetos.

### Requerimientos

#### 1. **Interfaz CRUD**

Debes crear una interfaz `CrudOperations` que declare los métodos básicos para un CRUD. Cada uno de los métodos debe devolver un valor para indicar si la operación fue exitosa o no:

- `boolean create(T item)`: Crear un nuevo objeto y almacenarlo.
- `T read(String id)`: Leer un objeto a partir de su identificador.
- `boolean update(T item)`: Actualizar un objeto existente.
- `boolean delete(String id)`: Eliminar un objeto a partir de su identificador.

#### 2. **Clases a Implementar**

- **Clase `Empleado`** (Clase de objeto):
  - Propiedades:
    - `String id`: Identificador único del empleado.
    - `String nombre`: Nombre del empleado.
    - `String puesto`: Puesto de trabajo del empleado.
    - `double salario`: Salario del empleado.
  - Métodos:
    - Constructor para inicializar los atributos.
    - Getters y setters para los atributos.
    - Método `toString()` para representar un empleado en formato texto (será útil al almacenar y leer los datos del archivo).
    - ... resto de métodos que consideres oportunos.
  
- **Clase `EmpleadoFileOperations`** (Subclase abstracta):
  - Esta clase será una **clase abstracta** que implementará la interfaz `CrudOperations` para gestionar los empleados almacenados en un fichero plano de texto.
  - Métodos:
    - `create()`: Añadir un nuevo empleado al archivo de texto.
    - `read()`: Leer los empleados desde el archivo de texto.
    - `update()`: Actualizar los detalles de un empleado en el archivo de texto.
    - `delete()`: Eliminar un empleado del archivo de texto.
  - La clase debe declarar un método abstracto para gestionar el acceso al archivo, que será implementado por las subclases.

- **Clase `EmpleadoFileOperationsImpl`**:
  - Esta clase debe extender la clase abstracta `EmpleadoFileOperations` y proporcionar la implementación concreta de los métodos `create()`, `read()`, `update()`, y `delete()`, utilizando ficheros planos para persistir los datos.
  - El formato del archivo será un fichero de texto plano, donde cada línea representa un objeto `Empleado`. Los campos estarán separados por comas o tabuladores.

#### 3. **Formato de los Ficheros**

Los datos de los empleados deben ser almacenados en un archivo de texto con el siguiente formato '(empleados.txt)':

```console
1, Juan Pérez, Desarrollador, 3000.50
2, Ana Gómez, Diseñadora, 2800.75
3, Luis López, Gerente, 4000.00
```

Cada línea en el archivo representa un objeto `Empleado`, con los `atributos separados por una coma`.

#### 4. **Clases Abstractas y Métodos**

Para trabajar con clases abstractas, debes:

- Crear una **clase abstracta** llamada `EmpleadoFileOperations` que implemente la interfaz `CrudOperations`.
- La clase abstracta debe definir la estructura básica del CRUD, pero los detalles específicos de cómo interactuar con el archivo serán delegados a las subclases.
- La subclase `EmpleadoFileOperationsImpl` debe ser responsable de implementar los métodos CRUD concretos para el manejo de los ficheros planos.

#### 5. **Pruebas de Funcionamiento**

Los estudiantes deben realizar pruebas para verificar que las operaciones CRUD funcionan correctamente con los ficheros de texto plano. Las pruebas deben incluir:

- **Crear** un nuevo empleado y verificar que se añade correctamente al archivo.
- **Leer** los datos de un empleado a partir del archivo.
- **Actualizar** la información de un empleado y verificar que se guarda correctamente en el archivo.
- **Eliminar** un empleado y verificar que se elimina correctamente del archivo.

#### 6. **Documentación**

La documentación debe incluir:

- Descripción de la interfaz `CrudOperations` y sus métodos.
- Explicación de las clases `Empleado` y `EmpleadoFileOperations`.
- Descripción de la clase abstracta `EmpleadoFileOperations` y su subclase `EmpleadoFileOperationsImpl`.
- Detalles sobre el formato y el manejo de ficheros planos.
- Instrucciones sobre cómo ejecutar el código y realizar pruebas.

### Evaluación

El ejercicio será evaluado según los siguientes criterios:

1. **Correcta Implementación de la Interfaz CRUD**: La interfaz `CrudOperations` debe ser implementada correctamente, y cada operación CRUD debe devolver un valor booleano.
2. **Uso de Clases Abstractas**: Se evaluará el diseño y la implementación de la clase abstracta `EmpleadoFileOperations` y cómo las subclases gestionan la persistencia en ficheros planos.
3. **Funcionamiento de los Métodos CRUD**: Se verificará si las operaciones CRUD funcionan correctamente en el almacenamiento de ficheros planos.
4. **Claridad del Código y Documentación**: El código debe ser claro, eficiente y bien documentado. La documentación debe ser completa y precisa.
5. **Documentación**: Documentación de las clases y métodos implementados.

### Objetivo del Ejercicio

El objetivo de este ejercicio es comprender cómo implementar un sistema CRUD utilizando interfaces y clases abstractas.


## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
