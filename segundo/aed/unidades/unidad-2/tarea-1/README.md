# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Acceso a Datos: "Implementando los repositorios para `hotel-puerto`")

## 1. Objetivo del ejercicio

Vas a construir la capa de persistencia (repositorios) de un dominio hotelero.

Al final del ejercicio deberias tener:

- Entidades JPA que representan el dominio (Hotel, Room, Guest, Booking).
- Interfaces de repositorio (nivel dominio) con las operaciones que la aplicacion necesita.
- Una clase base abstracta de repositorio JPA reutilizable.
- Implementaciones concretas JPA de cada repositorio.
- Tests de integracion contra una BBDD SQLite de prueba.

El ejercicio se realiza bajo el paquete base `org.docencia.hotel`.

---

## 2. Estructura de paquetes

Crea esta estructura dentro de `src/main/java`:

- `org.docencia.hotel.domain.model`
  - Aqui iran las entidades del dominio (Hotel, Room, Guest, Booking).
  - Cada entidad debe estar mapeada con anotaciones JPA (`@Entity`, `@Table`, `@Id`, etc).
  - Define tambien las relaciones entre entidades (por ejemplo, un Hotel tiene muchas Room, una Booking pertenece a una Room y a un Guest, etc.).

- `org.docencia.hotel.domain.repository`
  - Aqui iran las **interfaces** de repositorio.
  - Cada interfaz representa el contrato funcional que necesita tu dominio. Ejemplo:
    - HotelRepository
    - RoomRepository
    - GuestRepository
    - BookingRepository
  - No pongas implementacion aqui, solo el contrato.

- `org.docencia.hotel.persistence.jpa`
  - Aqui iran las clases que **implementan** las interfaces anteriores usando JPA/Hibernate.
  - Incluye una clase abstracta comun (por ejemplo `AbstractJpaRepository<T, ID>`) que ofrezca operaciones CRUD genericas reutilizables.
  - Incluye una clase concreta por cada interfaz de repositorio:
    - HotelJpaRepository
    - RoomJpaRepository
    - GuestJpaRepository
    - BookingJpaRepository
  - Cada clase concreta:
    - debe extender la clase abstracta generica,
    - debe implementar la interfaz del dominio correspondiente,
    - debe declarar las consultas especificas (por ejemplo buscar habitaciones por hotel, buscar reservas por rango de fechas, etc.),
    - debe ser marcada como componente de infraestructura (por ejemplo, anotacion de repositorio en Spring).

Crea tambien en `src/test/java` un paquete equivalente para las pruebas de integracion:

- `org.docencia.hotel.persistence` o similar, donde pondras tus tests.

---

## 3. Entidades del dominio (`org.docencia.hotel.domain.model`)

Debes crear al menos cuatro entidades:

1. `Hotel`
   - Campos basicos: identificador unico, nombre, direccion.
   - Relacion uno-a-muchos con `Room` (un hotel tiene muchas habitaciones).
   - Esta relacion debe representarse con una lista/coleccion en `Hotel` y una referencia inversa en `Room`.

2. `Room`
   - Campos basicos: identificador unico, numero de habitacion, tipo, precio por noche.
   - Debe tener una referencia al `Hotel` al que pertenece (muchas habitaciones pertenecen a un mismo hotel).
   - Esta relacion es de muchos-a-uno (muchas Room -> un Hotel).

3. `Guest`
   - Campos basicos: identificador unico, nombre completo, email, telefono.

4. `Booking`
   - Campos basicos: identificador unico, fecha de entrada (checkIn), fecha de salida (checkOut).
   - Debe referenciar:
     - la habitacion reservada (`Room`)
     - el huesped (`Guest`)
   - El objetivo es que puedas preguntar facilmente: “que reservas hay para esta habitacion en este rango de fechas?”.

Importante:

- Anota correctamente cada clase con `@Entity` y `@Table`.
- Define su clave primaria con `@Id`.
- **Importante:** Define las relaciones con `@OneToMany`, `@ManyToOne`, etc que vas a detectar en la bbdd **archivos/hotel_puerto.db** que se adjunta.
- Asegurate de que las columnas que son obligatorias aparezcan como `nullable = false` donde proceda.

---

## 4. Interfaces de repositorio (`org.docencia.hotel.domain.repository`)

Para cada entidad crea una interfaz de repositorio que contenga las operaciones minimas que el dominio necesita.

Por ejemplo, cada repositorio deberia declarar metodos para:

- Comprobar si existe una entidad por su id.
- Recuperar una entidad por id.
- Recuperar todas las entidades (listar).
- Guardar (crear/actualizar) una entidad.
- Eliminar por id.

Ademas, algunos repositorios necesitan metodos de dominio especificos. Incluyelos en la interfaz:

- `RoomRepository`: un metodo para obtener todas las habitaciones de un hotel concreto.
- `BookingRepository`: un metodo para obtener todas las reservas de una habitacion en un rango de fechas (para comprobar disponibilidad).

---

## 5. Clase abstracta generica de persistencia (`org.docencia.hotel.persistence.jpa`)

Si detectas funciones que se repiten, crea una clase **abstracta** reutilizable.

---

## 6. Implementaciones concretas JPA (`org.docencia.hotel.persistence.jpa`)

Por cada interfaz de `org.docencia.hotel.domain.repository`, crea una implementacion en esta capa.

Ejemplos de responsabilidades que TIENES que cubrir en cada una de las clases concretas:

