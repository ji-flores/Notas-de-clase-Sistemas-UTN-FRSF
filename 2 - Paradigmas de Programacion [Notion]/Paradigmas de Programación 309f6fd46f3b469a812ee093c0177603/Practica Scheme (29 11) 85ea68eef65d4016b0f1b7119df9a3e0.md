# Practica: Scheme (29/11)

```scheme
;;;L es sublista de T
(define (prefijo? P L)
  (if (null? P)
      #t
      (if (equal? (car P) (car L))
          (prefijo? (cdr P) (cdr L))
          #f
          )
      )
  )

(define (sublista-aux L n T m)
  (if (>= m n)
      (if (prefijo? L T)
          #t
          (sublista-aux L n (cdr T) (- m 1))
          )
      #f
      )
  )

(define (sublista? L T)
  (sublista-aux L (length L) T (length t))
  )

;;;Producto Polinomio (26 guia)
(define (arma-producto L1 L2)
  (if (null? L1)
      '()
      (append (map (lambda (x) (cons (car L1) x)) L2)
              (arma-producto (cdr L1) L2)
              )
      )
  )

(define (producto-polinomio L)
  (if (null? L)
      '(())
      (arma-producto (car L) (producto-polinomio (cdr L)))
      )
  )
```