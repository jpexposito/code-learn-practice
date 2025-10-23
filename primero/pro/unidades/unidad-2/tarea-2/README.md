# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Definición de Clases, constructores, getters, setters")

Practicar **clases simples en Java** usando exclusivamente:

- **Constructores**
- **Getters y Setters**
- **`equals`**
- **`toString`**

## Lo que se evalúa

1) **Siempre asignar valores a todas las propiedades** (vía **constructor** y al menos **un setter**).  
2) **Mostrar el resultado por pantalla** con `toString()` (y getters cuando se pida).  
3) **Usar `equals`** al menos una vez con **resultado `true`** y otra con **resultado `false`** (tras modificar datos cuando corresponda).

> **Convención de nombres**: usa variables descriptivas como `persona1`, `libro2`, `usuarioModificado`.  
> **Evita** abreviaturas crípticas como `p1`, `l1`, `a`, `b`.

---


### Opción con estructura sugerida

```
/src
  Main.java
  /model
    Persona.java
    Producto.java
    Libro.java
    Punto2D.java
    Coche.java
    Alumno.java
    Pelicula.java
    Direccion.java
    Usuario.java
    Pedido.java
```

---

## Plantillas útiles

### Clase base (ajústala a cada ejercicio)

```java
import java.util.Objects;

public class Plantilla {
    // Cambia estos campos por los del ejercicio
    private String campo1;
    private int campo2;

    // Constructor (asigna todos los campos)
    public Plantilla(String campo1, int campo2) {
        this.campo1 = campo1;
        this.campo2 = campo2;
    }

    // Getters/Setters
    public String getCampo1() { return campo1; }
    public void setCampo1(String campo1) { this.campo1 = campo1; }
    public int getCampo2() { return campo2; }
    public void setCampo2(int campo2) { this.campo2 = campo2; }

    // equals: ajusta los campos usados en la comparación
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Plantilla)) return false;
        Plantilla that = (Plantilla) o;
        return campo2 == that.campo2 &&
               Objects.equals(campo1, that.campo1);
    }

    // toString legible
    @Override
    public String toString() {
        return "Plantilla{campo1='" + campo1 + "', campo2=" + campo2 + "}";
    }
}
```

### Patrón de prueba en `Main`

```java
public class Main {
    public static void main(String[] args) {
        // Ejemplo del patrón general (sustituir por cada clase real):
        // 1) Crear con constructor (asignación completa)
        Persona persona1 = new Persona("Ada", 25);
        Persona persona2 = new Persona("Ada", 25);

        // 2) Mostrar
        System.out.println("persona1 = " + persona1.toString());
        System.out.println("persona2 = " + persona2.toString());

        // 3) equals -> true inicialmente
        System.out.println("¿persona1 equals persona2? " + persona1.equals(persona2)); // true

        // 4) Modificar con setter al menos una propiedad
        persona2.setEdad(26);

        // 5) Mostrar de nuevo y volver a comparar (false)
        System.out.println("persona2 (modificada) = " + persona2.toString());
        System.out.println("¿persona1 equals persona2 tras cambio? " + persona1.equals(persona2)); // false
    }
}
```

---

## Los 10 ejercicios (instrucciones exactas)

### 1) `Persona` (nombre, edad)

**Implementa:** constructor, getters/setters, `equals` por `nombre` **y** `edad`, `toString`.  
**En `main`:**

- Crea `persona1("Ada", 25)` y `persona2("Ada", 25)`; **muestra** ambas.
- `persona1.equals(persona2)` ⇒ **true**.
- **Modifica** `persona2.setEdad(26)`; **muestra** `persona2` y compara de nuevo ⇒ **false**.

---

### 2) `Producto` (codigo, precio)

**Implementa:** `equals` por `codigo`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `producto1("A123", 10.0)` y `producto2("A123", 12.0)`; **muestra** ambos.
- `producto1.equals(producto2)` ⇒ **true**.
- **Modifica** `producto2.setCodigo("B999")`; **muestra** `producto2` y compara ⇒ **false**.

---

### 3) `Libro` (isbn, titulo)

