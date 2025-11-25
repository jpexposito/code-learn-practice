# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Acceso a Datos: "Ejecución de procesos del sistema con Spring Boot")

## Introducción

El siguiente ejemplo explica **paso a paso** cómo crear un pequeño proyecto en **Spring Boot** que se conecte a una base de datos **MongoDB** y exponga un CRUD sencillo de `Persona` (con una `Direccion` embebida).

Vas a cosnseguir:

- Levantar un MongoDB (con Docker).
- Crear un proyecto Spring Boot con **Spring Data MongoDB**.
- Configurar la conexión (`application.properties`).
- Crear entidades, repositorio y controlador REST.
- Probar la conexión y ver datos en la base de datos.

---

### Verifica

```bash
java -version
mvn -version
docker --version
docker compose version
```

---

## Proyecto base de Spring

Se adjunta en la carpeta `archivos` un proyecto llamado `crud-mongo` con todo lo básico para realizar la tarea.

### Dependencias a añadir

- **Spring Web**
- **Spring Data MongoDB**
- (Opcional) **Spring Boot DevTools**
- (Opcional) **Lombok** (si la usas)

Descarga el proyecto (un `.zip`), descomprímelo y ábrelo con tu IDE.

---

## Levantar MongoDB con Docker Compose

En el directorio raíz del proyecto y en la carpeta `archivos` se encuentra el archivo `docker-compose.yml` similar a:

```yaml
services:
  mongo:
    image: mongo:7.0
    container_name: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: rootpassword
      MONGO_INITDB_DATABASE: personas_db
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db

  mongo-express:
    image: mongo-express:latest
    container_name: mongo-express
    restart: always
    depends_on:
      - mongo
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: rootpassword
      ME_CONFIG_MONGODB_SERVER: mongo
      ME_CONFIG_MONGODB_ENABLE_ADMIN: "true"
      ME_CONFIG_BASICAUTH_USERNAME: admin
      ME_CONFIG_BASICAUTH_PASSWORD: admin
    ports:
      - "8081:8081"

volumes:
  mongo_data:
```

Para levantar la base de datos:

```bash
docker compose up -d
```

- MongoDB estará en `localhost:27017`
- Mongo Express en `http://localhost:8081` (usuario: `admin`, password: `admin`)

---

## Configurar Spring Boot para usar MongoDB

En `src/main/resources/application.properties` añade:

```properties
spring.application.name=personas-mongo

# Conexión a MongoDB (usuario root, password root)
spring.data.mongodb.uri=mongodb://root:root@localhost:27017/personas_db?authSource=admin
spring.data.mongodb.database=personas_db

# Puerto de la aplicación en un futuro
#server.port=8080

# Logs (opcional, para ver lo que hace Spring Data Mongo)
logging.level.org.springframework.data.mongodb.core.MongoTemplate=DEBUG
```

> `personas_db` será el nombre de la base de datos que use el proyecto.

---

## Crear las clases de dominio (Persona y Direccion)

### Clase `Direccion`

Crea el paquete `com.docencia.mongo.model` y dentro el fichero `Direccion.java`:

```java
package com.docencia.mongo.model;

import org.springframework.data.mongodb.core.mapping.Field;

public class Direccion {

    @Field("calle")
    private String calle;

    @Field("ciudad")
    private String ciudad;

    @Field("codigo_postal")
    private String codigoPostal;

    @Field("pais")
    private String pais;

    public Direccion() {
    }

    public Direccion(String calle, String ciudad, String codigoPostal, String pais) {
        this.calle = calle;
        this.ciudad = ciudad;
        this.codigoPostal = codigoPostal;
        this.pais = pais;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    @Override
    public String toString() {
        return calle + ", " + ciudad + " (" + codigoPostal + "), " + pais;
    }
}
```

### Clase `Persona` (documento MongoDB)

En el mismo paquete, crea `Persona.java`:

```java
package com.docencia.mongo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "personas")
public class Persona {

    @Id
    private String id;

    @Field("nombre")
    private String nombre;

    @Field("edad")
    private Integer edad;

    @Field("email")
    private String email;

    @Field("direccion")
    private Direccion direccion;

    public Persona() {
    }

    public Persona(String nombre, Integer edad, String email, Direccion direccion) {
        this.nombre = nombre;
        this.edad = edad;
        this.email = email;
        this.direccion = direccion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "Persona{" +
                "id='" + id + '\'' +
                ", nombre='" + nombre + '\'' +
                ", edad=" + edad +
                ", email='" + email + '\'' +
                ", direccion=" + direccion +
                '}';
    }
}
```

