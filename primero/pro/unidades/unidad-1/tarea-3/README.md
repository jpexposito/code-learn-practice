# <img src=../../../../../images/computer.png width="40"> Code, Learn & Practice(Programación: Introducción a la Programación "Condicionales y Scanner en Java")

## Ejercicio 1: Elige tu camino

**Enunciado**: Eres un héroe en una mazmorra con dos puertas. Si eliges la puerta correcta, obtienes una espada mágica. Si eliges la incorrecta, caerás en una trampa.  

- Crea un programa que pregunte al usuario qué puerta elige (1 o 2) y le diga si ha obtenido la espada o ha caído en la trampa.

Aquí tienes la solución:

```java
import java.util.Scanner;
import java.util.Random;

public class Mazmorras {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();
        
        // Randomly set the correct door (1 or 2)
        int puertaCorrecta = random.nextInt(2) + 1;

        System.out.println("Elige una puerta (1 o 2): ");
        int eleccionUsuario = scanner.nextInt();

        if (eleccionUsuario == puertaCorrecta) {
            System.out.println("¡Has obtenido la espada mágica!");
        } else if (eleccionUsuario == 1 || eleccionUsuario == 2) {
            System.out.println("¡Has caído en la trampa!");
        } else {
            System.out.println("Opción no válida. Elige 1 o 2.");
        }

        scanner.close();
    }
}
```

---

## Ejercicio 2: Subir de nivel

**Enunciado**: Eres un guerrero de nivel 5. Si obtienes más de 50 puntos de experiencia, subes a nivel 6. Si no, te quedas en nivel 5.  

- Escribe un programa que reciba los puntos de experiencia y determine si subes de nivel o no.

---

## Ejercicio 3: Día de entrenamiento en la nave espacial

**Enunciado**: Cada día de la semana en tu nave espacial hay una actividad diferente. Los lunes entrenas combate, los miércoles pilotaje, y los viernes reparaciones. El resto de días descansas.  

- Crea un programa que pida el día de la semana y te diga cuál es la actividad programada.

---

## Ejercicio 4: ¿Te unes al lado oscuro?

**Enunciado**: Si eres un Sith o un Jedi, puedes usar la Fuerza. Si no, eres un simple mortal.  

- Crea un programa que pregunte al usuario si es Sith o Jedi y le diga si puede usar la Fuerza o no.

---

## Ejercicio 5: Nivel de poder en combate

**Enunciado**: Goku está en una batalla. Si su nivel de poder es mayor de 9000, está en "Modo Super Saiyan". Si no, está en "Modo normal".  

- Escribe un programa que reciba el nivel de poder de Goku y determine en qué modo está.

---

## Ejercicio 6: Cazar pokémon

**Enunciado**: Estás cazando pokémon. Si el pokémon es de tipo Agua, Fuego o Planta, puedes usar la pokébola. Si es de cualquier otro tipo, no.  

- Crea un programa que te diga si puedes atrapar al pokémon o no según su tipo.

---

## Ejercicio 7: El viaje a Mordor

**Enunciado**: Frodo está viajando a Mordor. Si la distancia es mayor a 1000 kilómetros, necesitará descansar. Si es menor, podrá continuar.  

- Escribe un programa que reciba la distancia a Mordor y diga si Frodo necesita descansar o no.

---

## Ejercicio 8: Portal hacia otra dimensión

**Enunciado**: Rick ha activado su pistola de portales. Si ingresa un número divisible por 3, el portal lleva a la dimensión A. Si es divisible por 5, lleva a la dimensión B. Si es divisible por ambos, lleva a la dimensión C.  

- Crea un programa que determine a qué dimensión llega el portal según el número ingresado.

---

## Ejercicio 9: Fusión de guerreros Z

**Enunciado**: Para hacer la fusión, los guerreros deben tener la misma cantidad de ki. Si los valores de ki no coinciden, la fusión falla.  

- Escribe un programa que reciba los valores de ki de dos guerreros y determine si la fusión es exitosa o falla.

---

## Ejercicio 10: Asignación de casa en Hogwarts