**Implementa:** `equals` por `isbn`, `toString`, constructores y getters/setters.  
**En `main`:**
- Crea `libro1("978-0-00-000000-1", "El primero")` y `libro2("978-0-00-000000-1", "Otro título")`; **muestra** ambos.
- Usa getters para imprimir `libro2.getTitulo()`.
- **Modifica** `libro2.setTitulo("Título actualizado")`; **muestra** `libro2`.
- `libro1.equals(libro2)` ⇒ **true** (mismo ISBN en todo momento).

---

### 4) `Punto2D` (x, y)

**Implementa:** `equals` por `x` **e** `y`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `punto1(3, 4)`, `punto2(3, 4)` y `punto3(5, 4)`; **muestra** los tres.
- `punto1.equals(punto2)` ⇒ **true**; `punto1.equals(punto3)` ⇒ **false**.
- **Modifica** `punto2.setX(7)`; **muestra** `punto2` y compara con `punto1` ⇒ **false**.

---

### 5) `Coche` (matricula, marca, modelo)

**Implementa:** `equals` por `matricula`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `coche1("1234-ABC", "Toyota", "Yaris")` y `coche2("1234-ABC", "Ford", "Focus")`; **muestra** ambos.
- `coche1.equals(coche2)` ⇒ **true**.
- **Modifica** `coche2.setMarca("Seat")`; **muestra** `coche2` y verifica que `equals` **sigue true** (la matrícula no cambió).

---

### 6) `Alumno` (dni, nombre)

**Implementa:** `equals` por `dni`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `alumno1("12345678A", "Lucía")`; **muestra** `alumno1`, `alumno1.getDni()` y `alumno1.getNombre()`.
- **Modifica** `alumno1.setNombre("Lucía Gómez")`; **muestra** `alumno1`.
- (Opcional) Crea `alumno2("12345678A", "Otro")` y comprueba `alumno1.equals(alumno2)` ⇒ **true**.

---

### 7) `Pelicula` (titulo, anio)

**Implementa:** `equals` por `titulo` **y** `anio`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `pelicula1("Matrix", 1999)`, `pelicula2("Matrix", 1999)` y `pelicula3("Matrix", 2003)`; **muestra** todas.
- `pelicula1.equals(pelicula2)` ⇒ **true**; `pelicula1.equals(pelicula3)` ⇒ **false**.
- **Modifica** `pelicula3.setAnio(1999)`; **muestra** `pelicula3` y comprueba ahora ⇒ **true** con `pelicula1`.

---

### 8) `Direccion` (calle, numero, ciudad)

**Implementa:** `equals` por `calle`, `numero`, `ciudad`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `direccion1("Gran Vía", 10, "Madrid")` y `direccion2("Gran Vía", 10, "Madrid")`; **muestra** ambas.
- Con getters, imprime: `"Vivo en " + direccion1.getCalle() + " " + direccion1.getNumero() + ", " + direccion1.getCiudad()`.
- `direccion1.equals(direccion2)` ⇒ **true**.
- **Modifica** `direccion2.setCiudad("Barcelona")`; **muestra** `direccion2` y compara ⇒ **false**.

---

### 9) `Usuario` (username, email)

**Implementa:** `equals` por `username`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `usuario1("ana", "ana@x.com")` y `usuario2("ana", "otra@x.com")`; **muestra** ambos.
- `usuario1.equals(usuario2)` ⇒ **true**.
- **Modifica** `usuario2.setUsername("ana2")`; **muestra** `usuario2` y compara ⇒ **false**.

---

### 10) `Pedido` (id, total)

**Implementa:** `equals` por `id`, `toString`, constructores y getters/setters.  
**En `main`:**

- Crea `pedido1("PED-001", 150.0)` y `pedido2("PED-001", 300.0)`; **muestra** ambos.
- `pedido1.equals(pedido2)` ⇒ **true**.
- **Modifica** `pedido2.setTotal(320.0)`; **muestra** `pedido2` y verifica que `equals` **sigue true**.
- (Opcional) Cambia `pedido2.setId("PED-002")` y comprueba ⇒ **false**.

---

## Consejos rápidos

- **Imprime siempre** los objetos antes y después de modificar con setters.  
- Asegúrate de que `equals` compare **solo** los campos indicados en cada enunciado.  
- No es necesario implementar `hashCode()` en estos ejercicios (aunque es buena práctica cuando se sobrescribe `equals`).  
- Mantén los **campos privados** y accede mediante getters/setters.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
