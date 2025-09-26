# <img src=../../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Ejercicios de if/ekse y switch en Java")

## 1) Detector de edad para una montaña rusa

**Descripción:** Determina si una persona puede subir a la atracción según su **edad** y **altura**.  
**Variables sugeridas:** `edad` (entero), `altura` (float, metros), `puedeSubir` (boolean).  
**Reglas:**

    - Puede subir si `edad >= 12` **y** `altura >= 1.40`.
    - Si no cumple ambos, no puede subir.

**Ejemplos (Entrada → Salida):**

- `edad=13, altura=1.42` → `Puede subir`
- `edad=11, altura=1.55` → `No puede subir`
- `edad=15, altura=1.39` → `No puede subir`

**Bonus:** Muestra mensajes distintos si falla por edad, por altura o por ambas.

---

## 2) Juego del número secreto

**Descripción:** El programa guarda un **número secreto** y el usuario intenta adivinarlo.  
**Variables sugeridas:** `secreto` (entero), `intento` (entero).  
**Reglas:**

- Si `intento == secreto` → “¡Acertaste!”
- Si `intento < secreto` → “Demasiado bajo”
- Si `intento > secreto` → “Demasiado alto”

**Ejemplos:**

- `secreto=42, intento=20` → `Demasiado bajo`
- `secreto=42, intento=80` → `Demasiado alto`
- `secreto=42, intento=42` → `¡Acertaste!`

---

## 3) Clasificación de notas escolares

**Descripción:** Clasifica una nota (0–10) en categorías.  
**Variables:** `nota` (float o entero), `categoria` (string).  
**Reglas (ejemplo):**

- `nota < 5` → `Suspenso`
- `5 <= nota < 7` → `Aprobado`
- `7 <= nota < 9` → `Notable`
- `9 <= nota <= 10` → `Sobresaliente`

**Ejemplos:**

- `nota=4.9` → `Suspenso`
- `nota=6.0` → `Aprobado`
- `nota=7.5` → `Notable`
- `nota=9.2` → `Sobresaliente`

**Bonus:** Valida que la nota esté entre 0 y 10; si no, error.

---

## 4) Par o impar

**Descripción:** Determina si un número es par o impar.  
**Variables:** `n` (entero).  
**Reglas:**

- Si `n % 2 == 0` → `Par` else `Impar`

**Ejemplos:**

- `n=10` → `Par`
- `n=7` → `Impar`

**Bonus:** Distingue también si es múltiplo de 4 o de 3.

---

## 5) Piedra, papel o tijeras (simple)

**Descripción:** Dos jugadores eligen entre `piedra`, `papel` o `tijeras`.  
**Variables:** `jugador1`, `jugador2` (string).  
**Reglas:**

- Empate si `jugador1 == jugador2`
- Tijeras gana a Papel; Papel gana a Piedra; Piedra gana a Tijeras.

**Ejemplos:**

- `jugador1=piedra, jugador2=papel` → `Gana jugador 2`
- `jugador1=tijeras, jugador2=papel` → `Gana jugador 1`
- `jugador1=papel, jugador2=papel` → `Empate`

**Bonus:** Acepta mayúsculas/minúsculas y sin tildes.

---

## 6) Calculadora de propinas

**Descripción:** Calcula la propina y el total a pagar.  
**Variables:** `cuenta` (float), `porcentaje` (entero/float), `propina`, `total`.  
**Reglas:**

- `propina = cuenta * porcentaje / 100`
- `total = cuenta + propina`

**Ejemplos:**

- `cuenta=50, porcentaje=10` → `propina=5, total=55`
- `cuenta=80, porcentaje=12.5` → `propina=10, total=90`

**Bonus:** Redondea a 2 decimales y permite dividir entre `n` amigos.

---

## 7) Reloj digital (saludos por hora)

**Descripción:** Muestra saludo según la hora (0–23).  
**Variables:** `hora` (entero).  
**Reglas (ejemplo):**

- `6–11` → `Buenos días`
- `12–19` → `Buenas tardes`
- `20–23 y 0–5` → `Buenas noches`

**Ejemplos:**

- `hora=8` → `Buenos días`
- `hora=15` → `Buenas tardes`
- `hora=22` → `Buenas noches`

**Bonus:** Valida rango 0–23; si no, error.

---

## 8) Adivina si tienes suerte

**Descripción:** Genera un número aleatorio y dice si eres suertudo.  
**Variables:** `n` (entero), `suertudo` (boolean).  
**Reglas:**

- Si `n % 7 == 0` → `¡Eres suertudo!` else `Sigue intentando`

**Ejemplos:**

- `n=14` → `¡Eres suertudo!`
- `n=29` → `Sigue intentando`

**Bonus:** Da pistas: “cerca” si `n % 7 == 1 o 6`.

---

## 9) Detector de año bisiesto

**Descripción:** Comprueba si un año es bisiesto.  
**Variables:** `anio` (entero).  
**Reglas estándar:**

- Es bisiesto si (`anio % 4 == 0` y `anio % 100 != 0`) **o** (`anio % 400 == 0`).

**Ejemplos:**

- `anio=2000` → `Bisiesto`
- `anio=1900` → `No bisiesto`
- `anio=2024` → `Bisiesto`

**Bonus:** Mensaje especial si es múltiplo de 400.

---

## 10) Simulador de semáforo

