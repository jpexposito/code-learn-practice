# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Trabajando con clases, encapsulación, constructores, métodos, `static`, herencia, interfaces, colecciones y paquetes)`

## 🧩 Ejercicio 1 – Tu primera `Persona`

**Objetivo:** practicar la **anatomía de una clase**, creación de **paquetes** y un primer `main`.

1. Crea el paquete:

   ```text
   com.docencia.curso
   ```

2. Dentro del paquete, crea la clase `Persona` con dos campos **sin** modificador de acceso (por ahora):

   ```java
   String nombre;
   int edad;
   ```

3. Añade un método `main` que:
   - Cree una instancia de `Persona`.
   - Asigne valores a `nombre` y `edad` directamente.
   - Imprima por consola algo como: `Ada (36)`.

**Extensión (opcional):** añade un segundo objeto `Persona` y muestra ambos en consola.

---

## 🧩 Ejercicio 2 – Encapsulación de `Persona`

**Objetivo:** practicar **encapsulación**, visibilidad y uso de **getters/setters**.

Partiendo de la clase `Persona` del ejercicio anterior:

1. Cambia los campos para que sean `private`:

   ```java
   private String nombre;
   private int edad;
   ```

2. Añade:
   - Un **constructor** que reciba `nombre` y `edad`.
   - Getters y setters para ambos campos.
3. En el `setter` de `nombre`:
   - Si `nombre` es `null` o está en blanco, lanza `IllegalArgumentException`.
4. En el `setter` de `edad`:
   - Si `edad` es negativa, lanza `IllegalArgumentException`.
5. Modifica el `main` (en `Persona` o en otra clase de prueba) para:
   - Crear una `Persona` con el constructor.
   - Probar a poner una edad negativa y observar la excepción.

**Pista:** reutiliza la lógica de validación en el constructor usando los setters (`setNombre(nombre)` en lugar de `this.nombre = nombre`).

---

## 🧩 Ejercicio 3 – `CuentaBancaria` con constructores

**Objetivo:** practicar **constructores**, **sobrecarga** y delegación con `this(...)`.

1. Crea la clase `CuentaBancaria` en el paquete `com.docencia.curso` con:

   ```java
   private final String iban;
   private double saldo;
   ```

2. Crea un constructor que reciba **solo** `iban` y delegue en otro constructor:

   ```java
   public CuentaBancaria(String iban) {
     this(iban, 0.0);
   }
   ```

3. Crea el constructor principal:

   ```java
   public CuentaBancaria(String iban, double saldo) {
     // valida que iban no sea null/blank y saldo no sea negativo
   }
   ```

4. Si `iban` es `null` o en blanco → lanza `IllegalArgumentException`  
   Si `saldo` es negativo → también `IllegalArgumentException`.

5. Crea una clase `PruebasCuenta` con un `main` que:
   - Cree varias cuentas con distintos saldos.
   - Intente crear una cuenta con saldo negativo y observe la excepción.

---

## 🧩 Ejercicio 4 – Operaciones sobre `CuentaBancaria`

**Objetivo:** trabajar con **métodos**, estado y un primer `toString()`.

Sobre la clase `CuentaBancaria`:

1. Añade los métodos:

   ```java
   public void ingresar(double cantidad) { ... }
   public void retirar(double cantidad) { ... }

   ```

   - `ingresar`: si `cantidad <= 0`, lanza `IllegalArgumentException`.
   - `retirar`: si `cantidad <= 0` o `cantidad > saldo`, lanza `IllegalArgumentException`.

2. Implementa `toString()` para que devuelva algo tipo:

   ```text
   Cuenta(ES00..., saldo=150.0)
   ```

3. En `PruebasCuenta.main`:
   - Crea una cuenta con saldo 100.
   - Ingresa 50.
   - Retira 30.
   - Imprime la cuenta para ver el saldo final.

**Extensión:** prueba a retirar una cantidad mayor que el saldo y observa qué ocurre.

---

## 🧩 Ejercicio 5 – `static` y clase `Validador`

**Objetivo:** practicar **métodos estáticos** y factorías.

