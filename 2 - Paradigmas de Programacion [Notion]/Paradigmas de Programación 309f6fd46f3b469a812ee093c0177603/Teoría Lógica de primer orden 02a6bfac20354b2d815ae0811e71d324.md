# Teoría: Lógica de primer orden

### Forma clausal de Skolem

Con $n\geq0$ y $m\geq0$, con al menos uno de los dos $>0$

$\forall X_i \; (A_1 \lor ... \lor A_n \lor \lnot B_1 \lor ... \lor \lnot B_m)$

$\forall X_i \; \lnot(B_1 \land ... \land B_m) \lor A_1 \lor ... \lor A_n$

$\forall X_i \; (B_1 \land ... \land B_m) \to (A_1 \lor ... \lor A_n)$

### Forma clausal de Horn

Caso particular de las **clausulas de Skolem** en donde $**n \in \{0,1\}**$

Que a su vez se pueden clasificar en:

- **Tipo 1: $n = 1, m = 0$.** Ej: **$\forall X_i \; A_1$**
- **Tipo 2: $n = 1, m >0$.** Ej: $**\forall X_i \; (B_1 \land ... \land B_m) \to A_1**$
- **Tipo 3: $n = 0, m>0$.** Ej: $**\forall X_i \; \lnot(B_1 \land ... \land B_m)**$

En general, si en un conjunto de reglas, una de ellas es de la forma $A_1 \land A_2 \land ... \land A_i$, esta se puede separar en $i$ reglas distintas, cada una de tipo 1.

Clausulas de tipo 1 y 2 se usan para describir las *reglas* de un programa lógico.

Clausulas de tipo 3 para realizar las *consultas.*

## Semántica

## En LPC

### Interpretación

Sea **L** un lenguaje proposicional, **A** el conjunto de átomos de **L**. Luego una interpretación **I** de **L** es una función de **A** en {**true**, **false**}

$$
I: A \to \{true,false\}
$$

### Numero de interpretaciones

Si un alfabeto tiene n atomos, entonces existen $2^n$ interpretaciones posibles.

### Valor de verdad

Entonces, el valor de verdad de una formula va a estar dado, exclusivamente, por los conectivos y valores de verdad de los átomos que contiene.

![Untitled](Teori%CC%81a%20Lo%CC%81gica%20de%20primer%20orden%2002a6bfac20354b2d815ae0811e71d324/Untitled.png)

## En LPO

### Termino basico (o ground)

Definición: Un termino o una clausula es básica (”ground”) si en ella no hay variables.

### Universo de un programa

Sea un programa lógico P, el universo de P $U(P)$, es el conjunto de términos básicos que pueden ser construidos a partir de las constantes y simbolos funcionales que ocurren en P.

### Base de un programa

Sea un programa lógico P, la base de P $B(P)$ es el conjunto de predicados basicos (también se los puede llamar “ground”) que pueden ser construidos a partir de los simbolos predicados que ocurren en P y los terminos de $U(P)$.

### Interpretación

**Def:** Asignación de valores de verdad (true) y falsedad (false) a cada predicado básico que se puede construir a partir del universo del discurso y el conjunto de símbolos predicativos que ocurren en el conjunto de cláusulas **(Base del programa)**

Entonces, una interpretación $I$ de un programa logico P es un subconjutno del conjunto $B(P)$. Este subconjunto contiene aquellos elementos de $B(P)$ a los que se le asigna un valor **true**, al resto se les asigna **false.**

### Valor de verdad

Una clausula **c** construida a partir de elementos de **B(P)**, tambipen tendrá un valor de verdad asociado respecto a una I. Este resultará de combinar los valores de verdad de los componentes utilizando las tablas de verdad de los conectivos lógicos involucrados.

### Interpretaciones modelo

Una interpretación es **modelo** de (o satisface) una **clausula**, si cada instancia básica (instanciación de cada una de las variables con un elemento del universo. Más sobre instancias [Teoría: Programación Lógica](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8.md)) de la misma tiene asociada un valor de verdad verdadero en I

Un interpretación I es **modelo** de un **programa lógico**, si I es modelo de cada una de las clausulas del programa

### Consecuencia lógica

Una clausula **f** es consecuencia lógica (o se deduce) de un programa lógico **P** si y solo si toda interpretación **I** modelo de **P** es también modelo de **f**

$$
P \vDash f
$$

La **ejecución** de un programa lógico **P** consiste en demostrar que $P \vDash f$.

**Problema!** El # de interpretaciones puede ser extremadamente grande, o incluso ser infinito.

### Inferencia lógica

Mecanismo de derivación sintáctica que, a partir de **P**, permite derivar nuevas cláusulas **c** usando reglas de inferencia.

### Demostración

Sucsesión de formulas $f_1 , f_2 , ... , f_n$ tal que cada una es un axioma, o se obtiene de formulas anteriores en la sucesión por la aplicación de alguna regla de inferencia

### Sistema formal consistente

Un sistema formal, en el que existe la negación $\lnot$, se dice que es consistente si no existe una fbc **f** en el sistema, tal que puede deducirse **f** y $**\lnot$f**.

Otra forma de definirlo es que un sistema es consistente si tiene una interpretación modelo, y no lo es si no tiene un modelo.

### Regla completa

Sea

- Un programa R.
- Una fbc **f** que corresponde a una invocación de R.
- **Q** una regla de inferencia.

Se dice que **Q** es completa si se cumple que:

**f** es deducible lógicamente de **R** usando **Q** si y solo si $R \vDash f$.

En otras palabras:

- Usando Q no se deduce nada que no sea consecuencia logica de R (a veces a esto se llama consistencia de la regla)
- Si f es consecuencia logica de R, se puede deducir usando Q (a veces a esto se le llama, por si mismo, completitud de la regla).

## Regla de resolución (o de Robinson)

Es un ejemplo de regla de inferencia completa

Dados los predicados $A_1 , ... , A_n$  y $B_1 , ... , B_m$, la regla consiste en:

> $\lnot(A_1 \land ... \land A_i \land ... \land A_n )$
> 
> 
> $B_1 \land ... \land B_m \to A_i$
> 
> $\therefore \lnot(A_1 \land ... \land A_{i-1} \land B_1 \land ... \land B_m \land A_{i+1} \land ... \land A_n )$
> 

### Demostración para programas logicos basada en la regla de resolución

A partir de la regla de resolución se puede generar un sistema de demostración automático que evalúe los programas en lógica mediante la aplicación reiterada de dicha regla.

Se realiza una prueba por contradicción o reducción al absurdo basandose en que:

> Dados f y R, f es deducible lógicamente a partir de R **si y solo si** el conjunto de $R \cup \{ \lnot f\}$ es inconsistente.
> 

Ademas, si R es consistente y $R \cup \{ \lnot f\}$ es inconsistente. Luego $R \vDash f$.

Por lo tanto debemos probar que $R \cup \{ \lnot f\}$ es inconsistente.