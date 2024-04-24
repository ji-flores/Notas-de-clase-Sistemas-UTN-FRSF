# Paso 1

# Paso 2
El tamaño de la carga util ahora es $888-20=868$ bytes, que si lo dividis por grupos de 8 bytes queda

# Paso 5
¿Porque el tamaño del primer fragmento es menor que la MTU? Porque el tamaño maximo de la carga util de un datagrama para MTU=450 es 430. Si tenemos que fragmentar 868 bytes de carga util, no podemos hacer fragmentos de 430, porque no es un multiplo de 8 (el offset debe ser si o si un multiplo de 8). El multiplo de 8 más cercano es 424.

# Paso 6
Obutvimos ese mensaje solo la primera vez, luego Windows reconfigura el MTU por alguna razón.
