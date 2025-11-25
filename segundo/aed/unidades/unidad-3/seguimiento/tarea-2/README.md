# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación de Servicios y Procesos: "Atributos “duros” en SQL, atributos “flexibles” en NoSQL")

Al finalizar este ejemplo, debes de entender:

- Qué tipo de información tiene más sentido guardar en una **BBDD relacional**.
- Qué tipo de información encaja mejor en una **BBDD no relacional (documental)**.
- Cómo diseñar las **tablas** (SQL) y las **colecciones** (NoSQL).
- Cómo modelar una **clase de dominio** que combina datos de ambas fuentes.
- Cómo implementar el **flujo de guardado** y el **flujo de lectura** de un objeto “partido” entre SQL y NoSQL.
- Cómo organizar **repositorios** para cada tecnología y un repositorio “polyglot” que los use.

---

## 2. Contexto: el dominio `Producto`

Imaginamos que nuestra aplicación gestiona un **catálogo de productos**. Cada producto tiene:

- Datos básicos, muy estables (id, nombre, precio, stock, categoría…).
- Datos variables o muy detallados (descripción larga, especificaciones técnicas, etiquetas…).

Ejemplos:

- Un portátil:  
  - Datos duros: nombre, precio, stock, categoría “Informática”.
  - Datos flexibles: RAM, CPU, peso, color, tamaño de pantalla…
- Un libro:  
  - Datos duros: título, precio, stock, categoría “Libros”.
  - Datos flexibles: número de páginas, idioma, formato, palabras clave…

La idea es **no forzar** todas esas especificaciones variables en un modelo relacional rígido (`relacional`), sino aprovechar una colección documental.

---

## 3. Diseño del modelo de datos

### 3.1. Parte relacional (SQL)

Usaremos una base de datos relacional (por ejemplo **H2**, **MySQL** o **PostgreSQL**) para los datos duros.

Tabla `producto`:

| Columna      | Tipo           | Notas                 |
|--------------|----------------|-----------------------|
| id           | BIGINT (PK)    | Identificador único   |
| nombre       | VARCHAR        | No nulo               |
| precio       | DECIMAL        | No nulo               |
| categoria_id | BIGINT (FK)    | Referencia a categoría|
| stock        | INT            | No nulo               |

Estos datos:

- Cambian poco.
- Son comunes a todos los productos.
- Son buenos candidatos para claves, filtros, joins, etc.

### 3.2. Parte NoSQL (documental)

Usaremos una base documental (**MongoDB**) para los datos flexibles.

Colección `producto_detalle`, con documentos como:

```json
{
  "productoId": 42,
  "descripcionLarga": "Texto largo...",
  "especificacionesTecnicas": {
    "color": "rojo",
    "peso": "1.2kg",
    "ram": "16GB",
    "cpu": "i7"
  },
  "tags": ["gaming", "oferta", "2025"]
}
```

Características:

- El campo `especificacionesTecnicas` es un objeto JSON con clave/valor.
- Las claves pueden variar entre productos (unos tienen `ram`, otros `talla`, otros `idioma`…).
- No necesitamos modificar el esquema de la BBDD cuando añadimos una nueva especificación.

---

## 4. Modelo de dominio en código

Ahora unimos ambas partes en clases Java.

### 4.1. Clase `Producto` (dominio)

```java
public class Producto {
    // Parte relacional
    private Long id;
    private String nombre;
    private BigDecimal precio;
    private int stock;
    private Categoria categoria;

    // Parte NoSQL (documento)
    private DetalleProducto detalle;

    // getters y setters...
}
```

- La **parte relacional** (`id`, `nombre`, `precio`, `stock`, `categoria`) se mapea a la tabla `producto`.
- La **parte NoSQL** (`detalle`) NO se guarda en la tabla SQL, se carga/guarda aparte, en la colección `producto_detalle`.

### 4.2. Clase `DetalleProducto` (dominio NoSQL)

```java
public class DetalleProducto {
    private String descripcionLarga;
    private Map<String, String> especificacionesTecnicas;
    private List<String> tags;

    // getters y setters...
}
```

- `especificacionesTecnicas` es un `Map<String, String>` para reflejar la flexibilidad del objeto JSON.
- `tags` es una lista de etiquetas.

En un proyecto real con Spring Data Mongo, esta clase podría llevar anotaciones como:

