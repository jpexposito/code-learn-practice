# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice  
(Acceso a Datos: **Persistencia Polyglot para `hotel-puerto` con H2 + NoSQL**)
<img src=https://wwcdn.weddingwire.com/vendor/65001_70000/67195/thumbnails/1200x1200_1367340572768-hotel-evening-new.jpg width="400">

## 1. Objetivo del ejercicio

Vas a construir la capa de persistencia (repositorios) de un dominio hotelero usando **polyglot persistence**:

- Una **BBDD relacional H2** para los datos estructurados (Hotel, Room, Guest, Booking).
- Una **BBDD no relacional** (por ejemplo, MongoDB u otra documental) para almacenar **parte de la información de los huéspedes**.

Al final del ejercicio deberías tener:

- Entidades JPA que representan el dominio (Hotel, Room, Guest, Booking) persistidas en H2.
- Una clase de documento NoSQL (`GuestPreferences` o similar) vinculada a `Guest`.
- Interfaces de repositorio con las operaciones que la aplicación necesita (relacional y NoSQL).
- Una clase base abstracta de repositorio JPA reutilizable.
- Implementaciones concretas JPA de cada repositorio.
- Implementaciones concretas para la parte NoSQL.
- Un **repositorio polyglot de Guest** que combine H2 + NoSQL para devolver un huésped “completo”.
- Tests de integración contra una BBDD H2 de prueba y contra la BBDD NoSQL de prueba.

El ejercicio se realiza bajo el paquete base `org.docencia.hotel`.

---

## 2. Estructura de paquetes

Crea esta estructura dentro de `src/main/java`:

- `org.docencia.hotel.model`
  - Aquí irán las entidades del dominio relacional (Hotel, Room, Guest, Booking).
  - Cada entidad debe estar mapeada con anotaciones JPA (`@Entity`, `@Table`, `@Id`, etc).
  - Define también las relaciones entre entidades (por ejemplo, un Hotel tiene muchas Room, una Booking pertenece a una Room y a un Guest, etc.).

- `org.docencia.hotel.model.nosql`
  - Aquí irán las clases de documentos de la parte NoSQL.
  - Debes crear al menos:
    - `GuestPreferences` (o nombre similar), que representa información adicional de un huésped que se almacenará en la BBDD no relacional.

- `org.docencia.hotel.domain.repository`
  - Aquí irán las **interfaces** de repositorio del dominio.
  - Cada interfaz representa el contrato funcional que necesita tu dominio. Ejemplo:
    - `HotelRepository`
    - `RoomRepository`
    - `GuestRepository` (esta será la interfaz polyglot para huésped completo)
    - `BookingRepository`
    - `GuestPreferencesRepository` (para la parte NoSQL, si quieres separar contrato)
  - No pongas implementación aquí, solo el contrato.

- `org.docencia.hotel.persistence.jpa`
  - Aquí irán las clases que **implementan** las interfaces necesarias usando JPA/Hibernate contra H2.
  - Incluye una clase abstracta común (por ejemplo `AbstractJpaRepository<T, ID>`) que ofrezca operaciones CRUD genéricas reutilizables.
  - Incluye una clase concreta por cada repositorio relacional:
    - `HotelJpaRepository`
    - `RoomJpaRepository`
    - `GuestJpaRepository`
    - `BookingJpaRepository`
  - Cada clase concreta:
    - debe extender la clase abstracta genérica,
    - debe implementar la interfaz de repositorio **relacional** que definas (si la separas del polyglot),
    - debe declarar las consultas específicas (por ejemplo buscar habitaciones por hotel, buscar reservas por rango de fechas, etc.),
    - debe ser marcada como componente de infraestructura (por ejemplo, anotación de repositorio en Spring).

- `org.docencia.hotel.persistence.nosql`
  - Aquí irán las clases que implementan la persistencia en la BBDD no relacional.
  - Debes incluir:
    - Una interfaz/implementación para manejar `GuestPreferences` en la BBDD NoSQL  
      (por ejemplo `GuestPreferencesDocumentRepository` usando `MongoTemplate` o Spring Data Mongo).

- `org.docencia.hotel.persistence.polyglot`
  - Aquí irán los adaptadores/repositorios que **combinan** H2 + NoSQL.
  - Al menos:
    - `GuestPolyglotRepository` (nombre orientativo), que implementa `GuestRepository` del dominio y orquesta:
      - la parte relacional (huesped básico en H2),
      - la parte NoSQL (`GuestPreferences`).

Crea también en `src/test/java` un paquete equivalente para las pruebas de integración:

- `org.docencia.hotel.persistence` o similar, donde pondrás tus tests de integración (relacional, NoSQL y polyglot).

---

## 3. Entidades del dominio relacional (`org.docencia.hotel.model`)

Debes crear al menos cuatro entidades JPA:

