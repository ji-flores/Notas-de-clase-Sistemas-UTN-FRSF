# Practica: Practica para Parcial 3

Ejercicio 3 de Parcial: Hacer una lista de potencias de un numero `n` que sean menores a otro numero `x`.

```scheme
(define (listar-potencias base ultimo max)
  (if (< ultimo max)
      (cons ultimo (listar-potencias base (* base ultimo) max))
      '()
      ))

(define (potencias n x) (listar-potencias n 1 x))
```

Composición de una lista de funciones usando función general “acumular”

```scheme
(define (acumular L op ntr)
  (if (null? L)
      ntr
      (op (car L) (acumular (cdr L) op ntr))
      )
  )

(define id (lambda (x) x))

(define (comp f g)
  (lambda (x) (f (g x))))
```

Aplicar una función n veces, generalización de ejercicio anterior

```scheme
(define (pwr-twr f n)
  (if (> n 0)
      (lambda (x) (f ((pwr-twr f (- n 1)) x)))
      (lambda (x) x)
      )
  )
```