1. Crea la clase utilitaria `Validador`:

   ```java
   public final class Validador {
     private Validador() {}

     public static boolean esIban(String iban) {
       return iban != null && iban.matches("[A-Z]{2}\d{2}.*");
     }
   }

   ```
2. En `CuentaBancaria`, añade un método de factoría estático:

   ```java
   public static CuentaBancaria of(String iban, double saldo) {
     if (!Validador.esIban(iban)) {
       throw new IllegalArgumentException("IBAN inválido");
     }
     return new CuentaBancaria(iban, saldo);
   }
   ```

3. En `PruebasCuenta.main`:
   - Crea cuentas usando `CuentaBancaria.of(...)` en lugar de `new`.
   - Prueba con un IBAN incorrecto para verificar que salta la excepción.

**Extensión:** añade más métodos estáticos en `Validador` (por ejemplo, `esDni`, `esTelefonoMovil`).

---

## 🧩 Ejercicio 6 – Herencia con `Persona` y `Empleado`

**Objetivo:** practicar **herencia**, **sobrescritura** y **composición**.

1. Crea la clase `Direccion`:

   ```java
   public class Direccion {
     private String calle;
     private String ciudad;

     // constructor, getters, setters, toString()
   }
   ```

2. Modifica `Persona` para que tenga una `Direccion`:

   ```java
   private Direccion direccion;
   ```

   - Añade getter/setter o incopórala en el constructor.
3. Crea la clase `Empleado` que **extienda** de `Persona`:

   ```java
   public class Empleado extends Persona {
     private double salario;

     // constructor(es), getters, setters
   }
   ```

4. Sobrescribe `toString()` en `Empleado` para incluir también el salario.  
   **Pista:** llama a `super.toString()` y añade la parte del salario.

5. Crea una clase `PruebasEmpleado` con un `main` que:
   - Cree una `Direccion`.
   - Cree un `Empleado` con nombre, edad, dirección y salario.
   - Imprima el empleado por consola.

**Extensión:** añade un método `subirSalario(double porcentaje)` a `Empleado` y pruébalo.

---

## 🧩 Ejercicio 7 – Interfaces: `Notificacion`, `Email` y `Sms`

**Objetivo:** trabajar con **interfaces** y **polimorfismo**.

1. Crea la interfaz:

   ```java
   public interface Notificacion {
     String destino();
     String mensaje();
     void enviar();
   }
   ```

2. Implementa la clase `Email`:

   ```java
   public class Email implements Notificacion {
     // destino, asunto, cuerpo (campos)
     // constructor
     // implementaciones de destino(), mensaje(), enviar()
   }
   ```

3. Implementa la clase `Sms`:

   ```java
   public class Sms implements Notificacion {
     // destino, texto
     // constructor
     // implementaciones de destino(), mensaje(), enviar()
   }
   ```

4. Crea una clase `Notificador` con un método estático:

   ```java
   public class Notificador {
     public static void enviar(Notificacion notificacion) {
       notificacion.enviar();
     }
   }
   ```

5. En `Notificador.main`:
   - Crea un `Email` y un `Sms`.
   - Llama a `Notificador.enviar(...)` con ambos.
   - Observa cómo, con el mismo tipo abstracto (`Notificacion`), se ejecuta una implementación distinta.

**Extensión:** crea una nueva clase `PushNotificacion` que también implemente `Notificacion` y úsala sin cambiar el código de `Notificador`.

---

## 🧩 Ejercicio 8 – Colecciones: lista de cuentas y suma de saldos

**Objetivo:** practicar **`List`**, genéricos y recorrido con bucles/enhanced for.

1. Crea una clase `Banco` con un campo:

   ```java
   private java.util.List<CuentaBancaria> cuentas = new java.util.ArrayList<>();
   ```

2. Añade métodos:

   ```java
   public void agregarCuenta(CuentaBancaria cuenta) { ... }
   public double saldoTotal() { ... }
   ```

   - `saldoTotal()` debe recorrer la lista y sumar los saldos.