1. `Hotel`
   - Campos básicos: identificador único, nombre, dirección.
   - Relación uno-a-muchos con `Room` (un hotel tiene muchas habitaciones).
   - Esta relación debe representarse con una lista/colección en `Hotel` y una referencia inversa en `Room`.

2. `Room`
   - Campos básicos: identificador único, número de habitación, tipo, precio por noche.
   - Debe tener una referencia al `Hotel` al que pertenece (muchas habitaciones pertenecen a un mismo hotel).
   - Esta relación es de muchos-a-uno (muchas Room -> un Hotel).

3. `Guest`
   - Campos básicos: identificador único, nombre completo, email, teléfono.
   - **Parte polyglot:**  
     - Añade un campo **no persistido por JPA** con `@Transient`, que representará los datos complementarios que se cargan desde NoSQL. Ejemplo:
  
       ```java
       @Transient
       private GuestPreferences preferences;
       ```

     - La clave que une las dos partes será el `id` del `Guest`.

4. `Booking`
   - Campos básicos: identificador único, fecha de entrada (checkIn), fecha de salida (checkOut).
   - Debe referenciar:
     - la habitación reservada (`Room`)
     - el huésped (`Guest`)
   - El objetivo es que puedas preguntar fácilmente: “¿qué reservas hay para esta habitación en este rango de fechas?”.

Importante:

- Anota correctamente cada clase con `@Entity` y `@Table`.
- Define su clave primaria con `@Id`.
- Define las relaciones con `@OneToMany`, `@ManyToOne`, etc.
- Asegúrate de que las columnas que son obligatorias aparezcan como `nullable = false` donde proceda.

---

## 4. Documento NoSQL de huésped (`org.docencia.hotel.model.nosql`)

Crea la clase:

### `GuestPreferences`

Representa datos adicionales del huésped que **no** se almacenan en H2, sino en una BBDD no relacional (por ejemplo MongoDB).

Campos orientativos:

- `guestId` (identificador del huésped, mismo valor que `Guest.id`).
- `preferredLanguage`
- `newsletterOptIn` (booleano).
- `favoriteRoomType` (por ejemplo, “suite”, “doble”, etc.).
- `tags` (lista de cadenas, por ejemplo `["vip", "early-checkin"]`).
- `notes` (texto libre).

Si usas Spring Data Mongo, puedes anotarla como:

```java
@Document(collection = "guest_preferences")
public class GuestPreferences {
    @Id
    private String id; // puede ser el mismo que guestId o un ObjectId
    private Long guestId;
    // resto de campos...
}
```

La idea es que un `Guest` “completo” estará compuesto por:

- Parte relacional (H2): datos básicos (`Guest` JPA).
- Parte NoSQL: `GuestPreferences`, cargada usando `guestId`.

---

## 5. Interfaces de repositorio del dominio (`org.docencia.hotel.domain.repository`)

Para cada entidad crea una interfaz de repositorio que contenga las operaciones mínimas que el dominio necesita.

### 5.1 Repositorios relacionales (H2)

Ejemplos:

- `HotelRepository`
- `RoomRepository`
- `BookingRepository`

Cada repositorio debería declarar métodos para:

- Comprobar si existe una entidad por su id.
- Recuperar una entidad por id.
- Recuperar todas las entidades (listar).
- Guardar (crear/actualizar) una entidad.
- Eliminar por id.

Además:

- `RoomRepository`: un método para obtener todas las habitaciones de un hotel concreto.
- `BookingRepository`: un método para obtener todas las reservas de una habitación en un rango de fechas (para comprobar disponibilidad).

### 5.2 Repositorio polyglot de `Guest`

Define `GuestRepository` como **repositorio del dominio** que trabaja con el `Guest` completo (incluyendo las preferencias):

- `Optional<Guest> findById(Long id);`
- `Guest save(Guest guest);`
- etc.

La implementación de esta interfaz será la que combine H2 + NoSQL.

### 5.3 Repositorio de `GuestPreferences` (NoSQL)

Opcionalmente define un contrato específico:

- `GuestPreferencesRepository`
  - `Optional<GuestPreferences> findByGuestId(Long guestId);`
  - `GuestPreferences save(GuestPreferences prefs);`
  - `void deleteByGuestId(Long guestId);`

Este contrato se implementará en la capa `persistence.nosql`.

---

## 6. Clase abstracta genérica de persistencia (`org.docencia.hotel.persistence.jpa`)

Si detectas funciones que se repiten, crea una clase **abstracta** reutilizable, por ejemplo:

```java
public abstract class AbstractJpaRepository<T, ID> {

    @PersistenceContext
    protected EntityManager em;

    private final Class<T> entityClass;

    protected AbstractJpaRepository(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    public Optional<T> findById(ID id) { ... }

    public List<T> findAll() { ... }

    public T save(T entity) { ... }

    public void deleteById(ID id) { ... }

    public boolean existsById(ID id) { ... }
}
```

