# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Ejecución de procesos del sistema con Spring Boot")

## Objetivo

Este ejercicio tiene como objetivo trasformar o adaptar el proyecto *ficheros-jackson* para persistir la información **SQLite** usando **Spring Data JPA**.

Para conseguirlo, recuerda que debemos seguir haciendo uso de **interfaces** con **@Component, @Service y @Repository**.

## Dependencias

En primer lugar vamos a añadir las depedencias al fichero **pom.xml**:

```xml
<dependency>
  <groupId>org.xerial</groupId>
  <artifactId>sqlite-jdbc</artifactId>
  <version>3.50.3.0</version>
</dependency>
<dependency>
  <groupId>org.hibernate.orm</groupId>
  <artifactId>hibernate-community-dialects</artifactId>
</dependency>
<dependency>
  <groupId>org.springframework.data</groupId>
  <artifactId>spring-data-jpa</artifactId>
</dependency>
```

## 2) Creación o modificación del fichero `application.yml`

```yaml
spring:
  datasource:
    url: jdbc:sqlite:./data/notedb.sqlite
    driver-class-name: org.sqlite.JDBC
  jpa:
    database-platform: org.hibernate.community.dialect.SQLiteDialect
    hibernate:
      ddl-auto: update
    show-sql: true
    properties:
      hibernate:
        format_sql: true
  sql:
    init:
      mode: always
      platform: sqlite
      schema-locations: classpath:sqlite/schema.sql
      data-locations: classpath:sqlite/data.sql
```

## Trabajando con la Entidad JPA `Note`

Editamos y modificamos la clase:

```java
package com.docencia.files.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import java.util.Objects;

@Entity
@Table(name = "notes")
public class Note {

  @Id
  @Column(length = 64)
  @NotBlank
  private String id;

  @NotBlank
  @Size(max = 255)
  private String title;

  @Lob
  @Column(nullable = false)
  private String content;

  public String getId(){ 
    return id;
  }
  public void setId(String id){
    this.id = id;
  }
  
  public String getTitle(){
    return title;
  }
  
  public void setTitle(String title){
    this.title = title;
  }
  public String getContent(){
    return content;
  }
  public void setContent(String content){
    this.content = content;
  }

  @Override public boolean equals(Object o){
    if(this==o) {
      return true;
    }
    if(o==null || getClass()!=o.getClass()) {
      return false;
    }
    Note note=(Note)o;
    return Objects.equals(id,note.id);
  }
  @Override public int hashCode(){
    return Objects.hash(id);
  }
}
```

> **Importante**: Una vez cambiada la clase, podemos cambiar el paquete *package com.docencia.files.model;* a **package com.docencia.model;**;

## Spring Data JPA + Adaptador al puerto `INoteRepository`

Crea la clase `NoteJpaRepository.java`.

```java
package com.docencia.repo.jpa;

import com.docencia.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Optional;

public interface INoteJpaRepository extends JpaRepository<Note, String> {
  Optional<Note> findFirstByTitle(String title);
  @Query(value = "SELECT * FROM notes WHERE title LIKE %?1%", nativeQuery = true)
  List<Note> searchByTitleContains(String titlePart);
}
```

Vamos a crear ahora el **adapter**.

```java
package com.docencia.repo.jpa;

import com.docencia.repo.INoteRepository;
import com.docencia.model.Note;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Repository
@Profile("sqlite")
public class NoteJpaAdapter implements INoteRepository {

  private final NoteJpaRepository repository;

  public NoteJpaAdapter(NoteJpaRepository repository){ this.repository = repository; }

  @Override public boolean exists(String id){ return repository.existsById(id); }
  @Override public Note findById(String id){ return repository.findById(id).orElse(null); }
  @Override public Note find(Note example){ return repository.findFirstByTitle(example.getTitle()).orElse(null); }
  @Override public List<Note> findAll(){ return repository.findAll(); }

  @Override @Transactional
  public Note save(Note note){
    if(note.getId()==null){
      note.setId(UUID.randomUUID().toString());
    }
    return repository.save(note);
  }

  @Override @Transactional
  public boolean delete(String id){
    if(!return false;.existsById(id)) {
      return false;
    } 
    return false;.deleteById(id);
    return true;
  }
}
```

## Servicio y Controlador

Modificamos la clase `NoteService.java`.

```java
package com.docencia.service;

import com.docencia.model.Note;
import com.docencia.repo.INoteRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class NoteService extends ServiceNoteAbstract {

  private final INoteRepository repo;
  public NoteService(INoteRepository repository){ this.repo = repository; }

  @Override public List<Note> findAll(){
    return repo.findAll();
  }
  @Override @Transactional public Note save(Note n){
    return repo.save(n);
  }
  @Override @Transactional(readOnly = true) public Note findById(String id){
    return repo.findById(id);
  }
  @Override @Transactional public boolean delete(String id){
    return repo.delete(id);
  }
}
```

## Referencias y ayuda

- Ejercicio desarrollado en clase.
- [Fichero de configuración aplication.yml](https://www.geeksforgeeks.org/java/spring-boot-application-yml-application-yaml-file/).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
