# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Acceso a Datos: "Atributos “duros” en SQL, atributos “flexibles” en NoSQL, con MapStruct")

A continuación vamos a:

1. Añadir **MapStruct** al proyecto.
2. Separar claramente **dominio** y **persistencia**.
3. Crear los **mappers** (`ProductoMapper`, `DetalleProductoMapper`).
4. Actualizar el **servicio** para trabajar con el modelo de dominio.
5. Añadir **tests de integración** para `ProductoService`.

> Nota: los ejemplos están adaptados a tu proyecto con:
> - `Producto` y `DetalleProducto` (dominio)
> - `ProductoEntity` (JPA / H2)
> - `DetalleProductoDocument` (MongoDB)
> - `ProductoService` como servicio de negocio

---

## 1. Añadir MapStruct al proyecto

Edita el `pom.xml` y añade:

### 1.1. Propiedad de versión

Dentro de `<properties>`:

```xml
<properties>
    <java.version>17</java.version>
    <openapi.version>2.0.2</openapi.version>
    <org.mapstruct.version>1.6.3</org.mapstruct.version> <!-- o la versión estable que prefieras -->
</properties>
```

### 1.2. Dependencias de MapStruct

Dentro de `<dependencies>`:

```xml
<dependency>
    <groupId>org.mapstruct</groupId>
    <artifactId>mapstruct</artifactId>
    <version>${org.mapstruct.version}</version>
</dependency>
```

### 1.3. Procesador de anotaciones (maven-compiler-plugin)

Dentro de `<build><plugins>`:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <configuration>
        <annotationProcessorPaths>
            <path>
                <groupId>org.mapstruct</groupId>
                <artifactId>mapstruct-processor</artifactId>
                <version>${org.mapstruct.version}</version>
            </path>
        </annotationProcessorPaths>
    </configuration>
</plugin>
```

Con esto Maven generará automáticamente las implementaciones de los mappers (por ejemplo `ProductoMapperImpl`).

## 2. Dominios y modelos de persistencia

### 2.1. Dominio (`com.docencia.rest.domain`)

- `Producto` (modelo de negocio)
- `DetalleProducto` (detalle que se guarda en Mongo)

Ejemplo de `Producto` simplificado:

```java
package com.docencia.rest.domain;

import java.math.BigDecimal;

public class Producto {
    private int id;
    private String nombre;
    private BigDecimal precio;
    private int stock;
    private DetalleProducto detalleProducto;

    // getters y setters
}
```

Ejemplo de `DetalleProducto`:

```java
package com.docencia.rest.domain;

import java.util.List;
import java.util.Map;

public class DetalleProducto {
    private int id;
    private int productoId;
    private String descripcionLarga;
    private Map<String, String> especificacionesTecnicas;
    private List<String> tags;

    // getters y setters
}
```

### 2.2. Entidades de persistencia

#### `ProductoEntity` (JPA, relacional)

```java
package com.docencia.rest.modelo;

import java.math.BigDecimal;

import jakarta.persistence.*;

@Entity
@Table(name = "productos")
public class ProductoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private BigDecimal precio;

    @Column(nullable = false)
    private int stock;

    // getters, setters, equals, hashCode
}
```

#### `DetalleProductoDocument` (MongoDB)

```java
package com.docencia.rest.modelo;

import java.util.List;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "producto_detalle")
public class DetalleProductoDocument {

    @Id
    private int id;
    private int productoId;
    private String descripcionLarga;
    private Map<String, String> especificacionesTecnicas;
    private List<String> tags;

    // getters, setters, equals, hashCode
}
```

---

## 3. Mappers con MapStruct

Los mappers viven en `com.docencia.rest.mapper`.

### 3.1. `DetalleProductoMapper`

```java
package com.docencia.rest.mapper;

import org.mapstruct.Mapper;

import com.docencia.rest.domain.DetalleProducto;
import com.docencia.rest.modelo.DetalleProductoDocument;

@Mapper(componentModel = "spring")
public interface DetalleProductoMapper {

    // Dominio -> Mongo
    DetalleProductoDocument toDocument(DetalleProducto detalle);

    // Mongo -> Dominio
    DetalleProducto toDocument(DetalleProductoDocument document);
}
```

### 3.2. `ProductoMapper`

```java
package com.docencia.rest.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.docencia.rest.domain.Producto;
import com.docencia.rest.modelo.DetalleProductoDocument;
import com.docencia.rest.modelo.ProductoEntity;

@Mapper(componentModel = "spring", uses = { DetalleProductoMapper.class })
public interface ProductoMapper {

    // Dominio -> JPA
    ProductoEntity toEntity(Producto producto);

    // JPA -> Dominio (sin detalle)
    Producto toDomain(ProductoEntity entity);

    // JPA + Mongo -> Dominio completo
    @Mapping(target = "id", source = "entity.id")
    @Mapping(target = "detalleProducto", source = "detalle")
    Producto toDomain(ProductoEntity entity, DetalleProductoDocument detalle);
}
```

> **Importante:**  
> La anotación `@Mapping(target = "id", source = "entity.id")` evita el error  
> `"Several possible source properties for target property 'id'"`  
> cuando tanto `ProductoEntity` como `DetalleProductoDocument` tienen un campo `id`.

---

## 4. Repositorios

### 4.1. `ProductoRepository` (JPA)

```java
package com.docencia.rest.repository.interfaces;

