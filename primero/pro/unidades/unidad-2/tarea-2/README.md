# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Definición de Clases, constructores, getters, setters")

## Ejercicio 1

Crea una clase llamada `Persona` con los atributos `nombre` y `edad`. Define un constructor que inicialice estos valores.

### Solución

```java
public class Persona {
    
    private String nombre;
    private int edad;

    /**
     *  Constructor por defecto de la clase
     */ 
    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    /**
     * Metodo que no forma parte de la tarea, solo es un ejemplo
     */
    public void mostrarInformacion() {
        System.out.println("Nombre: " + nombre + ", Edad: " + edad);
    }
```

## Ejercicio 2

Modifica la clase `Persona` para que tenga métodos getter y setter para el atributo `edad`.

## Ejercicio 3

Crea una clase `Coche` con los atributos `marca`, `modelo` y `año`. Incluye un constructor y métodos getter y setter para cada atributo.

## Ejercicio 4

Modifica la clase `Coche` para que el setter del atributo `año` solo permita valores mayores o iguales a 1886 (año de creación del primer coche).

>***Nota***: Utilización de if

## Ejercicio 5

Crea una clase llamada `Rectangulo` con los atributos `base` y `altura`. Implementa un método que calcule el área del rectángulo. Usa getters y setters para los atributos.

## Ejercicio 6

Añade un método en la clase `Rectangulo` que calcule el perímetro del rectángulo.

La fórmula para calcular el perímetro de un rectángulo es:

𝑃 = 2⋅(𝑏+ℎ)

Donde:

- ***P*** es el perímetro.
- ***b*** es la longitud de la base del rectángulo.
- ***h*** es la altura del rectángulo.

## Ejercicio 7

Crea una clase `Banco` con un atributo privado `saldo`. Implementa métodos para depositar y retirar dinero, y un método getter para consultar el saldo.

## Ejercicio 8

Crea una clase `Empleado` con los atributos `nombre`, `puesto` y `salario`. Usa getters y setters para cada atributo. El salario no puede ser negativo.

## Ejercicio 9

Modifica la clase `Empleado` para que el setter de `puesto` no permita valores vacíos o nulos.

## Ejercicio 10

Crea una clase `CuentaBancaria` con los atributos `titular` y `saldo`. Implementa un método para transferir dinero entre dos cuentas.

## Ejercicio 11

Modifica la clase `CuentaBancaria` para que la transferencia no pueda realizarse si el saldo de la cuenta es insuficiente.

## Ejercicio 12

Crea una clase `Libro` con los atributos `titulo`, `autor` y `paginas`. Usa getters y setters para cada atributo, y asegura que el número de páginas sea un entero positivo.

## Ejercicio 13

Crea una clase `Alumno` con los atributos `nombre` y `nota`. Implementa un método que determine si el alumno ha aprobado (nota >= 6).

## Ejercicio 14

Modifica la clase `Alumno` para que la nota no pueda ser mayor a 10 ni menor a 0 en el setter.

## Ejercicio 15

Crea una clase `Producto` con los atributos `nombre`, `precio` y `stock`. El precio no puede ser negativo y el stock debe ser al menos 0.

## Ejercicio 16

Añade a la clase `Producto` un método para vender productos, que disminuya el stock y retorne el total de la venta.

## Ejercicio 17

Crea una clase `Vehiculo` con los atributos `marca`, `modelo` y `combustible`. Define un método que permita agregar combustible al vehículo.

## Ejercicio 18

Modifica la clase `Vehiculo` para que el setter de `combustible` no permita valores negativos.

## Ejercicio 19

Crea una clase `Circulo` con un atributo `radio`. Implementa un método que calcule el área y el perímetro del círculo. Usa getters y setters para el radio.

## Ejercicio 20

Modifica la clase `Circulo` para que el setter de `radio` solo acepte valores positivos y mayores a 0.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
