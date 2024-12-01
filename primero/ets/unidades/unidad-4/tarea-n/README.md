# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Entornos de Desarrollo: Comenzando con los diagramas de Clases ")

## Ejercicio: Diseñando el Sistema de una Tienda de Souvenirs

<img src=https://shopinporto.porto.pt/wp-content/uploads/2019/07/01-Porto-Souvenir_2_012_SIP_2808-2.jpg width="350">

### Objetivo

- Crear el [diagrama de clases](https://github.com/jpexposito/code-learn/tree/main/primero/ets/unidades/unidad-4) para el sistema indicado.

### Guía paso a paso

Estamos diseñando el sistema para una tienda de souvenirs que vende camisetas, tazas, llaveros y otros artículos encantadores. Además, la tienda tiene `clientes` frecuentes y necesita registrar cada una de sus compras. Para organizar toda esta información, vamos a crear un **diagrama de clases**.

Nuestro sistema tendrá tres componentes principales: **Producto**, **Cliente** y **Venta**.

---

#### El Producto: La estrella de la tienda

El primer elemento clave son los **productos**. Cada producto en la tienda tiene características importantes:  

- **Nombre**: Esto nos dice qué es, como "Taza de cerámica".  
- **Precio**: Indica cuánto cuesta, por ejemplo, 15.00€.  
- **Cantidad en inventario**: Nos dice cuántas unidades tenemos disponibles, como 30.  
- **Categoría**: Clasifica el producto, como "Souvenir" o "Ropa".  

##### Métodos del Producto

- **Actualizar el inventario**:  
  Si un cliente compra un producto, necesitamos restar la cantidad comprada del inventario.  
  - **Método**: `actualizarInventario(cantidad: int)`  
  - **Función**: Resta/Suma la cantidad al inventario actual.  

- **Calcular el precio total**:  
  Si un cliente compra varias unidades de un producto, este método multiplica el precio por la cantidad solicitada y devuelve el precio total.  
  - **Método**: `precioTotal(cantidad: int)`  
  - **Función**: Multiplica `precio * cantidad` y devuelve el total.  

---

## El Cliente: La pieza clave del negocio

Por supuesto, los clientes son el motor de la tienda. Cada cliente tiene atributos únicos que necesitamos registrar:  

- **Nombre**: Por ejemplo, "Juan Pérez".  
- **Correo electrónico**: Así podemos enviarles promociones, como `juanperez@example.com`.  
- **Historial de compras**: Una lista de todas las compras que ha realizado en la tienda.  

### Métodos del Cliente

- **Añadir una compra a su historial**:  
  Cada vez que un cliente realiza una compra, esta se añade a su historial.  
  - **Método**: `añadirHistorial(venta: Venta)`  
  - **Función**: Agrega un objeto `Venta` al historial de compras del cliente.  

- **Obtener información del cliente**:  
  Si necesitamos datos rápidamente, este método devuelve el nombre, correo y cuántas compras ha realizado.  
  - **Método**: `obtenerDatosCliente()`  
  - **Función**: Devuelve una cadena con los datos del cliente.
   > ¿Qué función de la clase realiza esta acción (`to...`)?

---

## Las Ventas

Cada transacción en la tienda se registra como una **venta**. Una venta conecta a un cliente con los productos que ha comprado y tiene las siguientes características:  

- **Fecha**: El día en que ocurrió, por ejemplo, "2024-12-01".  
- **Cliente**: El comprador que realizó la compra (relación directa con la clase **Cliente**).  
- **Lista de productos**: Todos los productos que el cliente adquirió durante esta compra (relación directa con la clase **Producto**).  
- **Total**: El monto total pagado en la venta.  

### Métodos de la Venta

- **Calcular el total**:  
  Este método recorre la lista de productos, suma sus precios y devuelve el total de la venta.  
  - **Método**: `calcularTotal()`  
  - **Función**: Suma los precios de los productos en `listaProductos` y actualiza el `total`.  

- **Generar un recibo**:  
  Crea un resumen con la información del cliente, los productos comprados y el total pagado.  
  - **Método**: `generarRecibo()`  
  - **Función**: Devuelve un recibo en formato texto.  

---

## Relaciones entre las Clases

El sistema tiene tres relaciones importantes:  

1. **Un Cliente puede realizar muchas Ventas**:  
   Por ejemplo, Juan Pérez puede comprar una taza hoy y una camiseta la próxima semana. Esta es una relación **1:N** entre la clase **Cliente** y la clase **Venta**.  

2. **Una Venta puede incluir muchos Productos**:  
   Como una camiseta y un llavero en una sola compra. Además, un producto puede estar en muchas ventas (por ejemplo, una camiseta que compran varios clientes). Esto representa una relación **N:M** entre **Venta** y **Producto**.  

---

> ***Con toda la información aportada realiza el diagrama de clases y la implementación de las mismas***

## Referencias

- [Ejemplo de Diagrama de Clases](https://github.com/jpexposito/code-learn/blob/main/primero/ets/unidades/unidad-4/DIAGRAMA-CLASES-EXPLICADO.md).

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