**Descripción:** Dado un color del semáforo, dice qué hacer.  
**Variables:** `color` (string).  
**Reglas:**

- `rojo` → `Detener`
- `amarillo` → `Precaución`
- `verde` → `Avanzar`

**Ejemplos:**

- `color=rojo` → `Detener`
- `color=amarillo` → `Precaución`
- `color=verde` → `Avanzar`

**Bonus:** Acepta abreviaturas `r/a/v` y valida entradas no válidas.

---

## 11) Menú de heladería (switch)

**Descripción:** Muestra el sabor según opción 1–3.  
**Variables:** `opcion` (entero).  
**Reglas (`switch`):**

- `1` → `Vainilla`
- `2` → `Chocolate`
- `3` → `Fresa`

- Otro → `Opción no válida`

**Ejemplos:**

- `opcion=1` → `Vainilla`
- `opcion=3` → `Fresa`
- `opcion=5` → `Opción no válida`

**Bonus:** Añade precios y calcula total.

---

## 12) Conversor de días (switch)

**Descripción:** De número 1–7 a día de la semana.  
**Variables:** `n` (entero).  
**Reglas:**
- `1→Lunes, 2→Martes, …, 7→Domingo`
**Ejemplos:**
- `n=1` → `Lunes`
- `n=6` → `Sábado`
- `n=8` → `Valor inválido`
**Bonus:** Acepta `0→Domingo` si estás en modo calendario clásico.

---

## 13) Mini-calculadora (switch)

**Descripción:** Ejecuta operación `+ - * /` sobre dos números.  
**Variables:** `a`, `b` (float/int), `op` (char/string).  
**Reglas:**

- `op='+'` → `a+b`
- `op='-'` → `a-b`
- `op='*'` → `a*b`
- `op='/'` → si `b!=0` entonces `a/b` else `Error: división por cero`

**Ejemplos:**
- `a=8, b=2, op='+'` → `10`
- `a=8, b=0, op='/'` → `Error: división por cero`
**Bonus:** Añade exponenciación `^` y módulo `%`.

---

## 14) Clasificador de planetas (switch)

**Descripción:** De número 1–8 a nombre del planeta (desde el Sol).  
**Variables:** `n` (entero).  
**Reglas (ejemplo):**

- `1→Mercurio, 2→Venus, 3→Tierra, 4→Marte, 5→Júpiter, 6→Saturno, 7→Urano, 8→Neptuno`

**Ejemplos:**

- `n=3` → `Tierra`
- `n=5` → `Júpiter`
- `n=9` → `Valor inválido`

**Bonus:** Añade datos rápidos (anillos, tipo, etc.).

---

## 15) Sonidos de animales (switch)

**Descripción:** Muestra el sonido de un animal dado.  
**Variables:** `animal` (string).  
**Reglas:**

- `perro→Guau`, `gato→Miau`, `vaca→Muuu`, otros→`Desconocido`

**Ejemplos:**

- `animal=perro` → `Guau`
- `animal=pollo` → `Desconocido`

**Bonus:** Acepta sinónimos (`can`, `felino`).

---

## 16) Selector de superpoder (switch)

**Descripción:** Devuelve el poder elegido 1–3.  

**Variables:** `op` (entero).  
**Reglas:**

- `1→Volar`, `2→Invisibilidad`, `3→Superfuerza`, otro→`Desconocido`

**Ejemplos:**

- `op=2` → `Invisibilidad`
- `op=5` → `Desconocido`

---

## 17) Control de TV (switch)

**Descripción:** Dado un canal, muestra su categoría.  
**Variables:** `canal` (entero).  
**Reglas (ejemplo):**

- `5→Deportes`, `7→Noticias`, `11→Películas`, default→`No configurado`

**Ejemplos:**

- `canal=5` → `Deportes`
- `canal=2` → `No configurado`

**Bonus:** Añade guía de horarios (estructura de datos).

---

## 18) Meses del año (switch)

**Descripción:** De número 1–12 a nombre del mes.  
**Variables:** `mes` (entero).  
**Reglas:**

- `1→Enero, …, 12→Diciembre`

**Ejemplos:**

- `mes=4` → `Abril`
- `mes=13` → `Valor inválido`

**Bonus:** Devuelve también la estación del año (según hemisferio).

---

## 19) Clasificación de películas (switch)

**Descripción:** Según letra `G, PG, R`, devuelve explicación.  
**Variables:** `clas` (string).  
**Reglas (ejemplo):**

- `G→Apta para todos`
- `PG→Guía paternal sugerida`
- `R→Restringida`
- Otro→`Clasificación no reconocida`

**Ejemplos:**

- `clas='G'` → `Apta para todos`
- `clas='NC-17'` → `Clasificación no reconocida`

**Bonus:** Acepta minúsculas y espacios.

---

## 20) Cajero automático (switch + if)

**Descripción:** Simula opciones básicas de un cajero.  
**Variables:** `saldo` (float), `op` (entero), `monto` (float).  
**Reglas:**

- `1→Ver saldo`
- `2→Depositar`: `saldo += monto`
- `3→Retirar`: si `monto <= saldo` entonces `saldo -= monto` else `Error: fondos insuficientes`
- Otro→`Opción no válida`

**Ejemplos:**

- `saldo=100, op=1` → `Saldo: 100`
- `saldo=100, op=2, monto=50` → `Saldo: 150`
- `saldo=100, op=3, monto=200` → `Error: fondos insuficientes`

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
