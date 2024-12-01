# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Comenzando con los diagramas de Clases ")

## Ejercicio 1: Sistema de Reservas de Hoteles

### Descripción

Imagina que estás diseñando un sistema de reservas para un hotel. Este sistema debe gestionar las habitaciones disponibles, los clientes que realizan las reservas, y las reservas propiamente dichas.  

### Instrucciones  

1. Diseña un diagrama de clases que incluya las siguientes entidades:  
   - **Habitación**: Representa las habitaciones del hotel.  
   - **Cliente**: Representa a los clientes que realizan las reservas.  
   - **Reserva**: Conecta a los clientes con las habitaciones reservadas.  

2. Define al menos las siguientes propiedades y métodos para cada clase:  
   - **Habitación**:  
     - **Propiedades**:  
       - Número de habitación  
       - Tipo de habitación (individual, doble)  
       - Precio por noche  
     - **Métodos**:  
       - `comprobarDisponibilidad()`  
       - `cambiarEstado()`  

   - **Cliente**:  
     - **Propiedades**:  
       - Nombre  
       - Número de contacto  
       - Correo electrónico  
     - **Métodos**:  
       - `registrarCliente()`  
       - `obtenerInformación()`  

   - **Reserva**:  
     - **Propiedades**:  
       - Fecha de entrada  
       - Fecha de salida  
       - Cliente  
       - Habitación  
     - **Métodos**:  
       - `calcularCostoTotal()`  
       - `confirmarReserva()`  

3. Indica las relaciones entre las clases:  
   - Un cliente puede realizar varias reservas.  
   - Cada reserva está asociada con una habitación específica.  

---

## Ejercicio 2: Sistema de Gestión de Bibliotecas

### Descripción

Estás diseñando un sistema para gestionar una biblioteca. El sistema debe rastrear libros, miembros de la biblioteca, préstamos y otros elementos asociados.  

---

#### Sistema A

1. Diseña un diagrama de clases que incluya las siguientes entidades:  
   - **Libro**: Representa los libros disponibles en la biblioteca.  
   - **Miembro**: Representa a las personas registradas en la biblioteca.  
   - **Préstamo**: Conecta a los miembros con los libros que han tomado prestados.  
   - **Bibliotecario**: Representa al personal encargado de gestionar la biblioteca.  
   - **Categoría**: Clasifica los libros por temas (como ficción, ciencia, historia).  

2. Define las propiedades y métodos esenciales:  
   - **Libro**:  
     - **Propiedades**:  
       - Título  
       - Autor  
       - ISBN  
       - Categoría  
     - **Métodos**:  
       - `verificarDisponibilidad()`  
       - `asignarCategoría()`  

   - **Miembro**:  
     - **Propiedades**:  
       - Nombre  
       - ID de miembro  
       - Historial de préstamos  
     - **Métodos**:  
       - `registrarMiembro()`  
       - `verHistorial()`  

   - **Préstamo**:  
     - **Propiedades**:  
       - Fecha de préstamo  
       - Fecha de devolución  
       - Libro  
       - Miembro  
     - **Métodos**:  
       - `calcularMultaPorRetraso()`  
       - `marcarComoDevuelto()`  

   - **Bibliotecario**:  
     - **Propiedades**:  
       - Nombre  
       - ID de empleado  
     - **Métodos**:  
       - `registrarLibros()`  
       - `gestionarPréstamos()`  

   - **Categoría**:  
     - **Propiedades**:  
       - Nombre de la categoría  
       - Descripción  
     - **Métodos**:  
       - `agregarCategoría()`  
       - `listarLibrosPorCategoría()`  

3. Relaciona las clases:  
   - Un miembro puede realizar varios préstamos.  
   - Cada préstamo está asociado con un libro específico.  
   - Un bibliotecario puede gestionar muchos préstamos y registrar múltiples libros.  
   - Un libro pertenece a una categoría.  

---

#### Sistema B

1. Amplía el sistema añadiendo:  

   - **Editorial**: Representa a las editoriales que publican los libros.  
     - **Propiedades**:  
       - Nombre  
       - Dirección  
       - Contacto  
     - **Métodos**:  
       - `registrarEditorial()`  
       - `listarLibrosDeEditorial()`  

   - **Sala de Lectura**: Representa los espacios físicos de lectura en la biblioteca.  
     - **Propiedades**:  
       - Nombre de la sala  
       - Capacidad  
     - **Métodos**:  
       - `reservarSala()`  
       - `verificarDisponibilidad()`  

2. Relaciones adicionales:  
   - Un libro puede estar asociado con una editorial.  
   - Una sala de lectura puede ser reservada por un miembro para un tiempo específico.  

> ***Con toda la información aportada realiza los diagrama de clases y la implementación de las mismas***

## Referencias

- [Ejemplo de Diagrama de Clases](https://github.com/jpexposito/code-learn/blob/main/primero/ets/unidades/unidad-4/DIAGRAMA-CLASES-EXPLICADO.md).

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
