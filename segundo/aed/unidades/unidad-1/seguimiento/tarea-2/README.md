# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Acceso a Datos: "Ficheros")

## ✅ Preparación

```bash
php -v
```

Ejecuta:

```bash
php ejercicioX.php
```

## Ejercicio1: Operaciones con números naturales en PHP

### Enunciado

Dado un fichero `ops.csv` con columnas:

```code
z1,z2,op
```

donde:

- `op ∈ {suma, resta, producto, division}`  

Se debe calcular `z1 (op) z2` y generar como salida un fichero `resultado.csv`.

---

## Entrada (ejemplo)

Archivo: `ops.csv`

```csv
3,1,suma
5,2,producto
```

---

## Salida esperada

Archivo: `resultado.csv`

```csv
z1,z2,op,resultado
3,1,suma,4
5,2,producto,10
```

- `resultado` → número natural resultante de la operación.  
- Si ocurre una **división por 0**, escribir `ERROR` en la columna `resultado`.

---

## Archivos esperados

- **Entrada:** `ops.csv`  
- **Salida:** `resultado.csv`  

---

## Ejemplo de ejecución

```bash
php ejercicio1.php
```

### ops.csv

```code
z1,z2,op
3,1,suma
10,4,resta
2,8,resta
5,2,producto
7,0,producto
9,3,division
10,3,division
8,0,division
```

## Referencias

- https://doc.php.net/archives/php5/php_manual_en.tar.gz

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.