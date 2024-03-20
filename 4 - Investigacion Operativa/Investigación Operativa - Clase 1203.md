# Programación Lineal

## Definiciones

+ Solución factible: Vector $\vec{x}=[x_0,...,x_n]$ de valores que toman las variables de decisión, que cumplen con todas las restricciones del modelo.
+ Solución no factible: Evaluación de las VD que no cumple con al menos una restricción.
+ Solución optima ($x^*$): Solución **factible** que a su vez maximiza o minimiza (dependiendo del objetivo) la función objetivo.
+ $f(x^*)$: Valor optimo de la función objetivo.

Resolver un PL es encontrar la solución optima (que por definición es óptima). Junto con la solución optima, se debe informar el valor optimo de la FO.

### Problema

#### Variables

+ $x_s$: Toneladas de soja a sembrar.
+ $x_t$: Toneladas de trigo a sembrar.

#### Funcion objetivo
$\text{max }z=50x_s + 30x_t$

#### Restricciones

Tener en cuenta las unidades de la tabla

|   | Soja | Trigo |
| --- | --- | --- |
| **Tonleadas por hectarea** | 10 | 4 |
| **Hs. hombre por hectarea** | 180 | 60 |

Hay una restriccion de hectareas (200)

$\frac{1}{10}x_s + \frac{1}{4}x_t \leq 200$

Y una restriccion de horas hombre (18000), hay que tener en cuenta la unidad en la que estan expresadas en la tabla

$\frac{1}{10}\cdot 180 x_s + \frac{1}{4} \cdot 60 x_t \leq 18000$

$18 x_s + 15 x_t \leq 18000$ 

También se menciona un minimo se soja a plantar, por contrato (250 [tn]).

$x_s \geq 250$

Algo a notar es que los ordenes de magnitud de los coeficientes son distintos. Esto puede traer problemas comptuacionales. Esto tiene una solucion muy sencilla y es simplemente generar restricciones equivalentes multiplicando ambos lados de la inecuacion por un mismo numero.

## Conclusiones del analisis gráfico
+ Si una restricción se cumple como igualdad en la solución optima, se llama restricción activa (en el optimo). O restricción limitante.
+ Siempre podran encontrarse soluciones optimas *de problemas lineales* en puntos extremos (o vertices) de la region factible. Ademas, el conjunto de vertices es siempre finito.
+ Cuando el valor optimo de la FO se da sobre una frontera de la RF (y no solo en los vertices), se dice que hay soluciones alternativas. Esto no contradice la afirmacion anterior, ya que siguen existiendo vertices (los limites de esta frontera) que constituyen soluciones optimas.

### Problema de modelado
...
+ RF no acotadas: Pueden generar soluciones no acotadas. Aunque este tipo de soluciones son sintomas de un modelo mal realizado.