Tus repositorios JPA concretos heredarán de esta clase.

---

## 7. Implementaciones concretas JPA (`org.docencia.hotel.persistence.jpa`)

Por cada interfaz relacional de `org.docencia.hotel.domain.repository`, crea una implementación en esta capa.

### 7.1 HotelJpaRepository

- Heredar de la clase abstracta genérica.
- Implementar la interfaz `HotelRepository` (o la parte relacional si la has separado).
- Delegar en la clase base las operaciones CRUD básicas.
- Debe poder ser detectada por Spring para inyección (`@Repository`).

### 7.2 RoomJpaRepository

- Heredar de la clase abstracta genérica.
- Implementar la interfaz `RoomRepository`.
- Incluir la lógica para recuperar las habitaciones de un hotel concreto (consulta filtrada por id de hotel).
- También debe ser detectable por Spring.

### 7.3 GuestJpaRepository

- Heredar de la clase abstracta genérica.
- Encargarse solo de la parte **relacional** de `Guest`.
- Devolver/recibir instancias de `Guest` teniendo en cuenta que el campo `preferences` es `@Transient` (no se almacena en H2).
- Esta clase normalmente será un “adaptador interno” que usará el repositorio polyglot.

### 7.4 BookingJpaRepository

- Heredar de la clase abstracta genérica.
- Implementar la interfaz `BookingRepository`.
- Incluir la consulta que devuelve las reservas de una habitación dada dentro de un rango de fechas dado.
- También debe ser componente Spring.

---

## 8. Implementaciones NoSQL y repositorio polyglot

### 8.1 GuestPreferences NoSQL (`org.docencia.hotel.persistence.nosql`)

Crea una implementación de `GuestPreferencesRepository` que trabaje con tu BBDD NoSQL:

- Si usas Mongo:
  - Añade la dependencia `spring-boot-starter-data-mongodb`.
  - Puedes implementar el repositorio con:
    - una interfaz que extienda `MongoRepository<GuestPreferences, String>`, o
    - una clase que use `MongoTemplate`.

Debe permitir:

- Guardar/actualizar las preferencias de un huésped.
- Buscar por `guestId`.
- Borrar por `guestId`.

### 8.2 Repositorio polyglot de Guest (`org.docencia.hotel.persistence.polyglot`)

Crea `GuestPolyglotRepository` (nombre orientativo) que implemente la interfaz de dominio `GuestRepository` y que:

- Inyecte:
  - `GuestJpaRepository` (para la parte H2),
  - `GuestPreferencesRepository` (para la parte NoSQL).
- En `findById(id)`:
  1. Cargar el `Guest` básico desde H2.
  2. Cargar `GuestPreferences` desde NoSQL usando `guestId`.
  3. Asignar las preferencias al `Guest` (`guest.setPreferences(prefs)`).
  4. Devolver el `Guest` completo.
- En `save(guest)`:
  1. Guardar la parte relacional en H2 mediante `GuestJpaRepository`.
  2. Guardar las preferencias en NoSQL (si `guest.getPreferences()` no es `null`).
  3. Devolver el `Guest` actualizado.
- En `deleteById(id)` (si lo necesitas):
  1. Borrar en H2.
  2. Borrar las preferencias asociadas en NoSQL.

Con esto cumples el requisito: **un mismo objeto de dominio (`Guest`) tiene parte de su estado en la BBDD relacional H2 y parte en la BBDD no relacional.**

---

## 9. Configuración de persistencia

### 9.1 BBDD relacional H2

Tu proyecto debe ser capaz de levantar un `EntityManager` y hablar con una base de datos **H2**.

Si usas Spring Boot:

- Añade la dependencia de `spring-boot-starter-data-jpa`.
- Añade la dependencia de H2.
- Configura en `application.properties` (o `application-test.properties`) la URL JDBC que apunta a H2. Por ejemplo, para BBDD en memoria:
  ```properties
  spring.datasource.url=jdbc:h2:mem:hotel_puerto;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
  spring.datasource.driver-class-name=org.h2.Driver
  spring.jpa.hibernate.ddl-auto=create-drop
  ```
- Configura el dialecto de H2 si es necesario.

Puedes usar scripts `schema.sql` / `data.sql` para cargar datos iniciales, o dejar que JPA genere el esquema.

### 9.2 BBDD NoSQL

Configura tu BBDD no relacional (ejemplo con MongoDB):

- Añade la dependencia de `spring-boot-starter-data-mongodb`.
- Configura en `application.properties` algo como:
  ```properties
  spring.data.mongodb.uri=mongodb://localhost:27017/hotel_puerto
  ```
