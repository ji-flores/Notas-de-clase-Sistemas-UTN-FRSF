# Paso 1
|              |F1 |F2 |F3 |F4 |F5  |
|--------------|---|---|---|---|----|
|HLEN          |20 |20 |20 |20 |20  |
|Longitud      |276|276|276|276|276 |
|Identificacion|721|721|721|721|721 |
|Mas Datos     |1  |1  |1  |1  |0   |
|Offset        |0  |256|512|768|1024|

# Paso 2
El tamaño de la carga util ahora es $888-20=868$ bytes.
|              |F1 |F2 |F3 |F4 |
|--------------|---|---|---|---|
|HLEN          |20 |20 |20 |20 |
|Longitud      |276|276|276|120|
|Identificacion|3350|3350|3350|3350|
|Mas Datos     |1  |1  |1  |0  |
|Offset        |0  |256|512|768|

# Paso 5
¿Porque el tamaño del primer fragmento es menor que la MTU? Porque el tamaño maximo de la carga util de un datagrama para MTU=450 es 430. Si tenemos que fragmentar 868 bytes de carga util, no podemos hacer fragmentos de 430, porque no es un multiplo de 8 (el offset debe ser si o si un multiplo de 8). El multiplo de 8 más cercano es 424.
|              |F1 |F2 |F3 |
|--------------|---|---|---|
|HLEN          |20 |20 |20 |
|Longitud      |444|444|40 |
|Identificacion|3350|3350|3350|
|Mas Datos     |1  |1  |0  |
|Offset        |0  |424|848|

# Paso 6
Obutvimos ese mensaje solo la primera vez, luego Windows reconfigura el MTU por alguna razón.
