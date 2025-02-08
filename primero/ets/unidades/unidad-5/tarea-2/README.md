# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Trabajando con Interfaces y Clases Abstractas ")

<img src=images/empleado.png width="400">

## Descripción

Imagina que trabajas en una empresa y necesitas implementar un sistema de gestión de empleados. Los empleados pueden ser de diferentes tipos, como **Desarrolladores**, **Diseñadores**, **Gerentes**, etc. Todos los empleados tienen propiedades comunes, como su **nombre**, **edad**, y un **salario**. Sin embargo, cada tipo de empleado tiene comportamientos específicos que deben ser definidos de manera diferente.

Para representar esta estructura, crearemos una **clase abstracta** llamada `Empleado` que contendrá atributos comunes y un método abstracto para calcular el salario final del empleado, ya que la manera de calcular el salario varía según el tipo de empleado.

### Requerimientos

1. **Clase abstracta `Empleado`**:
   - Atributos: `nombre` (String), `edad` (int), `salarioBase` (double).
   - Método abstracto: `calcularSalarioFinal()`, que debe ser implementado por las subclases.
   - Método concreto: `mostrarInformacion()`, que muestra el nombre, edad y salario base del empleado.

2. **Subclase `Desarrollador`**:
   - Esta clase hereda de `Empleado` y sobrescribe el método `calcularSalarioFinal()`. Los desarrolladores reciben un bono extra del 20% sobre su salario base.

3. **Subclase `Diseñador`**:
   - Esta clase hereda de `Empleado` y sobrescribe el método `calcularSalarioFinal()`. Los diseñadores reciben un bono extra del 10% sobre su salario base.

4. **Subclase `Gerente`**:
   - Esta clase hereda de `Empleado` y sobrescribe el método `calcularSalarioFinal()`. Los gerentes reciben un bono extra del 30% sobre su salario base.

5. **Clase `Programa`**:
   - Crear instancias de cada tipo de empleado y mostrar su información, incluyendo el salario final calculado.

### Instrucciones para la implementación

1. **Definir la clase abstracta `Empleado`**:
   - La clase debe tener atributos privados para `nombre`, `edad` y `salarioBase`, con métodos públicos para obtener y modificar estos atributos.
   - El método `calcularSalarioFinal()` debe ser abstracto.

2. **Definir las subclases `Desarrollador`, `Diseñador`, y `Gerente`**:
   - Cada subclase debe sobrescribir el método `calcularSalarioFinal()` con la lógica específica para ese tipo de empleado.

3. **Crear una clase `Programa`**:
   - Instanciar un `Desarrollador`, un `Diseñador` y un `Gerente`.
   - Mostrar la información de cada empleado y el cálculo de su salario final.

> **NOTA IMPORTANTE**: _Has uso de interfaces si lo consideras oportuno_.

## Salida esperada

La solución creada debe de mostrar una salida similar a la siguiente:

```console
Empleado: Desarrollador
Nombre: Carlos
Edad: 30
Salario Base: 3000.0
Salario Final: 3600.0

Empleado: Diseñador
Nombre: Ana
Edad: 28
Salario Base: 2500.0
Salario Final: 2750.0

Empleado: Gerente
Nombre: Luis
Edad: 40
Salario Base: 5000.0
Salario Final: 6500.0
```

## Referencias

- [Ejemplos y documentación de interfaces](https://github.com/jpexposito/code-learn/blob/main/primero/pro/unidades/comun/INTERFACES.md).

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
