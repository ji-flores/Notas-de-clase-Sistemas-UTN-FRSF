# Teoría: PROLOG

# Parte 1

PROLOG transforma el interprete abstracto no determinista en un algoritmo determinista:

1. Elección del predicado que se encuentra más a la
izquierda (1er objetivo de la resolvente)
2. Búsqueda secuencial de una cláusula unificable en
lugar de hacerlo no determinísticamente
3. Backtracking: Rever el último punto de decisión,
intentando encontrar un nuevo Unificador que lo
satisfaga

*(Falta hasta pag. 7 de ppt…)*

## Listas

### Programas básicos con listas

- **“Es lista”**
    
    ```prolog
    lista([])
    lista([X | Y]) :- lista(Y)
    
    ?- lista([a,b,c])
    ```
    
    *Árbol de derivación para la consulta:*
    
    ![(): Nodo de éxito. Si hubiera variables en la consulta se escribe la sustitución que se aplicó](Teori%CC%81a%20PROLOG%20b8a610a6dab24341ade6af3edb13d57a/Untitled.png)
    
    (): Nodo de éxito. Si hubiera variables en la consulta se escribe la sustitución que se aplicó
    
- **Concatenar dos listas**
    - **Determinar si un elemento es miembro de una lista**
        
        ```prolog
        miembro(X,[X|Xs]).
        miembro(X,[Y|Ys]) :- miembro(X,Ys).
        
        %Consulta
        ?- miembro(b,[a,b,c])
        ```
        
    
    ```prolog
    concatenar([],L,L).
    concatenar([X|Xs],L,[X|C]) :- concatenar(Xs,L,C).
    
    %Consulta
    ?- concatenar([a,b],[c,d],M)
    ```
    

*Ambos predicados son primitivos de PROLOG.
+ miembro = member
+ concatenar = append*

Algunos ejemplos de predicados que pueden crearse en función de los mencionados:

```prolog
prefijo(P,L) :- append(P,_X,L)
sufijo(S,L) :- append(_X,S,L)
```

## Funciones o términos compuestos

Las funciones son términos validos en PROLOG, como lo eran en LPO. Pueden ser unificadas como cualquier otro termino.

![Ejemplo de utilización de funciones en un programa PROLOG](Teori%CC%81a%20PROLOG%20b8a610a6dab24341ade6af3edb13d57a/Untitled%201.png)

Ejemplo de utilización de funciones en un programa PROLOG

## Variables anónimas como argumentos de predicados

Variables genéricas que no tienen nombre. Son un recurso para indicar a PROLOG que en ese termino hay una incógnita cuyo valor no interesa para el cálculo del resultado.

![Untitled](Teori%CC%81a%20PROLOG%20b8a610a6dab24341ade6af3edb13d57a/Untitled%202.png)

## En general: Términos válidos

![Untitled](Teori%CC%81a%20PROLOG%20b8a610a6dab24341ade6af3edb13d57a/Untitled%203.png)

## Predicados aritméticos predefinidos

Proveen una interfaz con las capacidades aritméticas de la computadora

- Predicados relacionales
- Evaluador is(Valor,Expresion)

*Características:*

- *Menos generales que la definición lógica*
- *Incorporan direccionalidad en la definición de los predicados.*

### Expresiones aritméticas

Los predicados aritmeticos reciben, en general, exprsiones aritmeticas como argumentos

Una expresion aritmetica puede ser:

```bnf
<Expresion> ::= <Numero> | <Funcion_Aritmetica>
```

Donde una `Funcion_Aritmetica` recibe como argumentos expresiones aritméticas.

![Untitled](Teori%CC%81a%20PROLOG%20b8a610a6dab24341ade6af3edb13d57a/Untitled%204.png)

**Dato:** Funciones que se escriben en notación infija pueden escribirse en notación tradicional.

### Predicados relacionales

![Untitled](Teori%CC%81a%20PROLOG%20b8a610a6dab24341ade6af3edb13d57a/Untitled%205.png)

### Evaluador `is(Valor,Expresion)`

Sintaxis:

`<Valor> is <Expresión>`

Resultado:

- Si `Expresion` no es una expresión aritmética ground, produce un error
- Caso contrario, se evalúa `Expresion` y:
    - Si existe un unificador entre `Valor` y el resultado de evaluar `Expresion`, es exitoso.
    - Sino, falla.

*En PROLOG no es lo mismo el predicado `=:=` que el predicado `is`, que no es lo mismo que el predicado `=` (este ultimo es el unificador)*

El predicado `is` **NO es una asignación**

### Algunos ejemplos practicos:

```prolog
longitud([],0)
longitud([X|R],N) :- longitud(R,NR), N is NR+1.

%Consulta
?- longitud([a,b,c,d],X)
```

**El orden importa:** Si `N is NR+1` se evaluaría primero, al momento de evaluarse `NR` no estaría instanciada, por ende no sería ground por ende se produciría un error.

```prolog
sumaLista([],0).
sumaLista([X|R],S) :- sumaLista(R,SR) , N is S+SR.

%Consulta
?- sumaLista([1,3,6,9,5,8,52],N)
```

```prolog
maximo([X|[]],X).
maximo([X|R],X) :- maximo(R,Max) , X > Max.
maximo([X|R],Max) :- maximo(R,Max) , X =< Max.

%Solucion más eficiente
maximo([X],X).
maximo([X,Y|R],Max) :- X < Y , maximo([Y|R],Max)
maximo([X,Y|R],Max) :- X >= Y , maximo([X|R],Max)
```

# Parte 2

*falta hasta Arbol subsidiario*

### Arbol subisidiario

![Untitled](Teori%CC%81a%20PROLOG%20b8a610a6dab24341ade6af3edb13d57a/Untitled%206.png)

### Problemas con el predicado `not`

En general, programas que contengan un predicado `not` se comportan distinto si la consulta es, o no, ground.

La implementacion no trabaj correctamente con expresiones no ground. Es responsabilidad del programador que la negacion funcione correctamente

**Solucion:** Ubicar el predicado **not** al fondo de los antecedentes, de manera que las variables ya esten instanciadas cuando el interprete llegue a ellos.

*Otra cosa a notar: La forma del predicado not no cumple con la sintaxis de la logica de primer orden, pero bueno.*

## Predicado cut `!`

Consideremos el predicado

`unir(L1,L2,Unida)`

Consiste en unir dos listas ordenadas en una tercera, tambien ordenada.

```prolog
unir([X|Xc] , [Y|Yc] , [X|Zc]) :- X < Y , unir(Xc , [Y|Yc] , Zc).
unir([X|Xc] , [Y|Yc] , [X|Zc]) :- X = Y , unir(Xc , Yc , Zc).
unir([X|Xc] , [Y|Yc] , [Y|Zc]) :- X > Y , unir([X|Xc] , Yc , Zc).
unir(X , [ ] , X).
unir([ ] , X , X).
```

Si se cumple la primera condicion, la segunda y la tercera automaticamente no se cumplen, en otras palabras las condiciones son excluyentes, por lo que no tiene mucho sentido seguir recorriendo las otras posibilidades cuando ya se encontro una condicion que se cumple.

```prolog
unir([X|Xc] , [Y|Yc] , [X|Zc]) :- X < Y , ! , unir(Xc , [Y|Yc] , Zc).
unir([X|Xc] , [Y|Yc] , [X|Zc]) :- X = Y , ! , unir(Xc , Yc , Zc).
unir([X|Xc] , [Y|Yc] , [Y|Zc]) :- X > Y , ! , unir([X|Xc] , Yc , Zc).
unir(X , [ ] , X).
unir([ ] , X , X).
```

`!` no permitira que PROLOG intente otra unificacion de los objetivos previos a el.

### Efectos de Cut

- Cut poda todas las clausulas debajo de la que lo contiene, y en la cual fue evaluado (en la definicion de un dado predicado).
- Cut poda todas las soluciones alternativas a la conjuncion de objetivos que aparecen a la izquierda del minimo.
    
    ```prolog
    P :- A,B,!,C,D
    %Se tomara la primer solucion exitosa para A,B
    ```
    
- Cut no afecta los objetivos ubicados a su derecha. Se podran analizar mas de una solucion para ellos.
    
    Una vez que `!` es exitoso, se exploran todas las soluciones para `C, D`