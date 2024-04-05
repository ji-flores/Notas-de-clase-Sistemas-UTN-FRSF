# Teoría/Paractica: Tail-Recursion + Ej. de Parcial (02/12)

# Tail-Recursion o Condición de cola

*No entra en el parcial, es una buena estrategia para resolver problemas*

**Def:** Recursión donde no quedan evaluaciones pendientes, o llamada de subrutina realizada como la acción final de un procedimiento.

Cualquier algoritmo con un proceso iterativo puede expresarse de manera recursiva, que cumpla con condición de cola.

Aclarar que el reciproco no es cierto.

Ej: factorial:

La version recursiva implementada en Scheme hasta ahora es:

```scheme
(define (factorial n)
	(if (= n 0)
		1
		(* n (factorial (- n 1)))
	)
)
```

Tomese la implementación recursiva en C++

```cpp
int factorial (int n){
	int aux = 1;
	for(int i = 2; i =< n ; i++)
		aux *= i;
	return aux;
}
```

Y se idea la siguiente implementación en Scheme

```scheme
(define (factorial n) (factorial-itrtv n 1 2))

(define (factorial-itrtv n aux i)
	(if (<= i n)
		(factorial-itrtv n (* aux i) (+ i 1))
		aux
	)
)
```

Notar que en cada llamada recursiva en `factorial-itrtv` no quedan operaciones pendientes.

`factorial-itrtv` representa el ciclo `for`, y en cada nueva llamada se actualizan las variables con el valor que tendrían en la siguiente iteración del `for`.

Cada evaluación sucesiva no debe guardarse en la pila, sino que responde al llamador original de la recursión.

En algunos casos, tail-recursion puede mejorar mucho la eficiencia del algoritmo. Por ejemplo, calcular la sucesión de fibonacci.

```cpp
int fib(int n){
	int f1 = 0, f2 = 1, aux;
	if(n==0) return f1;
	for(int i=2 ; i < n ; i++){
		aux = f1 + f2;
		f1 = f2;
		f2 = aux;
	}
	return f2;
}
```

Teniendo esta solución iterativa, usando tail-recursion se implementa en Scheme.

```scheme
(define (fib n)
	(if (= n 0)
		1
		
(define (fib-iterativo n f1 f2 i)
	(if (< i n)
		(fib-iterativo n f2 (+ f1 f2) (+ i 1))
		f2
	)
)
```

# Equivalencia de Cálculo $\lambda$ con Maquinas de Turing

## Definición de primitivas de programación usando cálculo $\lambda$

- Booleanos.
- Pares ordenados.
- Números naturales.
- Recursión.

# Ej. de Parcial

```scheme
;;;Ej. 3 de parcial 11/8/2022
;;Primera alternativa

(define (or-list LF)
  (if (null? LF)
      (lambda (x) #f)
      (lambda (x) (or ((car LF) x) ((or-list (cdr LF)) x)))
      )
  )

(define (select f L)
  (if (null? L)
      '()
      (if (f (car L))
          (cons (car L) (select f (cdr L)))
          (select f (cdr L))
          )
      )
  )

(define (aplicaOr LF)
  (lambda (L) (select (or-list LF) L))
  )
  

(define funciones (list char? integer?))
(define lista '(1 #\a "hola" 2.34 99))
```

```scheme
;;;Ej. 3 de parcial 11/8/2022
;;Segunda alternativa

(define (select f L)
  (if (null? L)
      '()
      (if (f (car L))
          (cons (car L) (select f (cdr L)))
          (select f (cdr L))
          )
      )
  )

(define (alguna-funcion-evalua-true? LF elem)
  (if (null? LF)
      #f
      (if ((car LF) elem)
          #t
          (alguna-funcion-evalua-true? (cdr LF) elem)
          )
      )
  )

(define (aplicaOr LF)
  (lambda (L) (select (lambda (x) (alguna-funcion-evalua-true? LF x)) L)))

(define funciones (list char? integer?))
(define lista '(1 #\a "hola" 2.34 99))
```