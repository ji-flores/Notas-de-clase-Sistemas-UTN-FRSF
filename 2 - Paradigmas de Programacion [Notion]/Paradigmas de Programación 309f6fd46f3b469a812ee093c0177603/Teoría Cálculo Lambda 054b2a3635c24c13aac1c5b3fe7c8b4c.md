# Teoría: Cálculo Lambda

## Sintaxis del cálculo lambda

```bnf
<termino> ::= <variable> |
							λ<variable>.<termino> |
							(<termino> <termino>)
```

Notar que no existe el concepto de `<nombre>` o `<constante>`

Esto implica que el formalismo **no tendrá primitivas**, no nos permitirá emplear funciones con el concepto de módulos abstractos.

## Abstracción funcional: `λ<variable>.<termino>`

En esta sintaxis, la asbtracción funcional es:

![Untitled](Teori%CC%81a%20Ca%CC%81lculo%20Lambda%20054b2a3635c24c13aac1c5b3fe7c8b4c/Untitled.png)

La sintaxis propuesta utiliza la **representación de funciones con un solo argumento**.

$$
\lambda x_1 . \lambda x_2 . \lambda x_3 . M 
$$

¿Como se definen valores con multiples argumentos? Debo “anidar” funciones, ubicando más funciones en el cuerpo.

## Cálculo lambda

**Objetivo: Explicitar el concepto que representa el empleo de funciones como medio de transformación de argumentos en resultados.**

A este formalismo lo denominamos *cálculo*, ya que el mismo empleará:

- Un conjunto de axiomas.
- Reglas de inferencia (de la misma forma que lo utilizan los sistemas formales).

Para representar el medio de transformación mencionado.

## Reglas definidas en el CL.

De acuerdo a la sintaxis propuesta, una **aplicación funcional** tendrá el siguiente formato: `(M N)`

La cual producirá un **resultado**, como consecuencia de una correspondiente **regla de cálculo**, `R`.

La consistencia del sistema requiere que la **aplicación funcional** y el **resultado** puedan ser interpretadas como expresiones equivalentes `(M N)≈R`, es decir, que representan el mismo valor.

## Aplicación funcional: `(<termino> <termino>)`

Es la **evaluación de una función.**

![Untitled](Teori%CC%81a%20Ca%CC%81lculo%20Lambda%20054b2a3635c24c13aac1c5b3fe7c8b4c/Untitled%201.png)

El cálculo del resultado de una aplicación funcional será obtenido mediante la generación de expresiones equivalentes por aplicación de las reglas del cálculo $\lambda$ que definiremos a continuación

La equivalencia entre expresiones del cálculo \lambda tendrá las propiedades de **reflexividad**, **simetría** y **transitividad**, más las siguientes:

$M=N \implies (M\;P) = (N\;P)$

$M=N \implies (P\;M) = (P\;N)$ 

$M=N \implies \lambda x.N = \lambda x . M$

## Regla Beta

El CL contiene tres reglas, de las cuales la fundamental es la **regla beta.**

La **regla beta** permite generar expresiones que satisfagan la relación de equivalencia. La misma establece como sustituir en el cuerpo de la abstracción funcional cada ocurrencia de la variable que hace de argumento nominal por el argumento efectivo de la aplicación funcional correspondiente.

![Untitled](Teori%CC%81a%20Ca%CC%81lculo%20Lambda%20054b2a3635c24c13aac1c5b3fe7c8b4c/Untitled%202.png)

### Definición

$$
(\lambda x.M \; N) = [N/x]\:M
$$

 La parte derecha de la expresión se interpreta como:

**“El termino que se obtiene de introducir $N$ en lugar de $x$, toda vez que x ocurre libre en $M$”**

### Ocurrencia de un termino

**Def:**

Ocurrencia de $P$ en $Q$

**Clausura:**

$P$ ocurre en $P$

**Inducción:**

Si $P$ ocurre en $M$ o $N$ $\implies$ $P$ ocurre en $(M\;N)$

Si $P$ ocurre en $M$ o $P$ es igual a $x$ $\implies$ $P$ ocurre en $\lambda x . M$