- **HotelJpaRepository**
  - Heredar de la clase abstracta generica.
  - Implementar la interfaz `HotelRepository`.
  - Delegar en la clase base las operaciones CRUD basicas.
  - Esta implementacion deberia poder ser detectada por Spring para inyeccion (por ejemplo mediante anotaciones de estereotipo de repositorio).

- **RoomJpaRepository**
  - Heredar de la clase abstracta generica.
  - Implementar la interfaz `RoomRepository`.
  - Incluir la logica para recuperar las habitaciones de un hotel concreto (consulta filtrada por id de hotel).
  - Tambien debe ser detectable por Spring.

- **GuestJpaRepository**
  - Heredar de la clase abstracta generica.
  - Implementar la interfaz `GuestRepository`.
  - Delegar operaciones CRUD.

- **BookingJpaRepository**
  - Heredar de la clase abstracta generica.
  - Implementar la interfaz `BookingRepository`.
  - Incluir la consulta que devuelve las reservas de una habitacion dada dentro de un rango de fechas dado.
    - Este metodo te servira para comprobar si hay solapes de reservas.
  - Tambien debe ser componente Spring.

Nota: estas clases SI van a usar `EntityManager` y JPQL / consultas JPA para implementar las busquedas especificas.

---

## 7. Configuracion de persistencia

Tu proyecto debe ser capaz de levantar un `EntityManager` y hablar con una base de datos.

Si usas Spring Boot:

- Anade la dependencia de `spring-boot-starter-data-jpa`.
- Anade el driver JDBC de SQLite.
- Configura en `application.properties` (o `application-test.properties`) la URL JDBC que apunta a un fichero `.db` de SQLite.
- Configura el modo DDL de Hibernate (por ejemplo `create-drop` en entorno de pruebas para que cree las tablas al arrancar).

---

## 8. Pruebas de integracion

Crea tests de integracion en `src/test/java` que verifiquen que tus repositorios funcionan de verdad contra SQLite.

Cada test debe:

1. Arrancar el contexto (por ejemplo con `@SpringBootTest` si usas Spring Boot).
2. Usar un perfil de pruebas (por ejemplo `test`) para apuntar a una base de datos de test.
3. Insertar datos de ejemplo antes de cada test (por ejemplo creando un Hotel, dos Room, un Guest, etc.).
4. Ejecutar operaciones reales del repositorio:
   - Guardar entidades nuevas.
   - Recuperar por id.
   - Listar todas.
   - Borrar.
   - Consultas especificas (habitaciones de un hotel, reservas en rango de fechas).
5. Verificar con aserciones que los datos devueltos son los esperados.

Muy importante: ejecuta los tests de forma que los datos de un test no contaminen el siguiente.  
Forma habitual de conseguirlo:

- Usar transacciones en los tests y hacer rollback automatico al final de cada metodo.
- O bien recrear la BBDD en memoria para cada test (por ejemplo con `create-drop`).

---

## 9. Base de datos SQLite de ejemplo

Para que puedas probar sin tener que inventarte datos desde cero, te proporcionamos un fichero SQLite que incluye:

- Tabla `hotel`
- Tabla `room`
- Tabla `guest`
- Tabla `booking`
- Filas de ejemplo con un hotel, un par de habitaciones, dos huespedes y reservas de ejemplo.

Usa esta base para:

- Apuntar tu config de desarrollo (por ejemplo `spring.datasource.url=jdbc:sqlite:/ruta/a/hotel_puerto.db`).
- Hacer consultas manuales con cualquier cliente SQLite.
- Verificar si tus repositorios leen lo que deberian.

El fichero generado se llama `hotel_puerto.db`.

---

## 10. ¿Qué debes de implementar?

1. **Paquetes creados correctamente**
   - `org.docencia.hotel.domain.model`
   - `org.docencia.hotel.domain.repository`
   - `org.docencia.hotel.persistence.jpa`

2. **Entidades del dominio**
   - Hotel, Room, Guest, Booking definidas como entidades JPA.
   - Relaciones:
     - Hotel -> muchas Room
     - Booking -> una Room
     - Booking -> un Guest
   - Campos basicos (nombre hotel, numero habitacion, precio noche, etc.) definidos.

3. **Interfaces de repositorio**
   - Cada una declara:
     - existePorId / existsById
     - buscarPorId / findById
     - listarTodo / findAll
     - guardar / save
     - borrarPorId / deleteById
   - Mas metodos especificos:
     - RoomRepository: buscar habitaciones por id de hotel.
     - BookingRepository: buscar reservas por habitacion y rango de fechas.

4. **Clase abstracta generica**
   - Clase comun en `persistence.jpa` con la logica CRUD repetible. *Si detectas que es necesario*

5. **Repositorios JPA concretos**
   - Una clase concreta por cada interfaz.
   - Extienden la clase abstracta.
   - Implementan las busquedas especificas.
   - Estan preparadas para ser inyectadas (por ejemplo con anotacion de repositorio en Spring).

6. **Configuracion de persistencia**
   - La aplicacion sabe conectarse a SQLite mediante JDBC.
   - Hibernate/JPA reconoce las entidades.

7. **Tests de integracion**
   - Hay tests que insertan, leen, actualizan y borran datos reales usando los repositorios.
   - Se comprueba la logica especial (habitaciones por hotel, reservas en rango de fechas).
   - Los tests no se pisan entre si (rollback o BBDD separada).

8. **BBDD SQLite funcional**
   - Puedes abrir `hotel_puerto.db` con un visor SQLite.
   - Ves tablas `hotel`, `room`, `guest`, `booking`.
   - Ves datos de ejemplo coherentes (habitaciones pertenecen al hotel, reservas referencian habitacion y huesped).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
