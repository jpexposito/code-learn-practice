# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Creación de un CRUD sobre BBDD Relacionales a través de Spring")

## ✅ Requisitos

- **Java 17+**
- **Maven 3.8+**
- IDE (IntelliJ / Eclipse / VS Code)

---

## 📁 Estructura del proyecto que vamos a crear

```
com.docencia.objetos
 ├─ DemoApplication.java
 ├─ domain/Alumno.java
 ├─ repo/AlumnoRepository.java             (interfaz del dominio)
 ├─ repo/jpa/AlumnoEntity.java             (JPA)
 ├─ repo/jpa/AlumnoJpaRepository.java      (Spring Data JPA)
 ├─ repo/AlumnoRepositoryJpaAdapter.java   (ADAPTADOR A JPA/H2)  ← foco del alumnado
 ├─ service/AlumnoService.java             (lógica sin controllers)
 └─ config/H2ServerConfig.java             (opcional: consola web y TCP de H2)
resources
 └─ application.yml (perfil h2)
test
 └─ AlumnoServiceH2Test.java               (tests de verificación)
```

---

## 🎯 Objetivo didáctico

Implementar la interfaz de repositorio, contra una base **relacional H2 en memoria**, y verificar con **
tests**.

Interfaz objetivo:

```java
public interface AlumnoRepository {
  List<Alumno> findAll();
  Optional<Alumno> findById(Long id);
  Alumno save(Alumno alumno);
  boolean existsByEmail(String email);
  void deleteById(Long id);
  long count();
}
```

---

## 🚀 Cómo usar el **proyecto del alumnado (starter)**

1. **Descarga y descomprime el proyecto que se encuentra en el zip dentro de archivos**.
2. **Importa** en tu IDE como *Maven Project*.
3. Revisa `src/main/resources/application.yml` (perfil **h2** por defecto). No hay servidor web.
4. Completa los **TODO** en:

   - `repo/jpa/AlumnoEntity.java` (si falta alguna anotación)
   - `repo/jpa/AlumnoJpaRepository.java` (métodos derivados mínimos)
   - `repo/AlumnoRepositoryJpaAdapter.java` **(implementa la interfaz de dominio usando JPA/H2)**:
     - `findAll`, `findById`, `save`, `existsByEmail`, `deleteById`, `count`
     - (si hay TODOs extra, déjalos para la siguiente sesión)
   - `service/AlumnoService.java` (validación básica; lanzar `BadRequest`/`NotFound` si procede)

5. **Ejecuta los tests**:
   
   ```bash
   mvn -q clean test
   ```
   
   Deben pasar los del paquete `...AlumnoServiceH2Test` cuando termines la implementación.

6. (Opcional) **Arranca la app** con perfil H2 para ver logs o usar la consola H2 si está habilitada:

   ```bash
   mvn spring-boot:run -Dspring-boot.run.profiles=h2
   ```
   - Consola web H2 (si se incluyó `H2ServerConfig`): `http://localhost:8082`
   - Conexión externa (DBeaver/IntelliJ): `jdbc:h2:tcp://localhost:9092/mem:alumnosdb` (user: `sa`, pass vacía)

---

## 🧪 ¿Qué verifican los tests?

- **Crear** un alumno y obtener un `id` autogenerado.
- **Leer** por `id` y comprobar campos.
- **No permitir duplicado** de `email` (regla en `AlumnoService` + `existsByEmail` del repo).
- **Actualizar** nombre/ciclo y persistir cambios.
- **Listar** y comprobar `count`.
- **Borrar** y validar que desaparece.

---

## 🛠️ Problemas frecuentes (checklist)

- **`toList()` no existe** → usa Java 17 o cambia a `Collectors.toList()`.
- **No levanta `AlumnoJpaRepository`** → faltan dependencias JPA/H2 o estás en otro perfil que no es `h2`.
- **Tabla no existe** → ajusta `spring.jpa.hibernate.ddl-auto` (`create-drop`/`update`).
- **Duplicado de email** no falla → revisa `@Column(unique = true)` *y* la validación en `AlumnoService`.

---

## 📌 Recordatorio

En la próxima sesión activaremos **otros perfiles** (`mem`, `mongo`) y compararemos las implementaciones del repositorio **sin tocar el servicio**.

¡Buen código! 💻✨

## Referencias oficiales

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