- Crea las colecciones necesarias (por ejemplo `guest_preferences`) explícitamente o deja que se creen automáticamente.

Para los tests puedes usar:

- Un MongoDB de desarrollo, o
- Una solución embebida / contenedores de test.

---

## 10. Pruebas de integración

Crea tests de integración en `src/test/java` que verifiquen que tus repositorios funcionan de verdad contra H2 y la BBDD NoSQL.

Cada test debería:

1. Arrancar el contexto (por ejemplo con `@SpringBootTest`).
2. Usar un perfil de pruebas (por ejemplo `test`) para apuntar a BBDD de test.
3. Insertar datos de ejemplo antes de cada test (por ejemplo creando un Hotel, dos Room, un Guest, etc.).
4. Ejecutar operaciones reales de los repositorios:
   - Relacionales:
     - Guardar entidades nuevas en H2.
     - Recuperar por id.
     - Listar todas.
     - Borrar.
     - Consultas específicas (habitaciones de un hotel, reservas en rango de fechas).
   - NoSQL:
     - Guardar `GuestPreferences`.
     - Buscar por `guestId`.
   - Polyglot:
     - Guardar un `Guest` con preferencias.
     - Recuperar un `Guest` y comprobar que lleva sus preferencias cargadas.
5. Verificar con aserciones que los datos devueltos son los esperados.

Muy importante: ejecuta los tests de forma que los datos de un test no contaminen el siguiente.  
Formas habituales de conseguirlo:

- Usar transacciones en los tests y hacer rollback automático al final de cada método (para H2).
- Limpiar las colecciones de la BBDD NoSQL antes de cada test.

---

## 11. ¿Qué debes implementar?

1. **Paquetes creados correctamente**
   - `org.docencia.hotel.model`
   - `org.docencia.hotel.model.nosql`
   - `org.docencia.hotel.domain.repository`
   - `org.docencia.hotel.persistence.jpa`
   - `org.docencia.hotel.persistence.nosql`
   - `org.docencia.hotel.persistence.polyglot`

2. **Entidades del dominio (relacional)**
   - `Hotel`, `Room`, `Guest`, `Booking` definidas como entidades JPA.
   - Relaciones:
     - Hotel -> muchas Room
     - Booking -> una Room
     - Booking -> un Guest
   - Campos básicos (nombre hotel, número habitación, precio noche, etc.) definidos.
   - En `Guest`, un campo `@Transient` para `GuestPreferences`.

3. **Documento NoSQL**
   - `GuestPreferences` con los campos adicionales del huésped.
   - Relacionado con `Guest` mediante `guestId`.

4. **Interfaces de repositorio**
   - Repositorios relacionales:
     - `HotelRepository`, `RoomRepository`, `BookingRepository`.
     - Cada uno declara:
       - `existsById`
       - `findById`
       - `findAll`
       - `save`
       - `deleteById`
     - Métodos específicos:
       - `RoomRepository`: buscar habitaciones por id de hotel.
       - `BookingRepository`: buscar reservas por habitación y rango de fechas.
   - `GuestRepository` como repositorio **polyglot** del dominio.
   - `GuestPreferencesRepository` para la parte NoSQL (si lo separas).

5. **Clase abstracta genérica**
   - Clase común en `persistence.jpa` con la lógica CRUD repetible para JPA.

6. **Repositorios JPA concretos**
   - Una clase concreta por cada interfaz relacional.
   - Extienden la clase abstracta.
   - Implementan las búsquedas específicas.
   - Están preparadas para ser inyectadas (por ejemplo con anotación `@Repository`).

7. **Repositorios NoSQL**
   - Implementación de `GuestPreferencesRepository` en `persistence.nosql`.
   - Operaciones básicas de guardado, lectura y borrado por `guestId`.

8. **Repositorio polyglot de Guest**
   - `GuestPolyglotRepository` que implemente `GuestRepository`.
   - Combina `GuestJpaRepository` (H2) + `GuestPreferencesRepository` (NoSQL).
   - Al leer, monta un `Guest` con sus preferencias.
   - Al guardar, persiste en ambas BBDD.

9. **Configuración de persistencia**
   - La aplicación sabe conectarse a H2 mediante JDBC.
   - Hibernate/JPA reconoce las entidades.
   - La aplicación sabe conectarse a la BBDD NoSQL (Mongo u otra).

10. **Tests de integración**

  - Tests que insertan, leen, actualizan y borran datos reales usando los repositorios JPA contra H2.
  - Tests que trabajan con `GuestPreferences` en la BBDD NoSQL.
  - Tests que verifican el comportamiento del repositorio polyglot (`GuestRepository`).

---

## Referencias

- [Contrucción del servicio rest](https://github.com/jpexposito/code-learn/blob/main/segundo/pgv/5-red-servicos/SPRING-REST.md).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
