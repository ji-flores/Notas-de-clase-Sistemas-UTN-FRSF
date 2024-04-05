# Teoría: Introducción a la PF

**Algoritmo** **=**

**Lógica:** Especificación del problema

- En PL: Calculo de predicados de 1er orden.
- En PF: Cálculo $\lambda$.

*Ambos son declarativos.*

**+**

**Control:** Búsqueda de la solución.

## Programación funcional

### Caracteristicas

- Toda computación es el resultado de evaluar una función matemática.
- Enfatiza en la evaluación de expresiones y no la ejecución de instrucciones

- Programa = Función matemática (no necesariamente numérica)
- Ejecutar un programa = Evaluar una función
- No hay noción de variable como posición de memoria. Al igual que pasa en lógica; es un concepto general de la programación declarativa.
    - No hay instrucción de asignación.
    - No existen efectos colaterales.
    - Hay transparencia referencial: La salida depende solamente de las entradas.
- Permite definir funciones de orden superior: Las funciones pueden manipularse con libertad: Pueden pasarse como parámetros, ser argumentos de otras funciones, ser retornos de otras funciones, etc. Se dice que son ciudadanos de primer orden ???

## Función matemática

Una función $f$ entre dos conjuntos $A$ y $B$ es una correspondencia que a cada elemento de un subconjunto de $A$, llamado “Dominio de $f$”, le hace corresponder un y solo un elemento de un subconjunto de $B$ llamado “Imagen de $f$”

$f: A \rarr B$

$f(x)=$`<exp>`

### Definición de funciones

- Es una estructura jerárquica en la cual funciones más simples aparecen en la definición de funciones más complejas.
- Las funciones utilizadas a la derecha del signo de igualdad se referencian solo por su nombre. El significado puede obtenerse de reemplazar el nombre por su definición.
- Esta sucesión se clausura con funciones primitivas, cuyo significado se da por sobreentendido.

Al igual que en matemática, es posible definir funciones condicionales (Ej: $|x|)$ e incluso recursivas (Ej: $n!$).

También se trabaja con composición de funciones $f \circ g = f(g(x))$.

¿Como podría definirse la composición de funciones?

`composicion(f,g) = ?`

Podríamos escribir cada función como:

`f = (x) 2*x`

`g = (x) x +1`

Y ahora la composición sería:

`composición = (f,g)(x) f(g(x))`

Con esta notación nueva:

![Untitled](Teori%CC%81a%20Introduccio%CC%81n%20a%20la%20PF%20510c089c8f5f44338ad19c83f92528ed/Untitled.png)