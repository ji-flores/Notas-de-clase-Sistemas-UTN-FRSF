# Dudas

+ Crema, Manteca... y en general productos que tiene 0.0 en la tabla de conversion de leche cruda a producto lacteo. En la resolución dice que es porque se fabrica en base a otros productos que ya fueron tenidos en cuenta y que no se requiere leche cruda adicional. Ahora ¿Cuales son esos productos, leche refrigerada o no refrigerada?
+ Los supuestos dicen que tenemos que agrupar todos los productos en los grupos de **leche liquida**, **leche en polvo** y **otros**. Pero se necesita una distinción entre cuales de estos productos son refrigerados y cuales son no refrigerados para calcular correctamente los costos de transporte.

    Dentro de la leche liquida, hay leche refrigerada y no refrigerada. Dentro de "otros" estan, por ejemplo, Crema que es un producto refrigerado, y el Dulce de Leche que no es refrigerado.
+ ¿Costos de producción? Podriamos investigar el costo de la leche cruda.
+ ¿Sirven para algo los datos de la oferta? Creo que justamente la idea del programa es que decida cuanto vamos a producir para cubrir la demanda en cada sector del país.

# Notas
+ Mediante la minimización de los costos de transporte y relacionados a la logistica, en tanto se atienda a la demanda de las diferentes provincias, es posible determinar cuanto es el costo unitario por tranporte de cada producto.
+ Sabiendo el costo de tranporte del producto, y obteniendo una estimación del costo de materia prima(costo del litro de leche cruda en argentina), así como tambien el precio de venta recomendado de cada producto de la serenisima, es posible determinar el valor agregado unitario de cada producto de manera estimada.
+ Sabiendo el valor agregado unitario, por ende el valor agregado total, en conjunción con el dinero invertido en compra de la materia prima y transporte, es posible realizar una cota superior al rendimiento de capital invertido en La Serenisima.
+ Pero a partir de esa cota es posible comparar el costo oportunidad con otros tipos de inversión de riesgo.

# Supuestos
+ Por falta de datos en la tabla que especifica los productos elaborados por PE, se considera que los *POSTRES LACTEOS* se elaboran en la planta Complejo Industrial Pascual Mastellone.

# Bosquejo

## Clasificacion de productos
1. No clasificarlos. Usar todas las clases disponibles.
2. Clasificarlos con los supuestos que da el TP (Leche Fluida, Leche Seca, Otros).
    + Tiene el problema de que dentro de estas clases hay algunos refrigerados y otros no, y el costo de transporte es distinto.
    + No es tan facil hacer la conversión de, por ejemplo 1kg de "Otros" a 1lt de leche cruda.
    + Los productos agrupados estan medidos tanto en kg. como en lt. Y no es tan facil hacer una conversión de lts. de leche a kgs.
3. Clasificarlos con una clasificacion nuestra.
    + Leche Fluida, Leche Seca, Otros (Refrigerados), Otros (No refrigerados). Sigue el problema de conversión de leche cruda a producto.

## Variables
$x_{ijkw}$: Producto $i$ que se elabora en la planta de elaboración $j$ y se distribuye en el centro de distribución $k$, con el objetivo de satisfacer su demanda en la provincia $w$.

Tener en cuenta que hay variables reduntantes, ya que, por ejemplo, el centro de distribución de Neuquen nunca distribuye a Entre Rios.

# Función objetivo
Minimizar el costo de transportar producto $i$ de la planta $j$ al centro $k$.

Si se tiene el precio de la leche cruda se puede agregar también este costo, entonces el costo para cada variable sería:

$$
(\text{Costo por producir + Costo por transportar})\cdot x_{ijkw}
$$

## Restricciones
1. Cumplir la demanda de cada producto en cada provincia. Tener en cuenta que la demanda en cada provincia la puede satisfacer más de un centro de distribución.
    + (Si no clasificamos los productos) Tener en cuenta que la demanda de leche se puede cumplir con leche refrigerada o no refrigerada.
2. La cantidad de leche cruda utilizada en la producción debe ser menor o igual a la cantidad de leche cruda disponible. Para esta se usa el dato de conversión de leche cruda a producto lacteo.
3. La cantidad de toneladas de producto enviadas a un centro de distribución debe ser menor o igual a la capacidad maxima en toneladas que soporta cada centro.