```java
@Document(collection = "producto_detalle")
public class DetalleProductoDocument {
    @Id
    private String id;
    private Long productoId;
    private String descripcionLarga;
    private Map<String, String> especificacionesTecnicas;
    private List<String> tags;
}
```

(Ahora debes de añadir las anotaciones se pueden introducir en las distintas entity´s o colecciones).

---

## 5. Repositorios: separando responsabilidades

### 5.1. Repositorio relacional de `Producto`

Interfaz (dominio):

```java
public interface ProductoRelationalRepository {
    Optional<Producto> findById(Long id);
    List<Producto> findAll();
    Producto save(Producto producto);
    void deleteById(Long id);
}
```

Implementación JPA:

```java
@Repository
public class ProductoJpaRepository implements ProductoRelationalRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Optional<Producto> findById(Long id) {
        return Optional.ofNullable(em.find(Producto.class, id));
    }

    @Override
    public List<Producto> findAll() {
        return em.createQuery("SELECT p FROM Producto p", Producto.class)
                 .getResultList();
    }

    @Override
    public Producto save(Producto producto) {
        if (producto.getId() == null) {
            em.persist(producto);
            return producto;
        } else {
            return em.merge(producto);
        }
    }

    @Override
    public void deleteById(Long id) {
        Producto p = em.find(Producto.class, id);
        if (p != null) {
            em.remove(p);
        }
    }
}
```

### 5.2. Repositorio NoSQL de `DetalleProducto`

Interfaz:

```java
public interface DetalleProductoRepository {
    Optional<DetalleProducto> findByProductoId(Long productoId);
    DetalleProducto save(Long productoId, DetalleProducto detalle);
    void deleteByProductoId(Long productoId);
}
```

Implementación (**Mongo**):

```java
@Repository
public class DetalleProductoMongoRepository implements DetalleProductoRepository {

    private final MongoTemplate mongoTemplate;

    public DetalleProductoMongoRepository(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    @Override
    public Optional<DetalleProducto> findByProductoId(Long productoId) {
        Query query = new Query(Criteria.where("productoId").is(productoId));
        DetalleProductoDocument doc = mongoTemplate.findOne(query, DetalleProductoDocument.class);
        return Optional.ofNullable(mapToDomain(doc));
    }

    @Override
    public DetalleProducto save(Long productoId, DetalleProducto detalle) {
        DetalleProductoDocument doc = mapToDocument(productoId, detalle);
        mongoTemplate.save(doc);
        return detalle;
    }

    @Override
    public void deleteByProductoId(Long productoId) {
        Query query = new Query(Criteria.where("productoId").is(productoId));
        mongoTemplate.remove(query, DetalleProductoDocument.class);
    }

}
```

### 5.3. Repositorio “polyglot” de `Producto`

Este es el repositorio que verá la capa de aplicación/dominio.

```java
public interface ProductoRepository {
    Optional<Producto> findById(Long id);
    List<Producto> findAll();
    Producto save(Producto producto);
    void deleteById(Long id);
}
```

Implementación:

```java
@Repository
public class ProductoPolyglotRepository implements ProductoRepository {

    private final ProductoRelationalRepository productoRelationalRepo;
    private final DetalleProductoRepository detalleProductoRepo;

    public ProductoPolyglotRepository(ProductoRelationalRepository productoRelationalRepo,
                                      DetalleProductoRepository detalleProductoRepo) {
        this.productoRelationalRepo = productoRelationalRepo;
        this.detalleProductoRepo = detalleProductoRepo;
    }

    @Override
    public Optional<Producto> findById(Long id) {
        return productoRelationalRepo.findById(id)
                .map(producto -> {
                    detalleProductoRepo.findByProductoId(id)
                            .ifPresent(producto::setDetalle);
                    return producto;
                });
    }

    @Override
    public List<Producto> findAll() {
        List<Producto> productos = productoRelationalRepo.findAll();
        // Opcional: cargar detalles en lote (para el ejercicio, basta con la idea)
        productos.forEach(p ->
                detalleProductoRepo.findByProductoId(p.getId())
                        .ifPresent(p::setDetalle)
        );
        return productos;
    }

    @Override
    public Producto save(Producto producto) {
        // 1. Guardar la parte relacional
        Producto guardado = productoRelationalRepo.save(producto);

        // 2. Guardar la parte NoSQL (si existe)
        if (producto.getDetalle() != null) {
            detalleProductoRepo.save(guardado.getId(), producto.getDetalle());
        }

        return guardado;
    }

    @Override
    public void deleteById(Long id) {
        // Borrar en ambas BBDD
        productoRelationalRepo.deleteById(id);
        detalleProductoRepo.deleteByProductoId(id);
    }
}
```