import org.springframework.data.jpa.repository.JpaRepository;
import com.docencia.rest.modelo.ProductoEntity;

public interface ProductoRepository extends JpaRepository<ProductoEntity, Integer> {
}
```

### 4.2. `DetalleProductoRepository` (MongoDB)

```java
package com.docencia.rest.repository.interfaces;

import org.springframework.data.mongodb.repository.MongoRepository;
import com.docencia.rest.modelo.DetalleProductoDocument;

public interface DetalleProductoRepository
        extends MongoRepository<DetalleProductoDocument, Integer> {

    DetalleProductoDocument findByProductoId(int productoId);

    void deleteByProductoId(int productoId);
}
```

> No declares ningún método `save(int, DetalleProductoDocument)` aquí;  
> usa el `save()` heredado de `MongoRepository`.

---

## 5. Servicio `ProductoService`

El servicio expone y consume el modelo de dominio (`Producto`) y se encarga
de coordinar JPA + Mongo a través de los mappers.

### 5.1. Interfaz

```java
package com.docencia.rest.service.interfaces;

import java.util.List;
import java.util.Optional;

import com.docencia.rest.domain.Producto;

public interface ProductoServiceInterface {

    Optional<Producto> find(Producto producto);

    Optional<Producto> findById(int id);

    List<Producto> findAll();

    Producto save(Producto producto);

    boolean delete(Producto producto);

    boolean deleteById(int id);
}
```

### 5.2. Implementación

```java
package com.docencia.rest.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.docencia.rest.domain.Producto;
import com.docencia.rest.mapper.DetalleProductoMapper;
import com.docencia.rest.mapper.ProductoMapper;
import com.docencia.rest.modelo.DetalleProductoDocument;
import com.docencia.rest.modelo.ProductoEntity;
import com.docencia.rest.repository.interfaces.DetalleProductoRepository;
import com.docencia.rest.repository.interfaces.ProductoRepository;
import com.docencia.rest.service.interfaces.ProductoServiceInterface;

@Service
public class ProductoService implements ProductoServiceInterface {

    private final ProductoRepository productoRepository;
    private final DetalleProductoRepository detalleProductoRepository;
    private final ProductoMapper productoMapper;
    private final DetalleProductoMapper detalleProductoMapper;

    public ProductoService(ProductoRepository productoRepository,
                           DetalleProductoRepository detalleProductoRepository,
                           ProductoMapper productoMapper,
                           DetalleProductoMapper detalleProductoMapper) {
        this.productoRepository = productoRepository;
        this.detalleProductoRepository = detalleProductoRepository;
        this.productoMapper = productoMapper;
        this.detalleProductoMapper = detalleProductoMapper;
    }

    @Override
    public Optional<Producto> find(Producto producto) {
        if (producto == null) {
            return Optional.empty();
        }
        return findById(producto.getId());
    }

    @Override
    public Optional<Producto> findById(int id) {
        Optional<ProductoEntity> entityOpt = productoRepository.findById(id);
        if (entityOpt.isEmpty()) {
            return Optional.empty();
        }

        ProductoEntity entity = entityOpt.get();
        DetalleProductoDocument detalleDoc = detalleProductoRepository.findByProductoId(id);

        Producto producto = productoMapper.toDomain(entity, detalleDoc);
        return Optional.of(producto);
    }

    @Override
    public List<Producto> findAll() {
        List<ProductoEntity> entities = productoRepository.findAll();

        return entities.stream()
                .map(entity -> {
                    DetalleProductoDocument detalleDoc =
                            detalleProductoRepository.findByProductoId(entity.getId());
                    return productoMapper.toDomain(entity, detalleDoc);
                })
                .collect(Collectors.toList());
    }

    @Override
    public Producto save(Producto producto) {
        // 1. Guardar en BD relacional
        ProductoEntity entityToSave = productoMapper.toEntity(producto);
        ProductoEntity savedEntity = productoRepository.save(entityToSave);

        // 2. Guardar detalle en Mongo (si existe)
        if (producto.getDetalleProducto() != null) {
            DetalleProductoDocument detalleDoc =
                    detalleProductoMapper.toDocument(producto.getDetalleProducto());
            detalleDoc.setProductoId(savedEntity.getId());
            detalleProductoRepository.save(detalleDoc);
        }

        // 3. Reconstruir dominio completo
        DetalleProductoDocument detallePersistido =
                detalleProductoRepository.findByProductoId(savedEntity.getId());

        return productoMapper.toDomain(savedEntity, detallePersistido);
    }

    @Override
    public boolean delete(Producto producto) {
        if (producto == null) {
            return false;
        }
        return deleteById(producto.getId());
    }

    @Override
    public boolean deleteById(int id) {
        if (!productoRepository.existsById(id)) {
            return false;
        }

        productoRepository.deleteById(id);
        detalleProductoRepository.deleteByProductoId(id);

        return true;
    }
}
```

---

## Referencias

- [Documentación de la unidad](https://github.com/jpexposito/code-learn/blob/main/segundo/aed/unidades/unidad-3)
- [Spring data and Mongo](https://spring.io/projects/spring-data-mongodb).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
