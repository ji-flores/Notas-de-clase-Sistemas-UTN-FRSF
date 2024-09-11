# Pruebas de bondad de ajuste

Permite evaluar la adecuación de una disribución de probabilidad como descriptor del comportamiento de un conjunto de datos.

Para qué?

+ Evaluar datos experimentales de entradas para poder generarlos en una simulación.
+ Estudiar una salida (como la de Montecarlo) para saber a que distribución se ajusta.

## Metodos

1. Chi-Cuadrado ($\chi^2$): Para más de 30 samples.
2. Kolmogorov-Smirnov (K-S).

¿Que pasa si se rechaza la hipotesis nula?

+ Cambiar la distribución y/o los parametros, luego...
+ Recolectar más datos, luego...
+ Si parece no ajustarse a nada, lo tomamos como factor experimental, pasamos a modelar pero experimentamos con ese valor probando distintas distribuciones.

Al igual que chi 2, formaliza la idea intuitiva de aproximar un histograma de una muestra de N observaciones con un distribución de probabilidad estandar.

## Prueba KS

+ Usa la distribucion de probabilidad acumuladad de datos continuos.
+ Usar para $N \leq 30$.

El estadistico de datos observados D es la mayor diferencia entre la función de distribución acumulada observada y esperada.

Donde $D = \max(D^+,D^-)$

$D^+ = \max_{1 \leq i \leq N} \{FO(x_i) - FE(x_i)\}$

$D^- = \max_{1 \leq i \leq N} \{FE(x_i) - FO(x_{i-1})\}$

Luego, buscar $D_\text{tabla}$.

Por ultimo determinar si se acepta/rechaza la hipotesis nula. Si el estadistico calculado es menor al de tabla (que es el umbral), los datos ajustan.

## Ejercicio 5, Parte 2

**c)** No tiene sentido del todo. Por más que se ajustan a una uniforme ploteando un histograma, la distribución que propone la consigna esta dejando datos de lado, particularmente los maximos y minimos observados, y sería deseado tener en cuenta todos los datos.

**d)** El estadisco calculado fue $D=0.2333$, que es menor comparado con $D_t = 0.2417$, por lo que podemos concluir que H_0: El set de datos ajusta a una distribución $U(15.037,24.061)$. **Igual debería haber tomado la distribución que propone la consigna.**

## Ejercicio 4, Parte 3

### a)

¿Por qué cuadrados medios? Porque solo tenemos un dato que es la semilla.

### b)

Si se observan comportamientos muy distintos, uno puede argumentar que no se observa un patron discernible.