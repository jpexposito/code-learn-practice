# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Ejecución de procesos del sistema con Spring Boot")

## 1. ¿Cuál es el objetivo?

El objetivo es la migración del proyecto desarrollado sobre ficheros a bbdd.

¿Qué debemos de realiza?:

- Modelar una entidad de dominio sencilla (`Note`) con campos como `id`, `title` y `content`.
- Persistir esas notas en una base de datos relacional mediante JPA/Hibernate.
- Abstraer el acceso a datos mediante una interfaz de repositorio (`INoteRepository`) o bien mediante Spring Data JPA.
- Probar el comportamiento real contra la base de datos usando tests de integracion con Spring Boot.
- Medir la cobertura de codigo con JaCoCo.

Nos vamos a centrar en:

1. Arquitectura y capa de persistencia (ORM, Spring Data JPA).
2. Relaciones entre entidades (`@OneToOne`, `@OneToMany`, `@ManyToOne`).
3. Testing y aislamiento de la base de datos en los tests.
4. Cobertura de codigo con JaCoCo.
5. Referencias a documentacion oficial.

---

## 2. Arquitectura general

### 2.1 Entidad de dominio

La entidad principal es `Note`, que representa una nota almacenada en BBDD. Esta clase es una entidad JPA (`@Entity`), por lo que Hibernate la puede mapear a una tabla.

```java
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import jakarta.persistence.Table;

@Entity
@Table(name = "notes")
public class Note {

    @Id
    private String id; // normalmente un UUID como cadena

    @Column(nullable = false)
    private String title;

    @Column(length = 4000)
    private String content;

    // getters y setters
}
```

### 2.2 Repositorio

`INoteRepository` define las operaciones CRUD que la capa de dominio necesita, sin acoplarse directamente a la implementacion concreta ni a Hibernate:

```java
public interface INoteRepository {

    boolean exists(String id);

    Note findById(String id);

    Note find(Note example);

    List<Note> findAll();

    Note save(Note note);

    boolean delete(String id);
}
```

Esta interfaz se puede implementar "a mano" usando `EntityManager`, o reemplazar por una interfaz de Spring Data JPA (ver seccion 5).

### 2.3 Perfil de base de datos de pruebas

El proyecto define un perfil `test` (`@ActiveProfiles("test")`) para ejecutar los tests con una BBDD de prueba (por ejemplo SQLite, H2, etc.).  
Esto evita tocar datos reales y nos permite dejar que los tests creen, lean, actualicen y borren filas libremente.

> **Nota**: Esta solución no la hemos llevado a cabo en el ejemplo.

---

## 3. ORM y capa de persistencia

### 3.1 Que es un ORM

ORM (*Object-Relational Mapping*) es la idea de mapear clases Java a tablas de base de datos y objetos Java a filas.  
En Java estandar esto se hace con **Jakarta Persistence** (historicamente llamada JPA - Java Persistence API).

Con JPA/Jakarta Persistence:

- Anotas clases con `@Entity`.
- Anotas el campo clave con `@Id`.
- Describes columnas con `@Column`.
- Describes relaciones entre entidades con `@OneToOne`, `@OneToMany`, `@ManyToOne`, etc.

Debajo de esa especificacion suele estar **Hibernate**, que es el ORM concreto que genera el SQL real.

### 3.2 Spring Data JPA

**Spring Data JPA** es una capa adicional que hace mas facil trabajar con JPA. En lugar de escribir DAO/Repository a mano, declaras interfaces y Spring genera la implementacion en tiempo de arranque.

Caracteristicas importantes:

- Repositorios declarativos (`CrudRepository`, `JpaRepository`, etc.).
- Metodos CRUD listos (`save`, `findById`, `existsById`, `deleteById`, ...).
- Derivacion de queries a partir del nombre del metodo (`findByTitle(String title)`).
- Integracion con la gestion transaccional de Spring.

Ejemplo de un repositorio equivalente usando Spring Data JPA:

```java
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NoteRepositorySpringData extends JpaRepository<Note, String> {

    // Spring Data implementa esto automaticamente
    Optional<Note> findByTitle(String title);
}
```

> En este caso no tienes que escribir `save`, `findAll`, etc. `JpaRepository` ya los trae.

### 3.3 Ciclo de vida tipico

1. Creas un objeto `Note`.
2. Llamas a `save(note)`.
3. Spring Data JPA delega en Hibernate, que hace `INSERT` o `UPDATE`.
4. Cuando haces `findById(id)` recuperas la entidad desde la BBDD y te la devuelve como objeto `Note`.

