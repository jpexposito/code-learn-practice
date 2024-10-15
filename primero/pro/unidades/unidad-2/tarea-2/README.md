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

### Instancia y uso de la clase

Crea un objeto de la clase Persona con nombre __"Juan" y edad 30. Muestra la información de la persona.

## Ejercicio 2

Modifica la clase `Persona` para que tenga métodos getter y setter para el atributo `edad`.

### Instancia y uso de la clase

Crea un objeto de la clase Persona con nombre "Maria" y edad 25. Modifica la edad a 26 usando el setter y muestra la edad actualizada.

## Ejercicio 3

Crea una clase `Coche` con los atributos `marca`, `modelo` y `año`. Incluye un constructor y métodos getter y setter para cada atributo.

### Instancia y uso de la clase

Crea un objeto de la clase Coche con marca "Toyota", modelo "Corolla", y año 2022. Muestra los atributos del coche (marca, modelo, año) usando getters.

## Ejercicio 4

Modifica la clase `Coche` para que el setter del atributo `año` solo permita valores mayores o iguales a 1886 (año de creación del primer coche).

>***Nota***: Utilización de if

### Instancia y uso de la clase

Crea un objeto de la clase Coche con marca "Ford", modelo "Mustang", y año 2020. Intenta asignar un año menor a 1886 y muestra el resultado de la validación.

## Ejercicio 5

Crea una clase llamada `Rectangulo` con los atributos `base` y `altura`. Implementa un método que calcule el área del rectángulo. Usa getters y setters para los atributos.

### Instancia y uso de la clase

Crea un objeto de la clase Rectangulo con base 5 y altura 10. Muestra el área calculada del rectángulo.

## Ejercicio 6

Añade un método en la clase `Rectangulo` que calcule el perímetro del rectángulo.

La fórmula para calcular el perímetro de un rectángulo es:

𝑃 = 2⋅(𝑏+ℎ)

Donde:

- ***P*** es el perímetro.
- ***b*** es la longitud de la base del rectángulo.
- ***h*** es la altura del rectángulo.

### Instancia y uso de la clase

Crea un objeto de la clase Rectangulo con base 4 y altura 7. Muestra el perímetro calculado del rectángulo.

## Ejercicio 7

Crea una clase `Banco` con un atributo privado `saldo`. Implementa métodos para depositar y retirar dinero, y un método getter para consultar el saldo.

### Instancia y uso de la clase

Crea un objeto de la clase Banco con un saldo inicial de 1000. Deposita 500, retira 200 y muestra el saldo actual.

## Ejercicio 8

Crea una clase `Empleado` con los atributos `nombre`, `puesto` y `salario`. Usa getters y setters para cada atributo. El salario no puede ser negativo.

### Instancia y uso de la clase

Crea un objeto de la clase Empleado con nombre "Ana", puesto "Gerente", y salario 5000. Asegúrate de que el salario no sea negativo.

## Ejercicio 9

Modifica la clase `Empleado` para que el setter de `puesto` no permita valores vacíos o nulos.

### Instancia y uso de la clase

Crea un objeto de la clase Empleado con nombre "Carlos", puesto "Ingeniero" y salario 3000. Intenta asignar un puesto vacío y muestra el resultado de la validación.

## Ejercicio 10

Crea una clase `CuentaBancaria` con los atributos `titular` y `saldo`. Implementa un método para transferir dinero entre dos cuentas.

### Instancia y uso de la clase

Crea dos objetos de la clase CuentaBancaria con titulares "Pedro" y "Laura", y con saldo inicial de 1500 y 1000 respectivamente. Transfiere 500 de la cuenta de Pedro a la cuenta de Laura y muestra los saldos de ambas cuentas.

## Ejercicio 11

Modifica la clase `CuentaBancaria` para que la transferencia no pueda realizarse si el saldo de la cuenta es insuficiente.

### Instancia y uso de la clase

Crea dos objetos de la clase CuentaBancaria con titulares "Luis" y "Sofía", con saldos de 500 y 3000 respectivamente. Intenta transferir 1000 de la cuenta de Luis y muestra un mensaje de saldo insuficiente.

## Ejercicio 12

Crea una clase `Libro` con los atributos `titulo`, `autor` y `paginas`. Usa getters y setters para cada atributo, y asegura que el número de páginas sea un entero positivo.

### Instancia y uso de la clase

Crea un objeto de la clase Libro con título "El Quijote", autor "Cervantes", y 500 páginas. Asegúrate de que el número de páginas sea positivo.

## Ejercicio 13

Crea una clase `Alumno` con los atributos `nombre` y `nota`. Implementa un método que determine si el alumno ha aprobado (nota >= 6).

### Instancia y uso de la clase

Crea un objeto de la clase Alumno con nombre "Lucía" y nota 7. Determina si el alumno ha aprobado.

## Ejercicio 14

Modifica la clase `Alumno` para que la nota no pueda ser mayor a 10 ni menor a 0 en el setter.

### Instancia y uso de la clase

Crea un objeto de la clase Alumno con nombre "Jorge" y nota 11. Asegúrate de que la nota no pueda ser mayor que 10 ni menor que 0.

## Ejercicio 15

Crea una clase `Producto` con los atributos `nombre`, `precio` y `stock`. El precio no puede ser negativo y el stock debe ser al menos 0.

### Instancia y uso de la clase

Crea un objeto de la clase Producto con nombre "Laptop", precio 1000, y stock 50. Asegúrate de que el precio no sea negativo y que el stock no sea menor a 0.

## Ejercicio 16

Añade a la clase `Producto` un método para vender productos, que disminuya el stock y retorne el total de la venta.

### Instancia y uso de la clase

Crea un objeto de la clase Producto con nombre "Cámara", precio 300, y stock 20. Realiza una venta de 5 unidades y muestra el stock restante y el total de la venta.

## Ejercicio 17

Crea una clase `Vehiculo` con los atributos `marca`, `modelo` y `combustible`. Define un método que permita agregar combustible al vehículo.

### Instancia y uso de la clase

Crea un objeto de la clase Vehiculo con marca "Honda", modelo "Civic", y combustible 40 litros. Agrega 20 litros de combustible al vehículo.

## Ejercicio 18

Modifica la clase `Vehiculo` para que el setter de `combustible` no permita valores negativos.

### Instancia y uso de la clase

Crea un objeto de la clase Vehiculo con marca "Ford", modelo "Fiesta", y combustible 15 litros. Intenta asignar un valor negativo al combustible y muestra el resultado de la validación.

## Ejercicio 19

Crea una clase `Circulo` con un atributo `radio`. Implementa un método que calcule el área y el perímetro del círculo. Usa getters y setters para el radio.

### Instancia y uso de la clase

Crea un objeto de la clase Circulo con radio 5. Muestra el área y el perímetro del círculo.

## Ejercicio 20

Modifica la clase `Circulo` para que el setter de `radio` solo acepte valores positivos y mayores a 0.

### Instancia y uso de la clase

Crea un objeto de la clase Circulo con radio -3. Asegúrate de que el radio sea un valor positivo mayor a 0.

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
