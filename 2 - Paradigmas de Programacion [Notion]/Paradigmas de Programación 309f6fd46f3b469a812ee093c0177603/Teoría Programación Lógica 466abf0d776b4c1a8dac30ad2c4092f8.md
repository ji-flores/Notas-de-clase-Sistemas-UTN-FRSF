# Teoría: Programación Lógica

### Predicados de 1er. orden

¿Cual es el significado de la expresión $R \vDash f(X)$, donde $X$ es una variable?

En este contexto $X$ representa un objeto no identificado

$R \vDash f(X) \iff$Existe un valor $a$ para $X$ tal que $R \vDash f(a)$

En LPO, una variable no es una posición de memoria, sino entidades no especificadas (pero que toman un valor único) en una formula.

### Utilizar regla de resolución en programas con variables

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled.png)

## Sustitución

Una sustitución $\theta$ es un conjunto finito de pares (posiblemente vacío) de la forma:

$$
\theta = \{ X_1 / t_1 , \; X_2 / t_2 , \; ... , \; X_n / t_n \}
$$

Donde $X_i$ es una variable, $t_i$ es un termino y $X_i \neq X_j$ si $i \neq j$.

Las sustituciones se aplican a predicados: $P \: \theta = P'$. Entonces se dice que $P'$ es una **instancia** de P si existe $\theta$ tal que $P' = P \: \theta$.

Sustituciones pueden aplicarse a términos y a clausulas (simples o compuestas).

## Composición (de sustituciones)

Dados:

$\theta = \{ X_1 / s_1 , … , X_n / s_n \}$

$\sigma = \{ Y_1 / t_1 , … , Y_m / t_m \}$

La composición de dos sustituciones $\gamma = \theta \sigma$ se define como:

$$
\gamma = \{ X_i / (s_i \sigma) \; | \; X_i \neq (s_i \sigma) \} \cup \{ Y_i / t_i \; | \; Y_i \notin \{X_1, … , X_n \} \}
$$

![Ejemplos](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%201.png)

Ejemplos

![Partes de la definición que quedan ejemplificadas con cada ejemplo](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%202.png)

Partes de la definición que quedan ejemplificadas con cada ejemplo

## Unificador

Una sustitución $\theta$ unifica los predicados $P_1$ y $P_2$ si:

$$
P_1 \: \theta = P_2 \: \theta
$$

Se dice: $\theta$ es unificador de $P_1$ y $P_2$

**Ej:** Unificar los predicados $P_1 (f(X),X)$ y $P_2(Y,a)$

**Respuesta:** $\theta = \{ X / a , Y / f(a) \}$

**Ej:** Unificar los predicados $P_1(X,X,Y)$ y $P_2(Z,a,b)$

Respuesta: $\theta = \{ X/a , Y/b , Z/a \}$

**Ej:** Unificar los predicados $P_1(a,X,X)$ y $P_2(Y,Y,b)$

Respuesta: $\nexists \theta$ unificador de $P_1$ y $P_2$ 

**Ej:** Unificar los predicados $P_1(X,f(X))$ y $P_2 (W,Y)$

Respuestas:

$\theta_1 = \{ X / W , Y/ f(W) \}$ 

$\theta_2 = \{ W/X , Y/f(X) \}$

$\theta_3 = \{ W/a , X / a , Y / f(a) \}$

$...$

### Unificador más general

Un termino ‘s’ es más general que ‘t’ si:

‘t’ es una instancia de ‘s’ pero ‘s’ no es una instancia de ‘t’.

Un unificador $\theta$ para el conjunto de expresiones $\Sigma = \{P_1 , P_2 , … , P_n\}$ es una sustitución $\theta$ tal que $P_1 \theta = P_2 \theta = … = P_n \theta$

Si $\theta$ es un unificador para $\Sigma$, y si para cualquier unificador $\sigma$ de $\Sigma$ existe una sustitución $\gamma$ tal que $\sigma = \theta \gamma$, luego $\theta$ es un **unificador más general (UMG)** para $\Sigma$.

Puede existir más de un UMG para un conjunto de expresiones.

## Algoritmo de unificación

### Conjunto de desacuerdo: $D_{\Sigma}$

Dado un conjunto de predicados $\Sigma$, $D_{\Sigma}$ es el conjunto de términos que ocupan la menor posición j en cada elemento de $\Sigma$, y en la que al menos uno es diferente.

![Dos ejemplos](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%203.png)

Dos ejemplos

### Algoritmo

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%204.png)

### Ejemplo de aplicación del algoritmo

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%205.png)

## Utilización de la regla de resolución con variables

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%206.png)

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%207.png)

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%208.png)

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%209.png)

## Interprete abstracto

**Problema a resolver:**

¿$R \vDash f$?

o bien:

¿$\exists \theta \: | \: R \vDash f(X)\theta$?

**Característica:**

Es un algoritmo no determinista: Tiene ciertos puntos de decisión con más de una alternativa o camino a seguir, que toma al mismo tiempo. (Podría ejecutarse, por ejemplo, en un AFN o autómata finito no determinista)

Sea $R$ un programa lógico, $f$ una consulta y $Q$ una resolvente: una estructura de datos que almacena un conjunto de objetivos pendientes de demostrar.

1. Insertar $f$ en $Q$
2. Elegir una formula $A’$ de $Q$, y de  $R$ una cláusula $A \leftarrow B_1 , B_2 , … , B_n$ (con $n \geq 0$), tal que existe un $\theta$ que unifique a $A$ y $A’$ ($A \theta = A’ \theta$).
    
    Si este paso no puede realizarse SALIR.
    
    *Este es el paso no determinista*
    
3. Sacar $A’$ de $Q$.
    
    Agregar a $Q$ los predicados $B_1 , B_2 , … , B_n$.
    
4. Aplicar $\theta$ a $Q$  y $f$.
    
    *Pasos 3. y 4. son equivalentes a **aplicación de la regla de resolución***
    
5. Si $Q$ es vacío → SALIR con $f$.
6. Ir a paso 2.

## Árbol de derivación (o búsqueda)

![Untitled](Teori%CC%81a%20Programacio%CC%81n%20Lo%CC%81gica%20466abf0d776b4c1a8dac30ad2c4092f8/Untitled%2010.png)