### 3.4 Relaciones entre entidades (vision general)

JPA permite definir relaciones entre clases Java que se traducen en claves foraneas en la base de datos.  
Las mas comunes son:

- `@OneToOne`  (uno a uno)
- `@ManyToOne` (muchas instancias apuntan a una)
- `@OneToMany` (una instancia tiene muchas hijas)
- `@ManyToMany` (varias a varias, normalmente con tabla intermedia)

En las siguientes secciones se muestran ejemplos comunes.

---

## 4. Relaciones entre entidades: ejemplos

> Nota: Los paquetes/clases son solo de ejemplo. Ajusta los nombres de tabla, columnas y tipos de id a tu proyecto real.

### 4.1 Relacion One-to-One (`@OneToOne`)

Escenario: cada `Note` tiene exactamente un bloque de metadatos `NoteMetadata`, y ese bloque pertenece solo a esa `Note`.

```java
import jakarta.persistence.*;

@Entity
@Table(name = "note_metadata")
public class NoteMetadata {

    @Id
    private String id;

    private String lastEditor;
    private Long lastEditedAtEpoch;

    // getters/setters
}

@Entity
@Table(name = "notes")
public class Note {

    @Id
    private String id;

    private String title;
    private String content;

    @OneToOne
    @JoinColumn(name = "metadata_id") // FK en la tabla notes
    private NoteMetadata metadata;

    // getters/setters
}
```

Claves:

- `@OneToOne` indica la cardinalidad.
- `@JoinColumn` marca la FK en `notes.metadata_id`.
- Cada fila de `notes` apunta a exactamente una fila en `note_metadata`.

### 4.2 Relacion Many-to-One (`@ManyToOne`)

Escenario tipico: muchas notas pertenecen al mismo usuario autor.

```java
import jakarta.persistence.*;

@Entity
@Table(name = "app_user")
public class User {

    @Id
    private String id;

    private String username;
    private String displayName;

    // getters/setters
}

@Entity
@Table(name = "notes")
public class Note {

    @Id
    private String id;

    private String title;
    private String content;

    @ManyToOne
    @JoinColumn(name = "user_id") // FK en notes -> app_user.id
    private User author;

    // getters/setters
}
```

Claves:

- `@ManyToOne` en `Note` dice: "muchas notas -> un usuario".
- La FK vive en la tabla hija (`notes.user_id`).

### 4.3 Relacion One-to-Many bidireccional (`@OneToMany` / `@ManyToOne`)

Podemos hacer la relacion navegable tambien desde `User` hacia sus notas.  
Para eso usamos `mappedBy` en el lado "uno":

```java
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "app_user")
public class User {

    @Id
    private String id;

    private String username;
    private String displayName;

    @OneToMany(mappedBy = "author")
    private List<Note> notes = new ArrayList<>();

    // getters/setters
}

@Entity
@Table(name = "notes")
public class Note {

    @Id
    private String id;

    private String title;
    private String content;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User author;

    // getters/setters
}
```

Claves importantes:

- El lado `Note.author` (la parte `@ManyToOne`) es el "dueno" de la relacion porque contiene la FK real.
- El lado `User.notes` usa `@OneToMany(mappedBy = "author")` para decir "esta coleccion se mapea usando la FK definida en `Note.author`; yo no tengo mi propia FK".
- Esta es la manera tipica de modelar "un usuario tiene muchas notas" (uno-a-muchos) y "cada nota pertenece a un usuario" (muchos-a-uno).

Documentacion oficial de `@OneToMany` en la especificacion de Jakarta Persistence (incluye `mappedBy`, `cascade`, `orphanRemoval`):  
https://jakarta.ee/specifications/persistence/ (ver la seccion de la anotacion `@OneToMany`)

### 4.4 Buenas practicas con relaciones

- Preguntate si de verdad necesitas la relacion bidireccional.  
  Muchas veces basta con `@ManyToOne` en `Note` sin exponer `List<Note>` en `User`.
- Controla la carga perezosa (`LAZY`) vs ansiosa (`EAGER`).  
  Cargar demasiadas relaciones `EAGER` puede provocar queries gigantes.
- Usa `cascade` y `orphanRemoval` cuando quieras que, por ejemplo, borrar un `User` borre automaticamente sus `Note` hijas.  
  Esto debe hacerse con cuidado para no borrar datos que aun necesitas.

---

## 5. Capa de repositorio