> Recuerda [Documentos y anotaciones en bbdd no relacionales](https://github.com/jpexposito/code-learn/tree/main/segundo/aed/unidades/unidad-3#-3-nosql-documental-mongodb-y-spring-data-mongodb).

---

## Crear el repositorio Mongo (`MongoRepository`)

Crea el paquete `com.docencia.mongo.repository` y dentro `PersonaRepository.java`:

```java
package com.docencia.mongo.repository;

import com.docencia.mongo.model.Persona;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.List;
import java.util.Optional;

public interface PersonaRepository extends MongoRepository<Persona, String> {

    Optional<Persona> findByEmail(String email);

    List<Persona> findByNombreContainingIgnoreCase(String nombre);

    List<Persona> findByEdadBetween(Integer min, Integer max);

    @Query("{ 'direccion.ciudad': ?0 }")
    List<Persona> findByCiudad(String ciudad);
}
```

> Aquí ya se ve la parte potente de Spring Data MongoDB: métodos derivados del nombre (`findByNombreContainingIgnoreCase`) y consultas JSON con `@Query`.

---

## Servicio para encapsular la lógica

Crea el paquete `com.example.personasmongo.service` y `PersonaService.java`:

```java
package com.docencia.mongo.service;

import com.docencia.mongo.model.Persona;
import com.docencia.mongo.repository.PersonaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonaService {

    private final PersonaRepository personaRepository;

    public PersonaService(PersonaRepository personaRepository) {
        this.personaRepository = personaRepository;
    }

    public List<Persona> findAll() {
        return personaRepository.findAll();
    }

    public Optional<Persona> findById(String id) {
        return personaRepository.findById(id);
    }

    public Persona save(Persona persona) {
        return personaRepository.save(persona);
    }

    public void deleteById(String id) {
        personaRepository.deleteById(id);
    }
}
```

---

## Clase principal de la aplicación

En `com.docencia.mongo`, asegúrate de tener algo como:

```java
package com.docencia.mongo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PersonasMongoApplication {

    public static void main(String[] args) {
        SpringApplication.run(PersonasMongoApplication.class, args);
    }
}
```

---

## Ejecutar y probar

### Levantar MongoDB

Si todavía no está levantado:

```bash
docker compose up -d
```

Comprueba contenedores:

```bash
docker ps
```

### Arrancar la aplicación Spring Boot

Desde el directorio del proyecto:

```bash
mvn spring-boot:run
```

O desde el IDE, ejecutando la clase `PersonasMongoApplication`.

Deberías ver en la consola algo parecido a:

- `... Started PersonasMongoApplication ...`

## Visualizar datos en Mongo Express

Con el contenedor `mongo-express` levantado:

1. Abre en el navegador: `http://localhost:8081`
2. Usuario: `admin`
3. Contraseña: `admin`
4. Selecciona la base de datos `personas_db`
5. En la colección `personas` verás los documentos creados desde tu API.

---

## Errores típicos y cómo comprobar la conexión

- **Error de autenticación (`Authentication failed`)**  
  - Revisa usuario/contraseña en `docker-compose.yml` y `application.properties`.
- **Error de conexión (`Connection refused`)**  
  - Asegúrate de que el contenedor de Mongo está levantado y usa `localhost:27017`.
- **La colección no existe**  
  - Mongo la crea automáticamente al insertar el primer documento.

## Verificando el correcto funcionamiento a través de test

### Dependencia de tests (Maven)

En el `pom.xml` debe estar (Spring Boot ya la añade normalmente):

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>
```

Con esto tienes JUnit 5, AssertJ, etc.

---

#### Test de integración del repositorio (`PersonaRepositoryIT`)

Este test comprueba que **PersonaRepository** funciona bien contra Mongo:

- Guarda personas.
- Las recupera con los métodos personalizados:
  - `findByEmail`
  - `findByNombreContainingIgnoreCase`
  - `findByEdadBetween`
  - `findByCiudad` (con `@Query`).

##### Ubicación del test

Crea el fichero:

`src/test/java/com/docencia/mongo/repository/PersonaRepositoryIT.java`

##### Código del test

```java
package com.docencia.mongo.repository;

@SpringBootTest
@ActiveProfiles("test") // usa application-test.properties o la bbdd por defecto sin profile
class PersonaRepositoryIT {

    @Autowired
    private PersonaRepository personaRepository;

    @BeforeEach
    void cleanDatabase() {
        
        personaRepository.deleteAll();
    }

    private Persona nuevaPersona(String nombre, int edad, String email, String ciudad) {
        Direccion direccion = new Direccion("Calle Falsa 123", ciudad, "12345", "España");
        return new Persona(nombre, edad, email, direccion);
    }

    @Test
    @DisplayName("Guardar y buscar por email")
    void saveAndFindByEmail() {
        Persona p = nuevaPersona("Ada Lovelace", 36, "ada@example.com", "Londres");
        personaRepository.save(p);

        Optional<Persona> resultado = personaRepository.findByEmail("ada@example.com");

        assertThat(resultado).isPresent();
        assertThat(resultado.get().getNombre()).isEqualTo("Ada Lovelace");
    }

    @Test
    @DisplayName("Buscar por nombre que contiene (ignorando mayúsculas/minúsculas)")
    void findByNombreContainingIgnoreCase() {
        personaRepository.save(nuevaPersona("Ada Lovelace", 36, "ada@example.com", "Londres"));
        personaRepository.save(nuevaPersona("Alan Turing", 41, "alan@example.com", "Londres"));
        personaRepository.save(nuevaPersona("Grace Hopper", 50, "grace@example.com", "Nueva York"));

        List<Persona> resultado = personaRepository.findByNombreContainingIgnoreCase("a");


        assertThat(resultado)
                .extracting(Persona::getNombre)
                .containsExactlyInAnyOrder("Ada Lovelace", "Alan Turing", "Grace Hopper");
    }

    @Test
    @DisplayName("Buscar por rango de edad (Between)")
    void findByEdadBetween() {
        personaRepository.save(nuevaPersona("Ada Lovelace", 36, "ada@example.com", "Londres"));
        personaRepository.save(nuevaPersona("Alan Turing", 41, "alan@example.com", "Londres"));
        personaRepository.save(nuevaPersona("Grace Hopper", 50, "grace@example.com", "Nueva York"));

        List<Persona> entre30y45 = personaRepository.findByEdadBetween(30, 45);

        assertThat(entre30y45)
                .extracting(Persona::getNombre)
                .containsExactlyInAnyOrder("Ada Lovelace", "Alan Turing");
    }

    @Test
    @DisplayName("Buscar por ciudad usando @Query sobre direccion.ciudad")
    void findByCiudad() {
        personaRepository.save(nuevaPersona("Ada Lovelace", 36, "ada@example.com", "Londres"));
        personaRepository.save(nuevaPersona("Alan Turing", 41, "alan@example.com", "Londres"));
        personaRepository.save(nuevaPersona("Grace Hopper", 50, "grace@example.com", "Nueva York"));

        List<Persona> londres = personaRepository.findByCiudad("Londres");

        assertThat(londres)
                .hasSize(2)
                .extracting(Persona::getNombre)
                .containsExactlyInAnyOrder("Ada Lovelace", "Alan Turing");
    }
}
```

Puntos importantes:

- `@SpringBootTest` levanta todo el contexto de Spring (repositorio real + conexión Mongo).
- `@ActiveProfiles("test")` hace que se use `application-test.properties`.
- `personaRepository.deleteAll()` en `@BeforeEach` asegura que cada test empieza con la colección vacía.
- Se usan aserciones de **AssertJ** (`assertThat(...)`) para que los tests sean legibles.

---

## Ejecutar los tests

Asegúrate de que MongoDB está levantado con Docker:

```bash
docker compose up -d
```

Luego ejecuta los tests:

```bash
mvn clean test
```

O desde el IDE (clic derecho sobre el paquete `src/test/java` → **Run tests**).

Si todo está bien:

- Spring levantará el contexto en modo test.
- Se conectará a `personas_test o personas_db` si tienes `profiel o no activo`.
- Ejecutará los tests del repositorio y del controlador.
- Verás en consola los logs de inserciones/consultas en MongoDB.

---

### Qué estás verificando realmente

Con estos tests estás comprobando que:

1. El **mapeo** de `Persona`/`Direccion` a documentos Mongo funciona.
2. Las **consultas personalizadas** de `PersonaRepository` (`findByEmail`, `findByCiudad`, etc.) hacen lo que esperas.
3. El proyecto está correctamente configurado para usar **perfiles** (`test` para pruebas, otro para desarrollo) `si esta activo`.

Estos tests te dan confianza en que tu capa de persistencia y tu API funcionan
sobre una base de datos real, no solo “en memoria”.

## Referencias

- [Documentación de la unidad](https://github.com/jpexposito/code-learn/blob/main/segundo/aed/unidades/unidad-3)
- [Spring data and Mongo](https://spring.io/projects/spring-data-mongodb).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
