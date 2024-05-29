# Ejercicio 1
## Puntos Críticos
### Minimos locales:
f(x,y) = -16.306
+ (x,y)= (0,2.1472)
+ (x,y)= (2,2.1472)


(x,y)=(0,-1.3972)
(x,y)=(2,-1.3972)

Máximo Local
(x,y)= (1,0) 
f(x,y) = 1

```
INIT:
x1 = 0; x2 = 0;
ENDINIT

[FO] MIN = x1^4 - 4 * x1^3 + 4 * x1^2 + x2^4 - x2^3 - 6 * x2^2;

@BND(-3,x1,3);

@BND(-3,x2,3);
```

|Punto inicial|Valor alcanzado|
|-------------|---------------------|
|Sin punto    |f(2,2.1472) = -16.306|
|(0,0)        |f(2,2.1472) = -16.306|