### 5.1 Interfaz de dominio `INoteRepository`

En este proyecto se define una interfaz clara y pequeña para operaciones basicas sobre notas:

```java
public interface INoteRepository {

    boolean exists(String id);

    Note findById(String id);

    Note find(Note example);

    List<Note> findAll();

    Note save(Note note);

    boolean delete(String id);
}
```

Ventajas:

- Aisla al resto de la aplicacion de los detalles concretos de persistencia.
- Facilita el testeo, ya que se puede sustituir esta interfaz por un mock en tests unitarios.
- Permite cambiar la implementacion (por ejemplo de repositorio manual a Spring Data) sin tocar el codigo de negocio.

### 5.2 Equivalente con Spring Data JPA

Spring Data JPA ya implementa la mayoria de estos metodos a traves de `JpaRepository<T, ID>`:

```java
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NoteRepositorySpringData extends JpaRepository<Note, String> {

    // Query derivada del nombre: Spring genera el SQL automaticamente
    Optional<Note> findByTitle(String title);
}
```

Documentacion oficial de Spring Data JPA Repositories:  
https://docs.spring.io/spring-data/jpa/reference/#repositories  
Javadoc de JpaRepository (metodos CRUD ya listos):  
https://docs.spring.io/spring-data/jpa/docs/current/api/org/springframework/data/jpa/repository/JpaRepository.html

---

## 6. Testing con Spring Boot

### 6.1 Objetivo de los tests

Los tests deben comprobar que la capa de persistencia realmente funciona:

- CREATE: guardar una nota nueva.
- READ: leer por id / por criterios.
- UPDATE: modificar y volver a leer.
- EXISTS: comprobar que existe.
- DELETE: borrar y confirmar que ya no existe.

Para esto usamos `@SpringBootTest` para arrancar el contexto real de Spring Boot y un perfil `test` con una base de datos de pruebas.

### 6.2 Aislamiento de datos con `@Transactional`

Spring permite anotar los tests (o la clase de test) con `@Transactional`.  
Cuando un test es `@Transactional`, Spring abre una transaccion antes del test (incluyendo el `@BeforeEach`) y al final hace **rollback automatico**.  
Esto devuelve la base de datos a su estado inicial, evitando que los datos de un test contaminen al siguiente.

Doc oficial Spring Framework TestContext / transacciones:  
https://docs.spring.io/spring-framework/reference/testing/testcontext-framework/tx.html  
Resumen del comportamiento:

- Cada metodo de test se ejecuta dentro de una transaccion.
- Al terminar el metodo, la transaccion se revierte (rollback) por defecto.
- De este modo no necesitas scripts manuales para limpiar tablas entre tests.

### 6.3 Ejemplo de test de repositorio

```java
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
class NoteJpaRepositoryTest {

    @Autowired
    private INoteRepository noteRepository;

    private Note baseNote;

    @BeforeEach
    @Transactional
    void beforeEach() {
        Note n = new Note();
        n.setTitle("Nota base");
        n.setContent("contenido base");
        baseNote = noteRepository.save(n);

        assertThat(baseNote.getId()).isNotNull();
    }

    @Test
    @Transactional
    void updateContentTest() {
        baseNote.setContent("contenido modificado");
        Note actualizada = noteRepository.save(baseNote);

        assertThat(actualizada.getContent())
            .isEqualTo("contenido modificado");
    }

}
```

Ideas clave:

- `@SpringBootTest` levanta el contexto completo.
- `@ActiveProfiles("test")` asegura que usamos la configuracion de pruebas.
- `@BeforeEach` crea datos iniciales comunes a cada test.
- `@Transactional` en cada test garantiza rollback al final, por lo que la base de datos vuelve a estar limpia para el siguiente test.

**Importante:** si haces tests de capa web completa (`@SpringBootTest(webEnvironment = RANDOM_PORT)` y llamas endpoints HTTP reales), esa logica puede ejecutarse en otro hilo y entonces el rollback automatico puede no aplicarse a las inserciones que hace el servidor. En esos casos a veces hay que limpiar manualmente en `@AfterEach` (por ejemplo `repository.deleteAll()`). Esto es una recomendacion habitual en testing de Spring Boot end-to-end.

---

## 7. Cobertura de codigo con JaCoCo

### 7.1 Que es JaCoCo

**JaCoCo** es una herramienta de cobertura de codigo para Java.  
Se integra con Maven o Gradle para:

- Ejecutar los tests.
- Medir que lineas y ramas se han ejecutado.
- Generar un informe navegable en HTML, normalmente en `target/site/jacoco/index.html`.

Doc oficial del plugin Maven de JaCoCo:  
https://www.eclemma.org/jacoco/trunk/doc/maven.html  
Documentacion general JaCoCo:  
https://www.jacoco.org/jacoco/trunk/doc/

Cobertura alta NO significa necesariamente buenos tests, solo indica que tu codigo ha sido ejecutado por los tests.

### 7.2 Configuracion tipica Maven

En `pom.xml` se suele anadir el plugin `jacoco-maven-plugin` y el plugin `maven-surefire-plugin` (que ejecuta JUnit). Ejemplo basico:

```xml
<build>
    <plugins>

        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>3.5.0</version>
        </plugin>

        <!-- JaCoCo: instrumenta el codigo y genera el informe -->
        <plugin>
            <groupId>org.jacoco</groupId>
            <artifactId>jacoco-maven-plugin</artifactId>
            <version>0.8.12</version>

            <executions>
                <!-- Inserta el agente JaCoCo antes de los tests -->
                <execution>
                    <id>prepare-agent</id>
                    <goals>
                        <goal>prepare-agent</goal>
                    </goals>
                </execution>

                <!-- Genera el informe despues de los tests -->
                <execution>
                    <id>report</id>
                    <phase>test</phase>
                    <goals>
                        <goal>report</goal>
                    </goals>
                </execution>

                <!-- (Opcional) Falla el build si la cobertura es demasiado baja -->
                <execution>
                    <id>check</id>
                    <goals>
                        <goal>check</goal>
                    </goals>
                    <configuration>
                        <rules>
                            <rule>
                                <element>BUNDLE</element>
                                <limits>
                                    <limit>
                                        <counter>LINE</counter>
                                        <value>COVEREDRATIO</value>
                                        <minimum>0.70</minimum>
                                    </limit>
                                </limits>
                            </rule>
                        </rules>
                    </configuration>
                </execution>
            </executions>
        </plugin>

    </plugins>
</build>
```

### 7.3 Como generar y ver el informe

1. Ejecuta los tests:

   ```bash
   mvn clean test
   ```

2. (Si es necesario) genera manualmente el informe:

   ```bash
   mvn jacoco:report
   ```

3. Abre el informe HTML:
   - `target/site/jacoco/index.html`

El informe muestra:

- Cobertura por paquete.
- Cobertura por clase.
- Lineas cubiertas / no cubiertas.
- Rama de decision cubierta o no.

---

## 7.4 Verificación del comportamiento de la solución

El proyecto se encuentra migrado en la siguiente ruta **archivos/docencia-notes.zip**.

## 8. Checklist rapido para el proyecto

- Entidades anotadas con JPA (`@Entity`) y mapeadas a tablas.
- Relaciones entre entidades declaradas con `@OneToOne`, `@OneToMany`, `@ManyToOne`, etc., usando `mappedBy` cuando la relacion es bidireccional.
- Repositorio (`INoteRepository`) que aisla la logica de acceso a datos del resto del codigo.
- Tests con `@SpringBootTest`, `@ActiveProfiles("test")` y `@Transactional` para comprobar CRUD real y mantener la BBDD limpia gracias al rollback entre tests.
- Informe de cobertura con JaCoCo para saber que rutas de codigo han sido ejercitadas por los tests.

Este flujo cubre:

- Persistencia con ORM (JPA/Hibernate).
- Abstraccion con repositorios.
- Aislamiento en tests.
- Medicion objetiva de cobertura.

---



## 9. Referencias oficiales

- Jakarta Persistence / JPA:
  - https://jakarta.ee/specifications/persistence/

- Spring Data JPA Reference:
  - https://docs.spring.io/spring-data/jpa/reference/
  - Javadoc de `JpaRepository`:
    https://docs.spring.io/spring-data/jpa/docs/current/api/org/springframework/data/jpa/repository/JpaRepository.html

- Transactional tests y rollback en Spring:
  - https://docs.spring.io/spring-framework/reference/testing/testcontext-framework/tx.html
  - (Spring Boot Testing) Nota clasica: si el test es `@Transactional`, Spring hace rollback al final de cada metodo de test por defecto.

- JaCoCo (cobertura de codigo):
  - Maven plugin oficial:
    https://www.eclemma.org/jacoco/trunk/doc/maven.html
  - Documentacion general:
    https://www.jacoco.org/jacoco/trunk/doc/
  
## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