---

## 6. Flujo de guardado paso a paso

Supongamos que desde la capa de servicio recibimos un `Producto` nuevo con detalle:

```java
Producto p = new Producto();
p.setNombre("Portátil Gaming");
p.setPrecio(new BigDecimal("1299.99"));
p.setStock(10);
p.setCategoria(categoriaGaming);

DetalleProducto detalle = new DetalleProducto();
detalle.setDescripcionLarga("Portátil para gaming intensivo...");
detalle.setEspecificacionesTecnicas(Map.of(
        "ram", "16GB",
        "cpu", "Intel i7",
        "gpu", "RTX 4060",
        "peso", "2.1kg"
));
detalle.setTags(List.of("gaming", "oferta", "2025"));

p.setDetalle(detalle);

productoRepository.save(p);
```

### ¿Qué ocurre internamente?

1. `ProductoPolyglotRepository.save(p)` recibe el producto.
2. Llama a `productoRelationalRepo.save(p)`:
   - Se inserta una fila en la tabla `producto`.
   - El producto recupera un `id` generado (por ejemplo, 42).
3. Si `p.getDetalle() != null`:
   - Llama a `detalleProductoRepo.save(guardado.getId(), p.getDetalle())`.
   - Se inserta (o actualiza) un documento en la colección `producto_detalle` con `productoId = 42`.
4. Resultado:  
   - Parte dura en SQL, parte flexible en NoSQL, pero la aplicación trabaja con un único objeto `Producto`.

---

## 7. Flujo de lectura paso a paso

Cuando la aplicación necesita leer un producto por id:

```java
Optional<Producto> opt = productoRepository.findById(42L);
opt.ifPresent(p -> {
    System.out.println(p.getNombre());
    System.out.println(p.getDetalle().getDescripcionLarga());
});
```

### ¿Qué hace el repositorio polyglot?

1. Llama a `productoRelationalRepo.findById(42)`:
   - Hace un `SELECT * FROM producto WHERE id = 42`.
   - Devuelve un `Producto` sin detalle (campo `detalle` aún `null`).
2. Llama a `detalleProductoRepo.findByProductoId(42)`:
   - Hace una búsqueda en la colección `producto_detalle`.
   - Devuelve un `DetalleProducto`.
3. Asigna el detalle al producto:
   - `producto.setDetalle(detalle);`
4. Devuelve el `Producto` ya completo a la capa de servicio.

---

## 8. Beneficios que deben entender los alumnos

- **Flexibilidad:** añadir nuevas especificaciones técnicas no requiere alterar el esquema SQL.
- **Rendimiento:** puedes consultar listados solo con los datos duros en SQL (más ligero) y cargar detalles solo cuando los necesites.
- **Separación de responsabilidades:**
  - Repositorios específicos para SQL.
  - Repositorios específicos para NoSQL.
  - Un repositorio polyglot que une ambos mundos.
- **Modelo realista:** muchos sistemas en producción usan esta combinación (facturación en SQL, logs/metadatos en NoSQL, etc.).

---

## 9. Propuesta de tarea para los alumnos

1. Crear el modelo de dominio `Producto` y `DetalleProducto`.
2. Crear la tabla `producto` en una BBDD relacional (H2/MySQL).
3. Crear la colección `producto_detalle` en una BBDD NoSQL (Mongo).
4. Implementar:
   - `ProductoRelationalRepository` (JPA).
   - `DetalleProductoRepository` (Mongo).
   - `ProductoRepository` (polyglot) que combine ambos.
5. Escribir un pequeño **test de integración** que:
   - Guarde un producto con detalle.
   - Lo recupere por id.
   - Verifique que:
     - Los campos duros están en la tabla SQL.
     - Las especificaciones y tags se han guardado en NoSQL.
     - El objeto final `Producto` viene con su `detalle` relleno.

## Referencias

- [Documentación de la unidad](https://github.com/jpexposito/code-learn/blob/main/segundo/aed/unidades/unidad-3)
- [Spring data and Mongo](https://spring.io/projects/spring-data-mongodb).

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
