# Ejercicio 1

IP de la red asignada:

```
10110101.01011011.10000000.00000000/11111111.11111111.11111000.00000000

181.91.128.0/255.255.248.0
181.91.128.0/21
```

### Sede Rafaela

> La IP `10110101.01011011.10000110.11000001` pertenece a la red y posee la primera dirección asignada de su sede y no posee direcciones sin asignar.

De aca se puede deducir que la red de es de como mucho, 64 direcciones (la dirección de red tiene que tener todos los btis de host en 0, y la maxima cantidad de bits en cero consecutivos al final de la dirección es 6). La cantidad de hosts asignados va a ser $2^n-2$.

### Sede Reconquista

> `10110101.01011011.10000110.10101100` pertenece a la red y es la ultima dirección asignada de su sede (entiendo que quedan direcciones sin asignar). Su tamaño de red, pero sus direcicones fueron asignadas antes.

De esto deduzco que solo puede haber entre ellas direcciones del mismo tamaño.

### Sede Rosario
> Es la subred más grande de Santacorp. Posee 93 direcciones IP disponibles sin asignar.

De esto se deduce que su direccion de red tiene que ser `181.91.128.0`.

### Sede Santa Fé
> Es la segunda red más grande de Santacorp, su direc. de red es `10110101.01011011.10000100.00000000` y tiene 405 direcciones de red asignadas.

De aca se puede deducir que es una red de 512 direcciones (mascara /23).

Que la subred Rosario es una red de 1024 (ocupando todo el espacio desde el principio del espacio de direcciones hasta que empieza esta subred).

Y que ademas, la cantidad de hosts asignados de la subred Rosario es $1024 - 2 - 93 = 929$

### Sede Sunchales
> Es la subred mas pequeña, su direccion de broadcast es `10110101.01011011.10000111.00001111` y tiene 8 direcciones IP asignadas.

Como su dir. de broadcast son cuatro unos, es una red de 16 (ademas tiene 8 direcciones IP asignadas)

### Sede Venado Tuerto
> Es la tercera subred más grande de Santacorp, su mascara de red es /25 y posee 26 direcciones IP sin asignar.

De aca podemos deducir que es una red de 128 direcciones y que posee $128-2-26=100$ hosts asignados.

También, que la subred arranca donde termina la subred Santa Fé (la segunda mas grande). Osea, su dir. de red es `181.91.134.0/25`.

Ahora, con esta informacion sabemos que las subredes de Rafaela y Reconquista la cuarta y quinta subred en terminos de tamaño, y no hay ninguna otra subred entre ellas.

El enunciado dice que la subred de Reconquista va antes, por ende va despues de la de Venado Tuerto y termina donde comienza la de Rafaela, siendo su dir. de red `181.91.134.128` y su dir. de broadcast `10110101.01011011.10000110.10111111`. Entonces es una red de 64, y agregando la mascara a la dirección: `181.91.134.128/26`. Ademas, como la ultima IP asignada es `181.91.134.172` es la dirección n°44 de la red (sin contar la dirección n°0, que es la de host), hay 44 direcciones IP ya asignadas en esa subred.

Como la subred de Rafaela es de igual tamaño, su dirección de red es `181.91.134.192/26`.

Por ultimo, ahora puede confirmarse que la direccion de red de la subred Sunchales es `181.91.135.0`.

## Resultados

|Sede|Direccion de subred|Dirección de broadcast|Cantidad de direcciones disponibles en el rango elegido|Cantidad de direcciones utilizadas|Mascara de red|
|-|-|-|-|-|-|
|**Rosario**        |`181.91.128.0`  |`181.91.131.255`|1022|929|`255.255.252.0`  |
|**Santa Fe**       |`181.91.132.0`  |`181.91.133.255`|510 |405|`255.255.254.0`  |
|**Venado Tuerto**  |`181.91.134.0`  |`181.91.134.127`|126 |100|`255.255.255.128`|
|**Reconquista**    |`181.91.134.128`|`181.91.134.191`|62  |44 |`255.255.255.192`|
|**Rafaela**        |`181.91.134.192`|`181.91.134.255`|62  |62 |`255.255.255.192`|
|**Sunchales**      |`181.91.135.0`  |`181.91.135.15` |14  |8  |`255.255.255.240`|

## Ejercicio extra
Si hubiese que establecer un enlace punto a punto entre Rosario y Santa Fe, deberían poder reservarse al menos direcciones para una subred formada (como mínimo) por la interfaz del router de Santa Fé y la interfaz del router de Rosario. Para ello hace falta una red de 4 direcciones, ya que hay dos que se reservan para dirección de red y dirección de broadcast. Si ubicaramos esta subred seguida a la subred de Sunchales.

+ **Dirección de red**: `181.91.135.16`
+ **Dirección de broadcast**: `181.91.135.19`
+ **Cantidad de direcciones disponibles en el rango elegido**: 2.
+ **Cantidad de direcciones utilizadas**: 2.
+ **Mascara de red**: `255.255.255.252` o `\30`. 

