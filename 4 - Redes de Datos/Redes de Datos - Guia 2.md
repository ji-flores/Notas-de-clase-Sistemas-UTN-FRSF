# Direccionamiento IP - Ejercicios básicos

## Ejercicio 1

La consigna indica que tenes que poder identificar al menos 25 hosts por cada subred. En una dirección IP que tenga $n$ bits de host-id, se pueden identificar $2^n - 2$ hosts. Entonces:

$$
2^n - 2 \geq 25 \implies 2^n \geq 27 \implies n \geq 5
$$

También, que debemos obtener exactamente 5 subredes. Para ello, debemos subdividir el espacio de direcciones en por lo menos 8, por lo que nos quedarian subredes de como mucho 32 direcciones, o 5 bits de host-id.

Juntando ambas restricciones, podemos crear 5 subredes con 5 bits de host-id.

*(Una solucion alternativa, ya que la consigna no pide que todas las subredes sean del mismo tamaño, es tener 4 subredes de 32 bits y 1 subred de 128, así aprovechando todo el espacio de direcciones de la red de clase C)*

### Inciso a)
Al tener 5 bits de host-id, la mascara de red debe ser

```
11111111.11111111.11111111.11100000
255     .255     .255     .224

Notacion de barra invertida: /27
```

### Inciso b)
La cantidad maxima de subredes que pueden crearse con esa mascara de red es $2^{8-5}=2^3=8$

### Inciso c)
Como se aclaró, los bits que quedaron para en el cuarto octeto para los host-id son 5.

### Inciso d)
Recordando que hay que reservar una direccion como identificador de red, y otra para broadcast dirigido, el total de direcciones para host son (como ya se sugirió), $2^5 - 2 = 30$.

### Inciso e)
(Si entiendo bien) Se esta preguntando cual es la cantidad maxima de hosts que se pueden definir entre las 5 subredes. Serían $30 \cdot 5 = 150$

### Inciso f)
```
197     .15      .22      .63
11000101.00001111.00010110.00111111
```
Los ultimos 5 bits (reservados para host-id) son todos 1, esta es una dirección de broadcast dirigido, y por ende no puede corresponder a un host.

### Inciso g)
```
197     .15      .22      .160
11000101.00001111.00010110.10100000
```
Si consideramos que estamos usando 5 redes de 32 direccines, las IPs que reservamos llegarian solo hasta `11000101.00001111.00010110.10011111 = 197.15.22.159`, por lo que esa dirección quedaría fuera del rango que reservamos. En cambio, si estuvieramos usando 4 redes de 32 y una de 128, si sería valida.

### Inciso h)
Dirección de A:
```
197     .15      .22      .160
11000101.00001111.00010110.01111110
```
Dirección de B:
```
197     .15      .22      .129
11000101.00001111.00010110.10000001
```

Son ambos hosts validos, pero el host A se encuentra en la subred `11000101.00001111.00010110.01100000` y el B en la subred `11000101.00001111.00010110.10000000`.

## Ejercicio 2
### Inciso a)
Ambas tienen mascara de red 255.255.255.252 = 11111111.11111111.11111111.11111100, osea, solo dos bits de host-id (y solo dos hosts identificables).

Las direcciones son:

```
A: 00001010.00000001.00000001.00000011
B: 00001010.00000001.00000001.00000101
```

Los dispositivos no pertenecen a la misma red, porque sus net-id (los bits que no son los ultimos dos) son diferentes. Esta misma logica se usará para los proximos incisos asi que no se volvera a explicar.

### Inciso b)
`255.255.255.248` son tres bits de host-id.

```
A: 00001010.00000001.00000001.00001111
B: 00001010.00000001.00000001.00010000
```

No pertenecen a la misma red.

### Inciso c)
`255.255.255.224` son cinco bits de host-id.

```
A: 00001010.00000001.00000001.00001111
B: 00001010.00000001.00000001.00010000
```

Pertenecen a la misma red.

## Ejercicio 3

+ **a)** `10101100.10101000.00010111.00000000`. La consigna indica una mascara `/24`. Entonces, como todos los bits de id de host estan en cero, es una dirección de red.
+ **b)** `10101100.10101000.00010111.00011111\29` (Esto es abuso de notación, pero bueno). Todos los bits de la id de host estan en uno, así que es una dirección de broadcast (dirigido).
+ **c)** `10101100.10101000.00010111.00000100\30`. Todos los bits de id de host (los dos ultimos) estan en cero, así que es una dirección de red.
+ **d)** `10101100.10101000.00010111.00011111\27`. Los 5 bits de la host-id estan en uno: Es una dirección de broadcast dirigido.
+ **e)** `10101100.10101000.00010111.00000000\23`. Los bits de host-id son los 9 ultimos. Como estos no son ni todos ceros ni todos unos, la dirección corresponde a un host.

## Ejercicios 4 y 5

*Hechos en carpeta, capaz puedo escanearlos e insertarlos*.

```
Canciones de Armchair Boogie:
+ Jocko's Lament
+ Penguins
```