**Enunciado**: Según tus respuestas en el sombrero seleccionador, te pueden asignar a Gryffindor, Slytherin, Ravenclaw o Hufflepuff. Elige entre valiente, astuto, sabio o leal y el programa te asignará una casa.  

- Crea un programa que te asigne una casa según tu elección.

---

## Ejercicio 11: Velocidad de la Millennium Falcon

**Enunciado**: Si la velocidad de la Millennium Falcon es mayor de 1000, se activan los motores hiperespaciales. Si es mayor de 500 pero menor o igual a 1000, la nave está a máxima velocidad. Si es menor o igual a 500, la nave está en velocidad normal.  

- Escribe un programa que reciba la velocidad de la Millennium Falcon y determine el estado de los motores.

---

## Ejercicio 12: Pelea entre héroes

**Enunciado**: Batman y Superman están peleando. Si la fuerza de Superman es mayor a la de Batman, Superman gana. Si es menor, Batman gana. Si tienen la misma fuerza, es un empate.  

- Escribe un programa que reciba las fuerzas de ambos héroes y determine quién gana.

---

## Ejercicio 13: Energía de Iron Man

**Enunciado**: Si la energía del traje de Iron Man es mayor al 70%, puede volar. Si es mayor al 30% pero menor o igual al 70%, puede caminar. Si es menor o igual al 30%, está en modo crítico.  

- Crea un programa que determine el estado de Iron Man según su nivel de energía.

---

## Ejercicio 14: Batalla Pokémon

**Enunciado**: Si tu pokémon es de tipo Agua y el rival es de tipo Fuego, ganas. Si es Planta, pierdes. Si el rival es Agua, empatas.  

- Crea un programa que reciba los tipos de los pokémon y determine el resultado de la batalla.

---

## Ejercicio 15: Mazmorra de Zelda

**Enunciado**: Link encuentra tres objetos en una mazmorra: una llave, una bomba y un arco. Si tiene la llave, puede abrir la puerta. Si tiene la bomba, puede destruir la puerta. Si tiene el arco, puede atacar a los enemigos desde lejos.  

- Escribe un programa que determine qué puede hacer Link según el objeto que tenga.

---

## Ejercicio 16: Supervivencia en el Apocalipsis Zombie

**Enunciado**: Si tienes un arma de fuego y munición, puedes luchar contra los zombies. Si tienes un arma cuerpo a cuerpo, puedes defenderte. Si no tienes armas, debes huir.  

- Escribe un programa que determine qué hacer según el tipo de arma y si tienes munición.

---

## Ejercicio 17: Calcular daño en batalla de rol

**Enunciado**: En una batalla de rol, si el atacante tiene más fuerza que el defensor, le inflige un daño igual a la diferencia de fuerza. Si no, el defensor bloquea el ataque.  

- Crea un programa que reciba las fuerzas de ambos personajes y determine el daño infligido.

---

## Ejercicio 18: Reclutamiento para la Resistencia

**Enunciado**: Si tienes más de 18 años, eres aceptado en la Resistencia. Si tienes menos de 18 pero eres hábil con armas, también eres aceptado. Si no, debes esperar.  

- Crea un programa que determine si puedes unirte a la Resistencia.

---

## Ejercicio 19: Cálculo de recursos en StarCraft

**Enunciado**: Si tienes más de 500 minerales y más de 300 gas, puedes construir un coloso. Si no tienes suficientes recursos, construyes un marine.  

- Crea un programa que determine qué unidad puedes construir en StarCraft según los recursos.

---

## Ejercicio 20: Combate Final en Mortal Kombat

**Enunciado**: Dos luchadores están en el combate final de Mortal Kombat. Si la salud de un luchador es 0, pierde. Si ambos tienen salud, se evalúa quién tiene más ataque. Si ambos tienen el mismo ataque, el combate es un empate.  

- Escribe un programa que reciba la salud y ataque de ambos luchadores y determine el resultado del combate.

---

## Licencia 📄

Este proyecto está bajo la Licencia (Apache 2.0) - mira el archivo [LICENSE.md]([../../../LICENSE.md](https://github.com/jpexposito/code-learn-practice/blob/main/LICENSE)) para detalles.