3. En un `main` de pruebas (por ejemplo, `PruebasBanco`):
   - Crea un `Banco`.
   - Añade 3–4 `CuentaBancaria` con distintos saldos.
   - Muestra por consola el saldo total del banco.

**Extensión:** añade un método `List<CuentaBancaria> cuentasConSaldoMayorQue(double minimo)` y pruébalo.

---

## 🧩 Ejercicio 9 – `Set` y `equals/hashCode` en `CuentaBancaria`

**Objetivo:** entender por qué `equals` y `hashCode` son importantes en `Set`/`Map`.

1. Sobrescribe en `CuentaBancaria` los métodos:

   ```java
   @Override
   public boolean equals(Object o) {
     // Dos cuentas son iguales si tienen el mismo IBAN
   }

   @Override
   public int hashCode() {
     // Usa solo el IBAN
   }
   ```

2. Crea una clase de prueba (`PruebasSetCuentas`) con:

   ```java
   java.util.Set<CuentaBancaria> cuentas = new java.util.HashSet<>();
   ```

3. Añade dos cuentas con el **mismo** IBAN pero distinto saldo.  
   - ¿Cuántos elementos hay en el `Set`?
4. Cambia la implementación de `equals/hashCode` para que use también el saldo e interpreta el comportamiento.

**Reflexión:** comenta en el código por qué en un escenario real suele ser mejor considerar solo el identificador (IBAN).

---

## 🧩 Ejercicio 10 – Ordenar `Persona` con `Comparator`

**Objetivo:** practicar **comparadores** y ordenación de listas.

1. Asegúrate de que `Persona` tiene al menos: `nombre`, `apellido` y `edad` (con getters).
2. En una clase de pruebas (`PruebasOrdenacionPersonas`):
   - Crea una `List<Persona>` con 5–6 personas distintas.
3. Ordena la lista usando:

   ```java
   personas.sort(
     java.util.Comparator
       .comparing((Persona p) -> p.getApellido())
       .thenComparing(Persona::getNombre)
       .thenComparing((Persona p) -> p.getEdad(), java.util.Comparator.reverseOrder())
   );
   ```

4. Imprime la lista antes y después de ordenar.

**Extensión:** crea distintos `Comparator<Persona>` (por nombre, por edad, etc.) y pruébalos.

---

## 🧩 Ejercicio 11 – Mini librería `com.docencia.util`

**Objetivo:** entender la idea de **paquetes/librerías reutilizables**.

1. Crea un nuevo paquete:

   ```text
   com.docencia.util
   ```
2. Mueve la clase `Validador` a este paquete.
3. Asegúrate de actualizar los `import` en el resto de clases (`CuentaBancaria`, etc.).
4. (Opcional – si usas Maven)
   - Imagina que este módulo es un proyecto Maven aparte llamado `util`.
   - Escribe en un comentario del código cómo se declararía la dependencia en otro proyecto usando `<dependency>`.

**Extensión:** añade en `com.docencia.util` una clase `NotificacionUtils` con métodos estáticos auxiliares para trabajar con la interfaz `Notificacion`.

---

## 🧩 Ejercicio 12 – Mini proyecto integrador

**Objetivo:** combinar **clases, herencia, interfaces, colecciones y paquetes** en un pequeño programa.

Crea una clase `App` (por ejemplo, en el paquete `com.docencia.app`) con un `main` que:

1. Cree varias `Persona` y `Empleado` (usando `Direccion`).
2. Cree varias `CuentaBancaria` y las registre en un `Banco`.
3. Envíe distintas `Notificacion` (`Email`, `Sms`) usando `Notificador`.
4. Muestre:
   - Lista de empleados (ordenados por apellido).
   - Saldo total del banco.
   - Resultados de algunos métodos de utilidades (`Validador`, etc.).

**Retos adicionales (para quien vaya rápido):**

- Persistir temporalmente los datos en un `List`/`Map` para simular un “mini sistema” en memoria.
- Añadir menús por consola para que el usuario pueda elegir qué operación hacer (crear persona, crear cuenta, enviar notificación, etc.).

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
